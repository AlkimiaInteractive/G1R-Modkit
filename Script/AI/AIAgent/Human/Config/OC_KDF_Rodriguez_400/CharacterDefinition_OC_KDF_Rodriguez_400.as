UCLASS()
class UCharacterDefinition_Human_OC_KDF_Rodriguez_400: UCharacterDefinition_Human_OldCamp_FireMage
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mage_Fire;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",40);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",400);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",400);
    default SetAttributeValue("AttributeSet_Health.Health",340);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",340);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",70);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",70);
    default SetAttributeValue("AttributeSet_Mana.Mana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Strength.Strength",45);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",7);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",80);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",20);
    default AddToInventory(UItAr_Rune_FireBolt::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 99, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 16, EInventoryTypes::Pouch); 
    default AddToInventory(UItKe_FireMagesRoom::StaticClass(), 1, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_KDF_Rodriguez_400::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_FireMage::StaticClass();
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Alchemy::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Inscription::StaticClass());
    default m_UniqueName = n"OC_KDF_Rodriguez_400";
}
