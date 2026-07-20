UCLASS()
class UCharacterDefinition_Human_ST_TPL_Templar05_1451: UCharacterDefinition_Human_SwampCamp_Templar
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Templar;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",100);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",1000);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",1000);
    default SetAttributeValue("AttributeSet_Health.Health",500);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",230);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",230);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",105);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",65);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default AddToInventory(UItMw_2H_Sword_Light_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Soup::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_ST_TPL_Templar05_1451::StaticClass();
    default m_InitialGuildEffect = UGE_SleeperTemple::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"ST_TPL_Templar05_1451";
}
