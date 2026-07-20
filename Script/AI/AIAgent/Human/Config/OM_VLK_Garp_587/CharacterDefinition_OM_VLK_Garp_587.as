UCLASS()
class UCharacterDefinition_Human_OM_VLK_Garp_587: UCharacterDefinition_Human_OldCamp_Digger
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Digger;
    default m_LightType = 2;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",7);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",70);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",70);
    default SetAttributeValue("AttributeSet_Health.Health",100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",65);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",65);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",25);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default AddToInventory(UItMw_1H_Mace_Nailmace_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Loaf::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OM_VLK_Garp_587::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_Human_OldCamp_Digger_OM::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());
    default m_UniqueName = n"OM_VLK_Garp_587";
}
