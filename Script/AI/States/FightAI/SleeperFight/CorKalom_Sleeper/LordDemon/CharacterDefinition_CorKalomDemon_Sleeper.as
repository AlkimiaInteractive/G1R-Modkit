

UCLASS()
class UCharacterDefinition_Creature_CorKalomDemon_Sleeper : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Demon_Lord;
	default m_Species = GameplayTag::Species_Creature_Demon;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_CorKalomDemon_Sleeper_AI::StaticClass();
    default m_OnPlayerEffect = UGE_CorKalomDemon_Sleeper_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_LordDemon_Sleeper::StaticClass();

    default m_CueData.Add(GameplayTag::GameplayCue_State_Summoned, UCueVisualConfig_Summoned_Demon::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UCorKalomDemonSleeperWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);

	// Other
    default m_CameraConfig = UDemonCamera::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 100);
	default SetAttributeValue("AttributeSet_Strength.Strength", 160);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 150);
    default SetAttributeValue("AttributeSet_Health.Health", 2500); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 2500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 1500);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 1500);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 65);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 65);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 65);
	// protection[PROT_FLY] = 1000;

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_CorKalom_Sleeper::StaticClass();
    default m_UniqueName = n"CorKalomDemon";
}

// class USpawnAIAgentDefinition_DEPRECATED_Creature_LordDemon_Sleeper : USpawnAIAgentDefinition_DemonLord
// {
//     default AIAgentConfigClass = UAIAgentConfig_Creature_LordDemon_Sleeper::StaticClass();
// }

// UCLASS()
// class UAIAgentConfig_Creature_LordDemon_Sleeper : UAIAgentConfig_Demon_Lord
// {
// 	default m_CharacterDefinition = UCharacterDefinition_Creature_LordDemon_Sleeper::StaticClass();
//     default m_AnimConfig = UAnimConfig_LordDemon_Sleeper::StaticClass();
    

// }

class UG1RPerceptionAgentSettings_LordDemon_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
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