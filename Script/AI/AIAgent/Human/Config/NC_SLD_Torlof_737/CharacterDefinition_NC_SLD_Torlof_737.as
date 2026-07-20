UCLASS()
class UCharacterDefinition_Human_NC_SLD_Torlof_737: UCharacterDefinition_Human_NewCamp_Mercenary
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mercenary;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",23);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",230);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",230);
    default SetAttributeValue("AttributeSet_Health.Health",1000);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1000);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",400);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",400);
    default SetAttributeValue("AttributeSet_Mana.Mana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Strength.Strength",95);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",80);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",65);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",65);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",55);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",40);
    default AddToInventory(UItMw_2H_Axe_Torlof::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 20, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Rice::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Loaf::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 15, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_SLD_Torlof_737::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Mercenary_NC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_SLD_Torlof_737";
}
