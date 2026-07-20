UCLASS()
class UCharacterDefinition_Human_NC_SLD_Gorn_699: UCharacterDefinition_Human_NewCamp_Mercenary
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Mercenary;
    default m_LightType = 6;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",100);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",1000);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",1000);
    default SetAttributeValue("AttributeSet_Health.Health",320);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",320);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",155);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",155);
    default SetAttributeValue("AttributeSet_Mana.Mana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Strength.Strength",85);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",33);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",34);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",28);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",28);
    default AddToInventory(UItMw_2H_Axe_Gorn::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Potion_Wine::StaticClass(), 5, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Health_03::StaticClass(), 99, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Mana_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_NC_SLD_Gorn_699::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_NewCamp_Mercenary_NC::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Brave_Warrior_Patient::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_Gorn::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Sneak::StaticClass());
    default m_Skills.Add(UGE_Skill_Pickpocket_Skilled::StaticClass());
    default m_Skills.Add(UGE_Skill_Picklock_Skilled::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"NC_SLD_Gorn_699";
}
