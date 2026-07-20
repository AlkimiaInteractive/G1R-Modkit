UCLASS()
class UCharacterDefinition_Human_OC_GRD_Thorus_200: UCharacterDefinition_Human_OldCamp_Guard
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guard;
    default m_LightType = 6;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",50);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",500);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",500);
    default SetAttributeValue("AttributeSet_Health.Health",420);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",420);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",250);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",250);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",80);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",42);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",34);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",36);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",36);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default AddToInventory(UItMw_2H_Sword_Thorus::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Crossbow_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Bolt::StaticClass(), 14, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 42, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_GRD_Thorus_200::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_GuardLeader::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_GRD_Thorus_200";
}
