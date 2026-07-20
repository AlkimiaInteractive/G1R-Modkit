UCLASS()
class UCharacterDefinition_Human_OC_STT_Fisk_311: UCharacterDefinition_Human_OldCamp_Shadow
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Shadow;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",7);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",70);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",70);
    default SetAttributeValue("AttributeSet_Health.Health",224);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",224);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",130);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",130);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",21);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",21);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 3, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18, EInventoryTypes::Pouch); 
    default AddToInventory(UItKe_FiskStorage::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMw_1H_Sword_Short_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Small_02::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 13, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_STT_Fisk_311::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Shadow_OC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_STT_Fisk_311";
}
