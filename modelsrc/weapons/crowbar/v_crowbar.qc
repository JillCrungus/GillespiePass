// Created by Crowbar 0.49.0.0

$modelname "Weapons/v_pipe.mdl"

$bodygroup "studio"
{
	studio "v_pipe_reference.smd"
}


$surfaceprop "default"

$contents "solid"

$cdmaterials "models\Weapons\V_hand\"
$cdmaterials "models\Weapons\V_crowbar\"
$cdmaterials "models\props_canal\\"

$attachment "0" "ValveBiped.Tip" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox 7.416 -17.287 -33.063 43.324 0 2.306


$sequence "idle01" {
	"v_crowbar_anims\idle01.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "draw" {
	"v_crowbar_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "misscenter1" {
	"v_crowbar_anims\misscenter1.smd"
	activity "ACT_VM_MISSCENTER" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "misscenter2" {
	"v_crowbar_anims\misscenter2.smd"
	activity "ACT_VM_MISSCENTER" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "hitcenter1" {
	"v_crowbar_anims\hitcenter1.smd"
	activity "ACT_VM_HITCENTER" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "hitcenter2" {
	"v_crowbar_anims\hitcenter2.smd"
	activity "ACT_VM_HITCENTER" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "hitcenter3" {
	"v_crowbar_anims\hitcenter3.smd"
	activity "ACT_VM_HITCENTER" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "hitkill1" {
	"v_crowbar_anims\hitkill1.smd"
	activity "ACT_VM_HITKILL" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "holster" {
	"v_crowbar_anims\holster.smd"
	activity "ACT_VM_HOLSTER" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}
