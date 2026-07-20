UCLASS()
class UCharacterDefinition_Human_SC_NOV_Nyras_1303: UCharacterDefinition_Human_SwampCamp_Novice
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Novice;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",8);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",80);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",80);
    default SetAttributeValue("AttributeSet_Health.Health",132);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",132);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",66);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",66);
    default SetAttributeValue("AttributeSet_Mana.Mana",12);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",12);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",12);
    default SetAttributeValue("AttributeSet_Strength.Strength",26);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",13);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default m_AbilitiesEffect = UGE_Human_ReducedDefeatedTime::StaticClass();
    default AddToInventory(UItMw_1H_Mace_04::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 15, EInventoryTypes::Pouch); 
    default AddToInventory(UItFo_Rice::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_01::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_NOV_Nyras_1303::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Novice_SC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"SC_NOV_Nyras_1303";
}
