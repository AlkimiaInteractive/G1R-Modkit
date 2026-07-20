UCLASS()
class UGameplayAbility_CharacterAI_Snapper : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Snapper::StaticClass();

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Snapper::StaticClass());
}
class UDailyRoutine_Snapper : UAIState_DailyRoutine_Creature
{
    float radius = 2000.0f;

    UDailyRoutine_Snapper(float Inradius)
    {
        radius = Inradius;
    }
    
    default Schedule(7, 0, UAIState_Snapper_Living_Day(), Location::Spawnpoint, radius);
    default Schedule(23, 0, UAIState_Snapper_Living_Night(), Location::Spawnpoint, radius);
}

class UDailyRoutine_Snapper_Eat : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Eat(), Location::Spawnpoint, 500.0f);
    default Schedule(23, 0, UAIState_Eat(), Location::Spawnpoint, 500.0f);
}

class UDailyRoutine_Snapper_Cave : UAIState_DailyRoutine_Creature
{
    float radius = 2000.0f;

    UDailyRoutine_Snapper_Cave(float Inradius)
    {
        radius = Inradius;
    }

    default Schedule(7, 0, UAIState_Snapper_Living_Cave(), Location::Spawnpoint, radius);
    default Schedule(23, 0, UAIState_Snapper_Living_Night(), Location::Spawnpoint, radius);
}

UCLASS()
class UAIState_Snapper_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ScratchEar, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.2f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.2f, 15.0f));

    default ChanceToDoActionOnSpot = 0.25f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_Snapper_Living_Cave : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ScratchEar, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.2f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.2f, 15.0f));
}

class UAIState_Snapper_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.7f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.3f, InDurationSeconds = 30.0f));
}