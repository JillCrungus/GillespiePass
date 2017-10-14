
$modelname "beta\houndeye.mdl"

$bodygroup "studio"
{
	studio "houndeye_reference2.smd"
}


$surfaceprop "flesh"

$contents "solid"

$eyeposition 0 0 27

$maxeyedeflection 90

$cdmaterials "models\houndeye_beta\"

$cbox 0 0 0 0 0 0

$bbox -21.636 -20.322 -3.684 26.224 14.489 43.448


$sectionframes 30 121

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

$sequence "run_1" {
	"houndeye_anims\run_1.smd"
	activity "ACT_RUN" 4
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "run_2" {
	"houndeye_anims\run_2.smd"
	activity "ACT_RUN" 2
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "run_3" {
	"houndeye_anims\run_3.smd"
	activity "ACT_RUN" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
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
	{ event 6 6 "" }
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
	activity "ACT_DIESIMPLE" 1
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

}
