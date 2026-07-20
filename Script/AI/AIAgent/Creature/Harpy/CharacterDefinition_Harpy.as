
UCLASS()
class UCharacterDefinition_Creature_Harpy : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Harpy;
	default m_Species = GameplayTag::Species_Creature_Harpy;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Flying;
    
    default m_AbilitiesEffect = UGE_Harpy_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Harpy_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Harpy::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Harpy::StaticClass());

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories,1);

	default AddToInventory(UHarpyClaws_Grounded::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UHarpyClaws_Flying::StaticClass(), 1);

    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Harpy_02::StaticClass(), 2, EInventoryTypes::MainContainer);

	// Other
    default m_CameraConfig = UDefaultCamera::StaticClass();



	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	// default SetAttributeValue("AttributeSet_LevelProgression.Level", 20);
	// default SetAttributeValue("AttributeSet_Strength.Strength", 85);
	// default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 85);
    // default SetAttributeValue("AttributeSet_Health.Health", 2); //200); 
    // default SetAttributeValue("AttributeSet_Health.MaxHealth", 2); //200); 
    // default SetAttributeValue("AttributeSet_Armor.SuperArmor", 50);
    // default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 50);
	// default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    // default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	// default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 50);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 30);	
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 10);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 0);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 50);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);
	// protection[PROT_FLY] = 0;

	//Test Values
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 20);
	default SetAttributeValue("AttributeSet_Strength.Strength", 70);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 85);
    default SetAttributeValue("AttributeSet_Health.Health", 300); //200); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300); //200); 
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 30);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 1);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);

	
	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 200);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Harpy::StaticClass();
    default m_UniqueName = n"Harpy";
}

UCLASS()
class UGE_Harpy_Sleeper_AI : UGE_Harpy_AI
{
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
	
    FConditionalGameplayEffect conditionalGE;
	default conditionalGE.EffectClass = UGE_Dissolve::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalGE); 

	default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Dissolve::StaticClass());
}

UCLASS()
class UCharacterDefinition_Creature_Harpy_Sleeper : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Harpy;
	default m_Species = GameplayTag::Species_Creature_Harpy;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Flying;
    
    default m_AbilitiesEffect = UGE_Harpy_Sleeper_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Harpy_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Harpy_Sleeper::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Harpy::StaticClass());
	default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Harpy_Sleeper::StaticClass();

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories,1);

	default AddToInventory(UHarpyClaws_Grounded::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UHarpyClaws_Flying::StaticClass(), 1, EInventoryTypes::MainContainer);

    default AddToInventory(UItAt_Harpy_01::StaticClass(), 2, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Harpy_02::StaticClass(), 2, EInventoryTypes::MainContainer);

	// Other
    default m_CameraConfig = UDefaultCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	// default SetAttributeValue("AttributeSet_LevelProgression.Level", 20);
	// default SetAttributeValue("AttributeSet_Strength.Strength", 85);
	// default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 85);
    // default SetAttributeValue("AttributeSet_Health.Health", 2); //200); 
    // default SetAttributeValue("AttributeSet_Health.MaxHealth", 2); //200); 
    // default SetAttributeValue("AttributeSet_Armor.SuperArmor", 50);
    // default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 50);
	// default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    // default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	// default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 50);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 30);	
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 10);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 0);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 50);
	// default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);
	// protection[PROT_FLY] = 0;

	//Test Values
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 80);
	default SetAttributeValue("AttributeSet_Strength.Strength",135);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 100);
    default SetAttributeValue("AttributeSet_Health.Health", 200); //200); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 200); //200); 
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 120);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 30);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 0);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Harpy_Sleeper::StaticClass();
    default m_UniqueName = n"Harpy_Sleeper";
}

UCLASS()
class UCharacterVisualsDefinition_Harpy_Sleeper : UArmorVisualsDefinition
{
	default m_TagsToAdd.AddTag(GameplayTag::Visuals_DeathDissolve);
}