UCLASS()
class UCharacterDefinition_Human_OCR_GRD_Stone_219: UCharacterDefinition_Human_OldCamp_Guard
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guard;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",13);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",130);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",130);
    default SetAttributeValue("AttributeSet_Health.Health",320);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",320);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",140);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",140);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",70);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",5);
    default AddToInventory(UItMw_1H_Mace_Sledgehammer_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Cheese::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Apple::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10, EInventoryTypes::Pouch); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OCR_GRD_Stone_219::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Guard_OC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Blacksmith_Master::StaticClass());
    default m_UniqueName = n"OCR_GRD_Stone_219";
}
