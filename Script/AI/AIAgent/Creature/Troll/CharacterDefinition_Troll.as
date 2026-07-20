
UCLASS()
class UCharacterDefinition_Creature_Troll : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Troll_Normal;
	default m_Species = GameplayTag::Species_Creature_Troll;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_Troll_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Troll_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Troll_Focus::StaticClass();

	default AddToInventory(UTrollWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Troll_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	// Other
    default m_CameraConfig = UTrollCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 200);
	default SetAttributeValue("AttributeSet_Strength.Strength", 160);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 20);
    default SetAttributeValue("AttributeSet_Health.Health", 1000); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 1000);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 1000);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 1000);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 150);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 150);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 110);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 100);
	// protection[PROT_FLY] = 9999;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 2000);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	//default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	default m_AIAbility = UGameplayAbility_CharacterAI_Troll::StaticClass();

	default m_UniqueName = n"Troll";
}