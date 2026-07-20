UCLASS()
class UCharacterDefinition_Orc_FM_OSL_Tarrok_2001: UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Slave;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",40);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",400);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",400);
    default SetAttributeValue("AttributeSet_Health.Health",500);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",225);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",225);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_FM_OSL_Tarrok_2001::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Slave::StaticClass();
    default m_UniqueName = n"FM_OSL_Tarrok_2001";
}
