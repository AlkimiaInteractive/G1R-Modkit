UCLASS()
class UCharacterDefinition_Orc_OW_OWR_OrcTempleWarriorM01_2041: UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Warrior;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",40);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",400);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",400);
    default SetAttributeValue("AttributeSet_Health.Health",400);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",400);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",218);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",218);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",75);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",25);
    default AddToInventory(UItMw_2H_Axe_Orc_04_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcTempleWarriorM01_2041::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Warrior::StaticClass();
    default m_UniqueName = n"OW_OWR_OrcTempleWarriorM01_2041";
}
