UCLASS()
class UCharacterDefinition_Human_OG_TPL_Templar02_1444: UCharacterDefinition_Human_SwampCamp_Templar
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Templar;
    default m_LightType = 5;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",9);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",90);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",90);
    default SetAttributeValue("AttributeSet_Health.Health",230);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",400);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",160);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",160);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",55);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",55);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",23);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",23);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",17);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",26);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",22);
    default AddToInventory(UItMw_1H_Sword_04::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Soup::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OG_TPL_Templar02_1444::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Templar::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OG_TPL_Templar02_1444";
}
