UCLASS()
class UGameplayAbility_CharacterAI_Minecrawler_Queen : UGameplayAbility_CreatureAI
{
    default States.Remove(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter);
    default States.Remove(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound);
    default States.Remove(GameplayTag::AIState_Conflict_IdentifySmell);
    default States.Remove(GameplayTag::AIState_InvestigateSound_Item);

    default InitialDailyRoutineClass = UDailyRoutine_Minecrawler_Queen::StaticClass();
    default bRangedAttackRequiresRangedWeapon = false;
    default EngageConflictDistance = 7000;

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Minecrawler_Queen::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

class UDailyRoutine_Minecrawler_Queen : UAIState_DailyRoutine_Creature
{
    float radius = 5000.0f;

    UDailyRoutine_Minecrawler_Queen(float Inradius)
    {
        radius = Inradius;
    }

    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }

    //default Schedule(7, 0, UAIState_Minecrawler_Queen_Living_Day(), Location::Spawnpoint, radius);
}

UCLASS()
class UAIState_Minecrawler_Queen_Living_Day : UAIState_RandomInteractions 
{
    // default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 10.0f));

    // default SpotReachRadius = 300.0f;
}

UCLASS()
class UGameplayAbility_CharacterAI_Minecrawler_QueenPh2 : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Minecrawler_PH2_Queen::StaticClass();
    default bRangedAttackRequiresRangedWeapon = false;
    default EngageConflictDistance = 5000;
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Minecrawler_QueenPh2::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

UCLASS()
class UAIState_Minecrawler_Queen_Ph2_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround,InWeight = 1.0f,InDurationSeconds = 1000.0f));
}

class UDailyRoutine_Minecrawler_PH2_Queen : UAIState_DailyRoutine_Creature
{
    default RestoreAttributesAfterTimespan = FInGameTime::FromHours(20);
    default Schedule(7, 0, UAIState_Minecrawler_Queen_Ph2_Living_Day(), n"FP_QUEENPH2_STAND", 500.0F);
}

UCLASS()
class UAIState_Minecrawler_Queen_Ph2_Living_Day_Lay : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay,InWeight = 1.0f,InDurationSeconds = 1000.0f));
}
