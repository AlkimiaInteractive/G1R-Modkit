UCLASS()
class UCharacterDefinition_Human_OC_EBR_Raven_105: UCharacterDefinition_Human_OldCamp_OreBaron
{
    default m_CharacterType = GameplayTag::AIAgent_Human_OreBaron;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",90);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",900);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",900);
    default SetAttributeValue("AttributeSet_Health.Health",600);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",600);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",70);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",75);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default AddToInventory(UItMw_1H_Sword_Raven::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItKe_Smith_01::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 26, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_EBR_Raven_105::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_OreBaron::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_EBR_Raven_105";
}
