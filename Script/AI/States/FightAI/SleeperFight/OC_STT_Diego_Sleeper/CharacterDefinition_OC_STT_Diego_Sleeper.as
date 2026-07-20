UCLASS()
class UCharacterDefinition_Human_OC_STT_Diego_Sleeper : UCharacterDefinition_Human_OldCamp_Shadow
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Shadow;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",999);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_Health.Health",1500);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",250);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",250);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",100); //70
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",130);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",14*2);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",6*2);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",6*2);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",6*2);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
    default m_AbilitiesEffect = UGE_Human_AI_Diego_Sleeper::StaticClass();
    default AddToInventory(UItRw_Bow_Diego_Sleeper::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    // default AddToInventory(UItMw_1H_Sword_04::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    // default AddToInventory(UItMw_1H_Sword_04_Diego_SleeperTest::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMw_1H_Sword_04_Diego_Sleeper::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 100, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_STT_Diego_Sleeper::StaticClass();
    
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human_Diego_Sleeper::StaticClass();

    default m_UniqueName = n"OC_STT_Diego_Sleeper";
    default m_AIAbility = UGameplayAbility_CharacterAI_Human_Diego_Sleeper::StaticClass();
    default m_InitialGuildEffect = UGE_SleeperTemple_Diego::StaticClass();

    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());

    UPROPERTY()
    UClass m_TeleportSpotFilterClass = ADiegoSleeperTeleportSpotVisual::StaticClass();
}

UCLASS()
class UAIAgentConfig_Human_OC_STT_Diego_Sleeper : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Diego_Sleeper::StaticClass();
    default m_AnimConfig = UAnimConfig_Diego_Sleeper::StaticClass();
    default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

}
//Teleport animations
UCLASS()
class UTeleport_DiegoSleeper_Bow : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Diego/Teleport/A_DiegoSleeper_Bow_Teleport_In_Montage.A_DiegoSleeper_Bow_Teleport_In_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Diego/Teleport/A_DiegoSleeper_Bow_Teleport_Out_Montage.A_DiegoSleeper_Bow_Teleport_Out_Montage'";
}

//Teleport animations
UCLASS()
class UTeleport_DiegoSleeper_Sword : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Diego/Teleport/A_DiegoSleeper_S1H_Teleport_In_Montage.A_DiegoSleeper_S1H_Teleport_In_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Diego/Teleport/A_DiegoSleeper_S1H_Teleport_Out_Montage.A_DiegoSleeper_S1H_Teleport_Out_Montage'";
}


//Anim config for teleport
UCLASS()
class UAnimConfig_Diego_Sleeper : UAnimConfig_Human
{
    default AddAnimForItem(GameplayTag::Item_Spell_Sleeper_Teleport_Diego_Bow, UTeleport_DiegoSleeper_Bow::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Spell_Sleeper_Teleport_Diego_Sword, UTeleport_DiegoSleeper_Sword::StaticClass());
}

class USpawnAIAgentDefinition_OC_STT_Diego_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Human_OC_STT_Diego_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}

//Abilities to manage teleport
UCLASS()
class UGE_Human_AI_Diego_Sleeper : UGE_Human_AI_Mage_SixthCircle_Sleeper
{
    //default AddAbility(UGA_DiegoSleeperInvulnerableVisualManager::StaticClass());
    default AddAbility(UGA_DiegoSleeper_GiveTeleportComponent::StaticClass());
    default AddAbility(UGA_Diego_Sleeper_HealthMonitor::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);

    //default AddAbility(UGA_CastSpell_Teleport_DiegoSleeper::StaticClass());
}

UCLASS()
class UItRw_Bow_Diego_Sleeper: UBow
{
    default m_Name = "ItRw_Bow_Diego_Sleeper";
    default m_Value = 390;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 40.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Diego_Visual.BP_ItRw_Bow_Diego_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/Ranged/BP_ItRw_Bow_Diego_World.BP_ItRw_Bow_Diego_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItRw_Bow_Diego.T_ItemIcon_ItRw_Bow_Diego";
    default m_Description = "ItRw_Bow_Diego_description";
    default SetItemType(GameplayTag::Item_Weapon_Bow);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity"), 45.0f);

    default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_ActionsKeywords.Add(USpellActionKeywords_DiegoSleeper_Teleport_Bow::StaticClass()); 
}

UCLASS()
class UItMw_1H_Sword_04_Diego_Sleeper: USword1H
{
    default m_Name = "ItMw_1H_Sword_04_Diego_Sleeper";
    default m_Value = 384;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 65.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_04_Visual.BP_ItMw_1H_Sword_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_04_World.BP_ItMw_1H_Sword_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_04.T_ItemIcon_ItMw_1H_Sword_04";
    default m_Description = "ItMw_1H_Sword_04_description";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 13.0f);

    default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_ActionsKeywords.Add(USpellActionKeywords_DiegoSleeper_Teleport_Sword::StaticClass()); 
}

class UG1RPerceptionAgentSettings_Human_Diego_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
{
    // default Normal.Sight.InnerCoffin.Length = 10000.0f; //3000.0f;
    // default Normal.Sight.InnerCoffin.GoodVisionLength = 6000.0f; //2400.0f;
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
class UGameplayAbility_CharacterAI_Human_Diego_Sleeper : UGameplayAbility_CharacterAI_Human
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
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Sleeper_Diego::StaticClass());
}

