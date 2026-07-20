// Normal Xardas Skeleton
class USpawnAIAgentDefinition_Skeleton_Xardas_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Character_Skeleton_Xardas_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Creature/Skeleton/Xardas/AIAgentCharacter_XardasSkeleton.AIAgentCharacter_XardasSkeleton_C'";
}

UCLASS()
class UAIAgentConfig_Character_Skeleton_Xardas_Sleeper : UAIAgentConfig_Skeleton
{
	default m_CharacterDefinition = UCharacterDefinition_Character_Skeleton_Xardas_Sleeper::StaticClass();
}

UCLASS()
class UCharacterDefinition_Character_Skeleton_Xardas_Sleeper : UCharacterDefinition_Creature_Skeleton
{
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
    default SetAttributeValue("AttributeSet_Health.Health", 200);//250); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 200);//250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

    default m_InitialGuildEffect = UGE_SleeperTemple::StaticClass();
    default m_AbilitiesEffect = UGE_Skeleton_Xardas_Sleeper_AI::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Skeleton_Xardas_Sleeper::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_Skeleton_Xardas_Sleeper::StaticClass();

    default bPersistent = false;
}

UCLASS()
class UGameplayAbility_CharacterAI_Skeleton_Xardas_Sleeper : UGameplayAbility_CharacterAI_Skeleton
{
    default EngageConflictDistance = 50000;
}

class UG1RPerceptionAgentSettings_Skeleton_Xardas_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
{
    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 0.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;
    default Normal.Smell.AwarenessWearoffFactor = 0.0f;
    default Normal.Hearing.AwarenessWearoffFactor = 0.0f;
}

UCLASS()
class UGE_Skeleton_Xardas_Sleeper_AI : UGE_Skeleton_AI
{  
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Charm);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Fear);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);

    //default AddAbility(UGA_SkeletonMage_Summon_Skeleton::StaticClass());
    default RemoveAbility(UGA_Summon_Skeleton::StaticClass());
    default AddAbility(UGA_Summon_XardasSleeper_Skeleton::StaticClass());

    default AddAbility(UGA_ForcePlayerSightPerceptionOnStart::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);

    FConditionalGameplayEffect conditionalGE;
	default conditionalGE.EffectClass = UGE_Dissolve::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalGE); 

    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Dissolve::StaticClass());
}

// Scout Xardas Skeleton

class USpawnAIAgentDefinition_Scout_Skeleton_Xardas_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Character_Scout_Skeleton_Xardas_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Creature/Skeleton/Xardas/AIAgentCharacter_XardasSkeleton.AIAgentCharacter_XardasSkeleton_C'";
}

UCLASS()
class UAIAgentConfig_Character_Scout_Skeleton_Xardas_Sleeper : UAIAgentConfig_Skeleton_Scout
{
	default m_CharacterDefinition = UCharacterDefinition_Character_Scout_Skeleton_Xardas_Sleeper::StaticClass();
}



UCLASS()
class UCharacterDefinition_Character_Scout_Skeleton_Xardas_Sleeper : UCharacterDefinition_Creature_Skeleton_Scout
{
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
    default SetAttributeValue("AttributeSet_Health.Health", 200);//250); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 200);//250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

    default m_InitialGuildEffect = UGE_SleeperTemple::StaticClass();
    default m_AbilitiesEffect = UGE_Scout_Skeleton_Xardas_Sleeper_AI::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Scout_Skeleton_Xardas_Sleeper::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_Scout_Skeleton_Xardas_Sleeper::StaticClass();

    default bPersistent = false;
}

UCLASS()
class UGameplayAbility_CharacterAI_Scout_Skeleton_Xardas_Sleeper : UGameplayAbility_CharacterAI_Skeleton_Scout
{
    default EngageConflictDistance = 50000;
}

class UG1RPerceptionAgentSettings_Scout_Skeleton_Xardas_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
{
    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 0.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;
    default Normal.Smell.AwarenessWearoffFactor = 0.0f;
    default Normal.Hearing.AwarenessWearoffFactor = 0.0f;
}
//@DE - Scout uses warrior GEs.
UCLASS()
class UGE_Scout_Skeleton_Xardas_Sleeper_AI : UGE_Skeleton_Warrior_AI
{  
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Charm);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Fear);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);

    //default AddAbility(UGA_SkeletonMage_Summon_Skeleton::StaticClass());
    default RemoveAbility(UGA_Summon_Skeleton::StaticClass());
    default AddAbility(UGA_Summon_XardasSleeper_Skeleton::StaticClass());

    default AddAbility(UGA_ForcePlayerSightPerceptionOnStart::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);

}

//Warrior skeleton.


class USpawnAIAgentDefinition_Warrior_Skeleton_Xardas_Sleeper : USpawnAIAgentDefinition
{
    default AIAgentConfigClass = UAIAgentConfig_Character_Warrior_Skeleton_Xardas_Sleeper::StaticClass();
    default AIAgentCharacterClass = n"Blueprint'/Game/AI/AIAgent/Creature/Skeleton/Xardas/AIAgentCharacter_XardasSkeleton.AIAgentCharacter_XardasSkeleton_C'";
}

UCLASS()
class UAIAgentConfig_Character_Warrior_Skeleton_Xardas_Sleeper : UAIAgentConfig_Skeleton_Scout
{
	default m_CharacterDefinition = UCharacterDefinition_Character_Warrior_Skeleton_Xardas_Sleeper::StaticClass();
}

UCLASS()
class UCharacterDefinition_Character_Warrior_Skeleton_Xardas_Sleeper : UCharacterDefinition_Creature_Skeleton_Warrior
{
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
    default SetAttributeValue("AttributeSet_Health.Health", 200);//250); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 200);//250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 0);

    default m_InitialGuildEffect = UGE_SleeperTemple::StaticClass();
    default m_AbilitiesEffect = UGE_Warrior_Skeleton_Xardas_Sleeper_AI::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Warrior_Skeleton_Xardas_Sleeper::StaticClass();
    default m_AIAbility = UGameplayAbility_CharacterAI_Warrior_Skeleton_Xardas_Sleeper::StaticClass();

    default bPersistent = false;
}

UCLASS()
class UGameplayAbility_CharacterAI_Warrior_Skeleton_Xardas_Sleeper : UGameplayAbility_CharacterAI_Skeleton_Warrior
{
    default EngageConflictDistance = 50000;
}

class UG1RPerceptionAgentSettings_Warrior_Skeleton_Xardas_Sleeper : UG1RPerceptionAgentSettings_Omniperception_NoWearoff
{
    default Normal.Sight.AwarenessWearoffFactorNoLineOfSight = 0.0f;
    default Normal.Sight.AwarenessWearoffFactorOutOfShape = 0.0f;
    default Normal.Smell.AwarenessWearoffFactor = 0.0f;
    default Normal.Hearing.AwarenessWearoffFactor = 0.0f;
}
//@DE - Scout uses warrior GEs.
UCLASS()
class UGE_Warrior_Skeleton_Xardas_Sleeper_AI : UGE_Skeleton_Warrior_AI
{  
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Charm);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Fear);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);

    //default AddAbility(UGA_SkeletonMage_Summon_Skeleton::StaticClass());
    default RemoveAbility(UGA_Summon_Skeleton::StaticClass());
    default AddAbility(UGA_Summon_XardasSleeper_Skeleton::StaticClass());

    default AddAbility(UGA_ForcePlayerSightPerceptionOnStart::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);

}

