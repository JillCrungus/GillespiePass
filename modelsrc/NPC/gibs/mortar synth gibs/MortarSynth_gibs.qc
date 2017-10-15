// Created by Crowbar 0.49.0.0

$modelname "Gibs/MortarSynth_gibs.mdl"

$bodygroup "parts"
{
	studio "MortarSynth_gibs1.smd"
	studio "MortarSynth_gibs2.smd"
	studio "MortarSynth_gibs3.smd"
	studio "MortarSynth_gibs4.smd"
	studio "MortarSynth_gibs5.smd"
}


$contents "solid"

$cdmaterials "models\gibs\mortarsynth_gibs\"

$cbox 0 0 0 0 0 0

$bbox 9999 9999 9999 -9999 -9999 -9999

$animation "a_idle1" "MortarSynth_gibs_anims\idle1.smd" {
	fps 30
}

$sequence "idle1" {
	"a_idle1"
	fadein 0.2
	fadeout 0.2
	fps 30
}

