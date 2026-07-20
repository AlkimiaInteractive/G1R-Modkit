UCLASS()
class UCharacterDefinition_Creature_Lurker_Homer : UCharacterDefinition_Creature_Lurker
{
    default m_UniqueName = n"Lurker_Homer";

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 14);
	default SetAttributeValue("AttributeSet_Strength.Strength", 40);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 40);
    default SetAttributeValue("AttributeSet_Health.Health", 90); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 90);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 30);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 10);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 140);
}

UCLASS()
class UAIAgentConfig_Lurker_Homer : UAIAgentConfig_Lurker
{
	default m_CharacterDefinition = UCharacterDefinition_Creature_Lurker_Homer::StaticClass();
}


UCLASS()
class USpawnAIAgentDefinition_Lurker_Homer : USpawnAIAgentDefinition
{
	default AIAgentConfigClass = UAIAgentConfig_Lurker_Homer::StaticClass();
	default AIAgentCharacterClass = n"AAIAgentCharacter'/Game/AI/AIAgent/Creature/Lurker/AIAgentCharacter_Lurker.AIAgentCharacter_Lurker_C'";
}