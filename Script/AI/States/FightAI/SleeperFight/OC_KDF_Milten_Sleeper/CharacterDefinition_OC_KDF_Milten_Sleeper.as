UCLASS()
class UCharacterDefinition_Human_OC_KDF_Milten_Sleeper : UCharacterDefinition_Human_OldCamp_FireMage
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mage_Fire;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",999);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_Health.Health",10);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 10);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",60);
    default SetAttributeValue("AttributeSet_Mana.Mana",150);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",150);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",150);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",30);

    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", MAX_flt);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", MAX_flt);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", MAX_flt);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", MAX_flt);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", MAX_flt);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", MAX_flt);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", MAX_flt);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", MAX_flt);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", MAX_flt);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", MAX_flt);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

    default m_AbilitiesEffect = UGE_Human_AI_Milten_Sleeper::StaticClass();
    // default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAr_Rune_FireBall_MiltenSleeper::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_KDF_Milten_Sleeper::StaticClass();

    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human_Milten_Sleeper::StaticClass();

    default m_UniqueName = n"OC_KDF_Milten_Sleeper";
    default m_AIAbility = UGameplayAbility_CharacterAI_Human_Milten_Sleeper::StaticClass();
    default m_InitialGuildEffect = UGE_SleeperTemple_Milten::StaticClass();


    // default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    // default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    // default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());

    UPROPERTY()
    UClass m_TeleportSpotFilterClass = AMiltenSleeperTeleportSpotVisual::StaticClass();
}

class USpawnAIAgentDefinition_Human_OC_KDF_Milten_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Human_OC_KDF_Milten_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}

UCLASS()
class UAIAgentConfig_Human_OC_KDF_Milten_Sleeper : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_KDF_Milten_Sleeper::StaticClass();
    default m_AnimConfig = UAnimConfig_Milten_Sleeper::StaticClass();
    default m_NavigationConfig = UAIAgentConfig_Navigation_Milten_Sleeper::StaticClass();
    default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

}
//Teleport animations
UCLASS()
class UTeleport_MiltenSleeper : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Milten/A_MiltenSleeper_Disappear_Cast_Montage.A_MiltenSleeper_Disappear_Cast_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Milten/A_MiltenSleeper_Appear_Launch_Montage.A_MiltenSleeper_Appear_Launch_Montage'";
}

//Anim config for teleport
UCLASS()
class UAnimConfig_Milten_Sleeper : UAnimConfig_Human
{
    default AddAnimForItem(GameplayTag::Item_Spell_Sleeper_Teleport_Milten, UTeleport_MiltenSleeper::StaticClass());
}

UCLASS()
class UGE_Human_AI_Milten_Sleeper : UGE_Human_AI_Mage_SixthCircle_Sleeper
{
    default AddAbility(UGA_MiltenSleeperInvulnerableVisualManager::StaticClass());
    default AddAbility(UGA_MiltenSleeper_BraziersManager::StaticClass());
    default AddAbility(UGA_MiltenSleeper_BrazierMontage::StaticClass());

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Invulnerable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);

}

UCLASS()
class UItAr_Rune_FireBall_MiltenSleeper : UItAr_Rune_FireBall//UAxe1H
{
	default m_Name = "UItAr_Rune_FireBall_MiltenSleeper";
    // default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    // default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 10.0f);
    // default m_SuperArmorDamageBase = 20;
    //default m_ItemVisual = n"Blueprint'/Game/Items/Rune/BP_ItAr_Rune_FireBall_Visual.BP_ItAr_Rune_FireBall_Visual_C'";
    //default m_ItemVisualWorld = n"Blueprint'/Game/Items/Rune/BP_ItAr_Rune_FireBall_World.BP_ItAr_Rune_FireBall_World_C'";
    //default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Hatchet_01.T_ItemIcon_ItMw_1H_Axe_Hatchet_01";
    //default m_Description = "ItAr_Rune_FireBall_description_Sleeper";
    // default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    // default AddItemSpec(GameplayTag::Item_Property_Equipable);

	default RequiredMagicCircleLevel = 3;
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	
	default m_OnEquipEffect = nullptr;
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_MiltenSleeper_Teleport::StaticClass();
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Firebolt_MiltenSleeper::StaticClass();
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_FireBall_MiltenSleeper::StaticClass();
	default m_ActionsKeywords.Add(USpellActionKeywords_FireBall_MiltenSleeper::StaticClass());
    default m_ActionsKeywords.Add(USpellActionKeywords_Firebolt_MiltenSleeper::StaticClass());
    default m_ActionsKeywords.Add(USpellActionKeywords_MiltenSleeper_Teleport::StaticClass());

    default AddItemSpec(GameplayTag::Item_Property_NonLoot);

}

UCLASS()
class UItAr_Rune_FireBall_MiltenSleeper_Player : UItAr_Rune_FireBall//UAxe1H
{
	default m_Name = "UItAr_Rune_FireBall_MiltenSleeper";
    // default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    // default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 10.0f);
    // default m_SuperArmorDamageBase = 20;
    //default m_ItemVisual = n"Blueprint'/Game/Items/Rune/BP_ItAr_Rune_FireBall_Visual.BP_ItAr_Rune_FireBall_Visual_C'";
    //default m_ItemVisualWorld = n"Blueprint'/Game/Items/Rune/BP_ItAr_Rune_FireBall_World.BP_ItAr_Rune_FireBall_World_C'";
    //default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Axe_Hatchet_01.T_ItemIcon_ItMw_1H_Axe_Hatchet_01";
    //default m_Description = "ItAr_Rune_FireBall_description_Sleeper";
    // default SetItemType(GameplayTag::Item_Weapon_Axe_OneHand);
    // default AddItemSpec(GameplayTag::Item_Property_Equipable);

	default RequiredMagicCircleLevel = 0;
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Mana::StaticClass(), n"MagicianLevel"), RequiredMagicCircleLevel);
	
	default m_OnEquipEffect = nullptr;
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_MiltenSleeper_Teleport::StaticClass();
    default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Firebolt_MiltenSleeper::StaticClass();
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_FireBall_MiltenSleeper::StaticClass();
	// default m_ActionsKeywords.Add(USpellActionKeywords_FireBall_MiltenSleeper::StaticClass());
    // default m_ActionsKeywords.Add(USpellActionKeywords_Firebolt_MiltenSleeper::StaticClass());
    // default m_ActionsKeywords.Add(USpellActionKeywords_MiltenSleeper_Teleport::StaticClass());

    default AddItemSpec(GameplayTag::Item_Property_NonLoot);

}


class UG1RPerceptionAgentSettings_Human_Milten_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
{

    default Normal.Sight.OuterCoffin.Length = 2000.0f; //1200.0f;
    default Normal.Sight.OuterCoffin.GoodVisionLength = 2000.0f; //700.0f;
    default Normal.Sight.OuterCoffin.CloseHalfWidth = 300; //300
    default Normal.Sight.OuterCoffin.MiddleHalfWidth = 450; //450
    default Normal.Sight.OuterCoffin.FarHalfWidth = 300; //300

    default Normal.Sight.InnerCoffin.Length = 2000.0f; //3000.0f;
    default Normal.Sight.InnerCoffin.GoodVisionLength = 2000.0f; //2400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 2000; //150
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 2000; //250
    default Normal.Sight.InnerCoffin.FarHalfWidth = 2000; //150

    // default Normal.Sight.OuterCoffin.Length = 4200.0f; //3200.0f;
    // default Normal.Sight.OuterCoffin.GoodVisionLength = 3700.0f; //2700.0f;
    // default Normal.Sight.OuterCoffin.CloseHalfWidth = 1200; //300
    // default Normal.Sight.OuterCoffin.MiddleHalfWidth = 1800; //450
    // default Normal.Sight.OuterCoffin.FarHalfWidth = 1200; //300

    // // default Normal.Sight.HeightParabolAlpha = -0.0003f;
    // // default Normal.Sight.HeightParabolOffsetY = 0.6f;
    // default Normal.Sight.HeightParabolOffsetZ = 0.585f;

    // // default HighAlert.Sight.HeightParabolAlpha = 0.0f;
    // // default HighAlert.Sight.HeightParabolOffsetY = 0.6f;
    // // default HighAlert.Sight.HeightParabolOffsetZ = 0.4f;

    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 0.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;
    default Normal.Smell.AwarenessWearoffFactor = 0.0f;
    default Normal.Hearing.AwarenessWearoffFactor = 0.0f;
}

UCLASS()
class UGameplayAbility_CharacterAI_Human_Milten_Sleeper : UGameplayAbility_CharacterAI_Human
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
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Sleeper_Milten::StaticClass());
}
