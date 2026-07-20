UCLASS()
class UCharacterDefinition_Human_OC_EBR_Bartholo_106: UCharacterDefinition_Human_OldCamp_OreBaron
{
    default m_CharacterType = GameplayTag::AIAgent_Human_OreBaron;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",60);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",600);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",600);
    default SetAttributeValue("AttributeSet_Health.Health",600);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",600);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",65);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",10);
    default AddToInventory(UItMw_1H_Sword_Paw::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItKe_Storage_01::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_EBR_Bartholo_106::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_OreBaron::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_EBR_Bartholo_106";
}
