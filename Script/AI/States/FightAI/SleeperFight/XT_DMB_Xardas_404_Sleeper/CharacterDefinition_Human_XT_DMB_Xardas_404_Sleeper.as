UCLASS()
class UCharacterDefinition_Human_XT_DMB_Xardas_404_Sleeper : UCharacterDefinition_Human
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Xardas;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",30);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_Health.Health",1000);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1000);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",6000);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",6000);
    default SetAttributeValue("AttributeSet_Mana.Mana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Strength.Strength",20); //55
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",65);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

    default m_AbilitiesEffect = UGE_Human_AI_Xardas_Sleeper::StaticClass();
    default AddToInventory(UItMw_1H_Sword_01_Xardas_Sleeper::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Amulet_Enlight::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Ring_Magic_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Ring_Enlight::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_XT_DMB_Xardas_404_Sleeper::StaticClass();
    
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human_XT_DMB_Xardas_404_Sleeper::StaticClass();

    default m_UniqueName = n"XT_DMB_Xardas_404_Sleeper";
    default m_AIAbility = UGameplayAbility_CharacterAI_Human_Xardas_Sleeper::StaticClass();
    default m_InitialGuildEffect = UGE_SleeperTemple_Xardas::StaticClass();

    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());

    UPROPERTY()
    UClass m_TeleportMinionSpotFilterClass = AMinionSpot_XardasSleeper::StaticClass();
    UPROPERTY()
    UClass m_TeleportGroundSpotFilterClass = ACentralArenaTeleportSpot::StaticClass();

    
    default m_CueData.Remove(GameplayTag::Debuff_Electrified);
}

class USpawnAIAgentDefinition_Human_XT_DMB_Xardas_404_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Human_XT_DMB_Xardas_404_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_XardasSleeper.AIAgentCharacter_Human_XardasSleeper_C'";
}

UCLASS()
class UAIAgentConfig_Human_XT_DMB_Xardas_404_Sleeper : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_XT_DMB_Xardas_404_Sleeper::StaticClass();
    default m_AnimConfig = UAnimConfig_XardasSleeper::StaticClass();
    default m_LocomotionConfig = ULocomotionConfig_AIXardasSleeper::StaticClass();
    default m_SpawnSettings.MaxSignificanceRadius = 10000.f;
}

class ULocomotionConfig_AIXardasSleeper: ULocomotionConfig_AIHuman
{
    default m_FlyConfig = UFlyConfig_AIXardasSleeper::StaticClass();
}

class UFlyConfig_AIXardasSleeper : UFlyConfig_Player
{
    default m_UseOnlyControllerYaw = true;
}

UCLASS()
class UAnimConfig_XardasSleeper : UAnimConfig_Human
{
    default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_XardasSleeper::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Rune_FireBolt, UFireBolt_XardasSleeper::StaticClass());

    // DEFAULT ANIMATIONS
	default SetDefaultMovementAnimData(UDefault_XardasSleeper::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, USword1H_XardasSleeper_Master::StaticClass(), EWeaponSkill::Master);
}

UCLASS()
class USword1H_XardasSleeper_Master : USword1H_Human_Master
{
    // HITS
    default m_HitsData = UHitData_S1H_Ma_XardasSleeper::StaticClass();
}


UCLASS()
class UFireBolt_XardasSleeper : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Firebolt/A_XardasSleeper_S1H_Fly_Firebolt_Cast_Montage.A_XardasSleeper_S1H_Fly_Firebolt_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Firebolt/A_XardasSleeper_S1H_Fly_Firebolt_Launch_End_Montage.A_XardasSleeper_S1H_Fly_Firebolt_Launch_End_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Firebolt/A_XardasSleeper_S1H_Fly_Firebolt_Failure_Montage.A_XardasSleeper_S1H_Fly_Firebolt_Failure_Montage'";
    
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Firebolt/A_XardasSleeper_S1H_Fly_Firebolt_Launch_Sections_Montage.A_XardasSleeper_S1H_Fly_Firebolt_Launch_Sections_Montage'";
    default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Firebolt/A_XardasSleeper_S1H_Fly_Firebolt_Launch_End_Montage.A_XardasSleeper_S1H_Fly_Firebolt_Launch_End_Montage'";
    default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Flying/Firebolt/A_XardasSleeper_S1H_Fly_Firebolt_Failure_Montage.A_XardasSleeper_S1H_Fly_Firebolt_Failure_Montage'";
}

UCLASS()
class UProjectile_XardasSleeper : UItemAnimConfig
{
    default m_EquipData = UEquipData_XardasSleeper_Projectile::StaticClass();
}


UCLASS()
class UEquipData_XardasSleeper_Projectile : UEquipData
{
    default m_SocketName = n"weapon_l";
    //default m_SocketDrawName.FindOrAdd(EHoldsterLocation::Back) = n"sword_holder_02Socket";
}



UCLASS()
class UGE_Human_AI_Xardas_Sleeper : UGE_Human_AI_Mage_SixthCircle_Sleeper_Extended
{
    default AddAbility(UGA_XardasSleeperInvulnerableVisualManager::StaticClass());
    default AddAbility(UGA_Xardas_Sleeper_Invulnerable::StaticClass());
    default AddAbility(UGA_Teleport_XardasSleeper::StaticClass());
    default AddAbility(UGA_Xardas_Sleeper_HealthMonitor::StaticClass());
    default AddAbility(UGA_Xardas_Sleeper_FightManager::StaticClass());    
  
    // Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Animation_Spell_Firebolt_XardasSleeper);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NeverDisengage);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);
}


UCLASS()
class UItMw_1H_Sword_01_Xardas_Sleeper: USword1H
{
    default m_Name = "ItMw_1H_Sword_01_Xardas_Sleeper";
    default m_Value = 135;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 10.0f); //20
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Beliar_Visual.BP_ItMw_2H_Sword_Beliar_Visual_C'";
    default m_ItemVisualWorld = n"/Script/Engine.Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Sword_Beliar_World.BP_ItMw_2H_Sword_Beliar_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_01.T_ItemIcon_ItMw_1H_Sword_01";
    default m_Description = "ItMw_1H_Sword_01_description";
    default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
	default AddItemSpec(GameplayTag::Item_Property_Environment_Air_Flying); 
    default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 10.0f); //20

    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_RuneEquip_Firebolt_XardasSleeper::StaticClass();
    default m_ActionsKeywords.Add(USpellActionKeywords_Firebolt_XardasSleeper::StaticClass()); 
}

class UG1RPerceptionAgentSettings_Human_XT_DMB_Xardas_404_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
{
    /// Configure values so that xardas can see everywhere properly

    // default Normal.Sight.InnerCoffin.Length = 4000.0f;
    // default Normal.Sight.InnerCoffin.GoodVisionLength = 3400.0f;
    // default Normal.Sight.InnerCoffin.CloseHalfWidth = 600;
    // default Normal.Sight.InnerCoffin.MiddleHalfWidth = 1000;
    // default Normal.Sight.InnerCoffin.FarHalfWidth = 600;

    // default Normal.Sight.OuterCoffin.Length = 4200.0f;
    // default Normal.Sight.OuterCoffin.GoodVisionLength = 3700.0f;
    // default Normal.Sight.OuterCoffin.CloseHalfWidth = 1200;
    // default Normal.Sight.OuterCoffin.MiddleHalfWidth = 1800;
    // default Normal.Sight.OuterCoffin.FarHalfWidth = 1200;

    // default Normal.Sight.HeightParabolAlpha = -0.0003f;
    // default Normal.Sight.HeightParabolOffsetY = 0.6f;
    // default Normal.Sight.HeightParabolOffsetZ = 0.585f;

    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 0.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;
    default Normal.Smell.AwarenessWearoffFactor = 0.0f;
    default Normal.Hearing.AwarenessWearoffFactor = 0.0f;
}

UCLASS()
class UGameplayAbility_CharacterAI_Human_Xardas_Sleeper : UGameplayAbility_CharacterAI_Human
{
    default bEnableDisengage = false;
    
    /// ITEM SCORING
    /// Melee Weapon Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill());
    /// Ranged weapon scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill());
    /// Misc item scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_ActualWeaponBonus());

    default AssessmentModuleClass = UAIARM_SleeperDream;

    default InitialDailyRoutineClass = UDailyRoutine_StandAround_Only::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Sleeper_Xardas::StaticClass());
}

UCLASS()
class UDailyRoutine_XT_DMB_Xardas_404_Sleeper_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_StandAround(), n"FP_SD_XARDAS");
}
