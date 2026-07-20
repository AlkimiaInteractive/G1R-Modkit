UCLASS()
class UCharacterDefinition_Human_SC_WSC_Natalia_1207: UCharacterDefinition_Human_SwampCamp_WomanSlave
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",4);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",40);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",40);
    default SetAttributeValue("AttributeSet_Health.Health",52);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",52);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",30);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",30);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",20);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_WSC_Natalia_1207::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_WomanSlave::StaticClass();
    default m_UniqueName = n"SC_WSC_Natalia_1207";
}
