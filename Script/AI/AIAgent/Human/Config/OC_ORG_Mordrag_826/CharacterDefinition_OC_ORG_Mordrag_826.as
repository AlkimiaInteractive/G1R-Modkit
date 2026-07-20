UCLASS()
class UCharacterDefinition_Human_OC_ORG_Mordrag_826: UCharacterDefinition_Human_NewCamp_Rogue
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Rogue;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",100);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",100);
    default SetAttributeValue("AttributeSet_Health.Health",300);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",130);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",130);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",36);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",36);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",13);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default m_AbilitiesEffect = UGE_Human_ReducedDefeatedTime::StaticClass();
    default AddToInventory(UItKe_Lockpick::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 11, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Rice::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 2, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Mace_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Long_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 14, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Ring_Mordrag::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_ORG_Mordrag_826::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Rogue_OC::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Outcast_OldCamp::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_ORG_Mordrag_826";
}
