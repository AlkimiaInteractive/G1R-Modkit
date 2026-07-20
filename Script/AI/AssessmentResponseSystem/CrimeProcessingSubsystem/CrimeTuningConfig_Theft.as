/**
 * Tunables for Theft crime assessment.
 */
UCLASS()
class UCrimeTuningConfig_Theft : UCrimeTuningConfig_Base
{
    // ------------------------------------------------------------------------------------
    //     Item value bands (severity / stakes)    
    // ------------------------------------------------------------------------------------

    /** Item.m_Value strictly below is classified LowValue stakes. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Item value")
    float LowValueClamp = 2.0f;

    /** Item.m_Value strictly above is classified HighValue stakes. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Item value")
    float HighValueClamp = 5.0f;

    /** Stakes when stealing from an unconscious victim (human = High, orc = Low). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Circumstance")
    ETheftStakes UnconsciousLootingStakes = ETheftStakes::HighStakes;

    // ---------------------------------------------------------------------
    //     Theft warning — compliance, wrong drops, voicelines, follow/leash    
    // ---------------------------------------------------------------------

    /** Realtime seconds before non-compliance → AIEvent_Crime_Theft_WarningTimedOut. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning")
    float WarningComplianceSeconds = 15.0f;

    /** Wrong-item drops allowed before AIEvent_Crime_Theft_WarningRefused. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning")
    int MaxWrongDropsBeforeCombat = 2;

    /** Seconds after first wrong drop before InsistGiveBack bark. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning")
    float FoolMeInsistGiveBackGapSeconds = 2.0f;

    /** Distance the enforcer will try to keep from the thief. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Follow")
    float PrudentFollowDistanceCm = 500.0f;

    /** Enforcer breaks into a sprint to close in when the thief is farther away than this distance. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Follow")
    float PrudentFollowSprintDistanceCm = 1200.0f;

    /** Distance the thief must move from the original theft position before the enforcer escalates to combat chase. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Leash")
    float FleeDistanceForCombat = 1500.0f;

    /** Seconds of lost line-of-sight before the guard escalates to combat chase. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Leash")
    float LoSLostSecondsForCombat = 3.0f;

    /** Seconds of lost line-of-sight before the guard supresses the crime and exits warning. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Leash")
    float LoSLostSecondsForSuppress = 12.0f;

    /** Min distance thief must be from theft scene when LoS suppress fires (peaceful getaway). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Leash")
    float FleeDistanceForSuppress = 4000.0f;

    // ------------------------------------------------------------------------------------
    //     Bribe / exchange (dropped item value vs stolen item) + pickup edge cases           
    // ------------------------------------------------------------------------------------

    /** Floor on sum of dropped non-stolen item values for bribe/exchange thresholds (ore value as Item.m_Value). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Bribe")
    float BribeTotalDroppedValueFloor = 20.0f;

    /** For non-personal-victim to accept bribe, total dropped value must exceed max(floor, stolen value × this). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Bribe")
    float GuardBribeVsStolenValueMultiplier = 0.8f;

    /** For personal victim exchange acceptance, total dropped value must exceed max(floor, stolen value × this). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Bribe")
    float VictimExchangeVsStolenValueMultiplier = 1.1f;

    /**
     * If the bribe world actor vanishes while PickUpTask already cleared (e.g. ally grabbed it) but the guard's feet
     * are still within this radius of the recorded drop location, treat bribe/exchange as accepted.
     */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Pickup")
    float BribeStaleAcceptRadiusCm = 550.0f;

    /**
     * How far back in realtime seconds to search perception memory for DropItem events from the thief
     * when Warning first enters (covers cases where the perception callback bound after the drop happened).
     */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Theft|Warning|Pickup")
    float MissedDropPerceptionLookbackSec = 30.0f;
}

UCLASS()
class UCrimeTuningConfig_Theft_Human : UCrimeTuningConfig_Theft
{
    default UnconsciousLootingStakes = ETheftStakes::HighStakes;
}

UCLASS()
class UCrimeTuningConfig_Theft_Orc : UCrimeTuningConfig_Theft
{
    default UnconsciousLootingStakes = ETheftStakes::LowStakes;
}
