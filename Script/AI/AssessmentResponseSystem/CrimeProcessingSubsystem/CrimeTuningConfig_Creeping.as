/**
 * Tunables for Crime_Creeping assessment + Observe/Warning-Creeping state
 */
UCLASS()
class UCrimeTuningConfig_Creeping : UCrimeTuningConfig_Base
{
    /** Areas where crouching registers as Crime_Creeping. Empty = species opts out. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Perception")
    FGameplayTagContainer ApplicableAreaTags;

    // ---------------------------------------------------------------------
    //     Observe-Creeping phase
    // ---------------------------------------------------------------------

    /** Enable observe > warning > combat escalation. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Observe")
    bool bEscalates = true;

    /** Realtime seconds of continuous in-sight crouching before observe escalates to warning. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Observe")
    float ObserveSecondsBeforeWarning = 10.0f;

    /** Realtime seconds between Reaction_Interjection_Suspect voice barks while observing. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Observe")
    float InterjectionCooldownSeconds = 6.0f;

    /** Forward-dot threshold above which TurnToCharacter is suppressed (anti-jitter). */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Observe")
    float SkipTurnTowardsCriminalForwardDot = 0.75f;

    // ---------------------------------------------------------------------
    //     Peaceful exit (shared by Observe and Warning)
    // ---------------------------------------------------------------------

    /** Distance from witness to criminal at which the witness stops caring and exits peacefully. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Peaceful")
    float PeacefulEndDistance = 1200.0f;

    /** Realtime seconds of lost LoS before the witness exits peacefully. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Peaceful")
    float PeacefulEndLoSGraceSeconds = 3.0f;

    // ---------------------------------------------------------------------
    //     Reputation escalation by Creeping COUNT (not band-sum)
    // ---------------------------------------------------------------------

    /** Count at which bIsReputationEscalated flips true. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Reputation")
    int CountForReputationEscalation = 3;

    /** Count at which a within-grace re-creep skips the warning state and goes to combat + execute. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Reputation")
    int CountForExecuteOnDefeat = 5;

    // ---------------------------------------------------------------------
    //     Re-creep grace
    // ---------------------------------------------------------------------

    /** If the player resumes creeping within this many seconds of the last peaceful exit, go to warning. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|ReCreep")
    float ReCreepGraceSeconds = 30.0f;

    // ---------------------------------------------------------------------
    //     Warning state
    // ---------------------------------------------------------------------

    /** Realtime seconds the warning state will wait for the criminal to exit creep before escalating to combat. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Warning")
    float WarningSecondsBeforeBeatUp = 6.0f;

    /** Forwarded to UAIState_Warning_Crime base. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Warning")
    int NumWarningsBeforeCombat = 1;

    /** Initial retreat distance the witness opens between themselves and the criminal on warning entry. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Warning")
    float MinimumDistance = 150.0f;

    /** UAIState_Warning_Crime base: -1 keeps the criminal locked as initial target regardless of range. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Warning")
    float ThreatGoneDistanceThreshold = -1.0f;

    /** UAIState_Warning_Crime base: distance the criminal has to close further to count as "approached too much". */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|Warning")
    float ThreatApproachedTooMuchDistance = MAX_flt;

    // ---------------------------------------------------------------------
    //     Bark relay (alerts nearby allies to a creep)
    // ---------------------------------------------------------------------

    /** Horizontal distance from the criminal within which other valid witnesses. Set to 0 to disable. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Creeping|BarkRelay")
    float BarkRelayRadius = 750.0f;
}

UCLASS()
class UCrimeTuningConfig_Creeping_Human : UCrimeTuningConfig_Creeping
{
    default bEscalates = true;

    // Areas where creeping is suspicious.
    default ApplicableAreaTags.AddTag(GameplayTag::Area_OldCamp);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_NewCamp);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_SwampCamp);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_XardasTower);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_OldMine);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_FreeMine);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_ExchangeZone);
}

UCLASS()
class UCrimeTuningConfig_Creeping_Orc : UCrimeTuningConfig_Creeping
{
    // Orcs voice-react only; never warning or combat.
    default bEscalates = false;

    // Areas where creeping is suspicious.
    default ApplicableAreaTags.AddTag(GameplayTag::Area_OrcArena);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_OrcCamp);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_OrcEnclave);
    default ApplicableAreaTags.AddTag(GameplayTag::Area_OrcTown);
}
