UCLASS()
class UGameplayAbility_CharacterAI_Zombie : UGameplayAbility_CreatureAI
{
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Zombie::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

UCLASS()
class UGameplayAbility_CharacterAI_Zombie_SH : UGameplayAbility_CharacterAI_Zombie
{
    default InitialDailyRoutineClass = UDailyRoutine_Zombie_SH::StaticClass();
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_PlayerBias(), 10000.0f);
}

class UDailyRoutine_Zombie : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Zombie_Living_Day(), Location::Spawnpoint, 2000.0f);
    default Schedule(23, 0, UAIState_Zombie_Living_Night(), Location::Spawnpoint, 2000.0f);
}

class UDailyRoutine_Zombie_SH : UAIState_DailyRoutine_Creature
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }
    default Schedule(7, 0, UAIState_Zombie_Living_Day(), Location::Spawnpoint, 2000.0f);
    default Schedule(23, 0, UAIState_Zombie_Living_Night(), Location::Spawnpoint, 2000.0f);
}

UCLASS()
class UAIState_Zombie_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.4f, 30.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_Zombie_Living_Night : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.4f, 30.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}