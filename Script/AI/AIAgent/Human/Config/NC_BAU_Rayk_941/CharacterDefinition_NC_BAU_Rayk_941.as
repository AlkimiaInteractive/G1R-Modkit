UCLASS()
class UCharacterDefinition_Human_NC_BAU_Rayk_941: UCharacterDefinition_Human_NewCamp_Peasant
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Peasant;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",6);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",60);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",60);
    default SetAttributeValue("AttributeSet_Health.Health",112);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",112);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",60);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",20);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",11);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default m_AbilitiesEffect = UGE_Human_ReducedDefeatedTime::StaticClass();
    default AddToInventory(UItFo_Rice::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Loaf::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Mace_Nailmace_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMi_Stuff_Pipe_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Alchemy_Quicksilver_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_BAU_Rayk_941::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Peasant::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Brave_Outcast_All::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_BAU_Rayk_941";
}
