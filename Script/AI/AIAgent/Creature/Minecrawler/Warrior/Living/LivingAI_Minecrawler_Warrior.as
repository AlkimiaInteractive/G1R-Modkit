UCLASS()
class UGameplayAbility_CharacterAI_Minecrawler_Warrior : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Minecrawler_Warrior::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Minecrawler_Warrior::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_Minecrawler_Warrior_King : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Minecrawler_Warrior::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Minecrawler_Warrior_Large::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_Minecrawler_Temple : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Minecrawler_Warrior::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Minecrawler_Temple::StaticClass());
}

class UDailyRoutine_Minecrawler_Warrior : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Minecrawler_Warrior_Living_Day(), Location::Spawnpoint, 800.0f);
    default Schedule(23, 0, UAIState_Minecrawler_Warrior_Living_Night(), Location::Spawnpoint, 800.0f);
}

UCLASS()
class UAIState_Minecrawler_Warrior_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.4f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.3f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clean, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.15f, 20.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_Minecrawler_Warrior_Living_Night : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.4f, 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clean, 0.1f, 13.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.15f, 15.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}