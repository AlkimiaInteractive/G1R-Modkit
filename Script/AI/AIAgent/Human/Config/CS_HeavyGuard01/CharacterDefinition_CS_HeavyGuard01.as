UCLASS()
class UCharacterDefinition_Human_CS_HeavyGuard01: UCharacterDefinition_Human
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_LightType = 6;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",6);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",60);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",60);
    default SetAttributeValue("AttributeSet_Health.Health",100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",70);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",70);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",42);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",34);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",36);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",36);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_CS_HeavyGuard01::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_None::StaticClass();
    default m_UniqueName = n"CS_HeavyGuard01";
}
