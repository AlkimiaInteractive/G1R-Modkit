UCLASS()
class UCharacterDefinition_Orc_OW_OWR_OrcFighterM12_2019: UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Warrior;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",25);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",250);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",250);
    default SetAttributeValue("AttributeSet_Health.Health",310);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",310);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",143);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",143);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",55);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",20);
    default AddToInventory(UItMw_2H_Axe_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcFighterM12_2019::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Warrior::StaticClass();
    default m_UniqueName = n"OW_OWR_OrcFighterM12_2019";
}
