UCLASS()
class UCharacterDefinition_Orc_UL_OSL_UrShak_2200: UCharacterDefinition_OrcShaman
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Shaman;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",25);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",250);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",250);
    default SetAttributeValue("AttributeSet_Health.Health",500);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",188);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",188);
    default SetAttributeValue("AttributeSet_Mana.Mana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Strength.Strength",75);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",75);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",60);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",40);
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_2H_Staff_Orc_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_UL_OSL_UrShak_2200::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Orc_Shaman::StaticClass();
    default m_UniqueName = n"UL_OSL_UrShak_2200";
}
