UCLASS()
class UCharacterDefinition_Orc_ST_UOW_UndeadOrcTempleGuard08_3007: UCharacterDefinition_OrcUndead
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Undead_Warrior;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",25);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",250);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",250);
    default SetAttributeValue("AttributeSet_Health.Health",700);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",700);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",240);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",240);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",90);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",90);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOW_UndeadOrcTempleGuard08_3007::StaticClass();
    default m_UniqueName = n"ST_UOW_UndeadOrcTempleGuard08_3007";
}
