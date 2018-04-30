//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// No spaces in event names, max length 32
// All strings are case sensitive
//
// valid data key types are:
//   string : a zero terminated string
//   bool   : unsigned int, 1 bit
//   byte   : unsigned int, 8 bit
//   short  : signed int, 16 bit
//   long   : signed int, 32 bit
//   float  : float, 32 bit
//   local  : any data, but not networked to clients
//
// following key names are reserved:
//   local      : if set to 1, event is not networked to clients
//   unreliable : networked, but unreliable
//   suppress   : never fire this event
//   time	: firing server time
//   eventid	: holds the event ID

"sdkevents"
{
	"gameinstructor_draw"
	{
	}
	
	"gameinstructor_nodraw"
	{
	}
	
	"set_instructor_group_enabled"
	{
		"group"		"string"
		"enabled"	"short"
	}

	"pickup_pickedup"
	{
		"class" "string" //Class of what we picked up 
	}

	"player_longjumped"
	{
	}

	"weapon_deploy"
	{
		"weapon"			"string"
	}

	"weapon_fired" // We fired our weapon
	{
		"secondary"		"bool" // True if it was our secondary attack
	}

	"snark_thrown"
	{
		"snark"		"short"
	}

	"instructor_server_hint_create"
	{
		"hint_name"	"string"
		"hint_replace_key" "string"
		"hint_target" "short"
		"hint_activator_userid" "short"
		"hint_timeout" "short"
		"hint_icon_onscreen" "string"
		"hint_icon_offscreen" "string"
		"hint_caption" "string"
		"hint_activator_caption" "string"
		"hint_color" "string"
		"hint_icon_offset" "float"
		"hint_range" "float"
		"hint_flags" "long"
		"hint_binding" "string"
		"hint_allow_nodraw_target" "bool"
		"hint_nooffscreen" "bool"
		"hint_forcecaption" "bool"
		"hint_local_player_only" "bool"
	}

	"instructor_server_hint_stop"
	{
		"hint_name"	"string"
	}
	
}
