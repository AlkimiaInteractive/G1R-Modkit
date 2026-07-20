UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Nymph : UCharacterDefinition_Creature_Minecrawler
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Minecrawler;
    default m_Species = GameplayTag::Species_Creature_Minecrawler_Nymph;

    default m_UniqueName = n"Minecrawler Nymph";
    default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_Nymph;

	default m_AbilitiesEffect = UGE_Minecrawler_Nymph_AI;
    default m_OnPlayerEffect = UGE_Minecrawler_Nymph_Player;

    default SetAttributeValue("AttributeSet_LevelProgression.Level", 7);
	default SetAttributeValue("AttributeSet_Strength.Strength", 40);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 40); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 40);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 20);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 20);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 20);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 10);
	// protection[PROT_FLY] = 0;

	 default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 70);
}

UCLASS()
class UCharacterDefinition_Creature_Minecrawler_Nymph_Queen : UCharacterDefinition_Creature_Minecrawler
{
    default m_UniqueName = n"Minecrawler Nymph";
    default m_AIAbility = UGameplayAbility_CharacterAI_Minecrawler_Nymph;

	default m_AbilitiesEffect = UGE_Minecrawler_Nymph_Queen_AI;
    default m_OnPlayerEffect = UGE_Minecrawler_Nymph_Player;

    default SetAttributeValue("AttributeSet_LevelProgression.Level", 7);
	default SetAttributeValue("AttributeSet_Strength.Strength", 40);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 30);
    default SetAttributeValue("AttributeSet_Health.Health", 10); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 10);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 20);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 20);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 20);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 10);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
}