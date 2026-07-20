UCLASS()
class UCharacterDefinition_Human_UL_NON_Gilbert_1500: UCharacterDefinition_Human
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_LightType = 4;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",6);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty",60);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty",60);
    default SetAttributeValue("AttributeSet_Health.Health",148);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",148);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",55);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",55);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",15);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Edge",5);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Point",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Fire",10);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Energy",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Ice",0);
    default SetAttributeValue("AttributeSet_Armor.Resistance_Wind",0);
    default AddToInventory(UItMw_1H_Axe_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItKe_Lockpick::StaticClass(), 5, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Coop::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Lute::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::TorchSlot); 
    default AddToInventory(UItMi_Stuff_Barbknife_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Oldcoin_01::StaticClass(), 2, EInventoryTypes::Pouch); 
    default AddToInventory(UItMi_Stuff_Cup_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMi_Stuff_Mug_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Mutton_01::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Loaf::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_UL_NON_Gilbert_1500::StaticClass();
    default m_InitialGuildEffect = UGE_Guild_None::StaticClass();
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Trained::StaticClass());
    default m_UniqueName = n"UL_NON_Gilbert_1500";
}
