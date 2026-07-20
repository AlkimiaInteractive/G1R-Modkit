UCLASS()
class UCharacterDefinition_Creature_Golem_Stone_Bridge : UCharacterDefinition_Creature
{
    default m_CharacterType = GameplayTag::AIAgent_Creature_Golem_Stone;
	default m_Species = GameplayTag::Species_Creature_Golem_Stone;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;

	default m_AbilitiesEffect = UGE_Golem_Stone_Bridge_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Golem_Stone_Player::StaticClass();

    default m_PerceptionSettings = UG1RPerceptionAgentSettings_GolemSmall::StaticClass();

    default m_CueData.Add(GameplayTag::State_Summoned, UCueVisualConfig_Summoned_Golem::StaticClass());

    default AddToInventory(UStoneGolemWeapon_Small::StaticClass(), 1, EInventoryTypes::MeleeSlot);
    //default AddToInventory(UItAt_Stonegolem_01::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Stonegolem_02::StaticClass(), 1, EInventoryTypes::MainContainer);

	// Other
    default m_CameraConfig = UGolemCamera::StaticClass();

	// Super Armor
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 60.0f;
	default m_OnParriedDamageMultiplier = 1.0f;

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 100);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 100);
    default SetAttributeValue("AttributeSet_Health.Health", 700); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 700);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 500);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 500);

    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 9999);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 15);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 500);

	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
    default m_SuperArmorParams.m_StartRegenerateSc = 2.0f;
    default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
    default m_OnParriedDamageMultiplier = 1.0f;

    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);

	default m_AIAbility = UGameplayAbility_CharacterAI_Golem_Stone_Bridge::StaticClass();
    default m_UniqueName = n"Golem_Stone_Bridge";
}

UCLASS()
class UCharacterDefinition_Creature_Golem_Stone_Summoned : UCharacterDefinition_Creature_Golem_Stone_Bridge
{
	default m_AbilitiesEffect = UGE_Golem_Stone_Summon_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Golem_Stone_Player::StaticClass();

    default m_PerceptionSettings = UG1RPerceptionAgentSettings_GolemSmall::StaticClass();

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 100);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 100);
    default SetAttributeValue("AttributeSet_Health.Health", 500); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 500);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 500);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 150);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 150);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 150);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 150);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 150);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 15);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 500);

	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
    default m_SuperArmorParams.m_StartRegenerateSc = 2.0f;
    default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
    default m_OnParriedDamageMultiplier = 1.0f;

	default m_AIAbility = UGameplayAbility_CharacterAI_Golem_Stone_Summoned;
    default m_UniqueName = n"Golem_Stone_Summoned";
}