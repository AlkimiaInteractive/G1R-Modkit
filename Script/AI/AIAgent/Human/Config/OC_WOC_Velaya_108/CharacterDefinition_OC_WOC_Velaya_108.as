UCLASS()
class UCharacterDefinition_Human_OC_WOC_Velaya_108: UCharacterDefinition_Human_OldCamp_WomanSlave
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",5);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",50);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",50);
    default SetAttributeValue("AttributeSet_Health.Health",40);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",40);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",30);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",30);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",20);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default AddToInventory(UItMi_Stuff_Brush::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Wedel::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UArmor_SK_OC_WOC_Velaya_108_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_WOC_Velaya_108::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_WomanSlave::StaticClass();
    default m_AbilitiesEffect = UGE_Human_AI_OC_WOC_Velaya_108::StaticClass();
    default m_UniqueName = n"OC_WOC_Velaya_108";
}
