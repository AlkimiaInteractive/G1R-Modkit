UCLASS()
class UCharacterDefinition_Human_SC_GUR_BaalOrun_1209: UCharacterDefinition_Human_SwampCamp_Guru
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guru;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",30);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",300);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",300);
    default SetAttributeValue("AttributeSet_Health.Health",600);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",600);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Strength.Strength",70);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",50);
    default AddToInventory(UItMw_1H_Mace_Orun::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_03::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_GUR_BaalOrun_1209::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Guru::StaticClass();
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_UniqueName = n"SC_GUR_BaalOrun_1209";
}
