UCLASS()
class UCharacterDefinition_Orc_OW_OSC_OrcHunterM01_2059: UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Scout;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",22);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",220);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",220);
    default SetAttributeValue("AttributeSet_Health.Health",250);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",120);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",40);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",20);
    default AddToInventory(UItMw_2H_Sword_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSC_OrcHunterM01_2059::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Scout::StaticClass();
    default m_UniqueName = n"OW_OSC_OrcHunterM01_2059";
}
