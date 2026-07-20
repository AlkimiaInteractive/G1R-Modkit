UCLASS()
class UGameplayAbility_CharacterAI_Golem_Stone_Bridge : UGameplayAbility_CreatureAI
{
    default AssessmentModuleClass = UAIARM_Creature_Golem_Stone_Bridge;

    default InitialDailyRoutineClass = UDailyRoutine_Golem_Stone_Bridge::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Golem_Stone_Bridge::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
    //default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_PlayerBias(), 10000.0f);
}

UCLASS()
class UGameplayAbility_CharacterAI_Golem_Stone_Monastery : UGameplayAbility_CreatureAI
{
    default AssessmentModuleClass = UAIARM_Creature_Golem_Stone_Bridge;

    default InitialDailyRoutineClass = UDailyRoutine_Golem_Stone_Bridge::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Golem_Stone_Bridge::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
    //default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_PlayerBias(), 10000.0f);
}

UCLASS()
class UGameplayAbility_CharacterAI_Golem_Stone_Summoned : UGameplayAbility_CreatureAI
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Golem_Stone_Bridge::StaticClass());
    default bRangedAttackRequiresRangedWeapon = false;
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

class UDailyRoutine_Golem_Stone_Bridge : UAIState_DailyRoutine_Creature
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }
    default Schedule(7, 0, UAIState_Golem_Stone_Bridge_Living(), Location::Spawnpoint);
}

class UAIState_Golem_Stone_Bridge_Living : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, InDurationSeconds = 120.0f));
}