UCLASS()
class UCharacterDefinition_Human_BC_BAN_Arlin_852: UCharacterDefinition_Human_BanditCamp_Bandit
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Bandit;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",14);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",140);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",140);
    default SetAttributeValue("AttributeSet_Health.Health",500);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",165);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",165);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",20);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 3, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Rice::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Wolf_03::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_BC_BAN_Arlin_852::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_BanditCamp_Bandit::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"BC_BAN_Arlin_852";
}
