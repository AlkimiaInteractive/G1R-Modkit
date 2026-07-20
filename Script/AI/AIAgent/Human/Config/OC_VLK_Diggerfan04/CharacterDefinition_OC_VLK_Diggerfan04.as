UCLASS()
class UCharacterDefinition_Human_OC_VLK_Diggerfan04: UCharacterDefinition_Human_OldCamp_Digger
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Digger;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",5);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",50);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",50);
    default SetAttributeValue("AttributeSet_Health.Health",100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",45);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",45);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",25);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default AddToInventory(UItFo_Loaf::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_VLK_Diggerfan04::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Digger_OC::StaticClass();
    default m_UniqueName = n"OC_VLK_Diggerfan04";
}
