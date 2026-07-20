UCLASS()
class UCharacterDefinition_Human_SC_TPL_Templar08_1412: UCharacterDefinition_Human_SwampCamp_Templar
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Templar;
    default m_LightType = 5;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",15);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",150);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",150);
    default SetAttributeValue("AttributeSet_Health.Health",300);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",160);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",160);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",55);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",23);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",23);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",17);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",26);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",22);
    default AddToInventory(UItMw_2H_Sword_Light_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Soup::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_TPL_Templar08_1412::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Templar_SC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"SC_TPL_Templar08_1412";
}
