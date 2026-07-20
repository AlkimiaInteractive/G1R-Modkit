UCLASS()
class UCharacterDefinition_Human_NC_SLD_Mercenary04_706: UCharacterDefinition_Human_NewCamp_Mercenary
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mercenary;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",17);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",170);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",170);
    default SetAttributeValue("AttributeSet_Health.Health",356);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",356);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",150);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",150);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",90);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",39);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",39);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",38);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",36);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",38);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",34);
    default AddToInventory(UItMw_1H_Mace_War_03::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 14, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Rice::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Amphore_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_SLD_Mercenary04_706::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Mercenary_NC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_SLD_Mercenary04_706";
}
