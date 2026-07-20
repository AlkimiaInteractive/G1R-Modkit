UCLASS()
class UCharacterDefinition_Orc_OW_OWR_OrcClanWarriorM03_2049: UCharacterDefinition_OrcWorld
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Warrior;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",35);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",350);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",350);
    default SetAttributeValue("AttributeSet_Health.Health",350);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",350);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",203);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",203);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",65);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",25);
    default AddToInventory(UItMw_2H_Axe_Orc_03_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcClanWarriorM03_2049::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Warrior::StaticClass();
    default m_UniqueName = n"OW_OWR_OrcClanWarriorM03_2049";
}
