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

	virtual void Spawn();

	virtual void Precache();

	//void PhysicsSimulate();
	
	virtual bool MyTouch(CBasePlayer *pPlayer);

	int m_iResourceType;

	int m_iResourceValue = 1; //How many of the resource should we give?

	virtual void ShowResourceName(void);

	DECLARE_DATADESC();

protected:
	CNetworkVar(bool, m_bGlowEnabled);
};

