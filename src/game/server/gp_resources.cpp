#include "cbase.h"
#include "hl2_player.h"
#include "basecombatweapon.h"
#include "gamerules.h"
#include "items.h"
#include "engine/IEngineSound.h"
#include "gp_resources.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

#define RESOURCE_MODEL_COMBINE "models/weapons/w_bugbait.mdl"
#define RESOURCE_MODEL_BIO "models/weapons/w_bugbait.mdl"
#define RESOURCE_MODEL_METAL "models/weapons/w_bugbait.mdl"
#define RESOURCE_MODEL_GENERIC "models/weapons/w_bugbait.mdl"

BEGIN_DATADESC(CItemResource)
	DEFINE_KEYFIELD(	m_iResourceType, FIELD_INTEGER, "resourcetype")
END_DATADESC()


void CItemResource::Spawn()
{
	Precache();
	switch (m_iResourceType)
	{
		case RESOURCE_TYPE_GENERIC:
			Msg("WARNING!! Resource spawned without a type!! What the fuck happened?!\n");
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
			Msg("ERROR!! Something went seriously wrong with a resource! REMOVING.\n");
			UTIL_Remove(this);
			break;
	}
	BaseClass::Spawn();
}

void CItemResource::Precache()
{
	PrecacheModel(RESOURCE_MODEL_GENERIC);
	PrecacheModel(RESOURCE_MODEL_COMBINE);
	PrecacheModel(RESOURCE_MODEL_BIO);
	PrecacheModel(RESOURCE_MODEL_METAL);

	PrecacheScriptSound("ItemBattery.Touch");
}

bool CItemResource::MyTouch(CBasePlayer *pPlayer)
{

	CSingleUserRecipientFilter user(pPlayer);
	user.MakeReliable();

	UserMessageBegin(user, "ItemPickup");
	WRITE_STRING(GetClassname());
	MessageEnd();

	CPASAttenuationFilter filter(this, "ItemBattery.Touch");
	EmitSound(filter, entindex(), "ItemBattery.Touch");

	CHL2_Player *pHL2Player = dynamic_cast<CHL2_Player *>(pPlayer);
	if (pHL2Player)
	{
		pHL2Player->GiveResource(m_iResourceType, 1);
		return true;
	}
	return false;

}

LINK_ENTITY_TO_CLASS(item_resource, CItemResource);
PRECACHE_REGISTER(item_resource);