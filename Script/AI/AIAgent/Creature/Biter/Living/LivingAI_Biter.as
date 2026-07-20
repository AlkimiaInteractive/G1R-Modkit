UCLASS()
class UGameplayAbility_CharacterAI_Biter : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    
    default InitialDailyRoutineClass = UDailyRoutine_Biter::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Biter::StaticClass());
}

class UDailyRoutine_Biter : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Biter_Living_Day(), Location::Spawnpoint, 2000.0f);
    default Schedule(23, 0, UAIState_Biter_Living_Night(), Location::Spawnpoint, 2000.0f);
}

class UDailyRoutine_Biter_Stand : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Biter_Living_Stand(), Location::Spawnpoint, 400.0f);
    default Schedule(23, 0, UAIState_Biter_Living_Stand(), Location::Spawnpoint, 400.0f);
}

class UDailyRoutine_Biter_Night : UAIState_DailyRoutine_Creature
{
    default Schedule(23, 0, UAIState_Biter_Living_Night(), Location::Spawnpoint, 2000.0f);
}

class UDailyRoutine_Biter_Eat : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Biter_Living_Day(), Location::Spawnpoint, 2000.0f);
    default Schedule(17, 0, UAIState_Biter_Living_Eat(), Location::Spawnpoint, 3000.0f);
    default Schedule(23, 0, UAIState_Biter_Living_Night(), Location::Spawnpoint, 2000.0f);
}

UCLASS()
class UAIState_Biter_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.25f, 10.0f));


    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

class UAIState_Biter_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.6f, InDurationSeconds = 120.0f));
}

class UAIState_Biter_Living_Stand : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, InDurationSeconds = 120.0f));
}

class UAIState_Biter_Living_Eat : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, InDurationSeconds = 120.0f));
}