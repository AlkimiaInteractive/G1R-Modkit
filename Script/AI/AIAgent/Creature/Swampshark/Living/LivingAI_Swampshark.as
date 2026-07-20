UCLASS()
class UGameplayAbility_CharacterAI_Swampshark : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Swampshark::StaticClass();

    default bCanReachSwimmingTargetFromLand = true;

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Swampshark::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

UCLASS()
class UGameplayAbility_CharacterAI_Swampshark_Sleeper : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Swampshark_Sleeper::StaticClass();

    default bCanReachSwimmingTargetFromLand = true;

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Swampshark_Sleeper::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

class UDailyRoutine_Swampshark : UAIState_DailyRoutine_Creature
{
    float radius = 2000.0f;

    UDailyRoutine_Swampshark(float Inradius)
    {
        radius = Inradius;
    }

    default Schedule(7, 0, UAIState_Swampshark_Living_Day(), Location::Spawnpoint, 2000.0f);
    default Schedule(23, 0, UAIState_Swampshark_Living_Night(), Location::Spawnpoint, 2000.0f);
}

class UDailyRoutine_Swampshark_Sleeper : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Swampshark_Living_Day(), Location::Spawnpoint, 2000.0f);
    //default Schedule(23, 0, UAIState_Swampshark_Living_Night(), Location::Spawnpoint, 2000.0f);
}

UCLASS()
class UAIState_Swampshark_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_DigGround, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.25f, 20.0f));

    default ChanceToDoActionOnSpot = 0.25f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_Swampshark_Living_Night : UAIState_RandomInteractions_RandomSpots 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 1.0f, 120.0f));

    default ChanceToDoActionOnSpot = 1.0f;
    default SpotReachRadius = 300.0f;
}