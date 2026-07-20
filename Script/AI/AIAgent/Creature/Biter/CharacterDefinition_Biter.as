
UCLASS()
class UCharacterDefinition_Creature_Biter : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Biter;
	default m_Species = GameplayTag::Species_Creature_Biter;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
    default m_AbilitiesEffect = UGE_Biter_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Biter_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Biter::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Biter::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UBiterJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Muttonraw::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Biter_01::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Biter_02::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Biter_03::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // Other
    default m_CameraConfig = UBiterCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 12);
	default SetAttributeValue("AttributeSet_Strength.Strength", 110);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 80);
    default SetAttributeValue("AttributeSet_Health.Health", 260); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 260);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 40);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 20);
	
	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 120);

	default SetAttributeValue("AttributeSet_Oxygen.Oxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.MaxOxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenDepletionRate", 1);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenRecoveryRate", 5);
    default SetAttributeValue("AttributeSet_Oxygen.CriticalLevelPercent", 0.35);
	
	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//
	
	default m_AIAbility = UGameplayAbility_CharacterAI_Biter::StaticClass();
    default m_UniqueName = n"Biter";

	// default m_CharacterVisualsDefinition = UBitterCharacterVisualsDefinition::StaticClass();
	
    // default m_MutableAsset = "MO_Biter";
    // default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Biter/mutable/";
}

// UCLASS()
// class UBitterCharacterVisualsDefinition : UArmorVisualsDefinition
// {
//     UPROPERTY()
//     FString Armor = "None";
// }


UCLASS()
class UCharacterDefinition_Creature_Biter_Armored : UCharacterDefinition_Creature_Biter
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Biter_Armored;

	//default m_CharacterVisualsDefinition = UBitterArmoredCharacterVisualsDefinition::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Biter_Strapped : UCharacterDefinition_Creature_Biter
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Biter_Strapped;
	default m_Species = GameplayTag::Species_Creature_Biter_Strapped;

	//default m_CharacterVisualsDefinition = UBitterArmoredCharacterVisualsDefinition::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Biter_OrcGraveyard : UCharacterDefinition_Creature_Biter
{
	default m_UniqueName = n"Biter_OrcGraveyard";
}

// UCLASS()
// class UBitterArmoredCharacterVisualsDefinition : UArmorVisualsDefinition
// {
//     UPROPERTY()
//     FString Armor = "Armor";
// }