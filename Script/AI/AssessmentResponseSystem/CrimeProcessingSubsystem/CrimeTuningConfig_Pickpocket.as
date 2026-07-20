/**
 * Tunables for Pickpocket crime assessment + Pickpocket warning state.
 */

UCLASS()
class UCrimeTuningConfig_Pickpocket : UCrimeTuningConfig_Base
{
    // ---------------------------------------------------------------------
    //     Pickpocket warning
    // ---------------------------------------------------------------------
    
    /** Realtime seconds until the witness ends the warning peacefully */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float WarningComplianceSeconds = 15.0f;

    /** How many warning shouts before escalating to combat. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    int NumWarningsBeforeCombat = 1;

    /** Distance the victim tries to open from the thief on warning intro.*/
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float IntroRetreatDistance = 100.0f;

    /** Max realtime seconds for the intro retreat / face step before giving up (nav stall guard). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float IntroRetreatTimeLimitSeconds = 1.5f;

    /** If victim–thief distance is at least this, exit warning peacefully */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float PeacefulEndDistanceFromVictim = 1000.0f;

    /** After intro, if thief is closer than this gap esclate to combat. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float ProximityEscalateDistance = 20.0f;

    /** Seconds of continuous lost LoS before peaceful warning end. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float PeacefulEndLoSGraceSeconds = 0.35f;

    /** In pickpocket warning, skip TurnToCharacter if forward dot to thief is above this (prevent jitter). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float SkipTurnTowardsThiefIfForwardDotAbove = 0.6f;

    /** Passed to parent InitialMinimumDistance so BeginWarning can still strafe if thief is close after intro. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float MinimumDistance = 200.0f;

    /** Distance delta toward witness that counts as “approached too much” (pickpocket disables via MAX_flt). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float ThreatApproachedTooMuchDistance = MAX_flt;

    /** Parent ThreatGoneDistance: pickpocket sets -1 so SelectWarningCharacterOfInterest keeps locking InitialTarget regardless of range; peaceful range is handled in state. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    float ThreatGoneDistanceThreshold = -1.0f;

    /** Whether the warning state should draw and use a weapon while warning. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    bool bUseWeapon = false;

    /** Whether the warning state requires sensed hostiles to keep running. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    bool bRequireHostiles = false;

    /** Whether the warning state requires staying aware of the original initial target. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning")
    bool bRequireAwarenessOfInitialTarget = true;

    // ---------------------------------------------------------------------
    //     Optional suppress — thief gone long enough and far enough
    // ---------------------------------------------------------------------

    /** Seconds of lost line-of-sight before suppress may fire (paired with FleeDistanceForSuppress). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning|Suppress")
    float LoSLostSecondsForSuppress = 12.0f;

    /** Min distance thief must be from the victim when LoS suppress fires (peaceful + suppress latest pickpocket vs witness). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Warning|Suppress")
    float FleeDistanceForSuppress = 4000.0f;

    // ---------------------------------------------------------------------
    //     Repeated-attempt escalation
    // ---------------------------------------------------------------------

    /** Number of failed attempts before escalating to combat. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Escalation")
    int MaxFailedAttemptsBeforeCombat = 2;

    /** Realtime seconds after which a Crime_Pickpocket_Fail entry is excluded from the MaxFailedAttemptsBeforeCombat counter. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Pickpocket|Escalation")
    float FailCountDecayWindowSeconds = 300.0f;
}

UCLASS()
class UCrimeTuningConfig_Pickpocket_Human : UCrimeTuningConfig_Pickpocket
{
}

UCLASS()
class UCrimeTuningConfig_Pickpocket_Orc : UCrimeTuningConfig_Pickpocket
{
}
