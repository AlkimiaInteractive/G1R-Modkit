UCLASS()
class UGameplayAbility_CharacterAI_Minecrawler : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Minecrawler::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Minecrawler::StaticClass());
}

class UDailyRoutine_Minecrawler : UAIState_DailyRoutine_Creature
{
    float radius = 650.0f;

    UDailyRoutine_Minecrawler(float Inradius)
    {
        radius = Inradius;
    }

    default Schedule(7, 0, UAIState_MineCrawler_Living_Day(), Location::Spawnpoint, radius);
    default Schedule(23, 0, UAIState_MineCrawler_Living_Night(), Location::Spawnpoint, radius);
}

UCLASS()
class UAIState_MineCrawler_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.4f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.3f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clean, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.15f, 20.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_MineCrawler_Living_Night : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.4f, 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clean, 0.1f, 13.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.15f, 15.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_MineCrawler_SleeperTemple_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clean, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_DigGround, 0.15f, 15.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 600.0f;
}

class UDailyRoutine_Minecrawler_SleeperTemple : UAIState_DailyRoutine_Creature
{
    float radius = 600.0f;

    UDailyRoutine_Minecrawler_SleeperTemple(float Inradius)
    {
        radius = Inradius;
    }

    default Schedule(7, 0, UAIState_MineCrawler_SleeperTemple_Day(), Location::Spawnpoint, radius);
}