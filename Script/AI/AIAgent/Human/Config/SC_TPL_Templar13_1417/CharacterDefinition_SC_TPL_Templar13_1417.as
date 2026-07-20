UCLASS()
class UCharacterDefinition_Human_SC_TPL_Templar13_1417: UCharacterDefinition_Human_SwampCamp_Templar
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Templar;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",19);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",190);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",190);
    default SetAttributeValue("AttributeSet_Health.Health",344);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",344);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",85);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",65);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",22);
    default AddToInventory(UItMw_2H_Sword_Light_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Crossbow_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Bolt::StaticClass(), 12, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Soup::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_TPL_Templar13_1417::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Templar_SC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"SC_TPL_Templar13_1417";
}
