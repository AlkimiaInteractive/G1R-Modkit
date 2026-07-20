UCLASS()
class UCharacterDefinition_Human_OC_GRD_Guard38_290N: UCharacterDefinition_Human_OldCamp_Guard
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guard;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",100);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",100);
    default SetAttributeValue("AttributeSet_Health.Health",160);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",160);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",80);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",80);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",35);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",35);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",24);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",25);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",20);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",18);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",22);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",18);
    default m_AbilitiesEffect = UGE_Human_InfinityDefeatedTime::StaticClass();
    default AddToInventory(UItMw_1H_Sword_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Potion_Water_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_GRD_Guard38_290N::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_Convoy_OldCamp::StaticClass();
    default m_Personality = UGothicCharacterPersonality_Warrior::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_GRD_Guard38_290N";
}
