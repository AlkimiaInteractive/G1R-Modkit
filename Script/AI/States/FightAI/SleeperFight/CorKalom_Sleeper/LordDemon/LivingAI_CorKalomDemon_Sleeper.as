UCLASS()
class UGameplayAbility_CharacterAI_CorKalom_Sleeper : UGameplayAbility_CreatureAI 
{
    default MaximumRangedAttackHorizontalDistance = 5000.0f;
    default bRangedAttackRequiresRangedWeapon = false;
    default InitialDailyRoutineClass = UDailyRoutine_CorKalom_Sleeper::StaticClass();
    default EngageConflictDistance = 50000;
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_CorKalomDemon_Sleeper::StaticClass());
}

class UDailyRoutine_CorKalom_Sleeper : UAIState_DailyRoutine_Creature
{
    // default Schedule(6, 0, UAIState_OrcDog_Living_Day(), Location::Spawnpoint, 2000.0f);
    // default Schedule(23, 55, UAIState_OrcDog_Living_Night(), Location::Spawnpoint, 2000.0f);
}