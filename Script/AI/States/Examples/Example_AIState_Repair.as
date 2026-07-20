/**
 * Example daily routine state that lets the NPC repair stuff in their vicinity. Additionally,
 * there is a chance for the NPC to go to their toolchest between repairs.
 */
UCLASS()
class UAIState_Example_GetToolsAndRepair : UGothicCharacterAIState 
{
    UPROPERTY()
    float FindBuildingsInRadius = 2500.0f;
    
    UPROPERTY()
    float FindToolchestInRadius = 5000.0f;

    UPROPERTY()
    FGameplayTag RepairAction = GameplayTag::Action_Ambient_RepairBuilding;

    UPROPERTY()
    FGameplayTag GetToolsAction = GameplayTag::Action_Ambient_Chest;

    UPROPERTY()
    float ChanceToGetToolsAfterRepair = 0.3f;

    UPROPERTY()
    float RepairTimeLimitMin = 30.0f;

    UPROPERTY()
    float RepairTimeLimitMax = 60.0f;

    /** Defines the sequence of actions this character should do during this state. */
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (true)
        {
            TryRepairBuilding();

            if (Math::RandRange(0.0f, 1.0f) < ChanceToGetToolsAfterRepair)
            {
                TryGetTools();
            }

            WaitSeconds(1.0f);
        }
    }

    bool TryGetTools()
    {
        return AI.TryUseFreepoint(GetToolsAction, FindToolchestInRadius).WasSuccessful();
    }

    /** This will have the NPC go to different huts, depending on freepoint Cooldown! */
    bool TryRepairBuilding()
    {
        return AI.TryUseFreepoint(RepairAction, 
                                  FindBuildingsInRadius, 
                                  Math::RandRange(RepairTimeLimitMin, RepairTimeLimitMax)).WasSuccessful();
    }
}

/** Specialized variant to repair buildings */
UCLASS()
class UAIState_Example_RepairBuilding : UAIState_Example_GetToolsAndRepair
{
    default RepairAction = GameplayTag::Action_Ambient_RepairBuilding;
    default ChanceToGetToolsAfterRepair = 0.6f;

    default RepairTimeLimitMin = 120.0f;
    default RepairTimeLimitMax = 200.0f;
}

/** Specialized variant to repair bows */
UCLASS()
class UAIState_Example_RepairBow : UAIState_Example_GetToolsAndRepair
{
    /** Optional constructor allowing to configure a duration from within the daily routine schedule */
    UAIState_Example_RepairBow(float Duration)
    {
        RepairTimeLimitMin = Duration;
        RepairTimeLimitMax = Duration * 1.5f;
    }

    default RepairAction = GameplayTag::Action_Ambient_RepairBow;
    default ChanceToGetToolsAfterRepair = 0.2f;

    default RepairTimeLimitMin = 30.0f;
    default RepairTimeLimitMax = 60.0f;
}