UCLASS()
class UCharacterDefinition_Human_NC_SLD_Haenno_741: UCharacterDefinition_Human_NewCamp_Mercenary
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mercenary;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",100);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",100);
    default SetAttributeValue("AttributeSet_Health.Health",356);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",356);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",170);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",170);
    default SetAttributeValue("AttributeSet_Mana.Mana",10);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",10);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",10);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",33);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",34);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",28);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",28);
    default AddToInventory(UItRw_Bow_Long_10::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 17, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Mace_War_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Rice::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 15, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_SLD_Haenno_741::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Mercenary_NC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_SLD_Haenno_741";
}
