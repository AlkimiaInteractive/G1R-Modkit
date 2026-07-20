UCLASS()
class UCharacterDefinition_Human_OC_GRD_Guard36_288N: UCharacterDefinition_Human_OldCamp_Guard
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guard;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",14);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",140);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",140);
    default SetAttributeValue("AttributeSet_Health.Health",220);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",220);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",120);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",70);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",50);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",33);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",33);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",26);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",22);
    default m_AbilitiesEffect = UGE_Human_InfinityDefeatedTime::StaticClass();
    default AddToInventory(UItMw_1H_Sword_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Cheese::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 7, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_GRD_Guard36_288N::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_Convoy_OldCamp::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Warrior::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_GRD_Guard36_288N";
}
