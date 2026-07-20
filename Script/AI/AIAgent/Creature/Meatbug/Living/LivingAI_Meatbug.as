UCLASS()
class UGameplayAbility_CharacterAI_Meatbug : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Meatbug::StaticClass();
}

class UDailyRoutine_Meatbug : UAIState_DailyRoutine_Creature
{
    default Schedule(6, 0, UAIState_Meatbug_Living_Day(), Location::Spawnpoint, 1000.0f);
    default Schedule(23, 55, UAIState_Meatbug_Living_Night(), Location::Spawnpoint, 1000.0f);
}

UCLASS()
class UAIState_Meatbug_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.6f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.4f, 20.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_Meatbug_Living_Night : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.6f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.4f, 20.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}