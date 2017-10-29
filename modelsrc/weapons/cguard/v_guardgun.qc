// Created by Crowbar 0.49.0.0

$modelname "Weapons\v_Guardgun.mdl"

$bodygroup "studio"
{
	studio "v_guardgun_Guardgun_reference_reuived.smd"
}


$contents "solid"

$maxeyedeflection 90

$cdmaterials "Models\Weapons\v_Guardgun\"
$cdmaterials "models\Weapons\V_hand\"

$attachment "0" "Muzzle" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox 15.916 -18.478 -21.403 74.406 -4.053 -2.625


$sequence "idle1" {
	"v_guardgun_anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "draw" {
	"v_guardgun_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "fire" {
	"v_guardgun_anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "fireempty" {
	"v_guardgun_anims\fireempty.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload" {
	"v_guardgun_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}
