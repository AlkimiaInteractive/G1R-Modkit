UCLASS()
class UCharacterDefinition_Human_SC_NOV_Novice26_1337: UCharacterDefinition_Human_SwampCamp_Novice
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Novice;
    default m_LightType = 1;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",8);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",80);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",80);
    default SetAttributeValue("AttributeSet_Health.Health",208);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",208);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",40);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",40);
    default SetAttributeValue("AttributeSet_Mana.Mana",8);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",8);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",8);
    default SetAttributeValue("AttributeSet_Strength.Strength",30);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",4);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",4);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",8);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",8);
    default AddToInventory(UItMw_1H_Axe_Hatchet_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_NOV_Novice26_1337::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Novice_SC::StaticClass();
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"SC_NOV_Novice26_1337";
}
