UCLASS()
class UCharacterDefinition_Human_NC_BAU_Peasant04_908: UCharacterDefinition_Human_NewCamp_Peasant
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Peasant;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",6);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",60);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",60);
    default SetAttributeValue("AttributeSet_Health.Health",88);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",88);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",40);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",40);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",20);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default AddToInventory(UItFo_Rice::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Plate_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Booze::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Sword_Scythe_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_BAU_Peasant04_908::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Peasant::StaticClass();
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_BAU_Peasant04_908";
}
