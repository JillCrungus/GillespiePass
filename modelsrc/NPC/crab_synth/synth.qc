// Created by Crowbar 0.49.0.0

$modelname "Synth.mdl"

$bodygroup "studio"
{
	studio "synth_reference.smd"
}


$surfaceprop "default"

$contents "solid"

$maxeyedeflection 90

$cdmaterials "models\synth\"

$cbox 0 0 0 0 0 0

$bbox -127.172 -97.617 -21.177 168.468 92.605 150.124


// The 32 below is a guess until further is known about the format.
$animblocksize 32

$sectionframes 30 175

$animation "walk_S" "synth_anims\walk_S.smd" {
	fps 30
	loop
}

$animation "walk_SE" "synth_anims\walk_SE.smd" {
	fps 30
	loop
}

$animation "walk_E" "synth_anims\walk_E.smd" {
	fps 30
}

$animation "walk_NE" "synth_anims\walk_NE.smd" {
	fps 30
}

$animation "walk_N" "synth_anims\walk_N.smd" {
	fps 30
}

$animation "walk_NW" "synth_anims\walk_NW.smd" {
	fps 30
}

$animation "walk_W" "synth_anims\walk_W.smd" {
	fps 30
	loop
}

$animation "walk_SW" "synth_anims\walk_SW.smd" {
	fps 30
	loop
}

$sequence "idleshake01" {
	"synth_anims\idleshake01.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	node "idle"
	fps 30
}

$sequence "idle01" {
	"synth_anims\idle01.smd"
	activity "ACT_IDLE" 5
	fadein 0.2
	fadeout 0.2
	node "idle"
	fps 30
}

$sequence "walk01" {
	"synth_anims\walk01.smd"
	activity "ACT_WALK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "chargeready" {
	"synth_anims\chargeready.smd"
	activity "ACT_CHARGE_START" 1
	fadein 0.2
	fadeout 0.2
	transition "idle" "precharge"
	fps 30
}

$sequence "chargestart" {
	"synth_anims\chargestart.smd"
	activity "ACT_CHARGE_START_MOVE" 1
	fadein 0.2
	fadeout 0.2
	transition "precharge" "charge"
	fps 30
}

$sequence "chargeloop" {
	"synth_anims\chargeloop.smd"
	activity "ACT_RUN" 1
	fadein 0.2
	fadeout 0.2
	node "charge"
	fps 30
	loop
}

$sequence "run01" {
	"synth_anims\run01.smd"
	activity "ACT_RUN" 4
	fadein 0.2
	fadeout 0.2
	node "charge"
	fps 40
	loop
	Y
}

$sequence "chargestop" {
	"synth_anims\chargestop.smd"
	activity "ACT_CHARGE_MOVE_END" 1
	fadein 0.2
	fadeout 0.2
	transition "charge" "postcharge"
	fps 30
}

$sequence "chargeend" {
	"synth_anims\chargeend.smd"
	activity "ACT_CHARGE_END" 1
	fadein 0.2
	fadeout 0.2
	transition "postcharge" "idle"
	fps 30
}

$sequence "die_temp" {
	"synth_anims\anims\die_temp.smd"
	activity "ACT_DIESIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 40
}


$bonesaveframe "Bip02" position rotation
$bonesaveframe "Bip02 Pelvis" rotation
$bonesaveframe "Bip02 Spine" position rotation
$bonesaveframe "Bip02 L Thigh" position rotation
$bonesaveframe "Bip02 L Calf" rotation
$bonesaveframe "Bip02 L HorseLink" rotation
$bonesaveframe "Bip02 L Foot" rotation
$bonesaveframe "Bip02 R Thigh" position rotation
$bonesaveframe "Bip02 R Calf" rotation
$bonesaveframe "Bip02 R HorseLink" rotation
$bonesaveframe "Bip02 R Foot" rotation
$bonesaveframe "Bip02 Tail" position rotation
$bonesaveframe "Box11" rotation
$bonesaveframe "Box09" rotation
$bonesaveframe "Dummy10" rotation
$bonesaveframe "Box07" position rotation
$bonesaveframe "Box06" position rotation
$bonesaveframe "Box08" position rotation
$bonesaveframe "Bip02 Spine1" rotation
$bonesaveframe "Bip02 Neck" rotation
$bonesaveframe "Bip02 L Clavicle" rotation
$bonesaveframe "Bip02 L UpperArm" rotation
$bonesaveframe "Bip02 L Forearm" rotation
$bonesaveframe "Bip02 L Hand" rotation
$bonesaveframe "Bone19" rotation
$bonesaveframe "Bone20" rotation
$bonesaveframe "Bone21" rotation
$bonesaveframe "Bip02 L Finger01" rotation
$bonesaveframe "Bip02 L Finger0" rotation
$bonesaveframe "Bone15" rotation
$bonesaveframe "Bone16" rotation
$bonesaveframe "Bone17" rotation
$bonesaveframe "Bip02 L Finger21" rotation
$bonesaveframe "Bip02 L Finger2" rotation
$bonesaveframe "Bip02 R Clavicle" rotation
$bonesaveframe "Bip02 R UpperArm" rotation
$bonesaveframe "Bip02 R Forearm" rotation
$bonesaveframe "Bone27" position rotation
$bonesaveframe "Bone29" rotation
$bonesaveframe "Bone28" rotation
$bonesaveframe "Bip02 R Finger21" rotation
$bonesaveframe "Bip02 R Finger2" rotation
$bonesaveframe "Bone23" position rotation
$bonesaveframe "Bone24" rotation
$bonesaveframe "Bone26" rotation
$bonesaveframe "Bip02 R Finger01" rotation
$bonesaveframe "Bip02 R Finger0" rotation
$bonesaveframe "Bone10" rotation
$bonesaveframe "Bone11" rotation
$bonesaveframe "Skeleton06" rotation
$bonesaveframe "Skeleton05" rotation
$bonesaveframe "Bone09" rotation
$bonesaveframe "Bone12" rotation
$bonesaveframe "Skeleton03" rotation
$bonesaveframe "Skeleton04" rotation
$bonesaveframe "Bone06" rotation
$bonesaveframe "Bone07" rotation
$bonesaveframe "Skeleton02" rotation
$bonesaveframe "Skeleton01" rotation
$bonesaveframe "Bone01" rotation
$bonesaveframe "Bone02" rotation
$bonesaveframe "Skeleton08" rotation
$bonesaveframe "Skeleton07" rotation
$bonesaveframe "Bone04" rotation
$bonesaveframe "Bone05" rotation
$bonesaveframe "Box04" rotation
$bonesaveframe "Box05" rotation
$bonesaveframe "Box02" position rotation
$bonesaveframe "Box03" rotation
$bonesaveframe "Box10" rotation
$bonesaveframe "Box01" position rotation
