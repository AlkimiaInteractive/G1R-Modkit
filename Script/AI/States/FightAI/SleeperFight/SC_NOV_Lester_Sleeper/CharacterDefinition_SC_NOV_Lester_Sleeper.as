UCLASS()
class UCharacterDefinition_Human_SC_NOV_Lester_Sleeper : UCharacterDefinition_Human_SwampCamp_Novice
{
    //default m_Species = GameplayTag::AIAgent_Creature_SwampShark;
    default m_CharacterType = GameplayTag::AIAgent_Human_Novice;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",999);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_Health.Health",1500);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",1200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",1200);
    default SetAttributeValue("AttributeSet_Mana.Mana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Strength.Strength", 100); //45);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",75);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",28);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",12*2);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",12*2);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12*2);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
    default AddToInventory(UItMw_1H_Mace_Lester_Sleeper::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Soup::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_NOV_Lester_Sleeper::StaticClass();

    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human_SC_NOV_Lester_Sleeper::StaticClass();

    default m_UniqueName = n"SC_NOV_Lester_Sleeper";
    default m_AIAbility = UGameplayAbility_CharacterAI_Human_Lester_Sleeper::StaticClass();
    default m_AbilitiesEffect = UGE_Human_AI_Lester_Sleeper::StaticClass();
    default m_InitialGuildEffect = UGE_SleeperTemple_Lester::StaticClass();

    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
}


class USpawnAIAgentDefinition_Human_SC_NOV_Lester_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Human_SC_NOV_Lester_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}

UCLASS()
class UAIAgentConfig_Human_SC_NOV_Lester_Sleeper : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Lester_Sleeper::StaticClass();
    default m_AnimConfig = UAnimConfig_Lester_Sleeper::StaticClass();
    default m_NavigationConfig = UAIAgentConfig_Navigation_Lester_Sleeper::StaticClass();
    default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

UCLASS()
class UGE_Human_AI_Lester_Sleeper : UGE_Human_AI_Mage_SixthCircle_Sleeper
{
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);
}

UCLASS()
class UAnimConfig_Lester_Sleeper : UAnimConfig_Human
{
    default AddAnimForItem(GameplayTag::Item_Weapon_Rune_FistOfWind, UFistOfWind_Lester_M1H::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_Sleeper, UFistOfWind_Lester_M1H::StaticClass());
}

UCLASS()
class UFistOfWind_Lester_M1H : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Lester/FistOfWind/A_LesterSleeper_M1H_FistOfWind_Cast_Montage.A_LesterSleeper_M1H_FistOfWind_Cast_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Lester/FistOfWind/A_LesterSleeper_M1H_FistOfWind_Cast_Failure_Montage.A_LesterSleeper_M1H_FistOfWind_Cast_Failure_Montage'";
}


UCLASS()
class UItMw_1H_Mace_Lester_Sleeper: UMace1H
{
    default m_Name = "ItMw_1H_Mace_Lester_Sleeper";
    default m_Value = 340;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 75.0f); //60.0f);
    default m_SuperArmorDamageBase = 40;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Lester_Visual.BP_ItMw_1H_Mace_Lester_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Mace_Lester_World.BP_ItMw_1H_Mace_Lester_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Mace_Lester.T_ItemIcon_ItMw_1H_Mace_Lester";
    default m_Description = "ItMw_1H_Mace_Lester_description";
    default SetItemType(GameplayTag::Item_Weapon_Mace_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 10.0f); //40.0f);

    default m_ActionsKeywords.Add(USpellActionKeywords_LesterSleeper_FistOfWind::StaticClass());
} 

class UG1RPerceptionAgentSettings_Human_SC_NOV_Lester_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
{
    // default Normal.Sight.InnerCoffin.Length = 4000.0f; //3000.0f;
    // default Normal.Sight.InnerCoffin.GoodVisionLength = 3400.0f; //2400.0f;
    // default Normal.Sight.InnerCoffin.CloseHalfWidth = 600; //150
    // default Normal.Sight.InnerCoffin.MiddleHalfWidth = 1000; //250
    // default Normal.Sight.InnerCoffin.FarHalfWidth = 600; //150

    // default Normal.Sight.OuterCoffin.Length = 4200.0f; //3200.0f;
    // default Normal.Sight.OuterCoffin.GoodVisionLength = 3700.0f; //2700.0f;
    // default Normal.Sight.OuterCoffin.CloseHalfWidth = 1200; //300
    // default Normal.Sight.OuterCoffin.MiddleHalfWidth = 1800; //450
    // default Normal.Sight.OuterCoffin.FarHalfWidth = 1200; //300

    // // default Normal.Sight.HeightParabolAlpha = -0.0003f;
    // // default Normal.Sight.HeightParabolOffsetY = 0.6f;
    // default Normal.Sight.HeightParabolOffsetZ = 0.585f;

    // default HighAlert.Sight.HeightParabolAlpha = 0.0f;
    // default HighAlert.Sight.HeightParabolOffsetY = 0.6f;
    // default HighAlert.Sight.HeightParabolOffsetZ = 0.4f;

    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 0.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;
    default Normal.Smell.AwarenessWearoffFactor = 0.0f;
    default Normal.Hearing.AwarenessWearoffFactor = 0.0f;
}

UCLASS()
class UGameplayAbility_CharacterAI_Human_Lester_Sleeper : UGameplayAbility_CharacterAI_Human
{
    /// ITEM SCORING
    /// Melee Weapon Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill());
    /// Ranged weapon scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill());
    /// Misc item scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_ActualWeaponBonus());
    default EngageConflictDistance = 50000;
    default AssessmentModuleClass = UAIARM_SleeperDream;

    default InitialDailyRoutineClass = UDailyRoutine_StandAround_Only::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Sleeper_Lester::StaticClass());
}



UCLASS()
class UCharacterDefinition_Swampshark_Sleeper : UCharacterDefinition_Creature_Swampshark
{
    // default m_CharacterType = GameplayTag::AIAgent_Creature_SwampShark;
    // default m_Species = GameplayTag::Species_Creature_Swampshark;

	// default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
	
    // default m_AbilitiesEffect = UGE_Swampshark_AI::StaticClass();
    // default m_OnPlayerEffect = UGE_Swampshark_Player::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Swampshark_Sleeper::StaticClass();

	// default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Swampshark::StaticClass());

    default m_AIAbility = UGameplayAbility_CharacterAI_Swampshark_Sleeper::StaticClass();
    // default m_UniqueName = n"Swampshark";

	// // Inventory
	// // FGameplayTagContainer meleeSlotItemCategories;
	// // default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// // default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	// default AddToInventory(USwampsharkJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	// default AddToInventory(UItAt_Swampshark_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	// default AddToInventory(UItAt_Swampshark_02::StaticClass(), 2, EInventoryTypes::MainContainer);
	// default AddToInventory(UItAt_Swampshark_03::StaticClass(), 2, EInventoryTypes::MainContainer);
    // default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    // default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // // Other
    // default m_CameraConfig = USwampsharkCamera::StaticClass();

    // // Super Armor
	// //default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	// default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	// default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	// default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	// default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 40);
	default SetAttributeValue("AttributeSet_Strength.Strength", 300);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 140);
    default SetAttributeValue("AttributeSet_Health.Health", 1700); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 1700);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 120);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 130);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 130);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 90);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 40);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
	// protection[PROT_FLY] = 9999;

	// Hit Space
    // default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    // default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    // default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//
}

class UG1RPerceptionAgentSettings_Swampshark_Sleeper : UG1RPerceptionAgentSettings_Creature
{
    default Normal.Sight.OuterCoffin.Length = 5000.0f;
    default Normal.Sight.InnerCoffin.Length = 2000.0f;

    // default Normal.Hearing.SetCloseRangeDistance(700.0f);
    // default Normal.Hearing.SetMidRangeDistance(1000.0f);
    // default Normal.Hearing.SetFarRangeDistance(1500.0f);
}
UCLASS()
class UAIAgentConfig_Swampshark_Sleeper : UAIAgentConfig_Swampshark
{
	default m_CharacterDefinition = UCharacterDefinition_Swampshark_Sleeper::StaticClass();
    default m_NavigationConfig = UAIAgentConfig_Navigation_Swampshark_Sleeper::StaticClass();
    
}

class USpawnAIAgentDefinition_Swampshark_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Swampshark_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Swampshark/AI/AIAgentCharacter_Swampshark_Sleeper.AIAgentCharacter_Swampshark_Sleeper_C'";
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_Sleeper_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_StandAround(), n"FP_SD_LESTER");
}