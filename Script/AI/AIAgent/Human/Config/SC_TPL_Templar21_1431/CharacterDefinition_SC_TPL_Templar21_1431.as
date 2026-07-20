UCLASS()
class UCharacterDefinition_Human_SC_TPL_Templar21_1431: UCharacterDefinition_Human_SwampCamp_Templar
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Templar;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",16);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",160);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",160);
    default SetAttributeValue("AttributeSet_Health.Health",300);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",160);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",160);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",56);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",28);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",28);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",28);
    default AddToInventory(UItMw_2H_Sword_Light_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Soup::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_TPL_Templar21_1431::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Templar_SC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"SC_TPL_Templar21_1431";
}
