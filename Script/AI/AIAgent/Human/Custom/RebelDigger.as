UCLASS()
class URebelDigger: UCharacterDefinition_Human_OldCamp_Digger
{
    default m_CharacterType = GameplayTag::AIAgent_Human_Digger;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",5);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
    default SetAttributeValue("AttributeSet_Health.Health",100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth",100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor",60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",60);
    default SetAttributeValue("AttributeSet_Mana.Mana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",0);
    default SetAttributeValue("AttributeSet_Strength.Strength",999);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",15);
    default AddToInventory(UItMw_2H_Axe_Pickaxe::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Apple::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Loaf::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItFo_Potion_Beer::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OM_VLK_Digger29_593::StaticClass();
    default m_UniqueName = n"RebelDigger";
}

UCLASS()
class UAIAgentConfig_RebelDigger : UAIAgentConfig_Human
{
	default m_CharacterDefinition = URebelDigger::StaticClass();
}

class USpawnAIAgentDefinition_RebelDigger : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_RebelDigger::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Human/AIAgentCharacter_Human_Base.AIAgentCharacter_Human_Base_C'";
}