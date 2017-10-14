
$modelname "bullsquid.mdl"

$bodygroup "studio"
{
	studio "bullsquid_reference.smd"
}


$surfaceprop "alienflesh"

$contents "solid"

$eyeposition 0 16 28

$cdmaterials "models\bullchicken\"

$texturegroup "skinfamilies"
{
	{ "eye"  }
	{ "eye2" }
}

$cbox 0 0 0 0 0 0

$bbox -81.355 -47.154 -7.817 50.011 53.373 46.471


$sequence "walk" {
	"bullsquid_anims\walk.smd"
	activity "ACT_WALK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "run" {
	"bullsquid_anims\run.smd"
	activity "ACT_RUN" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "suprisedhop" {
	"bullsquid_anims\suprisedhop.smd"
	activity "ACT_HOP" 1
	{ event 5 11 "" }
	fadein 0.2
	fadeout 0.2
	fps 42
}

$sequence "flinchs" {
	"bullsquid_anims\flinchs.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "flinchb" {
	"bullsquid_anims\flinchb.smd"
	activity "ACT_BIG_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "turnleft" {
	"bullsquid_anims\turnleft.smd"
	activity "ACT_TURN_LEFT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "turnright" {
	"bullsquid_anims\turnright.smd"
	activity "ACT_TURN_RIGHT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "idle" {
	"bullsquid_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "whip" {
	"bullsquid_anims\whip.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 4 23 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "bite" {
	"bullsquid_anims\bite.smd"
	activity "ACT_MELEE_ATTACK2" 1
	{ event 2 7 "{" }
	{ event 6 10 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "range" {
	"bullsquid_anims\range.smd"
	activity "ACT_RANGE_ATTACK1" 1
	{ event 1 11 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "look" {
	"bullsquid_anims\look.smd"
	activity "ACT_INSPECT_WALL" 1
	{ event 3 10 "" }
	{ event 3 25 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "seecrab" {
	"bullsquid_anims\seecrab.smd"
	activity "ACT_SQUID_EXCITED" 1
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
	loop
}

$sequence "inspectdown" {
	"bullsquid_anims\inspectdown.smd"
	activity "ACT_SQUID_INSPECT_FLOOR" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "sniff" {
	"bullsquid_anims\sniff.smd"
	activity "ACT_SQUID_DETECT_SCENT" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "die" {
	"bullsquid_anims\die.smd"
	activity "ACT_DIEFORWARD" 1
	{ event 2002 2 "" }
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "die1" {
	"bullsquid_anims\die1.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 2002 52 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "bulljump" {
	"bullsquid_anims\bulljump.smd"
	fadein 0.2
	fadeout 0.2
	fps 25
}

$sequence "draggruntidle" {
	"bullsquid_anims\draggruntidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 14
}

$sequence "draggrunt" {
	"bullsquid_anims\draggrunt.smd"
	{ event 1004 1 "NPC_Bullsquid.Idle3" }
	{ event 1004 12 "NPC_Bullsquid.Idle1" }
	fadein 0.2
	fadeout 0.2
	fps 10
}

$sequence "scare" {
	"bullsquid_anims\scare.smd"
	{ event 1004 8 "NPC_Bullsquid.AttackGrowl3" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "squidfallidle" {
	"bullsquid_anims\squidfallidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 33
	loop
}

$sequence "squidfall" {
	"bullsquid_anims\squidfall.smd"
	{ event 1000 1 "" }
	{ event 1008 3 "NPC_Bullsquid.AttackGrowl2" }
	{ event 1008 33 "NPC_Bullsquid.AttackGrowl3" }
	{ event 1008 59 "Debris.Bustflesh2" }
	fadein 0.2
	fadeout 0.2
	fps 32
}

$sequence "ragdoll" {
	"bullsquid_anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionjoints "bullsquid_physics.smd"
{
	$mass 115
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01"


	$jointconstrain "Bip01 Tail" x limit -30 30 0.2
	$jointconstrain "Bip01 Tail" y limit -30 30 0.2
	$jointconstrain "Bip01 Tail" z limit -40 30 0.2

	$jointconstrain "Bip01 Spine" x limit -35 35 0.2
	$jointconstrain "Bip01 Spine" y limit -20 20 0.2
	$jointconstrain "Bip01 Spine" z limit -60 35 0.2

	$jointconstrain "Bip01 Neck" x limit -30 30 0.2
	$jointconstrain "Bip01 Neck" y limit -15 15 0.2
	$jointconstrain "Bip01 Neck" z limit -20 20 0.2

	$jointconstrain "Bip01 R Leg" x limit -20 40 0.2
	$jointconstrain "Bip01 R Leg" y limit -25 35 0.2
	$jointconstrain "Bip01 R Leg" z limit -45 40 0.2

	$jointconstrain "Bip01 R Leg1" x limit -35 35 0.2
	$jointconstrain "Bip01 R Leg1" y limit -35 35 0.2
	$jointconstrain "Bip01 R Leg1" z limit -35 35 0.2

	$jointconstrain "Bip01 Tail2" x limit -30 30 0.2
	$jointconstrain "Bip01 Tail2" y limit -45 45 0.2
	$jointconstrain "Bip01 Tail2" z limit -55 45 0.2

	$jointconstrain "Bip01 L Leg" x limit -40 20 0.2
	$jointconstrain "Bip01 L Leg" y limit -35 25 0.2
	$jointconstrain "Bip01 L Leg" z limit -45 40 0.2

	$jointconstrain "Bip01 L Leg1" x limit -35 35 0.2
	$jointconstrain "Bip01 L Leg1" y limit -35 35 0.2
	$jointconstrain "Bip01 L Leg1" z limit -35 35 0.2

	$jointconstrain "Bip01 L Foot" x limit -20 20 0.2
	$jointconstrain "Bip01 L Foot" y limit -30 30 0.2
	$jointconstrain "Bip01 L Foot" z limit -45 45 0.2

	$jointconstrain "Bip01 R Foot" x limit -20 20 0.2
	$jointconstrain "Bip01 R Foot" y limit -30 30 0.2
	$jointconstrain "Bip01 R Foot" z limit -45 45 0.2
}
