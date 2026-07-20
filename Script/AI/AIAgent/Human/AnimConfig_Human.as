


UCLASS()
class ULocoBlendCurvesConfig_Human : ULocoBlendCurvesConfig
{
    default m_DiagonalScaleAmountCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/AnimationBlendCurves/DiagonalScaleAmount.DiagonalScaleAmount'";
	default m_StrideBlendNWalk = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curves_StrideBlend_Walk.Curves_StrideBlend_Walk'";
	default m_StrideBlendNRun = n"CurveFloat'/Game/AnimLibrary/Data/Curves/AnimationBlendCurves/StrideBlend_N_Run.StrideBlend_N_Run'";
	default m_StrideBlendCWalk = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curves_StrideBlend_Walk.Curves_StrideBlend_Walk'";
	default m_StrideBlendSwimmingWalk = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curves_StrideBlend_Walk.Curves_StrideBlend_Walk'";
	default m_StrideBlendSwimmingRun = n"CurveFloat'/Game/AnimLibrary/Data/Curves/AnimationBlendCurves/StrideBlend_Swimming_Run.StrideBlend_Swimming_Run'";
	default m_StrideBlendDiveWalk = n"CurveFloat'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/Curves_StrideBlend_Walk.Curves_StrideBlend_Walk'";
	default m_LandPredictionCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/AnimationBlendCurves/LandPredictionBlend.LandPredictionBlend'";
	default m_LeanInAirCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/AnimationBlendCurves/LeanInAirAmount.LeanInAirAmount'";
	default m_YawOffsetFB = n"CurveVector'/Game/AnimLibrary/Data/Curves/AnimationBlendCurves/YawOffset_FB.YawOffset_FB'";
	default m_YawOffsetLR = n"CurveVector'/Game/AnimLibrary/Data/Curves/AnimationBlendCurves/YawOffset_LR.YawOffset_LR'";
}

UCLASS()
class UAnimConfig_Human_Woman : UAnimConfig_Human
{
	// DEFAULT ANIMATIONS
	default SetDefaultMovementAnimData(UDefault_Human_Woman::StaticClass());
}

UCLASS()
class UAnimConfig_Human : UAnimConfig
{
	default m_TransitionNL = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/Stops/ALS_N_Transition_L.ALS_N_Transition_L'";
	default m_TransitionNR = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/Stops/ALS_N_Transition_R_NLH.ALS_N_Transition_R_NLH'";
	
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Human::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

	// DEFAULT ANIMATIONS
	default SetDefaultMovementAnimData(UDefault_Human::StaticClass());

	/// ITEMS
	default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, USword1H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, USword1H_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, USword1H_Human_Master::StaticClass(), EWeaponSkill::Master);
	default AddAnimForItem(GameplayTag::Item_Weapon_Sword_TwoHand, USword2H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Sword_TwoHand, USword2H_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Sword_TwoHand, USword2H_Human_Master::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Weapon_Axe_OneHand, UAxe1H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Axe_OneHand, UAxe1H_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Axe_OneHand, UAxe1H_Human_Master::StaticClass(), EWeaponSkill::Master);
	default AddAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, UAxe2H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, UAxe2H_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Axe_TwoHand, UAxe2H_Human_Master::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, UMace1H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, UMace1H_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, UMace1H_Human_Master::StaticClass(), EWeaponSkill::Master);
	default AddAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, UMace2H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, UMace2H_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Orc_TwoHand, UMace2H_Human_Master::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Weapon_Staff, UStaff2H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Staff, UStaff2H_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Staff, UStaff2H_Human_Master::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Weapon_Fist, UFists_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Fist, UFists_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Fist, UFists_Human_Master::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Weapon_WatchFight, UAnimConfig_WatchFight_Human::StaticClass());

	default AddAnimForItem(GameplayTag::Item_Weapon_Torch, UTorch1H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Torch, UTorch1H_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Torch, UTorch1H_Human_Master::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Weapon_PickaxeDemo, UAxe1H_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	// default AddAnimForItem(GameplayTag::Item_Weapon_PickaxeDemo, UAxe1H_Human_Trained_Test::StaticClass(), EWeaponSkill::Trained);
	// default AddAnimForItem(GameplayTag::Item_Weapon_PickaxeDemo, UAxe1H_Human_Master_Test::StaticClass(), EWeaponSkill::Master);

	//Test weapon
	default AddAnimForItem(GameplayTag::Item_Weapon_Tail, USword1H_KnockbackTest::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Tail, USword1H_KnockbackTest::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Tail, USword1H_KnockbackTest::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, USword1H_RiposteTest::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, USword1H_RiposteTest::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, USword1H_RiposteTest::StaticClass(), EWeaponSkill::Master);

	// DO NOT SUBMIT UNCOMMENTED
	// default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHandTest, USword1H_Human_TestLayers::StaticClass(), EWeaponSkill::Untrained);
	// default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHandTest, USword1H_Human_TestLayers::StaticClass(), EWeaponSkill::Trained);
	// default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHandTest, USword1H_Human_TestLayers::StaticClass(), EWeaponSkill::Master);
	// END Test weapon
	
	default AddAnimForItem(GameplayTag::Item_Weapon_Bow, UBow_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Bow, UBow_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Bow, UBow_Human_Master::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Weapon_Crossbow, UCrossbow_Human_Untrained::StaticClass(), EWeaponSkill::Untrained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Crossbow, UCrossbow_Human_Trained::StaticClass(), EWeaponSkill::Trained);
	default AddAnimForItem(GameplayTag::Item_Weapon_Crossbow, UCrossbow_Human_Master::StaticClass(), EWeaponSkill::Master);

	default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune, UGenericRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Light, ULightRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Light_Cancel, ULightCastToCancelSpell_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Pyrokinesis, UPyrokinesisRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Teleport, UTeleportRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_ChainLightning, UChainLightningRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_StormFire, UStormOfFireRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_IceBolt, UIceBoltRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_FireBolt, UFireBoltRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_FireBall, UFireBallRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_BallLightning, UBallLightningRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_IceBlock, UIceBlockRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_FireRain, UFireRainRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_IceWave, UIceWaveRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Charm, UCharmRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Sleep, USleepRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Control, UControlRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Telekinesis, UTelekinesis_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_FistOfWind, UFistOfWindRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_StormFist, UStormFistRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_BreathOfDeath, UBreathOfDeathRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_UrizielWaveOfDeath, UUrizielWaveOfDeath_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_UrizielWaveOfDeath_Cancel, UUrizielWaveOfDeathCastToCancelSpell_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_DeathToTheUndead, UDeathToTheUndead_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Rune_Heal, UHealRune_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Shrink, UShrinkScroll_Human::StaticClass());
	
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll, UGenericScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Transform, UTransformScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Fear, UFearScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Light, ULightScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Light_Cancel, ULightCastToCancelSpell_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Control, UControlScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_FireBolt, UFireBoltScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_FireRain, UFireRainScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_StormOfFire, UStormOfFireScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_FireBall, UFireBallScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_FistOfWind, UFistOfWindScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_StormFist, UStormFistScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Pyrokinesis, UPyrokinesisScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_IceBolt, UIceBoltScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_IceWave, UIceWaveScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_IceBlock, UIceBlockScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_BallLightning, UBallLightningScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_ChainLightning, UChainLightningScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Summon_Skeletons, USummonSkeletonsScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Summon_ArmyOfDarkness, USummonArmyOfDarknessScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Summon_Demon, USummonDemonScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_Summon_Golem, USummonGolemScroll_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Scroll_InnosPray, UInnosPrayScroll_Human::StaticClass());

	default AddAnimForItem(GameplayTag::Item_Weapon_FishingRod, URod_Human::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Food, UItemAnimConfig_Human_Food::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Food_Bowl, UItemAnimConfig_Human_Food::StaticClass());
	default AddAnimForItem(GameplayTag::State_WallClimbing, UWallClimbing_Human::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Climbing_Fist, UWallClimbing_Human_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Human_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, UWaterWalking_Human_Combat::StaticClass());

	// Actions
	default AddAnimForAction(GameplayTag::Action_Pick_ToEquip, UInteractAnimConfig_Human_Pick::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Pick_ToInventory, UInteractAnimConfig_Human_Pick::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Pick_ToInventory_Pouch, UInteractAnimConfig_Human_Pick::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Pick_ToCarry, UInteractAnimConfig_Human_Pick::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Pickpocket, UInteractAnimConfig_Human_Pick::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Loot, UInteractAnimConfig_Human_Loot::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Human_SmashMeatBug::StaticClass());
	default AddAnimForAction(GameplayTag::Action_StartFire, UInteractAnimConfig_Human_StartFire::StaticClass());
	default AddAnimForAction(GameplayTag::Action_StartFire_End, UInteractAnimConfig_Human_StartFireEnd::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door, UInteractAnimConfig_Human_Door::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_Column_Egg, UInteractAnimConfig_Human_Door_Column_Egg::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_Orc, UInteractAnimConfig_Player_Door_Orc::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_GoblinCave, UInteractAnimConfig_Door_GoblinCave::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_Bell, UInteractAnimConfig_Door_Bell::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Close_Door, UInteractAnimConfig_Human_Door_Close::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Traverse_Door, UInteractAnimConfig_Human_Door_Traverse::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Traverse_Door, UInteractAnimConfig_Human_Door_Traverse::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Open_Gate, UInteractAnimConfig_Human_Trigger_Winch::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Close_Gate, UInteractAnimConfig_Human_Trigger_Winch::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_Focus, UInteractAnimConfig_Player_Door_Focus::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_AbandonedFence, UInteractAnimConfig_Door_AbandonedFence::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_AbandonedDoor, UInteractAnimConfig_Door_AbandonedMineDoor::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_SunkenAltar, UInteractAnimConfig_Door_SunkenTower_Altar::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Door_OrcSecretDoor, UInteractAnimConfig_Door_OrcSecretDoor::StaticClass());

	default AddAnimForAction(GameplayTag::Action_Lever, UInteractAnimConfig_Player_Lever::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_BookShelf, UInteractAnimConfig_Player_Lever_BookShelf::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_Mantain, UInteractAnimConfig_Player_Lever_Mantain::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_Ground, UInteractAnimConfig_Player_Lever_Ground::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_BloodPuzzle, UInteractAnimConfig_Player_Lever_BloodPuzzle::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_WaterPuzzle, UInteractAnimConfig_Player_Lever_WaterPuzzle::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_OrcLever, UInteractAnimConfig_Player_Lever_OrcLever::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_Wall, UInteractAnimConfig_Player_Lever_Wall::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_HearthFake, UInteractAnimConfig_Human_Lever_HearthFake::StaticClass());
	default AddAnimForAction(GameplayTag::Action_Lever_DestroyFinalBarrier, UInteractAnimConfig_Player_Lever_DestroyFinalBarrier::StaticClass());	
}


UCLASS()
class UInteractAnimConfig_Player_Lever_Ground : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/LeverGround/A_Man_LeverGround_Right_01_Montage.A_Man_LeverGround_Right_01_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/LeverGround/LeverGround_Right_Montage.LeverGround_Right_Montage'";
}

UCLASS()
class UInteractAnimConfig_Player_Lever_WaterPuzzle : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/BloodPuzzlePoolSwitch/NH_Pool_Switch.NH_Pool_Switch'";
	//default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/BloodPuzzlePoolSwitch/Pool_Switch.Pool_Switch'";
}

UCLASS()
class UInteractAnimConfig_Player_Lever_BloodPuzzle : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/BloodPuzzlePoolSwitch/NH_Pool_Switch.NH_Pool_Switch'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/BloodPuzzlePoolSwitch/Pool_Switch.Pool_Switch'";
}

UCLASS()
class UInteractAnimConfig_Human_Lever_HearthFake : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/SleeperAltar_Heart/NH_HearthTest_Montage.NH_HearthTest_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/SleeperAltar_Heart/HearthTest_Object_Montage.HearthTest_Object_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_Pick : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Pick/A_Man_Swim_PickUp_Front_L_Montage.A_Man_Swim_PickUp_Front_L_Montage'";

	// Configuration of PickUp Heights
	default m_ExtraData.Add(n"PickDown", 50.0f);
	default m_ExtraData.Add(n"PickFront", 150.0f);
	default m_ExtraData.Add(n"PickUp", 220.0f);

	default m_ExtraData.Add(n"PickDown_Swimming", 50.0f);
	default m_ExtraData.Add(n"PickFront_Swimming", 150.0f);
}

UCLASS()
class UInteractAnimConfig_Human_Loot : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Loot/A_Man_Loot_Montage.A_Man_Loot_Montage'";
}
UCLASS()
class UInteractAnimConfig_Human_SmashMeatBug : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/SmashMeatbugs/A_Man_SmashMeatbugs_Montage.A_Man_SmashMeatbugs_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_StartFire : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/A_Man_LitTorch_Temp_Montage.A_Man_LitTorch_Temp_Montage'";

	default m_ExtraData.Add(n"FireDown", 50.0f);
	default m_ExtraData.Add(n"FireFront", 100.0f);
	default m_ExtraData.Add(n"FireUp", 175.0f);
}

UCLASS()
class UInteractAnimConfig_Human_StartFireEnd : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/LitTorch/A_Man_UnLitTorch_Temp_Montage.A_Man_UnLitTorch_Temp_Montage'";

	default m_ExtraData.Add(n"FireDown", 50.0f);
	default m_ExtraData.Add(n"FireFront", 100.0f);
	default m_ExtraData.Add(n"FireUp", 175.0f);
}

UCLASS()
class UInteractAnimConfig_Human_Door : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Man_OpenDoor_Montage.Man_OpenDoor_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_Door_Column_Egg : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/ARM_Column_Egg_Broken/Man_Column_Egg_Broken_Montage.Man_Column_Egg_Broken_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_Door_Close : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Man_CloseDoor_Left_Montage.Man_CloseDoor_Left_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_Door_Traverse : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Man_OpenCloseDoor_Montage.Man_OpenCloseDoor_Montage'";
}

UCLASS()
class UInteractAnimConfig_Human_Trigger_Winch : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Triggers/NH_Trigger_Winch_Montage.NH_Trigger_Winch_Montage'";
	default m_ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Levers/MainDoorMachine/MainDoorMachine_Montage_next.MainDoorMachine_Montage_next'";
}