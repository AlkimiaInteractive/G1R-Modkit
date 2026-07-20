UCLASS()
class UCharacterDefinition_Creature_Scavenger_Adult_Riding_Cohsel : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Scavenger_Adult;
	default m_Species = GameplayTag::Species_Creature_Scavenger_Adult_Cohsel;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
	default m_AbilitiesEffect = UGE_Scavenger_AdultRideable_Cohsel_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Scavenger_Adult_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Scavenger::StaticClass();
    
	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Scavenger::StaticClass());

    default AddToInventory(UScavengerJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default AddToInventory(UItFo_Whitemeat::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Scavenger_01::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Scavenger_02::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // Other
    default m_CameraConfig = UScavengerAdultRidingCamera::StaticClass();

	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 10.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	default SetAttributeValue("AttributeSet_LevelProgression.Level", 6);
	default SetAttributeValue("AttributeSet_Strength.Strength", 30);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 10);
    default SetAttributeValue("AttributeSet_Health.Health", 120); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 120);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 20);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 20);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 17);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 17);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 5);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 60);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	
    default m_AIAbility = UGameplayAbility_CharacterAI_Scavenger_Adult_Rideable_Cohsel::StaticClass();
    default m_UniqueName = n"Scavenger_Adult_Rideable_Cohsel";
}