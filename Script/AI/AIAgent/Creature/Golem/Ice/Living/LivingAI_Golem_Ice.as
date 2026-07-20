UCLASS()
class UGameplayAbility_CharacterAI_Golem_Ice : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Golem_Ice::StaticClass();
    default bRangedAttackRequiresRangedWeapon = false;
    default EngageConflictDistance = 4000;
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Golem_Ice::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

class UDailyRoutine_Golem_Ice : UAIState_DailyRoutine_Creature
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }
    default Schedule(0, 0, UAIState_Golem_Living(), n"FP_ICEGOLEM_STAND", 600.0f);
}

UCLASS()
class UAIState_Golem_Living : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InWeight = 1.0f,InDurationSeconds = 1000.0f));
}



class UDailyRoutine_Golem_MiniIce : UAIState_DailyRoutine_Creature
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }
    default Schedule(0, 0, UAIState_Golem_Living(), Location::Spawnpoint, 100.0f);
}