
UCLASS()
class UCharacterDefinition_Creature_Lurker : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Lurker;
	default m_Species = GameplayTag::Species_Creature_Lurker;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
    default m_AbilitiesEffect = UGE_Lurker_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Lurker_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Lurker::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Lurker::StaticClass());

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(ULurkerJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    default AddToInventory(UItAt_Lurker_01::StaticClass(), 2, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Lurker_02::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Lurker_03::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(ULurkerTail::StaticClass(), 1);

    // Other
    default m_CameraConfig = ULizardCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 17);
	default SetAttributeValue("AttributeSet_Strength.Strength", 50);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 50);
    default SetAttributeValue("AttributeSet_Health.Health", 90); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 90);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 15);
	// protection[PROT_FLY] = 0;

	 default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 170);
	
	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//
	
	default m_AIAbility = UGameplayAbility_CharacterAI_Lurker::StaticClass();
    default m_UniqueName = n"Lurker";
	//default m_CharacterVisualsDefinition = ULurkerCharacterVisualsDefinition::StaticClass();
	
    //default m_MutableAsset = "MO_Lurker";
    //default m_MutableAssetPath = "/Game/Assets/Characters/Creatures/Lurker/Mutable/";
}

UCLASS()
class ULurkerCharacterVisualsDefinition : UArmorVisualsDefinition
{
    UPROPERTY()
    FString Algae = "None";
	
	// UFUNCTION(BlueprintOverride)
	// void Initialize()
    // {
    //     switch (Math::Rand() % 2)
	// 	{
	// 	case 0:
	// 		Algae = "None";
	// 		break;
	// 	case 1:
	// 		Algae = "Algae";
	// 		break;
	// 	}
    // }

}