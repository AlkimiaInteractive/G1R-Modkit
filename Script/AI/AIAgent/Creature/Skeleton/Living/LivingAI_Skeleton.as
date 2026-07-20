UCLASS()
class UGameplayAbility_CharacterAI_Skeleton : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Skeleton::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Skeleton::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_Skeleton_Warrior : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Skeleton::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Skeleton_Warrior::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_Skeleton_Scout : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Skeleton::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Skeleton_Scout::StaticClass());

    /// Ranged weapon scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Mlt_RangedWeapon_PrioritizeIfTargetFarAway());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_DisableIfNoAmmunitionInInventory());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_PrioritizeIfPassiveAttackerRole());
    // default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Mlt_RangedWeapon_BonusIfTargetOutsidePreferredLocationRadius());    
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_DisableIfInCombatEndActionsState());
}

UCLASS()
class UGameplayAbility_CharacterAI_Skeleton_Mage : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Skeleton::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Skeleton_Mage::StaticClass());
}

class UDailyRoutine_Skeleton : UAIState_DailyRoutine_Creature
{
    float radius = 2000.0f;

    UDailyRoutine_Skeleton(float Inradius)
    {
        radius = Inradius;
    }

    default Schedule(7, 0, UAIState_Skeleton_Living_Day(), Location::Spawnpoint, radius);
    default Schedule(23, 0, UAIState_Skeleton_Living_Night(), Location::Spawnpoint, radius);
}

class UDailyRoutine_Skeleton_Servant : UAIState_DailyRoutine_Creature
{

    default Schedule(7, 0, UAIState_Skeleton_Sweep(), Location::Spawnpoint);
}

class UDailyRoutine_Skeleton_SleeperTemple : UAIState_DailyRoutine_Creature
{
    float radius = 500.0f;

    UDailyRoutine_Skeleton_SleeperTemple(float Inradius)
    {
        radius = Inradius;
    }

    default Schedule(7, 0, UAIState_Skeleton_StandAround(), Location::Spawnpoint, radius);
}

class UAIState_Skeleton_StandAround : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, InDurationSeconds = 10.0f));
}

class UAIState_Skeleton_Sweep : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sweep, InDurationSeconds = 10.0f));
}

UCLASS()
class UAIState_Skeleton_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.1f, 15.0f));

    default ChanceToDoActionOnSpot = 0.25f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_Skeleton_Living_Night : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.1f, 15.0f));

    default ChanceToDoActionOnSpot = 0.25f;
    default SpotReachRadius = 300.0f;
}