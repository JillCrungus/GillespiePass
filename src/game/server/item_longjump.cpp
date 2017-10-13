//========= Copyright Valve Corporation, All rights reserved. ============//
//
// Purpose: Long jump module
//
// $NoKeywords: $
//=============================================================================//

#include "cbase.h"
#include "hl2_player.h"
#include "basecombatweapon.h"
#include "gamerules.h"
#include "items.h"
#include "engine/IEngineSound.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"


class CItemLongJump : public CItem
{
public:
	DECLARE_CLASS(CItemLongJump, CItem);

	void Spawn(void)
	{
		Precache();
		SetModel("models/items/w_longjump.mdl");
		BaseClass::Spawn();
	}

	void Precache(void)
	{
		PrecacheModel("models/items/w_longjump.mdl");
		PrecacheScriptSound("HL2Player.LJR");
		PrecacheScriptSound("HL2Player.LongJump");
	}

	bool MyTouch(CBasePlayer *pPlayer)
	{
		if (pPlayer->m_bLongJump)
		{
			return FALSE;
		}

		pPlayer->m_bLongJump = TRUE;// player now has longjump module
		pPlayer->SetSuitUpdate("!HEV_A1", false, SUIT_NEXT_IN_1MIN);
		return TRUE;
		}
};

LINK_ENTITY_TO_CLASS(item_longjump, CItemLongJump);
PRECACHE_REGISTER(item_longjump);