// Created by Crowbar 0.49.0.0

$modelname "testshit/samuel.mdl"

$model "samuel" "samuel_reference.smd" {

	flexcontroller eyelid range 0 1 right_lid_raiser
	flexcontroller eyelid range 0 1 left_lid_raiser
	flexcontroller eyelid range 0 1 right_lid_tightener
	flexcontroller eyelid range 0 1 left_lid_tightener
	flexcontroller eyelid range 0 1 right_lid_droop
	flexcontroller eyelid range 0 1 left_lid_droop
	flexcontroller eyelid range 0 1 blink
	flexcontroller brow range 0 1 right_inner_raiser
	flexcontroller brow range 0 1 left_inner_raiser
	flexcontroller brow range 0 1 right_outer_raiser
	flexcontroller brow range 0 1 left_outer_raiser
	flexcontroller brow range 0 1 right_lowerer
	flexcontroller brow range 0 1 left_lowerer
	flexcontroller nose range 0 1 right_cheek_raiser
	flexcontroller nose range 0 1 left_cheek_raiser
	flexcontroller nose range 0 1 wrinkler
	flexcontroller nose range 0 1 dilator
	flexcontroller mouth range 0 1 right_upper_raiser
	flexcontroller mouth range 0 1 left_upper_raiser
	flexcontroller mouth range 0 1 right_corner_puller
	flexcontroller mouth range 0 1 left_corner_puller
	flexcontroller mouth range 0 1 corner_depressor
	flexcontroller mouth range 0 1 chin_raiser
	flexcontroller phoneme range 0 1 right_part
	flexcontroller phoneme range 0 1 left_part
	flexcontroller phoneme range 0 1 right_puckerer
	flexcontroller phoneme range 0 1 left_puckerer
	flexcontroller phoneme range 0 1 right_funneler
	flexcontroller phoneme range 0 1 left_funneler
	flexcontroller phoneme range 0 1 right_stretcher
	flexcontroller phoneme range 0 1 left_stretcher
	flexcontroller phoneme range 0 1 bite
	flexcontroller phoneme range 0 1 presser
	flexcontroller phoneme range 0 1 tightener
	flexcontroller phoneme range 0 1 jaw_clencher
	flexcontroller phoneme range 0 1 jaw_drop
	flexcontroller phoneme range 0 1 right_mouth_drop
	flexcontroller phoneme range 0 1 left_mouth_drop
	flexcontroller head range -30 30 head_rightleft
	flexcontroller head range -45 20 head_updown
	flexcontroller head range -30 30 head_tilt
	flexcontroller eyes range -30 30 eyes_updown
	flexcontroller eyes range -30 30 eyes_rightleft
	flexcontroller arms range 0 1 arms_updown
	flexcontroller arms range 0 1 arms_inout

	localvar upper_right_lowerer
	localvar upper_right_neutral
	localvar upper_right_raiser
	localvar lower_right_lowerer
	localvar lower_right_neutral
	localvar lower_right_raiser
	localvar upper_left_lowerer
	localvar upper_left_neutral
	localvar upper_left_raiser
	localvar lower_left_lowerer
	localvar lower_left_neutral
	localvar lower_left_raiser
	localvar mouth
	localvar AU1R
	localvar AU1L
	localvar AU2R
	localvar AU2L
	localvar AU4R
	localvar AU4L
	localvar AU6R
	localvar AU6L
	localvar AU9R
	localvar AU9L
	localvar AU38
	localvar AU10R
	localvar AU10L
	localvar AU12R
	localvar AU12L
	localvar AU15
	localvar AU17R
	localvar AU17L
	localvar AU25R
	localvar AU25L
	localvar AU18R
	localvar AU18L
	localvar AU22R
	localvar AU22L
	localvar AU20R
	localvar AU20L
	localvar AU32
	localvar AU24
	localvar AU31
	localvar AU26R
	localvar AU26L
	localvar AU27R
	localvar AU27L
	localvar right_lip_suppressor
	localvar left_lip_suppressor
	%upper_right_raiser = right_lid_raiser * (1 - right_lid_droop * 0.8) * (1 - blink)
	%upper_right_neutral = (1 - right_lid_droop * 0.8) * (1 - right_lid_raiser) * (1 - blink)
	%upper_right_lowerer = blink
	%upper_left_raiser = left_lid_raiser * (1 - left_lid_droop * 0.8) * (1 - blink)
	%upper_left_neutral = (1 - left_lid_droop * 0.8) * (1 - left_lid_raiser) * (1 - blink)
	%upper_left_lowerer = blink
	%lower_right_raiser = blink
	%lower_right_neutral = (1 - blink) * (1 - right_lid_tightener * 0.5) * (1 - right_cheek_raiser * 0.25)
	%lower_right_lowerer = 0
	%lower_left_raiser = blink
	%lower_left_neutral = (1 - blink) * (1 - left_lid_tightener * 0.5) * (1 - left_cheek_raiser * 0.25)
	%lower_left_lowerer = 0
	%AU1R = right_inner_raiser * (1 - right_lowerer)
	%AU1L = left_inner_raiser * (1 - left_lowerer)
	%AU2R = right_outer_raiser * (1 - right_lowerer)
	%AU2L = left_outer_raiser * (1 - left_lowerer)
	%AU4R = right_lowerer
	%AU4L = left_lowerer
	%AU6R = right_cheek_raiser
	%AU6L = left_cheek_raiser
	%AU9R = wrinkler
	%AU9L = wrinkler
	%AU38 = dilator
	%AU10R = right_upper_raiser
	%AU10L = left_upper_raiser
	%AU12R = right_corner_puller
	%AU12L = left_corner_puller
	%AU15 = corner_depressor
	%right_lip_suppressor = 1 / (right_part + right_puckerer + right_funneler) * (1 - presser) * (1 - bite)
	%left_lip_suppressor = 1 / (left_part + left_puckerer + left_funneler) * (1 - presser) * (1 - bite)
	%AU25R = right_part * right_part * %right_lip_suppressor
	%AU25L = left_part * left_part * %left_lip_suppressor
	%AU18R = right_puckerer * right_puckerer * %right_lip_suppressor
	%AU18L = left_puckerer * left_puckerer * %left_lip_suppressor
	%AU22R = right_funneler * right_funneler * %right_lip_suppressor
	%AU22L = left_funneler * left_funneler * %left_lip_suppressor
	%AU17R = chin_raiser * (1 - jaw_drop * 0.5) * (1 - bite) * (1 - 0.6 * (%AU25R + %AU18R + %AU22R))
	%AU17L = chin_raiser * (1 - jaw_drop * 0.5) * (1 - bite) * (1 - 0.6 * (%AU25L + %AU18L + %AU22L))
	%AU20R = right_stretcher * (1 - jaw_drop * 0.5)
	%AU20L = left_stretcher * (1 - jaw_drop * 0.5)
	%AU32 = bite
	%AU24 = presser + (1 - presser) * tightener
	%AU31 = jaw_clencher * jaw_clencher / (jaw_clencher + jaw_drop)
	%AU26R = jaw_drop * (1 - right_mouth_drop * (1 - bite)) * jaw_drop / (jaw_clencher + jaw_drop)
	%AU26L = jaw_drop * (1 - left_mouth_drop * (1 - bite)) * jaw_drop / (jaw_clencher + jaw_drop)
	%AU27R = jaw_drop * right_mouth_drop * (1 - bite) * jaw_drop / (jaw_clencher + jaw_drop)
	%AU27L = jaw_drop * left_mouth_drop * (1 - bite) * jaw_drop / (jaw_clencher + jaw_drop)
	%mouth = %AU27R * 0.5 + %AU27L * 0.5 + %AU22R * 0.35 + %AU22L * 0.35 + %AU18R * 0.25 + %AU18L * 0.25 + %AU25R * 0.35 + %AU25L * 0.35 + %AU32 * 0.5
}

$weightlist "weights_barney_neckturn" {
	 "Bip01" 0
	 "Bip01 Pelvis" 0
	 "Bip01 L Calf" 0
	 "Bip01 L Foot" 0
	 "Bip01 L Foot" 0
	 "Bip01 R Calf" 0
	 "Bip01 R Foot" 0
	 "Bip01 R Foot" 0
	 "Bip01 Spine" 0
	 "Bip01 Spine1" 0
	 "Bip01 Spine2" 0
	 "Bip01 Spine3" 0
	 "Bip01 Neck" 0
	 "Bip01 L Hand" 0
	 "Bip01 R Hand" 0
	 "Bip01 Head" 1
	 "Bip01 R Clavicle" 0
	 "Bip01 R UpperArm" 0
	 "Bip01 R Forearm" 0
	 "Bip01 L Clavicle" 0
	 "Bip01 L UpperArm" 0
	 "Bip01 L Forearm" 0
}

$cdmaterials "models\samuel\"

$cbox 0 0 0 0 0 0

$bbox -7.137 -13.232 -0.203 6.687 13.807 71.441

$animation "neck_right" "barney_anims\neck_right.smd" {
	fps 30
	// This subtract line guesses the animation name and frame index. There is no way to determine which $animation and which frame was used. Change as needed.
	weightlist "weights_barney_neckturn"
}

$animation "neck_center" "barney_anims\neck_center.smd" {
	fps 30
	// This subtract line guesses the animation name and frame index. There is no way to determine which $animation and which frame was used. Change as needed.
	weightlist "weights_barney_neckturn"
}

$animation "neck_left" "barney_anims\neck_left.smd" {
	fps 30
	// This subtract line guesses the animation name and frame index. There is no way to determine which $animation and which frame was used. Change as needed.
	weightlist "weights_barney_neckturn"
}

$sequence "idle1" {
	"barney_anims\idle1.smd"
	activity "ACT_IDLE" 50
	fadein 0.2
	fadeout 0.2
	fps 15
	loop
}

$sequence "idle2" {
	"barney_anims\idle2.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "idle3" {
	"barney_anims\idle3.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "idle4" {
	"barney_anims\idle4.smd"
	activity "ACT_IDLE" 10
	fadein 0.2
	fadeout 0.2
	fps 12
}

$sequence "walk" {
	"barney_anims\walk.smd"
	activity "ACT_WALK" 1
	{ event 1004 0 "NPC.StepLeftWalk" }
	{ event 1004 15 "NPC.StepRightWalk" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "run" {
	"barney_anims\run.smd"
	activity "ACT_RUN" 1
	{ event 1004 5 "NPC.StepLeftRun" }
	{ event 1004 13 "NPC.StepRightRun" }
	fadein 0.2
	fadeout 0.2
	fps 25
	loop
}

$sequence "draw" {
	"barney_anims\draw.smd"
	activity "ACT_ARM" 1
	{ event 2 7 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "disarm" {
	"barney_anims\disarm.smd"
	activity "ACT_DISARM" 1
	{ event 4 15 "" }
	fadein 0.2
	fadeout 0.2
	fps 10
}

$sequence "reload" {
	"barney_anims\reload.smd"
	activity "ACT_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "turnleft" {
	"barney_anims\turnleft.smd"
	activity "ACT_TURN_LEFT" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "turnright" {
	"barney_anims\turnright.smd"
	activity "ACT_TURN_RIGHT" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "laflinch" {
	"barney_anims\laflinch.smd"
	activity "ACT_FLINCH_LEFTARM" 1
	fadein 0.2
	fadeout 0.2
	fps 16
}

$sequence "raflinch" {
	"barney_anims\raflinch.smd"
	activity "ACT_FLINCH_RIGHTARM" 1
	fadein 0.2
	fadeout 0.2
	fps 16
}

$sequence "llflinch" {
	"barney_anims\llflinch.smd"
	activity "ACT_FLINCH_LEFTLEG" 1
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "rlflinch" {
	"barney_anims\rlflinch.smd"
	activity "ACT_FLINCH_RIGHTLEG" 1
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "smlflinch" {
	"barney_anims\smlflinch.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "cower_stand" {
	"barney_anims\cower_stand.smd"
	fadein 0.2
	fadeout 0.2
	fps 14
}

$sequence "locked_door" {
	"barney_anims\locked_door.smd"
	fadein 0.2
	fadeout 0.2
	fps 28
	loop
}

$sequence "fall_loop" {
	"barney_anims\fall_loop.smd"
	fadein 0.2
	fadeout 0.2
	fps 28
	loop
}

$sequence "barn_wave" {
	"barney_anims\barn_wave.smd"
	fadein 0.2
	fadeout 0.2
	fps 22
}

$sequence "beat_grunt" {
	"barney_anims\beat_grunt.smd"
	fadein 0.2
	fadeout 0.2
	fps 14
}

$sequence "beat_gruntidle" {
	"barney_anims\beat_gruntidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 14
	loop
}

$sequence "flashlight" {
	"barney_anims\flashlight.smd"
	{ event 1004 5 "Weapons.BulletHit1" }
	fadein 0.2
	fadeout 0.2
	fps 14
	loop
}

$sequence "shootgun" {
	"barney_anims\shootgun.smd"
	"barney_anims\shootgun_2.smd"
	activity "ACT_RANGE_ATTACK1" 1
	blend "XR" -50 50
	blendwidth 2
	{ event 3 0 "" }
	{ event 5001 0 "21" }
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "shootgun2" {
	"barney_anims\shootgun2.smd"
	"barney_anims\shootgun2_2.smd"
	activity "ACT_RANGE_ATTACK1" 2
	blend "XR" -50 50
	blendwidth 2
	{ event 3 0 "" }
	{ event 5001 0 "21" }
	fadein 0.2
	fadeout 0.2
	fps 25
}

$sequence "diesimple" {
	"barney_anims\diesimple.smd"
	activity "ACT_DIE_HEADSHOT" 1
	{ event 2001 5 "" }
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "dieviolent" {
	"barney_anims\dieviolent.smd"
	activity "ACT_DIE_HEADSHOT" 1
	{ event 2001 10 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "diegutshot" {
	"barney_anims\diegutshot.smd"
	activity "ACT_DIE_GUTSHOT" 1
	{ event 2001 33 "" }
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "dieforward" {
	"barney_anims\dieforward.smd"
	activity "ACT_DIEFORWARD" 1
	{ event 2001 8 "" }
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "diebackward" {
	"barney_anims\diebackward.smd"
	activity "ACT_DIEBACKWARD" 1
	{ event 2001 19 "" }
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "diecrump" {
	"barney_anims\diecrump.smd"
	activity "ACT_DIESIMPLE" 2
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "barnaclehit" {
	"barney_anims\barnaclehit.smd"
	activity "ACT_BARNACLE_HIT" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "barnaclepull" {
	"barney_anims\barnaclepull.smd"
	activity "ACT_BARNACLE_PULL" 1
	fadein 0.2
	fadeout 0.2
	fps 45
	loop
}

$sequence "barnaclecrunch" {
	"barney_anims\barnaclecrunch.smd"
	activity "ACT_BARNACLE_CHOMP" 1
	fadein 0.2
	fadeout 0.2
	fps 5
}

$sequence "barnaclechew" {
	"barney_anims\barnaclechew.smd"
	activity "ACT_BARNACLE_CHEW" 1
	fadein 0.2
	fadeout 0.2
	fps 5
	loop
}

$sequence "lying_on_back" {
	"barney_anims\lying_on_back.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$sequence "lying_on_side" {
	"barney_anims\lying_on_side.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$sequence "lying_on_stomach" {
	"barney_anims\lying_on_stomach.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$sequence "stuffed_in_vent" {
	"barney_anims\stuffed_in_vent.smd"
	fadein 0.2
	fadeout 0.2
	fps 1
}

$sequence "standing_idle" {
	"barney_anims\standing_idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 15
	loop
}

$sequence "cprbarney" {
	"barney_anims\cprbarney.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "cprbarneyrevive" {
	"barney_anims\cprbarneyrevive.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "barney_dragvent" {
	"barney_anims\barney_dragvent.smd"
	{ event 1000 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "dying_barney" {
	"barney_anims\dying_barney.smd"
	{ event 1000 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "dying_barneyidle" {
	"barney_anims\dying_barneyidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 12
	loop
}

$sequence "dying_friend" {
	"barney_anims\dying_friend.smd"
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "dying_friendidle" {
	"barney_anims\dying_friendidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 12
	loop
}

$sequence "c1a3_bidle" {
	"barney_anims\c1a3_bidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 3
}

$sequence "c1a3_ventb" {
	"barney_anims\c1a3_ventb.smd"
	{ event 1000 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "c1a3_emergeidle" {
	"barney_anims\c1a3_emergeidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 16
	loop
}

$sequence "c1a3_emerge" {
	"barney_anims\c1a3_emerge.smd"
	{ event 1000 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 16
}

$sequence "haulbarney" {
	"barney_anims\haulbarney.smd"
	{ event 1000 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "intropush" {
	"barney_anims\intropush.smd"
	{ event 1004 15 "NPC.ButtonBlip1" }
	{ event 1004 24 "NPC.ButtonBlip1" }
	{ event 1004 34 "NPC.ButtonBlip1" }
	{ event 1004 44 "NPC.ButtonBlip1" }
	fadein 0.2
	fadeout 0.2
	fps 16
}

$sequence "fence" {
	"barney_anims\fence.smd"
	{ event 1000 70 "" }
	{ event 1001 70 "" }
	{ event 1004 72 "NPC.Electro4" }
	{ event 1008 100 "NPC_Barney.Pain2" }
	fadein 0.2
	fadeout 0.2
	fps 24
}

$sequence "sit1" {
	"barney_anims\sit1.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "almostidle" {
	"barney_anims\almostidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 16
	loop
}

$sequence "almost" {
	"barney_anims\almost.smd"
	{ event 1000 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 26
}

$sequence "laseridle" {
	"barney_anims\laseridle.smd"
	fadein 0.2
	fadeout 0.2
	fps 6
}

$sequence "laser_top" {
	"barney_anims\laser_top.smd"
	{ event 1000 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 6
}

$sequence "laser_bottom" {
	"barney_anims\laser_bottom.smd"
	{ event 1000 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 6
}

$sequence "barneyfallidle" {
	"barney_anims\barneyfallidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 33
	loop
}

$sequence "barneyfall" {
	"barney_anims\barneyfall.smd"
	{ event 1000 1 "" }
	{ event 1008 2 "NPC_Barney.Pain1" }
	{ event 1008 24 "NPC_Barney.Pain2" }
	{ event 1008 55 "NPC.BustFlesh1" }
	fadein 0.2
	fadeout 0.2
	fps 32
}

$sequence "c3a2_draw" {
	"barney_anims\c3a2_draw.smd"
	{ event 2 13 "" }
	fadein 0.2
	fadeout 0.2
	fps 16
}

$sequence "unlatch" {
	"barney_anims\unlatch.smd"
	fadein 0.2
	fadeout 0.2
	fps 12
}

$sequence "retina" {
	"barney_anims\retina.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "relaxstand" {
	"barney_anims\relaxstand.smd"
	fadein 0.2
	fadeout 0.2
	fps 10
	loop
}

$sequence "assassinated" {
	"barney_anims\assassinated.smd"
	{ event 1000 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "trackswitch" {
	"barney_anims\trackswitch.smd"
	fadein 0.2
	fadeout 0.2
	fps 22
}

$sequence "pepsiswing" {
	"barney_anims\pepsiswing.smd"
	fadein 0.2
	fadeout 0.2
	fps 25
}

$sequence "pepsipush" {
	"barney_anims\pepsipush.smd"
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "buttonpush" {
	"barney_anims\buttonpush.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
}


$sequence "barney_neckturn" {
	"neck_right"
	"neck_center"
	"neck_left"
	autoplay
	blend "head_yaw" -90 90
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
	fps 30
	// This subtract line guesses the animation name and frame index. There is no way to determine which $animation and which frame was used. Change as needed.
	weightlist "weights_barney_neckturn"
}

$sequence "ragdoll" {
	"barney_anims\ragdoll.smd"
	activity "ACT_DIERAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionjoints "barney_physics.smd"
{
	$mass 115
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01"


	$jointconstrain "Bip01 Spine2" x limit -60 60 0.2
	$jointconstrain "Bip01 Spine2" y limit -25 25 0.2
	$jointconstrain "Bip01 Spine2" z limit -25 30 0.2

	$jointconstrain "Bip01 R Arm1" x limit 0 0 0
	$jointconstrain "Bip01 R Arm1" y limit -45 64 0.2
	$jointconstrain "Bip01 R Arm1" z limit -73 12 0.2

	$jointconstrain "Bip01 R Arm2" x limit 0 0 0
	$jointconstrain "Bip01 R Arm2" y limit 0 0 0
	$jointconstrain "Bip01 R Arm2" z limit -120 4 0.2

	$jointconstrain "Bip01 L Arm1" x limit 0 0 0
	$jointconstrain "Bip01 L Arm1" y limit -67 30 0.2
	$jointconstrain "Bip01 L Arm1" z limit -73 12 0.2

	$jointconstrain "Bip01 L Arm2" x limit 0 0 0
	$jointconstrain "Bip01 L Arm2" y limit 0 0 0
	$jointconstrain "Bip01 L Arm2" z limit -120 4 0.2

	$jointconstrain "Bip01 L Hand" x limit -60 60 0.2
	$jointconstrain "Bip01 L Hand" y limit 0 0 0
	$jointconstrain "Bip01 L Hand" z limit -57 70 0.2

	$jointconstrain "Bip01 R Hand" x limit -60 60 0.2
	$jointconstrain "Bip01 R Hand" y limit 0 0 0
	$jointconstrain "Bip01 R Hand" z limit -57 70 0.2

	$jointconstrain "Bip01 R Calf" x limit -25 20 0.2
	$jointconstrain "Bip01 R Calf" y limit -40 20 0.2
	$jointconstrain "Bip01 R Calf" z limit -37 63 0.2

	$jointconstrain "Bip01 R Foot" x limit 0 0 0
	$jointconstrain "Bip01 R Foot" y limit 0 0 0
	$jointconstrain "Bip01 R Foot" z limit -95 4 0.2

	$jointrotdamping "Bip01 Head" 5
	$jointconstrain "Bip01 Head" x limit -20 20 0.2
	$jointconstrain "Bip01 Head" y limit -25 25 0.2
	$jointconstrain "Bip01 Head" z limit -13 30 0.2

	$jointconstrain "Bip01 L Calf" x limit -25 20 0.2
	$jointconstrain "Bip01 L Calf" y limit -20 40 0.2
	$jointconstrain "Bip01 L Calf" z limit -37 63 0.2

	$jointconstrain "Bip01 L Foot" x limit 0 0 0
	$jointconstrain "Bip01 L Foot" y limit 0 0 0
	$jointconstrain "Bip01 L Foot" z limit -95 4 0.2

	$jointconstrain "Bip01 L Foot" x limit 0 0 0
	$jointconstrain "Bip01 L Foot" y limit 0 0 0
	$jointconstrain "Bip01 L Foot" z limit -15 35 0.2

	$jointconstrain "Bip01 R Foot" x limit 0 0 0
	$jointconstrain "Bip01 R Foot" y limit 0 0 0
	$jointconstrain "Bip01 R Foot" z limit -15 35 0.2
}

