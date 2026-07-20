UCLASS()
class UCharacterDefinition_Human_SC_NOV_Lester: UCharacterDefinition_Human_SwampCamp_Novice
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Novice;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",100);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",1000);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",1000);
    default SetAttributeValue("AttributeSet_Health.Health",350);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",350);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",112);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",112);
    default SetAttributeValue("AttributeSet_Mana.Mana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",50);
    default SetAttributeValue("AttributeSet_Strength.Strength",52);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",12);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",12);
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 99, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Mace_Lester::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Soup::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_SC_NOV_Lester::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_SwampCamp_Novice_SC::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Brave_Patient::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_Lester::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"SC_NOV_Lester";
}
