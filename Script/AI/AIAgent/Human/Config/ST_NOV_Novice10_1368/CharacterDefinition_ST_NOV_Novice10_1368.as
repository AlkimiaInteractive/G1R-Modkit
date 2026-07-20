UCLASS()
class UCharacterDefinition_Human_ST_NOV_Novice10_1368: UCharacterDefinition_Human_SwampCamp_Novice
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Novice;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",30);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",300);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",300);
    default SetAttributeValue("AttributeSet_Health.Health",208);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",208);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",40);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",40);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",4);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",4);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",8);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_ST_NOV_Novice10_1368::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Novice::StaticClass();
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"ST_NOV_Novice10_1368";
}
