
$modelname "beta\bullsquid.mdl"

$bodygroup "studio"
{
	studio "bullsquid_reference.smd"
}


$surfaceprop "flesh"

$contents "solid"

$eyeposition 0 0 24

$maxeyedeflection 90

$cdmaterials "models\Bullsquid_beta\"

$attachment "Mouth" "Bullsquid.Tent_Bone15" 0 0 0 rotate 0 -45 90

$cbox 0 0 0 0 0 0

$bbox -73.03 -43.584 -1.582 61.091 46.814 73.572

// $hboxset "default"
// $hbox 0 "Bullsquid.Body_bone" -14.56 -14.94 -12.4 14.56 8.74 9.45 ""
// $hbox 0 "Bullsquid.Head_Bone" -12.53 -14.1 -18.790001 24.23 10.85 16.940001 ""
// $hbox 0 "Bullsquid.Head_Bone1" -7.3 -11.52 -16.200001 21 11.25 16.620001 ""
// $hbox 0 "Bullsquid.Leg_R1" -11.26 -18.639999 -5.3 25.540001 9.38 10.89 ""
// $hbox 0 "Bullsquid.Tail_Bone" -6.78 -10.1 -14.53 14.19 13.76 13.84 ""
// $hbox 0 "Bullsquid.Tail_Bone1" -11.69 -9.75 -12.12 17.719999 11.57 12.54 ""
// $hbox 0 "Bullsquid.Tail_Bone2" -5.96 -7.96 -9.78 17.799999 5.15 10.2 ""
// $hbox 0 "Bullsquid.Tail_Bone3" -5.74 -6.4 -5.5 17.42 4.2 5.92 ""
// $hbox 0 "Bullsquid.Tail_Bone4" -5.17 -3.67 -3.91 14.18 2.28 4.33 ""
// $hbox 0 "Bullsquid.Leg_L1" -11.31 -9.27 -4.63 25.49 18.139999 11.29 ""


$poseparameter "move_yaw" -180 180 0

$animation "a_walkN" "bullsquid_anims\a_walkN.smd" {
	fps 30
	loop
}

$animation "a_walkNE" "bullsquid_anims\a_walkNE.smd" {
	fps 30
	loop
}

$animation "a_walkE" "bullsquid_anims\a_walkE.smd" {
	fps 30
	loop
}

$animation "a_walkSE" "bullsquid_anims\a_walkSE.smd" {
	fps 30
	loop
}

$animation "a_walkS" "bullsquid_anims\a_walkS.smd" {
	fps 30
	loop
}

$animation "a_walkSW" "bullsquid_anims\a_walkSW.smd" {
	fps 30
	loop
}

$animation "a_walkW" "bullsquid_anims\a_walkW.smd" {
	fps 30
	loop
}

$animation "a_walkNW" "bullsquid_anims\a_walkNW.smd" {
	fps 30
	loop
}

$animation "a_run1N" "bullsquid_anims\a_run1N.smd" {
	fps 30
	loop
}

$animation "a_run2N" "bullsquid_anims\a_run2N.smd" {
	fps 30
	loop
}

$sequence "Idle01" {
	"bullsquid_anims\Idle01.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle02" {
	"bullsquid_anims\Idle02.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "ActiveIdle" {
	"bullsquid_anims\ActiveIdle.smd"
	activity "ACT_SQUID_SMELL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "walk_all" {
	"a_walkS"
	"a_walkSE"
	"a_walkE"
	"a_walkNE"
	"a_walkN"
	"a_walkNW"
	"a_walkW"
	"a_walkSW"
	"a_walkS"
	activity "ACT_WALK" 1
	blend "move_yaw" -180 180
	blendwidth 9
	{ event 2051 10 "" }
	{ event 2050 20 "" }
	fadein 0.2
	fadeout 0.2
	node ""
	fps 30
	loop
}

$sequence "walk2" {
	"a_walkS"
	"a_walkSE"
	"a_walkE"
	"a_walkNE"
	"a_walkN"
	"a_walkNW"
	"a_walkW"
	"a_walkSW"
	"a_walkS"
	activity "ACT_SQUID_WALK_EXCITED" 1
	blend "move_yaw" -180 180
	blendwidth 9
	{ event 2051 10 "" }
	{ event 2050 20 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Run1" {
	"a_walkS"
	"a_walkSE"
	"a_walkE"
	"a_walkNE"
	"a_run1N"
	"a_walkNW"
	"a_walkW"
	"a_walkSW"
	"a_walkS"
	activity "ACT_RUN" 1
	blend "move_yaw" -180 180
	blendwidth 9
	{ event 2051 8 "" }
	{ event 2050 15 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Run2" {
	"a_walkS"
	"a_walkSE"
	"a_walkE"
	"a_walkNE"
	"a_run2N"
	"a_walkNW"
	"a_walkW"
	"a_walkSW"
	"a_walkS"
	activity "ACT_SQUID_RUN_EXCITED" 1
	blend "move_yaw" -180 180
	blendwidth 9
	{ event 2051 8 "" }
	{ event 2050 15 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "hop" {
	"bullsquid_anims\hop.smd"
	activity "ACT_HOP" 1
	{ event 5 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "spit" {
	"bullsquid_anims\spit.smd"
	activity "ACT_RANGE_ATTACK1" 1
	{ event 1 7 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "pounce" {
	"bullsquid_anims\pounce.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 2 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "tailwhip" {
	"bullsquid_anims\tailwhip.smd"
	activity "ACT_MELEE_ATTACK2" 1
	{ event 7 2 "" }
	{ event 6 12 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "eat" {
	"bullsquid_anims\eat.smd"
	activity "ACT_SQUID_EAT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "eatdone" {
	"bullsquid_anims\eatdone.smd"
	activity "ACT_SQUID_DONE_EAT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "play" {
	"bullsquid_anims\play.smd"
	activity "ACT_SQUID_DISPLAY" 1
	{ event 4 55 "" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "hc_spot" {
	"bullsquid_anims\hc_spot.smd"
	activity "ACT_SQUID_SEE_HC" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "Die" {
	"bullsquid_anims\Die.smd"
	activity "ACT_DIESIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "swim" {
	"bullsquid_anims\swim.smd"
	activity "ACT_SWIM" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "ragdoll" {
	"bullsquid_anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "bullsquid_physics.smd"
{
	$mass 94
	$inertia 10
	$damping 0.01
	$rotdamping 1
	$rootbone " "


	$jointconstrain "Bullsquid.Leg_L" x limit 0 0 0
	$jointconstrain "Bullsquid.Leg_L" y limit 0 0 0
	$jointconstrain "Bullsquid.Leg_L" z limit 0 0 0

	$jointconstrain "Bullsquid.Leg_L1" x limit 0 0 0
	$jointconstrain "Bullsquid.Leg_L1" y limit 0 0 0
	$jointconstrain "Bullsquid.Leg_L1" z limit 0 0 0

	$jointconstrain "Bullsquid.Tail_Bone" x limit 0 0 0
	$jointconstrain "Bullsquid.Tail_Bone" y limit 0 0 0
	$jointconstrain "Bullsquid.Tail_Bone" z limit 0 0 0

	$jointconstrain "Bullsquid.Tail_Bone2" x limit 0 0 0
	$jointconstrain "Bullsquid.Tail_Bone2" y limit 0 0 0
	$jointconstrain "Bullsquid.Tail_Bone2" z limit 0 0 0

	$jointconstrain "Bullsquid.Tail_Bone3" x limit 0 0 0
	$jointconstrain "Bullsquid.Tail_Bone3" y limit 0 0 0
	$jointconstrain "Bullsquid.Tail_Bone3" z limit 0 0 0

	$jointconstrain "Bullsquid.Tail_Bone4" x limit 0 0 0
	$jointconstrain "Bullsquid.Tail_Bone4" y limit 0 0 0
	$jointconstrain "Bullsquid.Tail_Bone4" z limit 0 0 0

	$jointconstrain "Bullsquid.Leg_R" x limit 0 0 0
	$jointconstrain "Bullsquid.Leg_R" y limit 0 0 0
	$jointconstrain "Bullsquid.Leg_R" z limit 0 0 0

	$jointconstrain "Bullsquid.Leg_R1" x limit 0 0 0
	$jointconstrain "Bullsquid.Leg_R1" y limit 0 0 0
	$jointconstrain "Bullsquid.Leg_R1" z limit 0 0 0

	$jointconstrain "Bullsquid.Hand_BoneR" x limit 0 0 0
	$jointconstrain "Bullsquid.Hand_BoneR" y limit 0 0 0
	$jointconstrain "Bullsquid.Hand_BoneR" z limit 0 0 0

	$jointconstrain "Bullsquid.Head_Bone1" x limit 0 0 0
	$jointconstrain "Bullsquid.Head_Bone1" y limit 0 0 0
	$jointconstrain "Bullsquid.Head_Bone1" z limit 0 0 0

	$jointconstrain "Bullsquid.Hand_BoneL" x limit 0 0 0
	$jointconstrain "Bullsquid.Hand_BoneL" y limit 0 0 0
	$jointconstrain "Bullsquid.Hand_BoneL" z limit 0 0 0
}
