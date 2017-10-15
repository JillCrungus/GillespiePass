
$modelname "bullsquid.mdl"

$bodygroup "studio"
{
	studio "bullsquid_reference.smd"
}


$surfaceprop "alienflesh"

$contents "solid"

// Only set this if you know what it does, and need it for special circumstances, such as with gibs.
// $illumposition 3.109 15.672 19.327

$eyeposition 0 16 28

$cdmaterials "models\bullchicken\"

$texturegroup "skinfamilies"
{
	{ "eye"  }
	{ "eye2" }
}

// This list shows the VMT file names used in the SMD files.
// "bottommap.vmt"
// "tailside.vmt"
// "toptail.vmt"
// "bodytop.vmt"
// "tentacletop.vmt"
// "eye.vmt"
// "legside.vmt"
// "tentside.vmt"
// "mouth.vmt"
// "teeth.vmt"
// "eye2.vmt"

// Clipping box or view bounding box.
$cbox 0 0 0 0 0 0

// Bounding box or hull. Used for collision with a world object.
$bbox -81.355 -47.154 -7.817 50.011 53.373 46.471

// Hitbox info. Used for damage-based collision.
// The hitbox info below was automatically generated when compiled because no hitbox info was provided.
// $hboxset "default"
// $hbox 0 "Bip01 Pelvis" -13.546475 -15.420195 -17.36688 10.204422 6.877171 17.137121 ""
// $hbox 0 "Bip01 L Leg" 0 -11.215634 -5.138365 18.814709 6.249693 4.416617 ""
// $hbox 0 "Bip01 L Leg1" -6.429573 -4.548048 -6.627685 21.987322 10.99637 4.2939 ""
// $hbox 0 "Bip01 L Foot" -1.099963 -1.936903 -3.544376 4.324765 6.811002 2.615911 ""
// $hbox 0 "Bip01 L Toe0" 0 0 -1.608606 2.368488 2.893111 0.2168 ""
// $hbox 0 "Bip01 L Toe01" 0 0 -1.17046 2.475975 1.733203 1.068408 ""
// $hbox 0 "Bip01 L Toe1" 0 0 -0.213077 2.468929 2.883625 1.647466 ""
// $hbox 0 "Bip01 L Toe11" 0 0 -1.234789 2.487453 1.751643 1.214811 ""
// $hbox 0 "Bip01 R Leg" 0 -11.203029 -4.62651 18.907194 7.187526 5.27647 ""
// $hbox 0 "Bip01 R Leg1" -6.475284 -4.455014 -4.503813 21.987322 11.182483 6.417589 ""
// $hbox 0 "Bip01 R Foot" -1.099908 -1.909158 -2.371836 4.324765 7.017687 3.788455 ""
// $hbox 0 "Bip01 R Toe0" 0 0 -0.052492 2.277466 2.917929 1.895302 ""
// $hbox 0 "Bip01 R Toe01" 0 0 -0.934262 2.390434 1.746977 1.310935 ""
// $hbox 0 "Bip01 R Toe1" 0 0 -1.517999 1.821401 3.05348 0.396634 ""
// $hbox 0 "Bip01 R Toe11" 0 0 -1.014149 1.821401 1.825378 1.429346 ""
// $hbox 0 "Bip01 Spine" 0 -10.857156 -18.624407 11.689318 2.073344 18.394993 ""
// $hbox 0 "Bip01 Spine1" 0 -8.106318 -15.78529 21.095257 6.164953 15.55591 ""
// $hbox 0 "Bip01 Head" -4.189922 0 -11.528622 4.327651 5.364872 8.909744 ""
// $hbox 0 "Bone14" -0.47032 -7.807242 -3.035759 3.27728 0 0 ""
// $hbox 0 "Bone15" 0 -7.49407 -0.389988 2.989225 0 1.417812 ""
// $hbox 0 "Bone16" -0.347061 -6.764126 -5.046505 3.076538 0 0 ""
// $hbox 0 "Bone08" -0.614687 -8.579099 -3.623929 3.856412 0 0 ""
// $hbox 0 "Bone09" -0.886591 -7.396745 -3.690598 3.178008 0 0 ""
// $hbox 0 "Bone10" -0.220332 -5.839535 -4.17077 2.038767 0 0 ""
// $hbox 0 "Bone32" -3.791187 -6.374823 -3.791677 0.306113 0 0.476824 ""
// $hbox 0 "Bone33" -2.246505 -4.021058 -3.733889 1.233997 0 0.976712 ""
// $hbox 0 "Bone34" -1.112375 -5.136815 -3.372963 1.484027 0 0 ""
// $hbox 0 "Bone02" -0.392633 -7.552754 -4.080136 4.050067 0 0 ""
// $hbox 0 "Bone03" -0.018836 -3.769499 -3.182214 2.993564 0 0 ""
// $hbox 0 "Bone04" -2.002798 -4.322295 -3.104729 1.038702 0 0 ""
// $hbox 0 "Bone20" -2.743346 -7.396744 -7.564444 1.724452 0 0 ""
// $hbox 0 "Bone21" -1.389799 -5.947877 -4.765428 2.3235 0 0 ""
// $hbox 0 "Bone22" -1.06819 -6.19207 -0.298264 1.55121 0 1.481636 ""
// $hbox 0 "Bone26" -3.320139 -9.107598 -2.043632 0.233463 0 0.079169 ""
// $hbox 0 "Bone27" -1.451812 -8.049912 -2.599668 2.632989 0 0.558433 ""
// $hbox 0 "Bone28" -0.69798 -7.421041 -6.531869 1.75842 0 0 ""
// $hbox 0 "Bip01 Tail" 0 -6.985824 -12.546788 15.490297 8.034822 12.316812 ""
// $hbox 0 "Bip01 Tail1" 0 -5.03083 -7.463956 15.491479 5.794646 7.233544 ""
// $hbox 0 "Bip01 Tail2" 0 -3.251336 -3.447433 16.109854 2.658242 3.216667 ""


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
