UCLASS()
class UCharacterDefinition_Human_OG_GUR_BaalLukor_1211: UCharacterDefinition_Human_SwampCamp_Guru
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guru;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",50);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",500);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",500);
    default SetAttributeValue("AttributeSet_Health.Health",400);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",400);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",100);
    default SetAttributeValue("AttributeSet_Mana.Mana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",100);
    default SetAttributeValue("AttributeSet_Strength.Strength",60);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",100);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",50);
    default AddToInventory(UItMw_1H_Sword_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OG_GUR_BaalLukor_1211::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Guru::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_BaalLukor::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_UniqueName = n"OG_GUR_BaalLukor_1211";
}
