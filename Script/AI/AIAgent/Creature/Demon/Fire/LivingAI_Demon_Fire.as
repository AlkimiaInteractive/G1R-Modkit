UCLASS()
class UGameplayAbility_CharacterAI_Demon_Fire : UGameplayAbility_CreatureAI 
{
    default MaximumRangedAttackHorizontalDistance = 1000.0f;
    default bRangedAttackRequiresRangedWeapon = false;
    default InitialDailyRoutineClass = UDailyRoutine_Demon_Fire::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Demon_Fire::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

class UDailyRoutine_Demon_Fire : UAIState_DailyRoutine_Creature
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        RestoreAttributes();
    }
    // default Schedule(6, 0, UAIState_OrcDog_Living_Day(), Location::Spawnpoint, 2000.0f);
    // default Schedule(23, 55, UAIState_OrcDog_Living_Night(), Location::Spawnpoint, 2000.0f);
}