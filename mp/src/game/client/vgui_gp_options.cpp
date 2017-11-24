//The following include files are necessary to allow your MyPanel.cpp to compile.
#include "cbase.h"
#include "IGPOptionsPanel.h"
using namespace vgui;
#include <vgui/IVGui.h>
#include <vgui_controls/Frame.h>
#include <vgui_controls/Button.h>
#include <vgui_controls/cvartogglecheckbutton.h>



//CMyPanel class: Tutorial example class
class CGPOptionsPanel : public vgui::Frame
{
	DECLARE_CLASS_SIMPLE(CGPOptionsPanel, vgui::Frame);
	//CMyPanel : This Class / vgui::Frame : BaseClass

	CGPOptionsPanel(vgui::VPANEL parent); 	// Constructor
	~CGPOptionsPanel(){};				// Destructor

protected:
	//VGUI overrides:
	virtual void OnTick();
	virtual void OnCommand(const char* pcCommand);


private:
	//Other used VGUI control Elements:
	Button *m_pCloseButton;

};



// Constuctor: Initializes the Panel
CGPOptionsPanel::CGPOptionsPanel(vgui::VPANEL parent)
	: BaseClass(NULL, "GPOptionsPanel")
{
	SetParent(parent);

	SetKeyBoardInputEnabled(true);
	SetMouseInputEnabled(true);

	SetProportional(false);
	SetTitleBarVisible(true);
	SetMinimizeButtonVisible(true);
	SetMaximizeButtonVisible(true);
	SetCloseButtonVisible(true);
	SetSizeable(true);
	SetMoveable(true);
	SetVisible(true);


	SetScheme(vgui::scheme()->LoadSchemeFromFile("resource/SourceScheme.res", "SourceScheme"));

	LoadControlSettings("resource/GPOptions.res");

	vgui::ivgui()->AddTickSignal(GetVPanel(), 100);

	DevMsg("Panel has been constructed\n");


}


//Class: CMyPanelInterface Class. Used for construction.
class CGPOptionsPanelInterface : public IGPOptionsPanel
{
private:
	CGPOptionsPanel *MyPanel;
public:
	CGPOptionsPanelInterface()
	{
		MyPanel = NULL;
	}
	void Create(vgui::VPANEL parent)
	{
		MyPanel = new CGPOptionsPanel(parent);
	}
	void Destroy()
	{
		if (MyPanel)
		{
			MyPanel->SetParent((vgui::Panel *)NULL);
			delete MyPanel;
		}
	}
	void Activate(void)
	{
		if (MyPanel)
		{
			MyPanel->Activate();
		}
	}

};
static CGPOptionsPanelInterface g_MyPanel;
IGPOptionsPanel* mypanel = (IGPOptionsPanel*)&g_MyPanel;
ConVar cl_showmypanel("cl_showmypanel", "0", FCVAR_CLIENTDLL, "Sets the state of myPanel <state>");



CON_COMMAND(ToggleGPOptions, "Toggles myPanel on or off")
{
	cl_showmypanel.SetValue(!cl_showmypanel.GetBool());
	mypanel->Activate();
};


void CGPOptionsPanel::OnTick()
{
	BaseClass::OnTick();
	SetVisible(cl_showmypanel.GetBool()); //CL_SHOWMYPANEL / 1 BY DEFAULT
}



void CGPOptionsPanel::OnCommand(const char* pcCommand)
{
	BaseClass::OnCommand(pcCommand);
	if (!Q_stricmp(pcCommand, "turnoff"))
		cl_showmypanel.SetValue(0);
}


