UCLASS()
class UCharacterDefinition_Human_NC_SLD_Gorn_699_Sleeper : UCharacterDefinition_Human_NewCamp_Mercenary
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mercenary;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",999);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_Health.Health",1500);//2000
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 400);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",400);
    default SetAttributeValue("AttributeSet_Mana.Mana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",14*2);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",8*2);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",8*2);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",8*2);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
    default AddToInventory(UItMw_2H_Axe_Gorn_Sleeper::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 5, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_SLD_Gorn_699_Sleeper::StaticClass();

    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human_Gorn_Sleeper::StaticClass();

    default m_UniqueName = n"NC_SLD_Gorn_699_Sleeper";
    default m_AIAbility = UGameplayAbility_CharacterAI_Human_Gorn_Sleeper::StaticClass();
    default m_AbilitiesEffect = UGE_Human_AI_Gorn_Sleeper::StaticClass();
    default m_InitialGuildEffect = UGE_SleeperTemple_Gorn::StaticClass();

    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
}

UCLASS()
class UGE_Human_AI_Gorn_Sleeper : UGE_Human_AI_Mage_SixthCircle_Sleeper
{
   default AddAbility(UGA_GornSleeper_ElectrifiedAreaController::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
   default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
   default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NeverDisengage);
   default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);
}

UCLASS()
class UAIAgentConfig_Human_NC_SLD_Gorn_699_Sleeper : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Gorn_699_Sleeper::StaticClass();
    default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

}

class USpawnAIAgentDefinition_NC_SLD_Gorn_699_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Human_NC_SLD_Gorn_699_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}


UCLASS()
class UItMw_2H_Axe_Gorn_Sleeper: UAxe2H
{
    default m_Name = "ItMw_2H_Axe_Gorn_Sleeper";
    default m_Value = 560;
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 75.0f);
    default m_SuperArmorDamageBase = 20;
    default m_ItemVisual = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Gorn_Visual.BP_ItMw_2H_Axe_Gorn_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Weapon/2Handed/BP_ItMw_2H_Axe_Gorn_World.BP_ItMw_2H_Axe_Gorn_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_2H_Axe_Gorn.T_ItemIcon_ItMw_2H_Axe_Gorn";
    default m_Description = "ItMw_2H_Axe_Gorn_description";
    default SetItemType(GameplayTag::Item_Weapon_Axe_TwoHand);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    // default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength::StaticClass(), n"Strength"), 80.0f);
}


class UG1RPerceptionAgentSettings_Human_Gorn_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
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
class UGameplayAbility_CharacterAI_Human_Gorn_Sleeper : UGameplayAbility_CharacterAI_Human
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
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Sleeper_Gorn::StaticClass());
}
