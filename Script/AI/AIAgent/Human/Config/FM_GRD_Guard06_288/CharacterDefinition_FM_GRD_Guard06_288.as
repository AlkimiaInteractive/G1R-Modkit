UCLASS()
class UCharacterDefinition_Human_FM_GRD_Guard06_288: UCharacterDefinition_Human_OldCamp_Guard
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guard;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",15);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",150);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",150);
    default SetAttributeValue("AttributeSet_Health.Health",380);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",380);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",140);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",140);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",65);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",24);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",18);
    default AddToInventory(UItMw_1H_Sword_03::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItRw_Crossbow_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Bolt::StaticClass(), 21, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_FM_GRD_Guard06_288::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Guard::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"FM_GRD_Guard06_288";
}
