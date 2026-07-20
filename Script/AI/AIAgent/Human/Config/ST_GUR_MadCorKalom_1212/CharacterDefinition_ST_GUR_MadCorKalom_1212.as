UCLASS()
class UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212: UCharacterDefinition_Human_SwampCamp_Guru
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guru;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",1000);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",10000);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",10000);
    default SetAttributeValue("AttributeSet_Health.Health",600);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",600);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",500);
    default SetAttributeValue("AttributeSet_Strength.Strength",70);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",500);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",500);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",500);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",80);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",60);
    default AddToInventory(UItMw_1H_Sword_Kalom::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItAr_Rune_Pyrokinesis::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_GUR_CorKalom_1201::StaticClass();
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_AbilitiesEffect = UGE_Human_AI_MadCorKalom::StaticClass();
    default m_UniqueName = n"ST_GUR_MadCorKalom_1212";
}
