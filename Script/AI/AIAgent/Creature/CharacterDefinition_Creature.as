UCLASS()
class ULocoBlendCurvesConfig_Creature : ULocoBlendCurvesConfig
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
class UAnimConfig_Creature : UAnimConfig
{
	 default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
}

UCLASS(Abstract)
class UCharacterDefinition_Creature : UCharacterDefinition
{
	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
	FGameplayTagContainer meleeSlotItemCategories;
	default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
	default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
	default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw_Flying);
	default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw_Grounded);
	default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Swimming);
	default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_WaterWalking);
	default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    default m_CharacterType = GameplayTag::AIAgent_Creature;
	default m_Blood = UCreatureBlood_Red::StaticClass();

	// Character Attributes
	//default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
    // Initial character attributes values
    default SetAttributeValue("AttributeSet_Health.Health", 100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 100);
	default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 1);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty", 50);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 50);
    default SetAttributeValue("AttributeSet_Movement.SpeedModifier", 1);
	default SetAttributeValue("AttributeSet_Strength.Strength", 1);

	// Skills
	default m_Skills.Add(UGE_Skill_Mage_Circle_Untrained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
}