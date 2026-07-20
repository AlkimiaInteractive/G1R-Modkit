UCLASS()
class UCharacterDefinition_Human_FM_GRD_Guard18_300N: UCharacterDefinition_Human_OldCamp_Guard
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guard;
    default m_LightType = 3;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",9);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",90);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",90);
    default SetAttributeValue("AttributeSet_Health.Health",300);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",130);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",130);
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
    default AddToInventory(UItMw_1H_Sword_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Apple::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAm_Bolt::StaticClass(), 5, EInventoryTypes::MainContainer); 
    default AddToInventory(UItRw_Crossbow_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10, EInventoryTypes::Pouch); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_FM_GRD_Guard18_300N::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Guard::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"FM_GRD_Guard18_300N";
}
