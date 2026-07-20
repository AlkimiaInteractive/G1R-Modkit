UCLASS()
class UCharacterDefinition_Orc_OW_OWR_OrcWarriorM05_2014: UCharacterDefinition_OrcWorld
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Warrior;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",30);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",300);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",300);
    default SetAttributeValue("AttributeSet_Health.Health",330);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",330);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",165);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",165);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",60);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",25);
    default AddToInventory(UItMw_2H_Axe_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcWarriorM05_2014::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Warrior::StaticClass();
    default m_UniqueName = n"OW_OWR_OrcWarriorM05_2014";
}
