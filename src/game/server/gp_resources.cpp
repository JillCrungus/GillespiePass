#include "cbase.h"
#include "hl2_player.h"
#include "basecombatweapon.h"
#include "gamerules.h"
#include "items.h"
#include "engine/IEngineSound.h"
#include "ndebugoverlay.h"
#include "gp_resources.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"


#define RESOURCE_MODEL_COMBINE "models/weapons/w_bugbait.mdl"
#define RESOURCE_MODEL_BIO "models/weapons/w_bugbait.mdl"
#define RESOURCE_MODEL_METAL "models/weapons/w_bugbait.mdl"
#define RESOURCE_MODEL_GENERIC "models/weapons/w_bugbait.mdl"

BEGIN_DATADESC(CItemResource)
	DEFINE_KEYFIELD(m_iResourceType, FIELD_INTEGER, "resourcetype"),
	DEFINE_KEYFIELD(m_iResourceValue, FIELD_INTEGER, "resourcevalue"),

	DEFINE_THINKFUNC(ShowResourceName)
END_DATADESC()


void CItemResource::Spawn()
{
	Precache();
	if (m_iResourceType == 1066)
	{
		m_iResourceType = RandomInt(1, 3);
	}
	switch (m_iResourceType)
	{
		case RESOURCE_TYPE_GENERIC:
			//Msg("WARNING!! Resource spawned without a type!! What the fuck happened?!\n");
			SetModel(RESOURCE_MODEL_GENERIC);
			break;

		case RESOURCE_TYPE_COMBINE:
			SetModel(RESOURCE_MODEL_COMBINE);
			break;

		case RESOURCE_TYPE_BIO:
			SetModel(RESOURCE_MODEL_BIO);
			break;

		case RESOURCE_TYPE_METAL:
			SetModel(RESOURCE_MODEL_METAL);
			break;

		default:
			Msg("ERROR!! Invalid resource type! REMOVING.\n");
			UTIL_Remove(this);
			break;
	}
	BaseClass::Spawn();
	SetThink(&CItemResource::ShowResourceName);
	SetNextThink(gpGlobals->curtime + 0.1f);
}

void CItemResource::Precache()
{
	PrecacheModel(RESOURCE_MODEL_GENERIC);
	PrecacheModel(RESOURCE_MODEL_COMBINE);
	PrecacheModel(RESOURCE_MODEL_BIO);
	PrecacheModel(RESOURCE_MODEL_METAL);

	PrecacheScriptSound("ItemBattery.Touch");
}

void CItemResource::ShowResourceName( )
{
	switch (m_iResourceType)
	{
	case RESOURCE_TYPE_GENERIC:
		NDebugOverlay::EntityTextAtPosition(GetAbsOrigin(), 0, "Generic Resource", 0.15f);
		SetRenderMode(kRenderWorldGlow);
		SetRenderColor(255, 0, 0);
	case RESOURCE_TYPE_COMBINE:
		NDebugOverlay::EntityTextAtPosition(GetAbsOrigin(), 0, "Combine Resource", 0.15f);
		break;
	case RESOURCE_TYPE_BIO:
		NDebugOverlay::EntityTextAtPosition(GetAbsOrigin(), 0, "Biological Resource", 0.15f);
		break;
	case RESOURCE_TYPE_METAL:
		NDebugOverlay::EntityTextAtPosition(GetAbsOrigin(), 0, "Metal Resource", 0.15f);
		break;
	default:
		NDebugOverlay::EntityTextAtPosition(GetAbsOrigin(), 0, "Error!! Invalid Resource", 0.15f);
		break;
	}
	SetNextThink(gpGlobals->curtime + 0.1f);
}

bool CItemResource::MyTouch(CBasePlayer *pPlayer)
{

	CSingleUserRecipientFilter user(pPlayer);
	user.MakeReliable();

	UserMessageBegin(user, "ItemPickup");
	WRITE_STRING(GetClassname() + m_iResourceType);
	MessageEnd();

	CPASAttenuationFilter filter(this, "ItemBattery.Touch");
	EmitSound(filter, entindex(), "ItemBattery.Touch");

	CHL2_Player *pHL2Player = dynamic_cast<CHL2_Player *>(pPlayer);
	if (pHL2Player)
	{
		pHL2Player->GiveResource(m_iResourceType, m_iResourceValue);
		return true;
	}
	return false;

}

LINK_ENTITY_TO_CLASS(item_resource, CItemResource);
PRECACHE_REGISTER(item_resource);