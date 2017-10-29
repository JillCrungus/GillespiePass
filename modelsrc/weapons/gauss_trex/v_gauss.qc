// Created by Crowbar 0.49.0.0

$modelname "weapons\v_Gauss.mdl"

$bodygroup "studio"
{
	studio "v_gauss_Gauss_reference.smd"
}


$contents "solid"

$maxeyedeflection 90

$cdmaterials "models\Weapons\V_hand\"
$cdmaterials "models\Weapons\V_Gauss\"

$attachment "0" "muzzle" 13 0 0 rotate 0 -180 0

$cbox 0 0 0 0 0 0

$bbox 25.401 -23.999 -26.629 83.879 2.925 -9.121

$controller 0 "Dummy17" Y 0 360
$controller 1 "Dummy14" Y 0 360


$sequence "idle" {
	"v_gauss_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "fire" {
	"v_gauss_anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "charged_fire" {
	"v_gauss_anims\charged_fire.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "draw" {
	"v_gauss_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	fps 35
}

$sequence "shake" {
	"v_gauss_anims\shake.smd"
	activity "ACT_VM_PULLBACK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
