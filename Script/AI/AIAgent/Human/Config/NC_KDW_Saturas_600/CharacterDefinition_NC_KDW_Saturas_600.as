UCLASS()
class UCharacterDefinition_Human_NC_KDW_Saturas_600: UCharacterDefinition_Human_NewCamp_WaterMage
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mage_Water;
    default m_LightType = 5;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",60);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",600);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",600);
    default SetAttributeValue("AttributeSet_Health.Health",750);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",750);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",2000);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",2000);
    default SetAttributeValue("AttributeSet_Mana.Mana",MAX_flt);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",MAX_flt);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",MAX_flt);
    default SetAttributeValue("AttributeSet_Strength.Strength",90);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",100);
    default AddToInventory(UItAr_Rune_ChainLightning::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAr_Rune_IceBlock::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Amulet_Fire::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Ring_Power::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Plants_Flameberry_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_KDW_Saturas_600::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_WaterMageLeader::StaticClass();
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Alchemy::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Inscription::StaticClass());
    default m_UniqueName = n"NC_KDW_Saturas_600";
}
