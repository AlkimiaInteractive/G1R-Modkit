UCLASS()
class UCharacterDefinition_Orc_OW_OPS_OrcPeasantM09_2076: UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Peasant;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",22);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",220);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",220);
    default SetAttributeValue("AttributeSet_Health.Health",200);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",200);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",105);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",105);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",50);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OPS_OrcPeasantM09_2076::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Peasant::StaticClass();
    default m_UniqueName = n"OW_OPS_OrcPeasantM09_2076";
}
