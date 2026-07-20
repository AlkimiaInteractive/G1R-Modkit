UCLASS()
class UCharacterDefinition_Human_SC_GUR_YBerion_1200: UCharacterDefinition_Human_SwampCamp_Guru
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guru;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",30);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",300);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",300);
    default SetAttributeValue("AttributeSet_Health.Health",600);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",600);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",MAX_flt);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",MAX_flt);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",MAX_flt);
    default SetAttributeValue("AttributeSet_Strength.Strength",60);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",45);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default AddToInventory(UItAr_Rune_Pyrokinesis::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_02::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_03::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_GUR_YBerion_1200::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_GuruLeader::StaticClass();
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_UniqueName = n"SC_GUR_YBerion_1200";
}
