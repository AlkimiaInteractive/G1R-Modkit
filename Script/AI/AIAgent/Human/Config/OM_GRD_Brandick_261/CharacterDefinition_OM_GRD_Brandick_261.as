UCLASS()
class UCharacterDefinition_Human_OM_GRD_Brandick_261: UCharacterDefinition_Human_OldCamp_Guard
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Guard;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",15);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",150);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",150);
    default SetAttributeValue("AttributeSet_Health.Health",320);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",320);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",160);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",160);
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
    default AddToInventory(UItMw_1H_Sword_02::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItRw_Crossbow_01::StaticClass(), 1, EInventoryTypes::RangedSlot); 
    default AddToInventory(UItAm_Bolt::StaticClass(), 22, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Cheese::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Apple::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Orenugget::StaticClass(), 10, EInventoryTypes::Pouch); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OM_GRD_Brandick_261::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Guard_OM::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_Fists_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OM_GRD_Brandick_261";
}
