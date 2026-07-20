UCLASS()
class UCharacterDefinition_Human_CS_Escort06: UCharacterDefinition_Human
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",4);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",40);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",40);
    default SetAttributeValue("AttributeSet_Health.Health",26);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",26);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",93);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",93);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",13);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",9);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",24);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",24);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",23);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",16);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",10);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_CS_Escort06::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_None::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Trained::StaticClass());
    default m_UniqueName = n"CS_Escort06";
}
