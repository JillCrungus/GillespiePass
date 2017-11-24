//========= Copyright � 1996-2005, Valve Corporation, All rights reserved. ============//
//
// Purpose:		Cute hound like Alien.
//
// $NoKeywords: $
//=============================================================================//

#include "cbase.h"
#include "ai_basenpc.h"
#include "game.h"
#include "AI_Default.h"
#include "AI_Schedule.h"
#include "AI_Hull.h"
#include "AI_Navigator.h"
#include "AI_Route.h"
#include "AI_Squad.h"
#include "AI_SquadSlot.h"
#include "AI_Hint.h"
#include "ai_memory.h"
#include "ai_tacticalservices.h"
#include "ai_moveprobe.h"
#include "NPCEvent.h"
#include "animation.h"
#include "hl1_npc_houndeye.h"
#include "gib.h"
#include "soundent.h"
#include "ndebugoverlay.h"
#include "vstdlib/random.h"
#include "engine/IEngineSound.h"
#include "movevars_shared.h"

// houndeye does 20 points of damage spread over a sphere 384 units in diameter, and each additional 
// squad member increases the BASE damage by 110%, per the spec.
#define HOUNDEYE_MAX_SQUAD_SIZE			4
#define	HOUNDEYE_MAX_ATTACK_RADIUS		384
#define	HOUNDEYE_SQUAD_BONUS			(float)1.1

#define HOUNDEYE_EYE_FRAMES 4 // how many different switchable maps for the eye

#define HOUNDEYE_SOUND_STARTLE_VOLUME	128 // how loud a sound has to be to badly scare a sleeping houndeye

#define HOUNDEYE_TOP_MASS	 300.0f

ConVar sk_houndeye_health ( "sk_houndeye_health", "20" );
ConVar sk_houndeye_dmg_blast ( "sk_houndeye_dmg_blast", "15" );
ConVar debug_houndeye_always_sleep_at_hint("houndeye_always_sleep_at_hint", "0");


//=========================================================
// Monster's Anim Events Go Here
//=========================================================
#define		HOUND_AE_WARN			1
#define		HOUND_AE_STARTATTACK	2
#define		HOUND_AE_THUMP			3
#define		HOUND_AE_ANGERSOUND1	4
#define		HOUND_AE_ANGERSOUND2	5
#define		HOUND_AE_HOPBACK		6
#define		HOUND_AE_CLOSE_EYE		7

BEGIN_DATADESC( CNPC_Houndeye )
	DEFINE_FIELD( m_iSpriteTexture, FIELD_INTEGER ),
	DEFINE_FIELD( m_fAsleep, FIELD_BOOLEAN ),
	DEFINE_FIELD( m_fDontBlink, FIELD_BOOLEAN ),
	DEFINE_FIELD( m_vecPackCenter, FIELD_POSITION_VECTOR ),
	DEFINE_KEYFIELD(m_suppressAttack, FIELD_INTEGER, "SuppressAttack"),
	DEFINE_KEYFIELD(m_modelToUse, FIELD_STRING, "model"),
END_DATADESC()

LINK_ENTITY_TO_CLASS( npc_houndeye, CNPC_Houndeye );

//=========================================================
// monster-specific tasks
//=========================================================
enum
{
	TASK_HOUND_CLOSE_EYE = LAST_SHARED_TASK,
	TASK_HOUND_OPEN_EYE,
	TASK_HOUND_THREAT_DISPLAY,
	TASK_HOUND_FALL_ASLEEP,
	TASK_HOUND_WAKE_UP,
	TASK_HOUND_HOP_BACK,
	TASK_HOUND_BECOMEPLAYFUL,
	TASK_HOUND_NOPLAY,
	TASK_HOUND_FIND_NAP_SPOT,
};

//=========================================================
// monster-specific schedule types
//=========================================================
enum
{
	SCHED_HOUND_AGITATED = LAST_SHARED_SCHEDULE,
	SCHED_HOUND_HOP_RETREAT,
	SCHED_HOUND_YELL1,
	SCHED_HOUND_YELL2,
	SCHED_HOUND_RANGEATTACK,
	SCHED_HOUND_SLEEP,
	SCHED_HOUND_WAKE_LAZY,
	SCHED_HOUND_WAKE_URGENT,
	SCHED_HOUND_SPECIALATTACK,
	SCHED_HOUND_COMBAT_FAIL_PVS,
	SCHED_HOUND_COMBAT_FAIL_NOPVS,
	SCHED_HOUND_BECOMEPLAYFUL,
	SCHED_HOUNDEYE_NOPLAY,
	SCHED_HOUNDWANDER,
	SCHED_HOUND_SLEEP_MOVE,
	SCHED_HOUND_SLEEP_MOVE_RANDOM,
//	SCHED_HOUND_FAIL,
};

enum HoundEyeSquadSlots
{	
	SQUAD_SLOTS_HOUND_ATTACK = LAST_SHARED_SQUADSLOT,
};


//=========================================================
// Spawn
//=========================================================
void CNPC_Houndeye::Spawn()
{
	Precache( );
	
	SetRenderColor( 255, 255, 255, 255 );

	SetModel( m_modelToUse );
	
	SetHullType(HULL_TINY);
	SetHullSizeNormal();
	
	SetSolid( SOLID_BBOX );
	AddSolidFlags( FSOLID_NOT_STANDABLE );

	SetNavType(NAV_GROUND);
	SetMoveType( MOVETYPE_STEP );

	m_bloodColor		= BLOOD_COLOR_YELLOW;
	ClearEffects();
	m_iHealth			= sk_houndeye_health.GetFloat();
	m_flFieldOfView		= 0.5;// indicates the width of this monster's forward view cone ( as a dotproduct result )
	m_NPCState			= NPC_STATE_NONE;
	m_fAsleep			= FALSE; // everyone spawns awake
	m_fDontBlink		= FALSE;
	
	CapabilitiesClear();

	CapabilitiesAdd( bits_CAP_MOVE_GROUND );
	CapabilitiesAdd( bits_CAP_SQUAD);
	CapabilitiesAdd(bits_CAP_INNATE_RANGE_ATTACK1);
	CapabilitiesAdd(bits_CAP_FRIENDLY_DMG_IMMUNE);

	SetState(NPC_STATE_IDLE);

	NPCInit();

	BaseClass::Spawn();
}

//=========================================================
// Precache - precaches all resources this monster needs
//=========================================================
void CNPC_Houndeye::Precache()
{
	PrecacheModel("models/houndeye.mdl");
	PrecacheModel("models/beta/houndeye.mdl");

	m_iSpriteTexture = PrecacheModel( "sprites/shockwave.vmt" );

	PrecacheScriptSound( "HoundEye.Idle" );
	PrecacheScriptSound( "HoundEye.Warn" );
	PrecacheScriptSound( "HoundEye.Hunt" );
	PrecacheScriptSound( "HoundEye.Alert" );
	PrecacheScriptSound( "HoundEye.Die" );
	PrecacheScriptSound( "HoundEye.Pain" );
	PrecacheScriptSound( "HoundEye.Anger1" );
	PrecacheScriptSound( "HoundEye.Anger2" );
	PrecacheScriptSound( "HoundEye.Sonic" );

	BaseClass::Precache();
}	

void CNPC_Houndeye::Event_Killed( const CTakeDamageInfo &info )
{
	// Close the eye to make death more obvious
	m_nSkin = 2;
	BaseClass::Event_Killed( info );
}

int CNPC_Houndeye::RangeAttack1Conditions ( float flDot, float flDist )
{

	if (m_suppressAttack
		&& GetEnemy()->IsPlayer())
	{
		return COND_NONE;
	}

	// I'm not allowed to attack if standing in another hound eye 
	// (note houndeyes allowed to interpenetrate)
	trace_t tr;
	UTIL_TraceHull( GetAbsOrigin(), GetAbsOrigin() + Vector(0,0,0.1), 
					GetHullMins(), GetHullMaxs(),
					MASK_NPCSOLID, this, COLLISION_GROUP_NONE, &tr );
	if (tr.startsolid)
	{
		CBaseEntity *pEntity = tr.m_pEnt;
		if (pEntity->Classify() == CLASS_ALIEN_MONSTER)
		{
			return( COND_NONE );
		}
	}

	// If I'm really close to my enemy allow me to attack if 
	// I'm facing regardless of next attack time
	if (flDist < 100 && flDot >= 0.3)
	{
		return COND_CAN_RANGE_ATTACK1;
	}
	if ( gpGlobals->curtime < m_flNextAttack )
	{
		return( COND_NONE );
	}
	if (flDist > ( HOUNDEYE_MAX_ATTACK_RADIUS * 0.5 ))
	{
		return COND_TOO_FAR_TO_ATTACK;
	}
	if (flDot < 0.3)
	{
		return COND_NOT_FACING_ATTACK;
	}
	return COND_CAN_RANGE_ATTACK1;
}

//=========================================================
// IdleSound
//=========================================================
void CNPC_Houndeye::IdleSound ( void )
{
	CPASAttenuationFilter filter( this );
	EmitSound( filter, entindex(), "HoundEye.Idle" );	
}

//=========================================================
// IdleSound
//=========================================================
void CNPC_Houndeye::WarmUpSound ( void )
{
	CPASAttenuationFilter filter( this );
	EmitSound( filter, entindex(),"HoundEye.Warn" );	
}

//=========================================================
// WarnSound 
//=========================================================
void CNPC_Houndeye::WarnSound ( void )
{
	CPASAttenuationFilter filter( this );
	EmitSound( filter, entindex(), "HoundEye.Hunt" );	
}

//=========================================================
// AlertSound 
//=========================================================
void CNPC_Houndeye::AlertSound ( void )
{

	if ( m_pSquad && !m_pSquad->IsLeader( this ) )
		 return; // only leader makes ALERT sound.

	CPASAttenuationFilter filter( this );
	EmitSound( filter, entindex(), "HoundEye.Alert" );
}

//=========================================================
// DeathSound 
//=========================================================
void CNPC_Houndeye::DeathSound( const CTakeDamageInfo &info )
{
	CPASAttenuationFilter filter( this );
	EmitSound( filter, entindex(), "HoundEye.Die" );	
}

//=========================================================
// PainSound 
//=========================================================
void CNPC_Houndeye::PainSound ( const CTakeDamageInfo &info )
{
	CPASAttenuationFilter filter( this );
	EmitSound( filter, entindex(), "HoundEye.Pain" );	
}

//=========================================================
// MaxYawSpeed - allows each sequence to have a different
// turn rate associated with it.
//=========================================================
float CNPC_Houndeye::MaxYawSpeed  ( void )
{
	int flYS;

	flYS = 90;

	switch ( GetActivity() )
	{
	case ACT_CROUCHIDLE://sleeping!
		flYS = 0;
		break;
	case ACT_IDLE:	
		flYS = 60;
		break;
	case ACT_WALK:
		flYS = 90;
		break;
	case ACT_RUN:	
		flYS = 90;
		break;
	case ACT_TURN_LEFT:
	case ACT_TURN_RIGHT:
		flYS = 90;
		break;
	}

	return flYS;
}

//=========================================================
// Classify - indicates this monster's place in the 
// relationship table.
//=========================================================
Class_T	CNPC_Houndeye::Classify ( void )
{
	if (m_suppressAttack && m_playful)
	{
		return CLASS_HOUNDEYE_PLAYFUL;
	}
	if (m_suppressAttack)
	{
		return CLASS_CITIZEN_REBEL;
	}
	else
	{
		return CLASS_HEADCRAB;
	}
	
}

//=========================================================
// HandleAnimEvent - catches the monster-specific messages
// that occur when tagged animation frames are played.
//=========================================================
void CNPC_Houndeye::HandleAnimEvent( animevent_t *pEvent )
{
	switch ( pEvent->event )
	{
		case HOUND_AE_WARN:
			// do stuff for this event.
			WarnSound();
			break;

		case HOUND_AE_STARTATTACK:
			WarmUpSound();
			break;

		case HOUND_AE_HOPBACK:
			{
				float flGravity = sv_gravity.GetFloat();
				Vector v_forward;
				GetVectors( &v_forward, NULL, NULL );

				SetGroundEntity( NULL );

				Vector vecVel = v_forward * -200;
				vecVel.z += ( 0.6 * flGravity ) * 0.5;
				SetAbsVelocity( vecVel );

				break;
			}

		case HOUND_AE_THUMP:
			// emit the shockwaves
			SonicAttack();
			break;

		case HOUND_AE_ANGERSOUND1:
			{
				CPASAttenuationFilter filter( this );
				EmitSound( filter, entindex(), "HoundEye.Anger1" );	
			}
			break;

		case HOUND_AE_ANGERSOUND2:
			{
				CPASAttenuationFilter filter2( this );
				EmitSound( filter2, entindex(), "HoundEye.Anger2" );	
			}
			break;

		case HOUND_AE_CLOSE_EYE:
			if ( !m_fDontBlink )
			{
				m_nSkin = HOUNDEYE_EYE_FRAMES - 1;
			}
			break;

		default:
			BaseClass::HandleAnimEvent( pEvent );
			break;
	}
}

//=========================================================
// SonicAttack
//=========================================================
void CNPC_Houndeye::SonicAttack ( void )
{
	float		flAdjustedDamage;
	float		flDist;

	CPASAttenuationFilter filter( this );
	EmitSound( filter, entindex(), "HoundEye.Sonic");

	CBroadcastRecipientFilter filter2;
	te->BeamRingPoint( filter2, 0.0, 
		GetAbsOrigin(),							//origin
		16,										//start radius
		HOUNDEYE_MAX_ATTACK_RADIUS,//end radius
		m_iSpriteTexture,						//texture
		0,										//halo index
		0,										//start frame
		30,										//framerate
		0.2,									//life
		24,									//width
		16,										//spread
		12,										//amplitude
		WriteBeamColor().x,						//r
		WriteBeamColor().y,						//g
		WriteBeamColor().z,						//b
		192,									//a
		0										//speed
		);

	CBroadcastRecipientFilter filter3;
	te->BeamRingPoint( filter3, 0.0, 
		GetAbsOrigin(),									//origin
		16,												//start radius
		HOUNDEYE_MAX_ATTACK_RADIUS / 2,											//end radius
		m_iSpriteTexture,								//texture
		0,												//halo index
		0,												//start frame
		30,												//framerate
		0.2,											//life
		24,											//width
		16,												//spread
		0,												//amplitude
		WriteBeamColor().x,								//r
		WriteBeamColor().y,								//g
		WriteBeamColor().z,								//b
		192,											//a
		0												//speed
		);
	
	CBaseEntity *pEntity = NULL;
	// iterate on all entities in the vicinity.
	while ((pEntity = gEntList.FindEntityInSphere( pEntity, GetAbsOrigin(), HOUNDEYE_MAX_ATTACK_RADIUS )) != NULL)
	{
		if ( pEntity->m_takedamage  != DAMAGE_NO )
		{
			if ( !FClassnameIs(pEntity, "npc_houndeye") )
			{// houndeyes don't hurt other houndeyes with their attack

				// houndeyes do FULL damage if the ent in question is visible. Half damage otherwise.
				// This means that you must get out of the houndeye's attack range entirely to avoid damage.
				// Calculate full damage first

				
					if (m_pSquad && m_pSquad->NumMembers() > 1)
					{
						// squad gets attack bonus.
						flAdjustedDamage = sk_houndeye_dmg_blast.GetFloat() + sk_houndeye_dmg_blast.GetFloat() * (HOUNDEYE_SQUAD_BONUS * (m_pSquad->NumMembers() - 1));
					}
					else
					{
						// solo
						flAdjustedDamage = sk_houndeye_dmg_blast.GetFloat();
					}

					flDist = (pEntity->WorldSpaceCenter() - GetAbsOrigin()).Length();

					flAdjustedDamage -= (flDist / HOUNDEYE_MAX_ATTACK_RADIUS) * flAdjustedDamage;

					if (!FVisible(pEntity))
					{
						if (pEntity->IsPlayer())
						{
							// if this entity is a client, and is not in full view, inflict half damage. We do this so that players still 
							// take the residual damage if they don't totally leave the houndeye's effective radius. We restrict it to clients
							// so that monsters in other parts of the level don't take the damage and get pissed.
							flAdjustedDamage *= 0.5;
						}
						else if (!FClassnameIs(pEntity, "func_breakable") && !FClassnameIs(pEntity, "func_pushable"))
						{
							// do not hurt nonclients through walls, but allow damage to be done to breakables
							flAdjustedDamage = 0;
						
					}
				}

				//ALERT ( at_aiconsole, "Damage: %f\n", flAdjustedDamage );

				if (flAdjustedDamage > 0 )
				{
					CTakeDamageInfo info( this, this, flAdjustedDamage, DMG_SONIC | DMG_ALWAYSGIB );
					CalculateExplosiveDamageForce( &info, (pEntity->GetAbsOrigin() - GetAbsOrigin()), pEntity->GetAbsOrigin() );

					pEntity->TakeDamage( info );

					if ( (pEntity->GetAbsOrigin() - GetAbsOrigin()).Length2D() <= HOUNDEYE_MAX_ATTACK_RADIUS )
					{
						if ( pEntity->GetMoveType() == MOVETYPE_VPHYSICS || (pEntity->VPhysicsGetObject() && !pEntity->IsPlayer()) ) 
						{
							IPhysicsObject *pPhysObject = pEntity->VPhysicsGetObject();

							if ( pPhysObject )
							{
								float flMass = pPhysObject->GetMass();

								if ( flMass <= HOUNDEYE_TOP_MASS )
								{
									// Increase the vertical lift of the force
									Vector vecForce = info.GetDamageForce();
									vecForce.z *= 2.0f;
									info.SetDamageForce( vecForce );

									pEntity->VPhysicsTakeDamage( info );
								}
							}
						}
					}
				}
			}
		}
	}
}

//=========================================================
// WriteBeamColor - writes a color vector to the network 
// based on the size of the group. 
//=========================================================
Vector CNPC_Houndeye::WriteBeamColor ( void )
{
	BYTE	bRed, bGreen, bBlue;


	if ( m_pSquad )
	{
		//Msg("In squad...");
		switch ( m_pSquad->NumMembers() )
		{
		case 2:
			// no case for 0 or 1, cause those are impossible for monsters in Squads.
			bRed	= 101;
			bGreen	= 133;
			bBlue	= 221;
			//Msg("2 members...");
			break;
		case 3:
			bRed	= 67;
			bGreen	= 85;
			bBlue	= 255;
			//Msg("3 members...");
			break;
		case 4:
			bRed	= 62;
			bGreen	= 33;
			bBlue	= 211;
			//Msg("4 members...");
			break;
		default:
			Msg ( "Unsupported Houndeye SquadSize!\n" );
			bRed	= 188;
			bGreen	= 220;
			bBlue	= 255;
			break;
		}
	}
	else
	{
		//Msg("Not in squad... :(");
		// solo houndeye - weakest beam
		bRed	= 188;
		bGreen	= 220;
		bBlue	= 255;
	}
	

	return Vector ( bRed, bGreen, bBlue );
}


//this fuck is this function for? always returns true. Valve please.
bool CNPC_Houndeye::ShouldGoToIdleState( void )
{
	/*
	if ( m_pSquad )
	{
		AISquadIter_t iter;
		for (CAI_BaseNPC *pMember = m_pSquad->GetFirstMember( &iter ); pMember; pMember = m_pSquad->GetNextMember( &iter ) )
		{
			if ( pMember != this && pMember->GetHintNode()->HintType() != NO_NODE )
				 return true;
		}

		return true;
	}
	*/
	return true;
}

bool CNPC_Houndeye::FValidateHintType ( CAI_Hint *pHint )
{
	switch( pHint->HintType() )
	{
		case HINT_HL1_WORLD_MACHINERY:
			return true;
			break;
		case HINT_HL1_WORLD_BLINKING_LIGHT:
			return true;
			break;
		case HINT_HL1_WORLD_HUMAN_BLOOD:
			return true;
			break;
		case HINT_HL1_WORLD_ALIEN_BLOOD:
			return true;
			break;
		case HINT_HOUNDEYE_NAP:
			return true;
			break;
	}

	Msg ( "Couldn't validate hint type" );

	return false;
}

//=========================================================
// SetActivity 
//=========================================================
void CNPC_Houndeye::SetActivity ( Activity NewActivity )
{
	int	iSequence;

	if ( NewActivity == GetActivity() )
		return;

	if ( m_NPCState == NPC_STATE_COMBAT && NewActivity == ACT_IDLE && random->RandomInt( 0, 1 ) )
	{
		// play pissed idle.
		iSequence = LookupSequence( "madidle" );

		SetActivity( NewActivity ); // Go ahead and set this so it doesn't keep trying when the anim is not present
	
		// In case someone calls this with something other than the ideal activity
		SetIdealActivity( GetActivity() );

		// Set to the desired anim, or default anim if the desired is not present
		if ( iSequence > ACTIVITY_NOT_AVAILABLE )
		{
			SetSequence( iSequence );	// Set to the reset anim (if it's there)
			SetCycle( 0 );				// FIX: frame counter shouldn't be reset when its the same activity as before
			ResetSequenceInfo();
		}
	}
	else
	{
		BaseClass::SetActivity ( NewActivity );
	}
}

//=========================================================
// start task
//=========================================================
void CNPC_Houndeye::StartTask ( const Task_t *pTask )
{
	switch ( pTask->iTask )
	{
	case TASK_HOUND_FALL_ASLEEP:
		{
			m_fAsleep = TRUE; // signal that hound is lying down (must stand again before doing anything else!)
			TaskComplete();
			break;
		}
	case TASK_HOUND_WAKE_UP:
		{
			m_fAsleep = FALSE; // signal that hound is standing again
			TaskComplete();
			break;
		}
	case TASK_HOUND_OPEN_EYE:
		{
			m_fDontBlink = FALSE; // turn blinking back on and that code will automatically open the eye
			TaskComplete();
			break;
		}
	case TASK_HOUND_CLOSE_EYE:
		{
			m_nSkin = 3;
			m_fDontBlink = TRUE; // tell blink code to leave the eye alone.
			break;
		}
	case TASK_HOUND_THREAT_DISPLAY:
		{
			if (m_playful)
			{
				if (RandomInt(0, 50) < 10)
				{
					SetSchedule(SCHED_HOUNDEYE_NOPLAY);
					//DevMsg("Stopped being playful!");
				}
				if (!GetEnemy()->IsPlayer())
				{
					m_playful = false;
				}
			}
			SetIdealActivity(ACT_IDLE_ANGRY);
			break;
		}
	case TASK_HOUND_HOP_BACK:
		{
			SetIdealActivity( ACT_LEAP );
			break;
		}
	case TASK_RANGE_ATTACK1:
		{
			SetIdealActivity( ACT_RANGE_ATTACK1 );
			break;
		}
	case TASK_SPECIAL_ATTACK1:
		{
			SetIdealActivity( ACT_SPECIAL_ATTACK1 );
			break;
		}
	case TASK_HOUND_BECOMEPLAYFUL:
	{
		m_playful = true;
		break;
	}
	case TASK_HOUND_NOPLAY:
	{
		m_playful = false;
		SetIdealActivity(ACT_IDLE);
		if (RandomInt(0, 20) < 5)
		{
			SetSchedule(SCHED_HOUND_SLEEP); //Sometimes Houndeyes get all tuckered out after playing :>
		}
		TaskComplete();
		break;
	}
	case TASK_GET_PATH_TO_RANGE_ENEMY_LKP_LOS:
	{
		float			flMaxRange = HOUNDEYE_MAX_ATTACK_RADIUS * 0.9;
		Vector 			posLos;
		bool			foundLos = false;

		if (GetEnemy() != NULL)
		{
			foundLos = GetTacticalServices()->FindLos(GetEnemyLKP(), GetEnemy()->EyePosition(), flMaxRange, flMaxRange, 0.0, &posLos);
		}
		else
		{
			TaskFail(FAIL_NO_TARGET);
			return;
		}

		if (foundLos)
		{
			GetNavigator()->SetGoal(AI_NavGoal_t(posLos, ACT_RUN, AIN_HULL_TOLERANCE));
		}
		else
		{
			TaskFail(FAIL_NO_SHOOT);
		}
		break;
	}

	case TASK_HOUND_FIND_NAP_SPOT:
	{
		//DevMsg("Finding vantage point!");

		Vector	goalPos;
		CAI_Hint *pHint = NULL;
		CHintCriteria hint;
		hint.SetGroup(GetHintGroup());
		//DevMsg("Hint group set");

		hint.SetHintType(HINT_HOUNDEYE_NAP);
		//hint.SetHintType(HINT_ANY);

		hint.SetFlag(bits_HINT_NODE_NEAREST);
		pHint = CAI_HintManager::FindHint(NULL, GetAbsOrigin(), hint);

		if (pHint == NULL)
		{
			if (GetClassname())
			{
				TaskFail("Houndeye: Unable to find a suitable spot to nap!\n");
				DevMsg("Houndeye %s: Unable to find a suitable spot to nap!\n", GetClassname());
			}
			else
			{
				TaskFail("Houndeye with no classname failed to find an available nap spot!\n");
				DevMsg("Houndeye with no classname failed to find an available nap spot!\n");
			}
			
			break;
		}

		pHint->GetPosition(this, &goalPos);

		AI_NavGoal_t goal(goalPos);

		//Try to run directly there
		if (GetNavigator()->SetGoal(goal) == false)
		{
			if (GetClassname())
			{
				TaskFail("Houndeye %s: Found a nap spot but can't get path!\n");
			}
			else
			{
				TaskFail("Houndeye with no classname found a nap spot but could not get a path!\n");
			}
			break;
		}

		TaskComplete();
		break;
	}
	

	default: 
		{
			BaseClass::StartTask(pTask);
			break;
		}
	}
}

//=========================================================
// RunTask 
//=========================================================
void CNPC_Houndeye::RunTask ( const Task_t *pTask )
{
	switch ( pTask->iTask )
	{
	case TASK_HOUND_THREAT_DISPLAY:
		{
			if ( GetEnemy() )
			{
				float idealYaw;
				idealYaw = UTIL_VecToYaw( GetEnemy()->GetAbsOrigin() - GetAbsOrigin() );
				GetMotor()->SetIdealYawAndUpdate( idealYaw );
			}

			if ( IsSequenceFinished() )
			{
				TaskComplete();
			}
			
			break;
		}
	case TASK_HOUND_CLOSE_EYE:
		{
			if ( m_nSkin < HOUNDEYE_EYE_FRAMES - 1 )
				 m_nSkin++;
			break;
		}
	case TASK_HOUND_BECOMEPLAYFUL:
	{
		m_playful = true;
		break;
	}
	case TASK_HOUND_NOPLAY:
	{
		m_playful = false;
		break;
	}
	case TASK_HOUND_HOP_BACK:
		{
			if ( IsSequenceFinished() )
			{
				TaskComplete();
			}
			break;
		}
	case TASK_SPECIAL_ATTACK1:
		{
			m_nSkin = random->RandomInt(0, HOUNDEYE_EYE_FRAMES - 1);

			float idealYaw;
			idealYaw = UTIL_VecToYaw( GetNavigator()->GetGoalPos() );
			GetMotor()->SetIdealYawAndUpdate( idealYaw );
			
			float life;
			life = ((255 - GetCycle()) / ( m_flPlaybackRate * m_flPlaybackRate));
			if (life < 0.1)
			{
				life = 0.1;
			}

			
			if ( IsSequenceFinished() )
			{
				SonicAttack(); 
				TaskComplete();
			}

			break;
		}
	default:
		{
			BaseClass::RunTask(pTask);
			break;
		}
	}
}

//=========================================================
// PrescheduleThink
//=========================================================
void CNPC_Houndeye::PrescheduleThink ( void )
{
	BaseClass::PrescheduleThink();
	
	// if the hound is mad and is running, make hunt noises.
	if ( m_NPCState == NPC_STATE_COMBAT && GetActivity() == ACT_RUN && random->RandomFloat( 0, 1 ) < 0.2 )
	{
		WarnSound();
	}

	// at random, initiate a blink if not already blinking or sleeping
	if ( !m_fDontBlink  && !m_fAsleep)
	{
		if ( ( m_nSkin == 0 ) && random->RandomInt(0,0x7F) == 0 )
		{// start blinking!
			m_nSkin = HOUNDEYE_EYE_FRAMES - 1;
		}
		else if ( m_nSkin != 0 )
		{// already blinking
			m_nSkin--;
		}
	}

	// if you are the leader, average the origins of each pack member to get an approximate center.
	if ( m_pSquad && m_pSquad->IsLeader( this ) )
	{
		int iSquadCount = 0;

		AISquadIter_t iter;
		for (CAI_BaseNPC *pSquadMember = m_pSquad->GetFirstMember( &iter ); pSquadMember; pSquadMember = m_pSquad->GetNextMember( &iter ) )
		{
			iSquadCount++;
			m_vecPackCenter = m_vecPackCenter + pSquadMember->GetAbsOrigin();
		}

		m_vecPackCenter = m_vecPackCenter / iSquadCount;
	}
}

//=========================================================
// GetScheduleOfType 
//=========================================================
int CNPC_Houndeye::TranslateSchedule( int scheduleType ) 
{
	if ( m_fAsleep )
	{
		// if the hound is sleeping, must wake and stand!
		if ( HasCondition( COND_HEAR_DANGER ) ||  HasCondition( COND_HEAR_THUMPER ) || HasCondition( COND_HEAR_COMBAT ) || 
			 HasCondition( COND_HEAR_WORLD ) || HasCondition( COND_HEAR_PLAYER ) || HasCondition( COND_HEAR_BULLET_IMPACT ) )
		{
			CSound *pWakeSound;

			pWakeSound = GetBestSound();
			ASSERT( pWakeSound != NULL );
			if ( pWakeSound )
			{
				GetMotor()->SetIdealYawToTarget ( pWakeSound->GetSoundOrigin() );

				if ( FLSoundVolume ( pWakeSound ) >= HOUNDEYE_SOUND_STARTLE_VOLUME )
				{
					// awakened by a loud sound
					return SCHED_HOUND_WAKE_URGENT;
				}
			}
			// sound was not loud enough to scare the bejesus out of houndeye
			return SCHED_HOUND_WAKE_LAZY;
		}
		else if ( HasCondition( COND_NEW_ENEMY ) )
		{
			// get up fast, to fight.
			return SCHED_HOUND_WAKE_URGENT;
		}

		else
		{
			// hound is waking up on its own
			return SCHED_HOUND_WAKE_LAZY;
		}
	}
	switch	( scheduleType )
	{
	case SCHED_IDLE_STAND:
		{
			// we may want to sleep instead of stand!
			if ( m_pSquad && !m_pSquad->IsLeader( this ) && !m_fAsleep && random->RandomInt( 0,29 ) < 1 )
			{
				if (debug_houndeye_always_sleep_at_hint.GetInt() > 0)
				{
					return SCHED_HOUND_SLEEP_MOVE; //DEBUG: AlWAYS sleep at a hint node
				}
				return SCHED_HOUND_SLEEP;
			}
		
			if (m_suppressAttack &&!m_fAsleep && random->RandomInt(0, 30) < 1) //Only tamed Houndeyes who aren't already asleep should do this
			{
				if (debug_houndeye_always_sleep_at_hint.GetInt() > 0)
				{
					return SCHED_HOUND_SLEEP_MOVE; //DEBUG: AlWAYS sleep at a hint node
				}
				return SCHED_HOUND_SLEEP; //Just take a nap on the spot
			}
			if (m_suppressAttack &&!m_fAsleep && random->RandomInt(0, 30) < 1) //Only tamed Houndeyes who aren't already asleep should do this
			{
				return SCHED_HOUND_SLEEP_MOVE; //Move somehwere comfier before cozying up
			}

			
			if (m_suppressAttack) //Only tamed Houndeyes should do these
			{
				if (random->RandomInt(0, 29) < 1)
				{
					if (debug_houndeye_always_sleep_at_hint.GetInt() > 0)
					{
						return SCHED_HOUND_SLEEP_MOVE; //DEBUG: AlWAYS sleep at a hint node
					}
					return SCHED_HOUND_BECOMEPLAYFUL; //Get excited! We want to play with the player!
				}

				if (random->RandomInt(0, 2) == 1)
				{
					if (debug_houndeye_always_sleep_at_hint.GetInt() > 0)
					{
						return SCHED_HOUND_SLEEP_MOVE; //DEBUG: AlWAYS sleep at a hint node
					}
					return SCHED_HOUNDWANDER; //Just wander about
				}
				
		
			}
			
			return BaseClass::TranslateSchedule(scheduleType);
		}

	case SCHED_RANGE_ATTACK1:
		return SCHED_HOUND_RANGEATTACK;
	case SCHED_SPECIAL_ATTACK1:
		return SCHED_HOUND_SPECIALATTACK;

	case SCHED_FAIL:
		{
			if ( m_NPCState == NPC_STATE_COMBAT )
			{
				if ( !FNullEnt( UTIL_FindClientInPVS( edict() ) ) )
				{
					// client in PVS
					return SCHED_HOUND_COMBAT_FAIL_PVS;
				}
				else
				{
					// client has taken off! 
					return SCHED_HOUND_COMBAT_FAIL_NOPVS;
				}
			}
			else
			{
				return BaseClass::TranslateSchedule ( scheduleType );
			}
		}
	default:
		{
			return BaseClass::TranslateSchedule ( scheduleType );
		}
	}
}

int CNPC_Houndeye::SelectSchedule( void )
{
	switch	( m_NPCState )
	{
	case NPC_STATE_COMBAT:
		{
// dead enemy
			if ( HasCondition( COND_ENEMY_DEAD ) )
			{
				// call base class, all code to handle dead enemies is centralized there.
				return BaseClass::SelectSchedule();
			}

			if ( HasCondition( COND_LIGHT_DAMAGE ) || HasCondition( COND_HEAVY_DAMAGE ) )
			{
				if ( random->RandomFloat( 0 , 1 ) <= 0.4 )
				{
					trace_t trace;
					Vector v_forward;
					GetVectors( &v_forward, NULL, NULL );
					UTIL_TraceEntity( this, GetAbsOrigin(), GetAbsOrigin() + v_forward * -128, MASK_SOLID, &trace );
					
					if ( trace.fraction == 1.0 )
					{
						// it's clear behind, so the hound will jump
						return SCHED_HOUND_HOP_RETREAT;
					}
				}

				return SCHED_TAKE_COVER_FROM_ENEMY;
			}

			if ( HasCondition( COND_CAN_RANGE_ATTACK1 ) )
			{
				if ( OccupyStrategySlot ( SQUAD_SLOTS_HOUND_ATTACK ) )
				{
					return SCHED_RANGE_ATTACK1;
				}

				return SCHED_HOUND_AGITATED;
			}
			break;
		}
	}

	return BaseClass::SelectSchedule();
}


//=========================================================
// FLSoundVolume - subtracts the volume of the given sound
// from the distance the sound source is from the caller, 
// and returns that value, which is considered to be the 'local' 
// volume of the sound. 
//=========================================================
float CNPC_Houndeye::FLSoundVolume( CSound *pSound )
{
	return ( pSound->Volume() - ( ( pSound->GetSoundOrigin() - GetAbsOrigin() ).Length() ) );
}


//------------------------------------------------------------------------------
//
// Schedules
//
//------------------------------------------------------------------------------

AI_BEGIN_CUSTOM_NPC( npc_houndeye, CNPC_Houndeye )

	DECLARE_TASK ( TASK_HOUND_CLOSE_EYE )
	DECLARE_TASK ( TASK_HOUND_OPEN_EYE )
	DECLARE_TASK ( TASK_HOUND_THREAT_DISPLAY )
	DECLARE_TASK ( TASK_HOUND_FALL_ASLEEP )
	DECLARE_TASK ( TASK_HOUND_WAKE_UP )
	DECLARE_TASK ( TASK_HOUND_HOP_BACK )
	DECLARE_TASK( TASK_HOUND_NOPLAY )
	DECLARE_TASK( TASK_HOUND_BECOMEPLAYFUL)
	DECLARE_TASK( TASK_HOUND_FIND_NAP_SPOT )

	//=========================================================
	// > SCHED_HOUND_AGITATED
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_AGITATED,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_HOUND_THREAT_DISPLAY	0"
		"	"
		"	Interrupts"
		"		COND_NEW_ENEMY"
		"		COND_HEAVY_DAMAGE"
	)

	//=========================================================
	// > SCHED_HOUND_HOP_RETREAT
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_HOP_RETREAT,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_HOUND_HOP_BACK			0"
		"		TASK_SET_SCHEDULE			SCHEDULE:SCHED_TAKE_COVER_FROM_ENEMY"
		"	"
		"	Interrupts"
	)

	//=========================================================
	// > SCHED_HOUND_YELL1
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_YELL1,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_FACE_IDEAL				0"
		"		TASK_RANGE_ATTACK1			0"
		"		TASK_SET_SCHEDULE			SCHEDULE:SCHED_HOUND_AGITATED"
		"	"
		"	Interrupts"
	)

	//=========================================================
	// > SCHED_HOUND_YELL2
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_YELL2,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_FACE_IDEAL				0"
		"		TASK_RANGE_ATTACK1			0"
		"	"
		"	Interrupts"
	)
	//=========================================================
	// > SCHED_HOUND_RANGEATTACK
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_RANGEATTACK,

		"	Tasks"
		"		TASK_SET_SCHEDULE			SCHEDULE:SCHED_HOUND_YELL1"
		"	"
		"	Interrupts"
		"		COND_LIGHT_DAMAGE"
		"		COND_HEAVY_DAMAGE"
	)
	

	//=========================================================
	// > SCHED_HOUND_SLEEP
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_SLEEP,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_SET_ACTIVITY			ACTIVITY:ACT_IDLE"
		"		TASK_WAIT_RANDOM			5"
		"		TASK_PLAY_SEQUENCE			ACTIVITY:ACT_CROUCH"
		"		TASK_SET_ACTIVITY			ACTIVITY:ACT_CROUCHIDLE"
		"		TASK_HOUND_FALL_ASLEEP		0"
		"		TASK_WAIT_RANDOM			25"
			"	TASK_HOUND_CLOSE_EYE		0"
		"	"
		"	Interrupts"
		"		COND_LIGHT_DAMAGE"
		"		COND_HEAVY_DAMAGE"
		"		COND_NEW_ENEMY"
		"		COND_HEAR_COMBAT"
		"		COND_HEAR_DANGER"
		"		COND_HEAR_PLAYER"
		"		COND_HEAR_WORLD"
	)

	//=========================================================
	// > SCHED_HOUND_WAKE_LAZY
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_WAKE_LAZY,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_HOUND_OPEN_EYE			0"
		"		TASK_WAIT_RANDOM			2.5"
		"		TASK_PLAY_SEQUENCE			ACT_STAND"
		"		TASK_HOUND_WAKE_UP			0"
		"	"
		"	Interrupts"
	)

	//=========================================================
	// > SCHED_HOUND_WAKE_URGENT
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_WAKE_URGENT,

		"	Tasks"
		"		TASK_HOUND_OPEN_EYE			0"
		"		TASK_PLAY_SEQUENCE			ACT_HOP"
		"		TASK_FACE_IDEAL				0"
		"		TASK_HOUND_WAKE_UP			0"
		"	"
		"	Interrupts"
	)

	//=========================================================
	// > SCHED_HOUND_SPECIALATTACK
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_SPECIALATTACK,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_FACE_IDEAL				0"
		"		TASK_SPECIAL_ATTACK1		0"
		"		TASK_PLAY_SEQUENCE			ACTIVITY:ACT_IDLE_ANGRY"
		"	"
		"	Interrupts"
		"		"
		"		COND_NEW_ENEMY"
		"		COND_LIGHT_DAMAGE"
		"		COND_HEAVY_DAMAGE"
		"		COND_ENEMY_OCCLUDED"
	)

	//=========================================================
	// > SCHED_HOUND_COMBAT_FAIL_PVS
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_COMBAT_FAIL_PVS,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_HOUND_THREAT_DISPLAY	0"
		"		TASK_WAIT_FACE_ENEMY		1"
		"	"
		"	Interrupts"
		"		"
		"		COND_NEW_ENEMY"
		"		COND_LIGHT_DAMAGE"
		"		COND_HEAVY_DAMAGE"
	)

	//=========================================================
	// > SCHED_HOUND_COMBAT_FAIL_NOPVS
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_COMBAT_FAIL_NOPVS,

		"	Tasks"
		"		TASK_STOP_MOVING			0"
		"		TASK_HOUND_THREAT_DISPLAY	0"
		"		TASK_WAIT_FACE_ENEMY		1"
		"		TASK_SET_ACTIVITY			ACTIVITY:ACT_IDLE"
		"		TASK_WAIT_PVS				0"
		"	"
		"	Interrupts"
		"		COND_NEW_ENEMY"
		"		COND_LIGHT_DAMAGE"
		"		COND_HEAVY_DAMAGE"
	)
	//=========================================================
	// > SCHED_HOUND_BECOMEPLAYFUL
	//=========================================================
	DEFINE_SCHEDULE
	(
		SCHED_HOUND_BECOMEPLAYFUL,

		"	Tasks"
		"		TASK_HOUND_THREAT_DISPLAY	0"
		"		TASK_STOP_MOVING			0"
		"		TASK_HOUND_BECOMEPLAYFUL				0"
		"	"
		"	Interrupts"
		"		"
		"		COND_LIGHT_DAMAGE"
		"		COND_HEAVY_DAMAGE"
		"		COND_NEW_ENEMY"
		"		COND_HEAR_COMBAT"
		"		COND_HEAR_DANGER"
		"		COND_HEAR_PLAYER"
		"		COND_HEAR_WORLD"
		"		"
	)
	//=========================================================
	// > SCHED_HOUND_NOPLAY
	//=========================================================
	DEFINE_SCHEDULE
	(
	SCHED_HOUNDEYE_NOPLAY,

	"	Tasks"
	"		TASK_HOUND_NOPLAY	0"
	"	"
	"	Interrupts"
	"	"
	)
	//=========================================================
	// > SCHED_HOUNDWANDER
	//=========================================================
	DEFINE_SCHEDULE
	(
	SCHED_HOUNDWANDER,

	"	Tasks"
	"		TASK_STOP_MOVING				0"
	"		TASK_WANDER						480384" // 4 feet to 32 feet
	"		TASK_WALK_PATH					0"
	"		TASK_WAIT_FOR_MOVEMENT			0"
	"		TASK_STOP_MOVING				0"
	"		TASK_FACE_REASONABLE			0" //Don't face a wall
	"	Interrupts"
	"	"
	"		COND_LIGHT_DAMAGE"
	"		COND_HEAVY_DAMAGE"
	"		COND_NEW_ENEMY"
	)
	//=========================================================
	// > SCHED_HOUND_SLEEP_MOVE
	//=========================================================
	DEFINE_SCHEDULE
	(
	SCHED_HOUND_SLEEP_MOVE,

	"	Tasks"
	"		TASK_STOP_MOVING				0"
	"		TASK_HOUND_FIND_NAP_SPOT		480384" // 4 feet to 32 feet
	"		TASK_WALK_PATH					0"
	"		TASK_WAIT_FOR_MOVEMENT			0"
	"		TASK_STOP_MOVING			0"
	"		TASK_SET_ACTIVITY			ACTIVITY:ACT_IDLE"
	"		TASK_WAIT_RANDOM			5"
	"		TASK_PLAY_SEQUENCE			ACTIVITY:ACT_CROUCH"
	"		TASK_SET_ACTIVITY			ACTIVITY:ACT_CROUCHIDLE"
	"		TASK_HOUND_FALL_ASLEEP		0"
	"		TASK_WAIT_RANDOM			25"
	"	    TASK_HOUND_CLOSE_EYE		0"
	"	"
	"	Interrupts"
	"		COND_LIGHT_DAMAGE"
	"		COND_HEAVY_DAMAGE"
	"		COND_NEW_ENEMY"
	"		COND_HEAR_COMBAT"
	"		COND_HEAR_DANGER"
	"		COND_HEAR_PLAYER"
	"		COND_HEAR_WORLD"
	)

	//=========================================================
	// > SCHED_HOUND_SLEEP_MOVE_RANDOM
	//=========================================================
	DEFINE_SCHEDULE
	(
	SCHED_HOUND_SLEEP_MOVE_RANDOM,

	"	Tasks"
	"		TASK_STOP_MOVING				0"
	"		TASK_WANDER		480384" // 4 feet to 32 feet
	"		TASK_WALK_PATH					0"
	"		TASK_WAIT_FOR_MOVEMENT			0"
	"		TASK_STOP_MOVING			0"
	"		TASK_SET_ACTIVITY			ACTIVITY:ACT_IDLE"
	"		TASK_WAIT_RANDOM			5"
	"		TASK_PLAY_SEQUENCE			ACTIVITY:ACT_CROUCH"
	"		TASK_SET_ACTIVITY			ACTIVITY:ACT_CROUCHIDLE"
	"		TASK_HOUND_FALL_ASLEEP		0"
	"		TASK_WAIT_RANDOM			25"
	"	    TASK_HOUND_CLOSE_EYE		0"
	"	"
	"	Interrupts"
	"		COND_LIGHT_DAMAGE"
	"		COND_HEAVY_DAMAGE"
	"		COND_NEW_ENEMY"
	"		COND_HEAR_COMBAT"
	"		COND_HEAR_DANGER"
	"		COND_HEAR_PLAYER"
	"		COND_HEAR_WORLD"
	)

AI_END_CUSTOM_NPC()