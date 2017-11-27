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

enum eResourceTypes
{
	RESOURCE_TYPE_GENERIC = 0,
	RESOURCE_TYPE_COMBINE,
	RESOURCE_TYPE_BIO,
	RESOURCE_TYPE_METAL,
};

class CItemResource : public CItem
{
public:
	DECLARE_CLASS(CItemResource, CItem);

	void Spawn();

	void Precache();
	
	bool MyTouch(CBasePlayer *pPlayer);

	int m_iResourceType;

	DECLARE_DATADESC();
};

