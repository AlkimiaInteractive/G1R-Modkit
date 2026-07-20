UCLASS()
class UCharacterDefinition_Human_OC_GRD_Jackal_201: UCharacterDefinition_Human_OldCamp_Guard
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guard;
    default m_LightType = 5;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",35);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",350);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",350);
    default SetAttributeValue("AttributeSet_Health.Health",300);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",70);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",40);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",42);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",34);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",36);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",32);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",36);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",30);
    default AddToInventory(UItMw_1H_Axe_03::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Crossbow_03::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Bolt::StaticClass(), 18, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_GRD_Jackal_201::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Guard_OC::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OC_GRD_Jackal_201";
}
