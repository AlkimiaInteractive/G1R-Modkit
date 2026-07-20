UCLASS()
class UCharacterDefinition_Human_NC_NOV_BaalKagan_1332: UCharacterDefinition_Human_SwampCamp_Novice
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Novice;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",6);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",60);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",60);
    default SetAttributeValue("AttributeSet_Health.Health",148);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",148);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",55);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",55);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",15);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default AddToInventory(UItMw_1H_Axe_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMi_Joint_01::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_03::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_NOV_BaalKagan_1332::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Novice_NC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_NOV_BaalKagan_1332";
}
