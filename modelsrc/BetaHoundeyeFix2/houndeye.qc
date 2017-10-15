
$modelname "beta\houndeye.mdl"

$bodygroup "studio"
{
	studio "houndeye_reference.smd"
}


$surfaceprop "flesh"

$contents "solid"

$eyeposition 0 0 27

$maxeyedeflection 90

$cdmaterials "models\houndeye_beta\"

$cbox 0 0 0 0 0 0

$bbox -21.636 -20.322 -3.684 26.224 14.489 43.448

// $hboxset "default"
// $hbox 0 "Bip01 Pelvis" 0 -2.94 -5.5 4.27 4.013 4.95 ""
// $hbox 0 "Bip01 L Leg" -2.1 -7.3 -0.93 14.27 5.3 8.54 ""
// $hbox 0 "Bip01 L Leg1" 0 -3.91 0 10.39 2.75 5.35 ""
// $hbox 0 "Bip01 L Foot" -0.81 0 0 2.2 4.81 6.2 ""
// $hbox 0 "Bip01 Spine" -2.43 -10.23 -8.16 7.117 10.75 7.87 ""
// $hbox 0 "Bip01 Spine1" -4.06 -12.87 -9.06 7.116 10.16 8.77 ""
// $hbox 0 "Bip01 Spine2" -3.66 -15.01 -10.99 7.116 12.52 10.71 ""
// $hbox 0 "Bip01 Spine3" -1.61 -17.209999 -12.73 8.34 11.98 12.44 ""
// $hbox 0 "Bip01 Head" -9.73 -1.49 -13.13 16.74 8.95 12.82 ""
// $hbox 0 "Bip01 L Arm1" 0 -4.07 -2.49 19.34 9.53 4.93 ""
// $hbox 0 "Bip01 L Arm2" 0 -2.01 -1.73 10.41 4.53 2.84 ""
// $hbox 0 "Bip01 R Arm1" 0 -5.66 -5.22 19.33 9.53 3.82 ""
// $hbox 0 "Bip01 R Arm2" 0 -2.01 -3.15 10.42 4.52 1.46 ""
// $hbox 0 "Bone01" -6.18 -2.84 -6.4 2.7 0.8 6.32 ""




$includemodel "houndeye_anim.mdl"

$sequence "ragdoll" {
	"houndeye_anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "houndeye_physics.smd"
{
	$mass 45
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01"


	$jointconstrain "Bip01 Spine1" x limit -30 30 1
	$jointconstrain "Bip01 Spine1" y limit -30 30 1
	$jointconstrain "Bip01 Spine1" z limit -30 30 1

	$jointconstrain "Bip01 L Arm1" x limit -30 30 1
	$jointconstrain "Bip01 L Arm1" y limit -40 30 1
	$jointconstrain "Bip01 L Arm1" z limit -40 40 1

	$jointconstrain "Bip01 L Arm2" x limit -30 30 1
	$jointconstrain "Bip01 L Arm2" y limit -60 60 1
	$jointconstrain "Bip01 L Arm2" z limit -60 40 1

	$jointconstrain "Bip01 R Arm1" x limit -30 30 1
	$jointconstrain "Bip01 R Arm1" y limit -30 40 1
	$jointconstrain "Bip01 R Arm1" z limit -40 40 1

	$jointconstrain "Bip01 L Leg" x limit -30 30 1
	$jointconstrain "Bip01 L Leg" y limit -45 45 1
	$jointconstrain "Bip01 L Leg" z limit -50 30 1

	$jointconstrain "Bip01 R Arm2" x limit -30 30 1
	$jointconstrain "Bip01 R Arm2" y limit -60 60 1
	$jointconstrain "Bip01 R Arm2" z limit -60 40 1
}
