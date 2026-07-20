UCLASS()
class UCharacterDefinition_Human_NC_BAU_Peasant13_923: UCharacterDefinition_Human_NewCamp_Peasant
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Peasant;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",5);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",50);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",50);
    default SetAttributeValue("AttributeSet_Health.Health",76);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",76);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",35);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",35);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",15);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",11);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default AddToInventory(UItFo_Rice::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Sword_Scythe_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_BAU_Peasant13_923::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Peasant::StaticClass();
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_BAU_Peasant13_923";
}
