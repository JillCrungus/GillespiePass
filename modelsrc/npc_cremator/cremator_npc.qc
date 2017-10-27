$modelname "cremator_npc.mdl"
$body "studio" "cremator_ref.smd"
$bodygroup "gun"
{ 	
	studio "gun_reference.smd"
	blank
}
$bodygroup "head"
{
	studio "Head_Original.smd"
	blank
}


$cdmaterials "models/cremator/"
$illumposition 16.640 -0.291 43.756
$hboxset "default"
$hbox 3 "ValveBiped.Bip01_Pelvis" -26.628  -7.951  -14.889  14.620  15.188  12.608
$hbox 2 "ValveBiped.Bip01_Spine" -10.39    0.91   -7.50     4.61   15.91    7.50
$hbox 0 "ValveBiped.Bip01_Spine1" -0.732  -8.705  -17.540  22.916  15.704  16.553
$hbox 1 "ValveBiped.Bip01_Neck" 0.000  -8.424  -8.561  13.330  9.402  9.118
$hbox 1 "ValveBiped.Bip01_Neck1" 0.000  -8.424  -8.561  13.330  9.402  9.118
$hbox 1 "ValveBiped.Bip01_Head" 0.000  -4.271  -5.838  11.778  6.894  5.382
$hbox 4 "ValveBiped.Bip01_L_UpperArm" 0.000  -1.862  -1.531  19.849  2.177  1.970
$hbox 4 "ValveBiped.Bip01_L_Forearm" -4.926  -2.554  -1.927  18.133  3.004  1.996
$hbox 4 "ValveBiped.Bip01_L_Hand" -2.605  -1.645  -2.470  9.969  2.768  3.430
$hbox 5 "ValveBiped.Bip01_R_UpperArm" 0.000  -1.890  -1.987  19.872  2.086  1.515
$hbox 5 "ValveBiped.Bip01_R_Forearm" -4.987  -2.583  -2.013  18.249  3.011  1.910
$hbox 6 "ValveBiped.Bip01_L_Thigh" 0.000  -5.404  -6.000  22.312  1.664  0.000
$hbox 6 "ValveBiped.Bip01_L_Calf" 0.000  -5.871  -5.550  27.782  11.678  5.269
$hbox 6 "ValveBiped.Bip01_L_Foot" -5.194  -4.273  -4.874  5.179  11.354  4.772
$hbox 7 "ValveBiped.Bip01_R_Thigh" 0.000  -5.336  -0.000  22.312  0.000  2.712
$hbox 7 "ValveBiped.Bip01_R_Calf" 0.000  -5.958  -4.729  27.695  11.728  6.155
$hbox 7 "ValveBiped.Bip01_R_Foot" -5.171  -4.185  -4.194  5.148  11.403  5.772
$hbox 10 "Object08" -5.845  -54.751  -6.103  18.109  4.537  5.549
$poseparameter ZR -180.00 180.00
$attachment "1" "muzzle" -0.00 0.00 0.00 rotate 45 -90 0 
//$attachment "point1" "ValveBiped.Bip01_Pelvis" 1.60 15.00 0.80 rotate -0 0 0
$attachment "0" "muzzle" -0.00 0.00 0.00 rotate 45 -90 0 
$attachment "footleft" "ValveBiped.Bip01_L_Foot" 5.00 0.00 0.00 rotate 0 -180 180
$attachment "footright" "ValveBiped.Bip01_R_Foot" 5.00 0.00 0.00 rotate 0 -180 180
//$attachment "anim_attachment_RH" "ValveBiped.Bip01_R_Hand" 0.00 0.00 0.00 rotate 90.00 90.00 0.00
$attachment "anim_attachment_LH" "ValveBiped.Bip01_L_Hand" 0.00 0.00 -0.00 rotate -90.00 90.00 0.00
$surfaceprop "flesh_blueblood" // NOTE TO DL'ERS: You really, really, really want to change this
$contents solid
$eyeposition -0.000 0.000 95.500
$sequence walk1 "walk2m" fps 30.00 loop walkframe 37 LX LY ACT_WALK 1 {
	{ event AE_CL_PLAYSOUND 20 "Crem.Footstep" }
	{ event AE_CL_PLAYSOUND 2 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 26 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 33 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 35 "Crem.Footstep" }


}
$sequence run "walk2m" fps 36.00 loop walkframe 37 LX LY ACT_RUN 1 {

	{ event AE_CL_PLAYSOUND 20 "Crem.Footstep" }
	{ event AE_CL_PLAYSOUND 2 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 26 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 33 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 35 "Crem.Footstep" }

}
$sequence limp1 "limp1" fps 30.00 loop walkframe 37 LX LY ACT_WALK_HURT 1 {
	{ event AE_CL_PLAYSOUND 20 "Crem.Footstep" }
	{ event AE_CL_PLAYSOUND 2 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 16 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 28 "Crem.Swish" }
	{ event AE_CL_PLAYSOUND 30 "Crem.Footstep" }

}
$sequence flich1 "flich1" loop ACT_SMALL_FLINCH 1 fps 30.000
//$sequence fireinout "fireinout" ACT_FIREINOUT 1 fps 30.000
$sequence fireupleft "fireupleft" loop ACT_FIREUPLEFT 1 fps 30.000
$sequence fireupright "fireupright" loop ACT_FIREUPRIGHT 1 fps 30.000
$sequence fireinoutsw "fireinoutsw" loop ACT_FIRESPREAD 1 fps 30.000
$sequence breathing "breathing" loop ACT_IDLE 1 fps 30.000000 {
	{ event 5 1 }
}
$sequence firebreathing1 "firebreathing1" loop ACT_IDLE_ANGRY 1 fps 30.000

//Couldn't figure out a better way to do this.. Behold the EVIL EVENT SPAM
$sequence fireimmo "firebreathing1" loop ACT_RANGE_ATTACK1 1 fps 30.000 {
	{ event 4 3 }
	{ event 4 6 }
	{ event 4 9 }
	{ event 4 12 }
	{ event 4 15 }
	{ event 4 18 }
	{ event 4 21 }
	{ event 4 24 }
	{ event 4 27 }
	{ event 4 30 }
	{ event 4 33 }
	{ event 4 36 }
	{ event 4 39 }
	{ event 4 42 }
	{ event 4 45 }
	{ event 4 48 }
	{ event 4 51 }
	{ event 4 54 }
	{ event 4 57 }
	{ event 4 60 }
	{ event 4 63 }
	{ event 4 66 }
	{ event 4 69 }
	{ event 4 72 }
	{ event 4 75 }
	{ event 4 78 }
	{ event 4 81 }
	{ event 4 84 }
	{ event 4 87 }
	{ event 4 90 }
	{ event 4 93 }
	{ event 4 96 }
	{ event 4 99 }
	{ event 4 102 }
	{ event 4 105 }
	{ event 4 108 }
	{ event 4 111 }
	{ event 4 114 }
	{ event 4 117 }
	{ event 4 120 }
	{ event 4 123 }
	{ event 4 126 }
	{ event 4 129 }
	{ event 4 132 }
	{ event 4 135 }
	{ event 4 138 }
	{ event 4 141 }
	{ event 4 144 }
	{ event 4 147 }
	{ event 4 150 }
	{ event 5 153 }
}

//I was never able to get these 2 working
$sequence walkdeployed "walk2m" loop ACT_WALK_DEPLOYED 1 fps 30.000 {
	{ event 4 3 }
	{ event 4 6 }
	{ event 4 9 }
	{ event 4 12 }
	{ event 4 15 }
	{ event 4 18 }
	{ event 4 21 }
	{ event 4 24 }
	{ event 4 27 }
	{ event 4 30 }
	{ event 4 33 }
	{ event 5 36 }
}

$sequence rundeployed "walk2m" loop ACT_RUN_DEPLOYED 1 fps 36.000 {
	{ event 4 3 }
	{ event 4 6 }
	{ event 4 9 }
	{ event 4 12 }
	{ event 4 15 }
	{ event 4 18 }
	{ event 4 21 }
	{ event 4 24 }
	{ event 4 27 }
	{ event 4 30 }
	{ event 4 33 }
	{ event 5 36 }
}

$sequence firestart "firestart" ACT_MELEE_ATTACK1 1 fps 30.0000 {
	{ event 2 9 }
	{ event 1 10 }
}
$sequence firestop "firestop" ACT_CREMATOR_DISARM 1 fps 30.000 {
	{ event 8 1 }
}

//Change this to ACT_RANGE_ATTACK1 if you want this in
$sequence fireinout "fireinout" loop ACT_RANGE_ATTACK4 1 fps 30.000 {
	{ event 4 57 }
	{ event 4 60 }
	{ event 4 63 }
	{ event 4 66 }
	{ event 4 69 }
	{ event 4 72 }
	{ event 4 75 }
	{ event 4 76 }
	{ event 4 79 }
	{ event 4 82 }
	{ event 4 85 }
	{ event 4 88 }
	{ event 4 91 }
	{ event 4 94 }
	{ event 4 97 }
	{ event 4 100 }
	{ event 4 103 }
	{ event 4 106 }	
	{ event 4 109 }
	{ event 4 112 }
	{ event 4 115 }
	{ event 4 118 }
	{ event 4 121 }
	{ event 4 124 }
	{ event 4 127 }
	{ event 4 130 }
	{ event 4 133 }
	{ event 4 136 }	
	{ event 4 139 }
	{ event 4 142 }
	{ event 4 145 }
	{ event 4 148 }
	{ event 4 151 }
	{ event 4 154 }
	{ event 4 157 }
	{ event 4 160 }
	{ event 4 163 }
	{ event 4 166 }
	{ event 4 169 }
	{ event 4 172 }
	{ event 4 175 }
	{ event 4 178 }
	{ event 4 181 }
	{ event 4 184 }
	{ event 4 187 }
	{ event 4 190 }
	{ event 4 193 }
	{ event 4 196 }
	{ event 4 199 }
	{ event 5 200 }
}
$sequence ragdoll "ragdoll" ACT_DIERAGDOLL 1 fps 30.000000

$bonemerge ValveBiped.Bip01_R_Hand

$collisionjoints "phymodel.smd" {

	$mass 100.0
	$inertia 5.00
	$damping 0.01
	$rotdamping 1.50
	$rootbone "ValveBiped.Bip01_spine"

	$jointconstrain "rfront_flapa" x limit -6.00 6.00 0.20
	$jointconstrain "rfront_flapa" y limit 0.00 0.00 0.00
	$jointconstrain "rfront_flapa" z limit 0.00 0.00 0.00

	$jointconstrain "rback_flapa" x limit -6.00 6.00 0.20
	$jointconstrain "rback_flapa" y limit 0.00 0.00 0.00
	$jointconstrain "rback_flapa" z limit 0.00 0.00 0.00

	$jointconstrain "lback_flapa" x limit -6.00 6.00 0.20
	$jointconstrain "lback_flapa" y limit 0.00 0.00 0.00
	$jointconstrain "lback_flapa" z limit 0.00 0.00 0.00

	$jointconstrain "ValveBiped.Bip01_r_thigh" x limit 0.00 0.00 0.20
	$jointconstrain "ValveBiped.Bip01_r_thigh" y limit -5.00 5.00 0.20
	$jointconstrain "ValveBiped.Bip01_r_thigh" z limit -6.00 -1.00 0.20

	$jointconstrain "ValveBiped.Bip01_r_calf" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_r_calf" y limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_r_calf" z limit -15.00 3.00 0.20

	$jointconstrain "ValveBiped.Bip01_l_thigh" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_l_thigh" y limit -5.00 5.00 0.20
	$jointconstrain "ValveBiped.Bip01_l_thigh" z limit -6.00 1.00 0.20

	$jointconstrain "ValveBiped.Bip01_l_calf" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_l_calf" y limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_l_calf" z limit -15.00 3.00 0.20

	$jointconstrain "ValveBiped.Bip01_spine2" x limit -6.00 6.00 0.20
	$jointconstrain "ValveBiped.Bip01_spine2" y limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_spine2" z limit -22.00 31.00 0.20

	$jointconstrain "ValveBiped.Bip01_r_upperarm" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_r_upperarm" y limit -6.00 6.00 0.20
	$jointconstrain "ValveBiped.Bip01_r_upperarm" z limit -30.00 30.00 0.20

	$jointconstrain "ValveBiped.Bip01_r_forearm" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_r_forearm" y limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_r_forearm" z limit -50.00 0.00 0.20

	$jointconstrain "ValveBiped.Bip01_l_upperarm" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_l_upperarm" y limit -6.00 6.00 0.20
	$jointconstrain "ValveBiped.Bip01_l_upperarm" z limit -30.00 30.00 0.20

	$jointconstrain "ValveBiped.Bip01_l_forearm" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_l_forearm" y limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_l_forearm" z limit -50.00 0.00 0.20

	$jointconstrain "ValveBiped.Bip01_l_hand" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_l_hand" y limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_l_hand" z limit 0.00 20.00 0.20

	$jointconstrain "ValveBiped.Bip01_r_hand" x limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_r_hand" y limit 0.00 0.00 0.00
	$jointconstrain "ValveBiped.Bip01_r_hand" z limit 0.00 20.00 0.20

	$jointconstrain "lfront_flapa" x limit -8.00 8.00 0.20
	$jointconstrain "lfront_flapa" y limit 0.00 0.00 0.00
	$jointconstrain "lfront_flapa" z limit 0.00 0.00 0.00
	$animatedfriction 1.000 400.000 0.500 0.000 0.300
}