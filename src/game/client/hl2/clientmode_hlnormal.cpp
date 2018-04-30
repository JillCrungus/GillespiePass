//========= Copyright Valve Corporation, All rights reserved. ============//
//
// Purpose: Draws the normal TF2 or HL2 HUD.
//
//=============================================================================
#include "cbase.h"
#include "clientmode_hlnormal.h"
#include "vgui_int.h"
#include "hud.h"
#include <vgui/IInput.h>
#include <vgui/IPanel.h>
#include <vgui/ISurface.h>
#include <vgui_controls/AnimationController.h>
#include "iinput.h"
#include "ienginevgui.h"

// memdbgon must be the last include file in a .cpp file!!!
#include "tier0/memdbgon.h"

extern bool g_bRollingCredits;

ConVar fov_desired( "fov_desired", "75", FCVAR_ARCHIVE | FCVAR_USERINFO, "Sets the base field-of-view.", true, 75.0, true, 90.0 );

//-----------------------------------------------------------------------------
// Globals
//-----------------------------------------------------------------------------
vgui::HScheme g_hVGuiCombineScheme = 0;


// Instance the singleton and expose the interface to it.
IClientMode *GetClientModeNormal()
{
	static ClientModeHLNormal g_ClientModeNormal;
	return &g_ClientModeNormal;
}


//-----------------------------------------------------------------------------
// Purpose: this is the viewport that contains all the hud elements
//-----------------------------------------------------------------------------
class CHudViewport : public CBaseViewport
{
private:
	DECLARE_CLASS_SIMPLE( CHudViewport, CBaseViewport );

protected:
	virtual void ApplySchemeSettings( vgui::IScheme *pScheme )
	{
		BaseClass::ApplySchemeSettings( pScheme );

		gHUD.InitColors( pScheme );

		SetPaintBackgroundEnabled( false );
	}

	virtual void CreateDefaultPanels( void ) { /* don't create any panels yet*/ };
};


//-----------------------------------------------------------------------------
// ClientModeHLNormal implementation
//-----------------------------------------------------------------------------
ClientModeHLNormal::ClientModeHLNormal()
{
	m_pViewport = new CHudViewport();
	m_pViewport->Start( gameuifuncs, gameeventmanager );
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
ClientModeHLNormal::~ClientModeHLNormal()
{
}


//-----------------------------------------------------------------------------
// Purpose: 
//-----------------------------------------------------------------------------
void ClientModeHLNormal::Init()
{
	BaseClass::Init();

	// Load up the combine control panel scheme
	g_hVGuiCombineScheme = vgui::scheme()->LoadSchemeFromFileEx( enginevgui->GetPanel( PANEL_CLIENTDLL ), IsXbox() ? "resource/ClientScheme.res" : "resource/CombinePanelScheme.res", "CombineScheme" );
	if (!g_hVGuiCombineScheme)
	{
		Warning( "Couldn't load combine panel scheme!\n" );
	}
}

bool ClientModeHLNormal::ShouldDrawCrosshair( void )
{
	return ( g_bRollingCredits == false );
}

vgui::Panel *ClientModeHLNormal::GetPanelFromViewport(const char *pchNamePath)
{
	char szTagetName[256];
	Q_strncpy(szTagetName, pchNamePath, sizeof(szTagetName));

	char *pchName = szTagetName;

	char *pchEndToken = strchr(pchName, ';');
	if (pchEndToken)
	{
		*pchEndToken = '\0';
	}

	char *pchNextName = strchr(pchName, '/');
	if (pchNextName)
	{
		*pchNextName = '\0';
		pchNextName++;
	}

	// Comma means we want to count to a specific instance by name
	int nInstance = 0;

	char *pchInstancePos = strchr(pchName, ',');
	if (pchInstancePos)
	{
		*pchInstancePos = '\0';
		pchInstancePos++;

		nInstance = atoi(pchInstancePos);
	}

	// Find the child
	int nCurrentInstance = 0;
	vgui::Panel *pPanel = NULL;

	for (int i = 0; i < GetViewport()->GetChildCount(); i++)
	{
		Panel *pChild = GetViewport()->GetChild(i);
		if (!pChild)
			continue;

		if (stricmp(pChild->GetName(), pchName) == 0)
		{
			nCurrentInstance++;

			if (nCurrentInstance > nInstance)
			{
				pPanel = pChild;
				break;
			}
		}
	}

	pchName = pchNextName;

	while (pPanel)
	{
		if (!pchName || pchName[0] == '\0')
		{
			break;
		}

		pchNextName = strchr(pchName, '/');
		if (pchNextName)
		{
			*pchNextName = '\0';
			pchNextName++;
		}

		// Comma means we want to count to a specific instance by name
		nInstance = 0;

		pchInstancePos = strchr(pchName, ',');
		if (pchInstancePos)
		{
			*pchInstancePos = '\0';
			pchInstancePos++;

			nInstance = atoi(pchInstancePos);
		}

		// Find the child
		nCurrentInstance = 0;
		vgui::Panel *pNextPanel = NULL;

		for (int i = 0; i < pPanel->GetChildCount(); i++)
		{
			Panel *pChild = pPanel->GetChild(i);
			if (!pChild)
				continue;

			if (stricmp(pChild->GetName(), pchName) == 0)
			{
				nCurrentInstance++;

				if (nCurrentInstance > nInstance)
				{
					pNextPanel = pChild;
					break;
				}
			}
		}

		pPanel = pNextPanel;
		pchName = pchNextName;
	}

	return pPanel;
}




