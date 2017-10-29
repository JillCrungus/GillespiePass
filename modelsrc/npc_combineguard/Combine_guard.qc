$modelname "Combine_guard.mdl"
$cdmaterials "models/combine_guard/"

$scale 1.3
$model "studio" "Guard_reference.smd"

$bodygroup "gun"
{
	studio "Gun_reference_reuv.smd"
	blank
}

$illumposition 14.61 -4.25 49.07

$surfaceprop "metal"

$contents solid

$bbox -22.32 -33.33 -0.20 51.54 24.82 98.35
$hboxset "default"

$attachment "muzzle" "muzzle" 8.00 0.00 0.00 rotate -0.00 -0.00 0.00

$poseparameter aim_yaw -45.00 45.00 loop 0.00
$poseparameter aim_pitch -27.00 56.00 loop 0.00

$sequence "idle01" "@idle01.smd" fps 30.00 loop ACT_IDLE 1  {
	node 1

}

$animation "a_upL_0_0" "a_upL_0_0.smd" fps 30.00 loop 
$animation "a_left_0_1" "a_left_0_1.smd" fps 30.00 
$animation "a_downL_0_2" "a_downL_0_2.smd" fps 30.00 
$animation "a_up_1_0" "a_up_1_0.smd" fps 30.00 
$animation "a_center_1_1" "a_center_1_1.smd" fps 30.00 
$animation "a_down_1_2" "a_down_1_2.smd" fps 30.00 
$animation "a_upR_2_0" "a_upR_2_0.smd" fps 30.00 
$animation "a_right_2_1" "a_right_2_1.smd" fps 30.00 
$animation "a_downR_2_2" "a_downR_2_2.smd" fps 30.00 
$sequence "gunaim" "a_center_1_1.smd" fps 30.00


$sequence "actidle01" "@actidle01.smd" fps 30.00 loop ACT_IDLE_ANGRY 1


$sequence "ragdoll" "ragdoll.smd" fps 30.00 loop  ACT_DIERAGDOLL 1  {

}


$sequence "walk" "@walk.smd" fps 30.00 loop  walkframe 35 LX ACT_WALK 1  {
	{ event 21 2 }
	{ event 20 10 }
	node 1

}

$sequence "run" "@run.smd" fps 30.00 loop  walkframe 21 LX ACT_RUN 1  {
	{ event 21 5 }
	{ event 20 21 }
	node 1

}

$sequence "customwalk" "@customwalk.smd" fps 30.00 loop  walkframe 35 LX  {

}

$sequence "turn_right" "@turn_right.smd" fps 30.00 loop  walkframe 35 LX ACT_TURN_RIGHT 1  {
	node 1

}

$sequence "turn_left" "@turn_left.smd" fps 30.00 loop  walkframe 35 LX ACT_TURN_LEFT 1  {
	node 1

}


$sequence "punch01" "@punch01.smd" fps 30.00 ACT_MELEE_ATTACK1 1  {
	{ event 11 0.29 "" }
	{ event 14 0.29 "" }
	//node 2

}

$sequence "idleact" "@idleact.smd" fps 30.00 ACT_CGUARD_IDLE_TO_ANGRY 1  {
	blendlayer "gunaim" 0.00 0.00 0.00 0.00
	transition 1 2

}

$sequence "fire" "@fire.smd" fps 30.00 ACT_RANGE_ATTACK1 1  {
	{ event 13 15.00 "" }
	{ event 12 30 "" }
//	blendlayer "gunaim" 0.00 0.00 0.00 0.00
//	node 2

}

$sequence "bustdoor" "@bustdoor.smd" fps 30.00 snap  {
	{ event 1003 0.01 "1" }
	{ event 1003 0.74 "2" }
	{ event 1003 0.74 "3" }
	{ event 1003 0.79 "4" }
	{ event 1003 0.86 "5" }

}

$collisionjoints "cguardphys.smd" { //This needs a LOT of improvement. If you kill him by launching a prop_physics at him he gets sent FLYING.
	$concave
	//$maxconvexpieces 200
	$mass 90.0
	$inertia 5.00
	$damping 0.01
	$rotdamping 1.50
	$rootbone "Bip01 Pelvis"

	$jointmerge "Bip01 Pelvis" "Bip01"
//	$jointmerge "valvebiped.bip01_pelvis" "valvebiped.bip01_spine"

	$jointconstrain "bip01 spine2" x limit -35.00 35.00 0.00
	$jointconstrain "bip01 spine2" y limit -30.00 30.00 0.00
	$jointconstrain "bip01 spine2" z limit -35.00 75.00 0.00

	$jointconstrain "bip01 l upperarm" x limit -90.00 60.00 0.00
	$jointconstrain "bip01 l upperarm" y limit -19.00 25.00 0.00
	$jointconstrain "bip01 l upperarm" z limit -12.00 39.00 0.00

	$jointconstrain "bip01 r upperarm" x limit -59.00 90.00 0.00
	$jointconstrain "bip01 r upperarm" y limit -26.00 40.00 0.00
	$jointconstrain "bip01 r upperarm" z limit -19.00 48.00 0.00

	$jointconstrain "bip01 r forearm" x limit -48.00 45.00 0.00
	$jointconstrain "bip01 r forearm" y limit -3.00 3.00 0.00
	$jointconstrain "bip01 r forearm" z limit -140.00 12.00 0.00

	$jointconstrain "bip01 r hand" x limit -37.00 37.00 0.00
	$jointconstrain "bip01 r hand" y limit -15.00 17.00 0.00
	$jointconstrain "bip01 r hand" z limit -60.00 50.00 0.00

	$jointconstrain "bip01 l forearm" x limit -46.00 48.00 0.00
	$jointconstrain "bip01 l forearm" y limit -3.00 3.00 0.00
	$jointconstrain "bip01 l forearm" z limit -120.00 12.00 0.00

	$jointconstrain "bip01 l thigh" x limit -60.00 60.00 0.00
	$jointconstrain "bip01 l thigh" y limit -35.00 65.00 0.00
	$jointconstrain "bip01 l thigh" z limit -30.00 120.00 0.00

	$jointconstrain "bip01 l calf" x limit -15.00 15.00 0.00
	$jointconstrain "bip01 l calf" y limit -6.00 6.00 0.00
	$jointconstrain "bip01 l calf" z limit -95.00 12.00 0.00

	$jointconstrain "bip01 l hand" x limit -37.00 37.00 0.00
	$jointconstrain "bip01 l hand" y limit -15.00 17.00 0.00
	$jointconstrain "bip01 l hand" z limit -17.00 50.00 0.00

	$jointconstrain "bip01 r thigh" x limit -60.00 60.00 0.00
	$jointconstrain "bip01 r thigh" y limit -65.00 35.00 0.00
	$jointconstrain "bip01 r thigh" z limit -30.00 120.00 0.00

	$jointconstrain "bip01 r calf" x limit -15.00 15.00 0.00
	$jointconstrain "bip01 r calf" y limit -6.00 6.00 0.00
	$jointconstrain "bip01 r calf" z limit -95.00 12.00 0.00

	$jointconstrain "bip01 r foot" x limit -25.00 30.00 0.00
	$jointconstrain "bip01 r foot" y limit -15.00 35.00 0.00
	$jointconstrain "bip01 r foot" z limit -40.00 40.00 0.00

	$jointconstrain "bip01 l foot" x limit -35.00 25.00 0.00
	$jointconstrain "bip01 l foot" y limit -35.00 15.00 0.00
	$jointconstrain "bip01 l foot" z limit -40.00 40.00 0.00

	$jointconstrain "bip01 neck2" x limit -60.00 60.00 0.00
	$jointconstrain "bip01 neck2" y limit -75.00 75.00 0.00
	$jointconstrain "bip01 neck2" z limit -110.00 110.00 0.00

	$jointconstrain "bip01 neck3" x limit -35.00 35.00 0.00
	$jointconstrain "bip01 neck3" y limit -32.00 32.00 0.00
	$jointconstrain "bip01 neck3" z limit -65.00 85.00 0.00

	$jointconstrain "bip01 neck4" x limit -36.00 35.00 0.00
	$jointconstrain "bip01 neck4" y limit -45.00 45.00 0.00
	$jointconstrain "bip01 neck4" z limit -50.00 85.00 0.00

	$jointconstrain "bip01 head" x limit -70.00 70.00 0.00
	$jointconstrain "bip01 head" y limit -40.00 40.00 0.00
	$jointconstrain "bip01 head" z limit -35.00 85.00 0.00
}
