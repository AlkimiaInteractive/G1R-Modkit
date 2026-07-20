UCLASS()
class UCharacterDefinition_Orc_OW_OSC_OrcScoutM17_2115: UCharacterDefinition_OrcWorld
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Scout;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",21);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",210);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",210);
    default SetAttributeValue("AttributeSet_Health.Health",250);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",101);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",101);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",37);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",15);
    default AddToInventory(UItMw_2H_Sword_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSC_OrcScoutM17_2115::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Scout::StaticClass();
    default m_UniqueName = n"OW_OSC_OrcScoutM17_2115";
}
