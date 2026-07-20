UCLASS()
class UCharacterDefinition_Orc_ST_UOW_UndeadOrcHighTempleGuard11_3026: UCharacterDefinition_OrcUndead
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Undead_Warrior;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",40);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",400);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",400);
    default SetAttributeValue("AttributeSet_Health.Health",750);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",750);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",255);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",255);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_ST_UOW_UndeadOrcHighTempleGuard11_3026::StaticClass();
    default m_UniqueName = n"ST_UOW_UndeadOrcHighTempleGuard11_3026";
}
