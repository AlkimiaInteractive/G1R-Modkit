UCLASS()
class UCharacterDefinition_Human_SC_GUR_CorAngar_1202: UCharacterDefinition_Human_SwampCamp_Guru
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guru;
    default m_LightType = 6;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",30);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",300);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",300);
    default SetAttributeValue("AttributeSet_Health.Health",600);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",600);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",MAX_flt);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",MAX_flt);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",MAX_flt);
    default SetAttributeValue("AttributeSet_Strength.Strength",90);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",65);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",30);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",28);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",28);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",28);
    default AddToInventory(UItAr_Rune_Sleep::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_02::StaticClass(), 4, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_2H_Sword_Wind::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMi_Joint_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Joint_03::StaticClass(), 3, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_GUR_CorAngar_1202::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_TemplarLeader::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Warrior::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Mage_Circle_6::StaticClass());
    default m_UniqueName = n"SC_GUR_CorAngar_1202";
}
