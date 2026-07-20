UCLASS()
class UCharacterDefinition_Creature_Scavenger_Adult_Riding : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Scavenger_Adult;
	default m_Species = GameplayTag::Species_Creature_Scavenger_Adult_Rideable;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
    default m_AbilitiesEffect = UGE_Scavenger_Adult_AI_Rideable::StaticClass();
    default m_OnPlayerEffect = UGE_Scavenger_Adult_Player::StaticClass();
    
	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Scavenger::StaticClass());

    default AddToInventory(UItFo_Whitemeat::StaticClass(), 3, EInventoryTypes::MainContainer);

    // Other
    default m_CameraConfig = UScavengerAdultRidingCamera::StaticClass();

	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 10.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	default SetAttributeValue("AttributeSet_Armor.SuperArmor", MAX_flt);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", MAX_flt);
	default SetAttributeValue("AttributeSet_Health.Health", MAX_flt);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", MAX_flt);
	
	default SetAttributeValue("AttributeSet_Alcohol.Alcohol", 0); 
    default SetAttributeValue("AttributeSet_Alcohol.MaxAlcohol", 200);
    default SetAttributeValue("AttributeSet_Alcohol.AlcoholDepletionRate", 1);

    default SetAttributeValue("AttributeSet_Swampweed.Swampweed", 0); 
    default SetAttributeValue("AttributeSet_Swampweed.MaxSwampweed", 200);
    default SetAttributeValue("AttributeSet_Swampweed.SwampweedDepletionRate", 1);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	
    //
	default m_AIAbility = UGameplayAbility_CharacterAI_Scavenger_Adult_Rideable::StaticClass();
    default m_UniqueName = n"Scavenger_Adult_Rideable";
}