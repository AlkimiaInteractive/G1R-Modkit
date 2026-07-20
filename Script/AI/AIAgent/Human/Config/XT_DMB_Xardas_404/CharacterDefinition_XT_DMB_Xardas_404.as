UCLASS()
class UCharacterDefinition_Human_XT_DMB_Xardas_404: UCharacterDefinition_Human
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Xardas;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",100);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",1000);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",1000);
    default SetAttributeValue("AttributeSet_Health.Health",2000);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",2000);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",2000);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",2000);
    default SetAttributeValue("AttributeSet_Mana.Mana",2000);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",2000);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",2000);
    default SetAttributeValue("AttributeSet_Strength.Strength",150);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",150);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",150);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",150);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",150);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",150);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",150);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",150);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",150);
    default m_AbilitiesEffect = UGE_XT_DMB_Xardas_404_Abilties::StaticClass();
    default AddToInventory(UItAr_Scroll_SummonDemon::StaticClass(), 20, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 99, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Amulet_Enlight::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Ring_Magic_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Ring_Enlight::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_XT_DMB_Xardas_404::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_DemonSummoner::StaticClass();
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Alchemy::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Inscription::StaticClass());
    default m_Skills.Add(UGE_Skill_Orcish_Skilled::StaticClass());
    default m_UniqueName = n"XT_DMB_Xardas_404";
}
