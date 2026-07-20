UCLASS()
class UCharacterDefinition_Human_QD_Questdealer: UCharacterDefinition_Human
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",6);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",60);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",60);
    default SetAttributeValue("AttributeSet_Health.Health",100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",55);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",55);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_QD_Questdealer::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_None::StaticClass();
    default m_UniqueName = n"QD_Questdealer";
}

class UAIAgentConfig_Human_QD_Questdealer : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_QD_Questdealer::StaticClass();

}

UCLASS()
class UCharacterVisualsDefinition_Human_QD_Questdealer: UArmorVisualsDefinition_Human
{
   default Person = "Male61";
    default Eye_Color = "Eye_Color_05";
    default Eyebrows = "Eyebrows_05";
    default Goatee = "Goatee_05";
    default Hair_Color = "Hair_Color_02";
    default Hair = "Hair_47";
    default Moustache = "Moustache_04";
    default SideBurn = "None";
    default Skin_Color = "Skin_Color_03";
    default Stubblecaps = "Stubblecaps_02";
    default Teeth = "Teeth_01";
    default BodyType = "Type01";
    default Clothes = "MediumGuard";
    default Shirt = "Shirt_01";
    default Shoulders = "Shoulders_01";
    default Arms = "Arms_01";
    default Belt = "Belt_01";
    default Tassets = "Tassets_02";
    default Skirt = "Skirt_02";
    default Pants = "Pants_01";
    default Knees = "Knees_02";
    default Boots = "Boots_01";
    default Bracelet = "Bracelet_02";
    default m_PreBakedName = "FM_GRD_Guard14_296";
    default m_UpperTeethOffset = 0.2;
    default m_CharacterVisualFeatures = UVisualFeatures_FM_GRD_Guard14_296::StaticClass();
    default m_HasPreBakedSK = true;
    default m_TagsToAdd.AddTag(GameplayTag::Visuals_Humans_SkinType_02);
    default m_TagsToAdd.AddTag(GameplayTag::Visuals_Humans_HeadType_01);
}
