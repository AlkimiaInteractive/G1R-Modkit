UCLASS()
class UCharacterDefinition_Human_NC_BAU_Jan_942: UCharacterDefinition_Human_NewCamp_Peasant
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Peasant;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",15);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",150);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",150);
    default SetAttributeValue("AttributeSet_Health.Health",400);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",400);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",180);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",180);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",120);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default m_AbilitiesEffect = UGE_Human_ReducedDefeatedTime::StaticClass();
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Apple::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_BAU_Jan_942::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Peasant::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Jan::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_Fists_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_BAU_Jan_942";
}
