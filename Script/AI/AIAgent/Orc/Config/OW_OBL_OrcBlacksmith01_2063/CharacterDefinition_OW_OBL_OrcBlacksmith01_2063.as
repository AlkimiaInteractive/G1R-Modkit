UCLASS()
class UCharacterDefinition_Orc_OW_OBL_OrcBlacksmith01_2063: UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Blacksmith;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",25);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",250);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",250);
    default SetAttributeValue("AttributeSet_Health.Health",200);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",200);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",120);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",60);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",5);
    default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OBL_OrcBlacksmith01_2063::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Warrior_Blacksmith::StaticClass();
    default m_UniqueName = n"OW_OBL_OrcBlacksmith01_2063";
}
