UCLASS()
class UCharacterDefinition_Human_OC_IE_Charlotte: UCharacterDefinition_Human
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_LightType = 5;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",3);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",30);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",30);
    default SetAttributeValue("AttributeSet_Health.Health",40);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",40);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",25);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",25);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",5);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_IE_Charlotte::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Digger::StaticClass();
    default m_UniqueName = n"OC_IE_Charlotte";
}
