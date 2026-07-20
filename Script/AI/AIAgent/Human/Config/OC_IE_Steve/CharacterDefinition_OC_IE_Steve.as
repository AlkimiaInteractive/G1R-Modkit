UCLASS()
class UCharacterDefinition_Human_OC_IE_Steve: UCharacterDefinition_Human
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_LightType = 6;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",5);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",50);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",50);
    default SetAttributeValue("AttributeSet_Health.Health",88);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",88);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",60);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",20);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_IE_Steve::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Digger::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_UniqueName = n"OC_IE_Steve";
}
