
UCLASS()
class UGameplayAbility_CharacterAI_Troll : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Troll_Base::StaticClass();
    default bRangedAttackRequiresRangedWeapon = false;
    default MinimumPreferredLocationConflictRadius = 10000.0f;
    default EngageConflictDistance = 50000;
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Troll_Adult::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

UCLASS()
class UGameplayAbility_CharacterAI_TrollJuvenile : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Troll_Base::StaticClass();

    default MinimumPreferredLocationConflictRadius = 10000.0f;

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Troll_Juvenile::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

UCLASS()
class UGameplayAbility_CharacterAI_TrollPrime : UGameplayAbility_CharacterAI_Troll
{

}

class UDailyRoutine_Troll_Base : UAIState_DailyRoutine_Creature
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }
    default Schedule(7, 0, UAIState_Troll_Living_Day(), Location::Spawnpoint,500);
}

UCLASS()
class UAIState_Troll_Living_Day : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, InDurationSeconds = 120.0f));
}