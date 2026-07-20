UCLASS()
class UCharacterDefinition_Human_OC_NOV_BaalParvez_1330: UCharacterDefinition_Human_SwampCamp_Novice
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Novice;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",20);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",200);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",200);
    default SetAttributeValue("AttributeSet_Health.Health",250);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",90);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",90);
    default SetAttributeValue("AttributeSet_Mana.Mana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default AddToInventory(UItMw_1H_Mace_04::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Rice::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_NOV_BaalParvez_1330::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Novice_OC::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Brave::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_NOV_BaalParvez_1330";
}
