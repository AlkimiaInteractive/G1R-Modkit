UCLASS()
class UCharacterDefinition_Human_NC_BAU_RiceLord_900: UCharacterDefinition_Human_NewCamp_Peasant
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Peasant;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",100);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",100);
    default SetAttributeValue("AttributeSet_Health.Health",170);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",170);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",110);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",110);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",50);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",5);
    default AddToInventory(UItFo_Rice::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 38, EInventoryTypes::Pouch); 
    default AddToInventory(UItKe_Ricelord_01::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMw_2H_Staff_Scepter::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMi_Alchemy_Moleratlubric_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Ring_Life_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_BAU_RiceLord_900::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_PeasantLeader::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_BAU_RiceLord_900";
}
