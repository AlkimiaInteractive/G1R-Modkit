UCLASS()
class UCharacterDefinition_Human_OC_KDF_Corristo_402: UCharacterDefinition_Human_OldCamp_FireMage
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mage_Fire;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",60);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",600);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",600);
    default SetAttributeValue("AttributeSet_Health.Health",400);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",400);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",60);
    default SetAttributeValue("AttributeSet_Mana.Mana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",13);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",13);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",120);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",40);
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 99, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItKe_FireMagesRoom::StaticClass(), 1, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 18, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_KDF_Corristo_402::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_FireMageLeader::StaticClass();
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Alchemy::StaticClass());
    default m_Skills.Add(UGE_Skill_Crafting_Inscription::StaticClass());
    default m_UniqueName = n"OC_KDF_Corristo_402";
}
