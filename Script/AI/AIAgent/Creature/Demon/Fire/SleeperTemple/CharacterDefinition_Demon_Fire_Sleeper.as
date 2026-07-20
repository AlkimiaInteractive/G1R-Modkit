
UCLASS()
class UGE_Demon_Fire_AI_Sleeper : UGE_Demon_Fire_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default AddAbility(UGA_CreatureNotifySpawn::StaticClass());
    default AddAbility(UGA_BossHealthBar::StaticClass());
}

UCLASS()
class UGE_Demon_Fire_AI_Sleeper_NoAnimSpawn : UGE_Demon_Fire_AI_Sleeper
{
    // This removes the Effect and Ability to wait to be Shown by Summon Animation
    default AdditionalEffects.OnApplicationGameplayEffects.Empty();
    default RemoveAbility(UGA_Summon_FireDemon::StaticClass());
    default AddAbility(UGA_BossHealthBar::StaticClass());
}


UCLASS()
class UCharacterDefinition_Creature_Demon_Fire_Sleeper : UCharacterDefinition_Creature_Demon_Fire
{
    default m_AbilitiesEffect = UGE_Demon_Fire_AI_Sleeper_NoAnimSpawn::StaticClass();
    default m_UniqueName = n"Demon_Fire_Sleeper";
}

UCLASS()
class UGE_Demon_Fire_AI_Sleeper_SpawnWithBlood : UGE_Demon_Fire_AI_Sleeper
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Visuals_Creature_Demon_Fire_Blood);
    default RemoveAbility(UGA_FireDemon_FX_Sizzle::StaticClass());
}

UCLASS()
class UCharacterDefinition_Creature_Demon_Fire_Sleeper_Ruushk_01 : UCharacterDefinition_Creature_Demon_Fire
{
    	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 150);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 120);
    default SetAttributeValue("AttributeSet_Health.Health", 1200); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 1200);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 500);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 500);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 90);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 500);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 37);
    default m_AbilitiesEffect = UGE_Demon_Fire_AI_Sleeper_SpawnWithBlood::StaticClass();
    default m_UniqueName = n"Demon_Sleeper_Ruushk_01";
}

UCLASS()
class UCharacterDefinition_Creature_Demon_Fire_Sleeper_Ruushk_02 : UCharacterDefinition_Creature_Demon_Fire
{
    	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 150);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 75);
    default SetAttributeValue("AttributeSet_Health.Health", 1200); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 1200);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 500);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 500);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 90);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 500);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 37);
    default m_AbilitiesEffect = UGE_Demon_Fire_AI_Sleeper_SpawnWithBlood::StaticClass();
    default m_UniqueName = n"Demon_Sleeper_Ruushk_02";
}

UCLASS()
class UCharacterDefinition_Creature_Demon_Fire_Sleeper_Ruushk_03 : UCharacterDefinition_Creature_Demon_Fire
{
    	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 150);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 75);
    default SetAttributeValue("AttributeSet_Health.Health", 1200); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 1200);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 500);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 500);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 90);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 500);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 37);
    default m_AbilitiesEffect = UGE_Demon_Fire_AI_Sleeper_SpawnWithBlood::StaticClass();
    default m_UniqueName = n"Demon_Sleeper_Ruushk_03";
}