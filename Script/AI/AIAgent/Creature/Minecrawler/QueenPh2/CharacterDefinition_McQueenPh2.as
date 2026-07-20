UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Queen_Ph2 : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Minecrawler_Queen;
    default m_Species = GameplayTag::Species_Creature_Minecrawler_Queen;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_Minecrawler_Queen_AI_Ph2;
    default m_OnPlayerEffect = UGE_Minecrawler_Queen_Player;
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Minecrawler_Queen_Ph2;

	default m_Blood = UCreatureBlood_Blue::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 13);
	default SetAttributeValue("AttributeSet_Strength.Strength", 65); //65
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 400); //90);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 400); //90);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 4000); //60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 4000); //60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 55);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 2000);

	default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_QueenPh2;
    default m_UniqueName = n"Minecrawler_Queen";

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//
	//Camera
	default m_CameraConfig = UMinecrawlerQueenCamera::StaticClass();
	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
	default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 2);

    //default AddToInventory(UMCQueen_Legs, 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UMCQueen_Legs_Phase2, 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Crawlerqueen, 4, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Minecrawlerqueen_01, 1, EInventoryTypes::MainContainer);
}

UCLASS()
class UGE_Minecrawler_Queen_Ph2_Sleeper_AI : UGE_Minecrawler_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
	//default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Electrified);
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);

	default AddAbility(UGA_Boss_HealthMonitor::StaticClass());

	FConditionalGameplayEffect conditionalSummonGE;
	default conditionalSummonGE.EffectClass = UGE_SummonedNotVisible::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalSummonGE);

	default AddAbility(UGA_Summon_MCQueen_PH2_Sleeper::StaticClass());
    default AddAbility(UGA_BossHealthBar::StaticClass());

    FConditionalGameplayEffect conditionalGE;
	default conditionalGE.EffectClass = UGE_Dissolve::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalGE); 
	
	default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Dissolve::StaticClass());
	default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}

UCLASS()
class UCharacterVisualsDefinition_Minecrawler_Queen_Ph2_Sleeper : UArmorVisualsDefinition
{
	default m_TagsToAdd.AddTag(GameplayTag::Visuals_DeathDissolve);
}

UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Queen_Ph2_Sleeper : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Minecrawler_Queen;
    default m_Species = GameplayTag::Species_Creature_Minecrawler_Queen;
	default m_Blood = UCreatureBlood_Blue::StaticClass();

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_Minecrawler_Queen_Ph2_Sleeper_AI;
    default m_OnPlayerEffect = UGE_Minecrawler_Queen_Player;
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Minecrawler_Queen;

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;

	default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Minecrawler_Queen_Ph2_Sleeper::StaticClass();
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 13);
	default SetAttributeValue("AttributeSet_Strength.Strength", 170); //65
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 1000); //90);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 1000); //90);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 4000); //60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 4000); //60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 70);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 70);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 60);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

	default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_QueenPh2;
    default m_UniqueName = n"Minecrawler_Queen_Ph2_Sleeper";

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//
	
	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
	default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 2);

    //default AddToInventory(UMCQueen_Legs, 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UMCQueen_Legs_Phase2, 1, EInventoryTypes::MeleeSlot);
	// default AddToInventory(UItAt_Crawlerqueen, 4, EInventoryTypes::MainContainer);
	// default AddToInventory(UItAt_Minecrawlerqueen_01, 1, EInventoryTypes::MainContainer);
	
}