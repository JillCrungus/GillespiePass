// Created by Crowbar 0.49.0.0

$modelname "props_canal/mattpipe.mdl"

$bodygroup "studio"
{
	studio "mattpipe_reference.smd"
}

$surfaceprop "crowbar"

$contents "solid"

$cdmaterials "models\props_canal\\"

$cbox 0 0 0 0 0 0

$bbox -18.934 -4.664 -4.154 16.022 3.644 5.6


$sequence "idle" {
	"w_crowbar_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "attack1" {
	"w_crowbar_anims\attack1.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_crowbar_physics.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
