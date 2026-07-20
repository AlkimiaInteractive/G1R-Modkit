UCLASS()
class UCharacterDefinition_Human_OC_VLK_Digger39_575: UCharacterDefinition_Human_OldCamp_Digger
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Digger;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",5);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",50);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",50);
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
    default AddToInventory(UItMw_1H_Mace_Club_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Apple::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_VLK_Digger39_575::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Digger_OC::StaticClass();
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_VLK_Digger39_575";
}
