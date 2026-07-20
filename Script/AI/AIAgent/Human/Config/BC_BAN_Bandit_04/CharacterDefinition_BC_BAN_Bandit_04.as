UCLASS()
class UCharacterDefinition_Human_BC_BAN_Bandit_04: UCharacterDefinition_Human_BanditCamp_Bandit
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Bandit;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",12);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",120);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",120);
    default SetAttributeValue("AttributeSet_Health.Health",300);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",125);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",125);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",80);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",23);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",18);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Grilledscavenger::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_2H_Staff_Scepter::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 10, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_BC_BAN_Bandit_04::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_BanditCamp_Bandit::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"BC_BAN_Bandit_04";
}
