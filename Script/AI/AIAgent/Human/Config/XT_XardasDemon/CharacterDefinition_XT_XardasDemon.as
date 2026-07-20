UCLASS()
class UCharacterDefinition_Human_XT_XardasDemon: UCharacterDefinition_Creature_XardasDemon
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",60);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",600);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",600);
    default SetAttributeValue("AttributeSet_Health.Health",300);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",140);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",140);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",75);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",75);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",500);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",35);
    default m_InitialGuildEffect = UGE_Guild_Human_DemonSummonerAlly::StaticClass();
    default m_UniqueName = n"XT_XardasDemon";
}
