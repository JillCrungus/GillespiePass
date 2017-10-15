
$modelname "houndeye.mdl"

$bodygroup "studio"
{
	studio "houndeye_reference.smd"
}


$surfaceprop "alienflesh"

$contents "solid"

// Only set this if you know what it does, and need it for special circumstances, such as with gibs.
// $illumposition -4.116 -0.863 22.343

$eyeposition 0 0 27

$cdmaterials "models\houndeye\"

$texturegroup "skinfamilies"
{
	{ "eye"  }
	{ "eye1" }
	{ "eye2" }
}

// This list shows the VMT file names used in the SMD files.
// "rleg.vmt"
// "fleg.vmt"
// "insidelegs.vmt"
// "belly.vmt"
// "eye.vmt"
// "side.vmt"
// "hoof.vmt"
// "rleg_inside.vmt"
// "eye1.vmt"
// "eye2.vmt"

// Clipping box or view bounding box.
$cbox 0 0 0 0 0 0

// Bounding box or hull. Used for collision with a world object.
$bbox -23.818 -25.319 -2.933 25.545 17.086 47.619

// Hitbox info. Used for damage-based collision.
// The hitbox info below was automatically generated when compiled because no hitbox info was provided.
// $hboxset "default"
// $hbox 0 "Bip01 Pelvis" -0.000005 0 -0.130056 1.268482 4.012748 3.533233 ""
// $hbox 0 "Bip01 L Leg" -0.41491 -6.874317 -1.653698 14.191053 4.064085 9.193302 ""
// $hbox 0 "Bip01 L Leg1" 0 -1.507447 0 9.483088 2.132726 4.853573 ""
// $hbox 0 "Bip01 L Foot" -0.275906 0 0 2.218288 4.560258 5.238676 ""
// $hbox 0 "Bip01 Spine" -0.395763 -9.081964 -7.342815 7.116809 4.28595 7.202585 ""
// $hbox 0 "Bip01 Spine1" -3.285251 -10.916257 -8.911316 7.115733 6.896903 8.772284 ""
// $hbox 0 "Bip01 Spine2" -2.780502 -13.748435 -9.238277 7.115577 10.109046 9.086722 ""
// $hbox 0 "Bip01 Spine3" -2.760295 -15.477165 -12.537875 8.513328 12.563179 12.390124 ""
// $hbox 0 "Bip01 Neck" -2.905748 -7.748605 -12.224167 1.887411 0.001516 11.895201 ""
// $hbox 0 "Bip01 Head" -10.539563 -1.132983 -11.934581 15.974941 9.48171 11.781818 ""
// $hbox 0 "Bip01 L Arm1" -0.433404 -4.029322 -1.666672 19.256119 7.831665 5.324105 ""
// $hbox 0 "Bip01 L Arm2" 0 -1.8126 -1.277096 9.94842 2.800971 2.6903 ""
// $hbox 0 "Bip01 R Arm1" 0 -4.028514 -5.58144 19.256119 7.949551 1.533792 ""
// $hbox 0 "Bip01 R Arm2" 0 -1.661757 -2.812223 9.925092 2.79732 1.158298 ""


$sequence "idle1" {
	"houndeye_anims\idle1.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "idle2" {
	"houndeye_anims\idle2.smd"
	activity "ACT_IDLE" 20
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "idle3" {
	"houndeye_anims\idle3.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "run" {
	"houndeye_anims\run.smd"
	activity "ACT_RUN" 4
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "run2" {
	"houndeye_anims\run2.smd"
	activity "ACT_RUN" 2
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "run3" {
	"houndeye_anims\run3.smd"
	activity "ACT_RUN" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "die" {
	"houndeye_anims\die.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 2001 5 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "die1" {
	"houndeye_anims\die1.smd"
	activity "ACT_DIEFORWARD" 1
	{ event 2001 10 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "die2" {
	"houndeye_anims\die2.smd"
	activity "ACT_DIEBACKWARD" 2
	{ event 2001 8 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "die3" {
	"houndeye_anims\die3.smd"
	activity "ACT_DIEBACKWARD" 1
	{ event 2001 7 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "attack" {
	"houndeye_anims\attack.smd"
	activity "ACT_RANGE_ATTACK1" 1
	{ event 2 5 "" }
	{ event 3 59 "" }
	fadein 0.2
	fadeout 0.2
	fps 25
}

$sequence "flinch_small" {
	"houndeye_anims\flinch_small.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "flinch_small2" {
	"houndeye_anims\flinch_small2.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "die_crumple" {
	"houndeye_anims\die_crumple.smd"
	activity "ACT_DIESIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "running_junp" {
	"houndeye_anims\running_junp.smd"
	activity "ACT_LEAP" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "walk_limp" {
	"houndeye_anims\walk_limp.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "walk2" {
	"houndeye_anims\walk2.smd"
	activity "ACT_WALK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "leaderlook" {
	"houndeye_anims\leaderlook.smd"
	activity "ACT_GUARD" 1
	{ event 1 10 "" }
	{ event 1 20 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "sleep" {
	"houndeye_anims\sleep.smd"
	activity "ACT_CROUCHIDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "gotosleep" {
	"houndeye_anims\gotosleep.smd"
	activity "ACT_CROUCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "sleeptostand" {
	"houndeye_anims\sleeptostand.smd"
	activity "ACT_STAND" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "madidle" {
	"houndeye_anims\madidle.smd"
	activity "ACT_IDLE_ANGRY" 2
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "madidle2" {
	"houndeye_anims\madidle2.smd"
	activity "ACT_IDLE_ANGRY" 3
	{ event 4 7 "" }
	{ event 7 7 "" }
	{ event 4 17 "" }
	{ event 7 17 "" }
	{ event 5 34 "" }
	{ event 7 34 "" }
	fadein 0.2
	fadeout 0.2
	fps 37
	loop
}

$sequence "madidle3" {
	"houndeye_anims\madidle3.smd"
	activity "ACT_IDLE_ANGRY" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "inspect" {
	"houndeye_anims\inspect.smd"
	activity "ACT_INSPECT_WALL" 1
	fadein 0.2
	fadeout 0.2
	fps 10
}

$sequence "eat" {
	"houndeye_anims\eat.smd"
	activity "ACT_EAT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "180l" {
	"houndeye_anims\180l.smd"
	activity "ACT_TURN_LEFT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "180r" {
	"houndeye_anims\180r.smd"
	activity "ACT_TURN_RIGHT" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "jumpback" {
	"houndeye_anims\jumpback.smd"
	activity "ACT_LEAP" 1
	{ event 6 10 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "wakefast" {
	"houndeye_anims\wakefast.smd"
	activity "ACT_HOP" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "whimper" {
	"houndeye_anims\whimper.smd"
	fadein 0.2
	fadeout 0.2
	fps 35
	loop
}

$sequence "jumpwindow" {
	"houndeye_anims\jumpwindow.smd"
	fadein 0.2
	fadeout 0.2
	fps 28
}

$sequence "ragdoll" {
	"houndeye_anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionjoints "houndeye_physics.smd"
{
	$mass 45
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01"


	$jointconstrain "Bip01 Spine1" x limit -30 30 0.2
	$jointconstrain "Bip01 Spine1" y limit -30 30 0.2
	$jointconstrain "Bip01 Spine1" z limit -30 30 0.2

	$jointconstrain "Bip01 L Arm1" x limit -30 30 0.2
	$jointconstrain "Bip01 L Arm1" y limit -40 30 0.2
	$jointconstrain "Bip01 L Arm1" z limit -40 40 0.2

	$jointconstrain "Bip01 L Arm2" x limit -30 30 0.2
	$jointconstrain "Bip01 L Arm2" y limit -60 60 0.2
	$jointconstrain "Bip01 L Arm2" z limit -60 40 0.2

	$jointconstrain "Bip01 R Arm1" x limit -30 30 0.2
	$jointconstrain "Bip01 R Arm1" y limit -30 40 0.2
	$jointconstrain "Bip01 R Arm1" z limit -40 40 0.2

	$jointconstrain "Bip01 L Leg" x limit -30 30 0.2
	$jointconstrain "Bip01 L Leg" y limit -45 45 0.2
	$jointconstrain "Bip01 L Leg" z limit -50 30 0.2

	$jointconstrain "Bip01 R Arm2" x limit -30 30 0.2
	$jointconstrain "Bip01 R Arm2" y limit -60 60 0.2
	$jointconstrain "Bip01 R Arm2" z limit -60 40 0.2
}
