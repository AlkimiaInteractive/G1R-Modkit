UCLASS()
class UCharacterDefinition_Human_UL_ORG_Jacko_862: UCharacterDefinition_Human_NewCamp_Rogue
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Rogue;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",9);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",90);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",90);
    default SetAttributeValue("AttributeSet_Health.Health",236);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",236);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",100);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",13);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default m_AbilitiesEffect = UGE_Human_ReducedDefeatedTime::StaticClass();
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 28, EInventoryTypes::Pouch); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Mace_03::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Small_03::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 15, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_UL_ORG_Jacko_862::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Rogue_World::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"UL_ORG_Jacko_862";
}
