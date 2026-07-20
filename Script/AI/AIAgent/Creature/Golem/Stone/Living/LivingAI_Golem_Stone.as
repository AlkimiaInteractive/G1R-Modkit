UCLASS()
class UGameplayAbility_CharacterAI_Golem_Stone : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Golem_Stone::StaticClass();
    default bRangedAttackRequiresRangedWeapon = false;
    default EngageConflictDistance = 4000;
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Golem_Stone::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);

    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_PlayerBias(), 10000.0f);
}

class UDailyRoutine_Golem_Stone : UAIState_DailyRoutine_Creature
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }
    default Schedule(0, 0, UAIState_Golem_Living(), n"FP_STONEGOLEM_STAND", 600.0f);
}


// class UAIState_Golem_Living : UAIState_RandomInteractions
// {
//     default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, InDurationSeconds = 120.0f));
// }