UCLASS()
class UCharacterDefinition_Human_FM_SLD_Mercenary10_762: UCharacterDefinition_Human_NewCamp_Mercenary
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mercenary;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",16);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",160);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",160);
    default SetAttributeValue("AttributeSet_Health.Health",356);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",356);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",140);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",140);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",90);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",33);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",34);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",28);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",28);
    default AddToInventory(UItMw_1H_Mace_War_03::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 18, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Rice::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 3, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_FM_SLD_Mercenary10_762::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Mercenary_FM::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"FM_SLD_Mercenary10_762";
}
