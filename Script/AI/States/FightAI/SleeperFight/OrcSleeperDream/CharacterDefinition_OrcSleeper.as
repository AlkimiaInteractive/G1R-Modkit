
UCLASS()
class UCharacterDefinition_Orc_Sleeper : UCharacterDefinition_Orc
{
	default m_CharacterType = GameplayTag::AIAgent_Orc_Warrior;

    default SetAttributeValue("AttributeSet_LevelProgression.Level",999);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
    default SetAttributeValue("AttributeSet_Health.Health",1);//2000
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Strength.Strength",100);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40); 

    // default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMw_2H_Axe_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    //default AddToInventory(UItMw_2H_Sword_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 

     default m_PerceptionSettings = UG1RPerceptionAgentSettings_DreamOrc::StaticClass();
     default m_AIAbility = UGameplayAbility_CharacterAI_OrcSleeper::StaticClass();
     default m_UniqueName = n"Orc_Sleeper";
     default m_AbilitiesEffect = UGE_Orc_Sleeper_AI::StaticClass();

    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcWarriorM01_2001_Sleeper::StaticClass();
}

UCLASS()
class UCharacterDefinition_Orc_Sleeper1 : UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Warrior;

    default SetAttributeValue("AttributeSet_LevelProgression.Level",999);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
    default SetAttributeValue("AttributeSet_Health.Health",1);//2000
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Strength.Strength",90);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);

    // default AddToInventory(UItMw_2H_Axe_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 

     default m_PerceptionSettings = UG1RPerceptionAgentSettings_DreamOrc::StaticClass();
     default m_AIAbility = UGameplayAbility_CharacterAI_OrcSleeper::StaticClass();
     default m_UniqueName = n"Orc_Sleeper";
     default m_AbilitiesEffect = UGE_Orc_Sleeper_AI::StaticClass();
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OWR_OrcFighterM01_2003_Sleeper::StaticClass();
}

UCLASS()
class UCharacterDefinition_Orc_Sleeper2 : UCharacterDefinition_Orc
{
    default m_CharacterType = GameplayTag::AIAgent_Orc_Scout;
    default SetAttributeValue("AttributeSet_LevelProgression.Level",999);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience",0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints",0);
	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);
    default SetAttributeValue("AttributeSet_Health.Health",1);//2000
    default SetAttributeValue("AttributeSet_Health.MaxHealth",1);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor",200);
    default SetAttributeValue("AttributeSet_Mana.Mana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Mana.MaxMana",20);
    default SetAttributeValue("AttributeSet_Strength.Strength",90);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity",40);

    default AddToInventory(UItMw_2H_Sword_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    //default AddToInventory(UItMw_2H_Mace_Orc_01_vOrc::StaticClass(), 1, EInventoryTypes::MeleeSlot); 

     default m_PerceptionSettings = UG1RPerceptionAgentSettings_DreamOrc::StaticClass();
     default m_AIAbility = UGameplayAbility_CharacterAI_OrcSleeper::StaticClass();
     default m_UniqueName = n"Orc_Sleeper";
     default m_AbilitiesEffect = UGE_Orc_Sleeper_AI::StaticClass();
    default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Orc_OW_OSC_OrcScoutM13_2111_Sleeper::StaticClass();
}

UCLASS()
class UGE_Orc_Sleeper_AI : UGE_Orc_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    
    FConditionalGameplayEffect conditionalGE;
	default conditionalGE.EffectClass = UGE_Dissolve::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalGE); 

    default AddAbility(UGA_ForceAttackPlayer::StaticClass());
    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Dissolve::StaticClass());
}

UCLASS()
class USpawnAIAgentDefinition_SleeperDreamOrc : UAIAgentConfig_Orc
{
	default m_CharacterDefinition = UCharacterDefinition_Orc_Sleeper::StaticClass();
}
UCLASS()
class USpawnAIAgentDefinition_SleeperDreamOrc1 : UAIAgentConfig_Orc
{
	default m_CharacterDefinition = UCharacterDefinition_Orc_Sleeper1::StaticClass();
}
UCLASS()
class USpawnAIAgentDefinition_SleeperDreamOrc2 : UAIAgentConfig_Orc
{
	default m_CharacterDefinition = UCharacterDefinition_Orc_Sleeper2::StaticClass();
}

class USpawnAIAgentDefinition_OrcDream_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = USpawnAIAgentDefinition_SleeperDreamOrc;
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_OrcDream_Sleeper1 : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = USpawnAIAgentDefinition_SleeperDreamOrc1;
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

class USpawnAIAgentDefinition_OrcDream_Sleeper2 : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = USpawnAIAgentDefinition_SleeperDreamOrc2;
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Orc/AIAgentCharacter_OrcM.AIAgentCharacter_OrcM_C'";
}

UCLASS()
class UGameplayAbility_CharacterAI_OrcSleeper : UGameplayAbility_CharacterAI_Orc
{
    default EngageConflictDistance = 50000;
}
class UG1RPerceptionAgentSettings_DreamOrc : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
{
    //default Normal.Sight.InnerCoffin.Length = 4000.0f; //3000.0f;
    //default Normal.Sight.InnerCoffin.GoodVisionLength = 3400.0f; //2400.0f;
    default Normal.Sight.InnerCoffin.CloseHalfWidth = 6000; //150
    default Normal.Sight.InnerCoffin.MiddleHalfWidth = 10000; //250
    default Normal.Sight.InnerCoffin.FarHalfWidth = 6000; //150

    // default Normal.Sight.OuterCoffin.Length = 4200.0f; //3200.0f;
    // default Normal.Sight.OuterCoffin.GoodVisionLength = 3700.0f; //2700.0f;
    // default Normal.Sight.OuterCoffin.CloseHalfWidth = 1200; //300
    // default Normal.Sight.OuterCoffin.MiddleHalfWidth = 1800; //450
    // default Normal.Sight.OuterCoffin.FarHalfWidth = 1200; //300
}