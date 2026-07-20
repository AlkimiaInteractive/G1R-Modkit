UCLASS()
class UCharacterDefinition_Human_OC_KDF_Milten: UCharacterDefinition_Human_OldCamp_FireMage
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mage_Fire;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",100);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",1000);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",1000);
    default SetAttributeValue("AttributeSet_Health.Health",250);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",55);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",55);
    default SetAttributeValue("AttributeSet_Mana.Mana",150);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",150);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",150);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",7);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",80);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",20);
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Apple::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 99, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_03::StaticClass(), 99, EInventoryTypes::MainContainer); 
    default AddToInventory(UItKe_FireMagesRoom::StaticClass(), 1, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_KDF_Milten::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_FireMage::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Brave_Mage_Patient::StaticClass();
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Alchemy::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Inscription::StaticClass());
    default m_UniqueName = n"OC_KDF_Milten";
}
