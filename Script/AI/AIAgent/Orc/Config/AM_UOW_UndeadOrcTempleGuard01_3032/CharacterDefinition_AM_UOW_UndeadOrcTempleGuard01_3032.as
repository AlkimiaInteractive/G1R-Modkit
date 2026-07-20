UCLASS()
class UCharacterDefinition_Orc_AM_UOW_UndeadOrcTempleGuard01_3032: UCharacterDefinition_OrcUndead
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Undead_Warrior;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",25);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",250);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",250);
    default SetAttributeValue("AttributeSet_Health.Health",300);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",110);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",110);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",42);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",15);
    default AddToInventory(UItMw_2H_Axe_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItAt_Amulet_Ulu_Talisman::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_AM_UOW_UndeadOrcTempleGuard01_3032::StaticClass();
    default m_UniqueName = n"AM_UOW_UndeadOrcTempleGuard01_3032";
}
