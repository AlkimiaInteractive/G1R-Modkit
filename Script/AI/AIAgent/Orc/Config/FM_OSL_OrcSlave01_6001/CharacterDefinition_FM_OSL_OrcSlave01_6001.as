UCLASS()
class UCharacterDefinition_Orc_FM_OSL_OrcSlave01_6001: UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Slave;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",100);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",100);
    default SetAttributeValue("AttributeSet_Health.Health",10);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",158);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",158);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",90);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",15);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_FM_OSL_OrcSlave01_6001::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Slave::StaticClass();
    default m_UniqueName = n"FM_OSL_OrcSlave01_6001";
}
