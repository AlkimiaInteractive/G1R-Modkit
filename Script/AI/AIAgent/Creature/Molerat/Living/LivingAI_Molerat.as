
UCLASS()
class UGameplayAbility_CharacterAI_Molerat : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::Always_PredatorOnly;  
    default InitialDailyRoutineClass = UDailyRoutine_Molerat_Base::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Molerat::StaticClass());

    // default WarnignHostileDistance = 100;
}

class UDailyRoutine_Molerat_Drink : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Molerat_Living_Day(), Location::Spawnpoint,4000);
    default Schedule(13, 0, UAIState_Molerat_Living_Drink(), Location::Spawnpoint,4000);
    default Schedule(14, 0, UAIState_Molerat_Living_Day(), Location::Spawnpoint,4000);
    default Schedule(23, 0, UAIState_Molerat_Living_Night(), Location::Spawnpoint);
}

class UDailyRoutine_Molerat_Base : UAIState_DailyRoutine_Creature
{
    float radius = 1200.0f;

    UDailyRoutine_Molerat_Base(float Inradius)
    {
        radius = Inradius;
    }
    
    default Schedule(7, 0, UAIState_Molerat_Living_Day(), Location::Spawnpoint,radius);
    default Schedule(23, 0, UAIState_Molerat_Living_Night(), Location::Spawnpoint, radius);
}

class UDailyRoutine_Molerat_Base_Extended : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Molerat_Living_Day_Extended(), Location::Spawnpoint,4000);
    default Schedule(23, 0, UAIState_Molerat_Living_Night(), Location::Spawnpoint);
}

UCLASS()
class UAIState_Molerat_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.4f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.3f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.15f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.4f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.4f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.2f, 30.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 100.0f;

    // if character wants to go to a spot with one of these tags, it will always start a random interaction here. 
    // If you want this specific interaction to start, only add this tag as PossibleAction to the spot
    default AlwaysStartInteractionOnSpotWithInteractions.AddTag(GameplayTag::Action_Ambient_Drink);
}

UCLASS()
class UAIState_Molerat_Living_Day_Extended : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.4f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.3f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.15f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.4f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.4f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.2f, 30.0f));


    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

class UAIState_Molerat_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.7f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.3f, InDurationSeconds = 60.0f));
}

class UAIState_Molerat_Living_Drink : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, InDurationSeconds = 121.0f));
}