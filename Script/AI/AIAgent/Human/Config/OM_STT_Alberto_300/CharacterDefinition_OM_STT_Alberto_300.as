UCLASS()
class UCharacterDefinition_Human_OM_STT_Alberto_300: UCharacterDefinition_Human_OldCamp_Shadow
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Shadow;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",12);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",120);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",120);
    default SetAttributeValue("AttributeSet_Health.Health",296);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",296);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",140);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",140);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",70);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",21);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",21);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default AddToInventory(UItFo_Apple::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 20, EInventoryTypes::Pouch); 
    default AddToInventory(UItMw_1H_Sword_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Small_04::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 25, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OM_STT_Alberto_300::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Shadow_OM::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Sneak::StaticClass());
    default m_Skills.Add(UGE_Skill_Pickpocket_Skilled::StaticClass());
    default m_Skills.Add(UGE_Skill_Picklock_Skilled::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OM_STT_Alberto_300";
}
