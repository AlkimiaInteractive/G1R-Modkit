UCLASS()
class UCharacterDefinition_Human_OC_STT_Shadow05_314: UCharacterDefinition_Human_OldCamp_Shadow
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Shadow;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",7);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",70);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",70);
    default SetAttributeValue("AttributeSet_Health.Health",200);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",200);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",120);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",20);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",21);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",21);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default AddToInventory(UItMw_1H_Sword_Short_04::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Bow_Small_02::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Arrow::StaticClass(), 21, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_STT_Shadow05_314::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Shadow_OC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_STT_Shadow05_314";
}
