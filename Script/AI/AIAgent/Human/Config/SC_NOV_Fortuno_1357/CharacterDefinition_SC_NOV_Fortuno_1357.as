UCLASS()
class UCharacterDefinition_Human_SC_NOV_Fortuno_1357: UCharacterDefinition_Human_SwampCamp_Novice
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Novice;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",7);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",70);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",70);
    default SetAttributeValue("AttributeSet_Health.Health",148);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",148);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",65);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",65);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",15);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",13);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",13);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",14);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",14);
    default AddToInventory(UItMw_1H_Mace_Fortuno::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMi_Joint_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_NOV_Fortuno_1357::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Novice_SC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"SC_NOV_Fortuno_1357";
}
