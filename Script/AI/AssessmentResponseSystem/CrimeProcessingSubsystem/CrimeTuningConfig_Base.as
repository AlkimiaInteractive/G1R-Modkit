/**
 * CrimeTuningConfig_Base
 *
 * Abstract tuning base shared by all crime-type tuning configs. Holds the two
 * thresholds that the generic reputation-escalation pipeline reads so that
 * CrimeContext::EnsurePreparedFor_Common can compute bIsReputationEscalated and
 * bIsReputationAtExecuteLevel without knowing the concrete crime type.
 *
 * Extension recipe:
 *   - Derive UCrimeTuningConfig_X : UCrimeTuningConfig_Base for each new crime type.
 *   - Override the defaults in species-specific sub-subclasses where needed.
 *   - Keep species-varying values in data (subclass defaults), never in procedural code.
 */
UCLASS(Abstract)
class UCrimeTuningConfig_Base : UObject
{
    /** Accumulated severity (all crime types vs this witness) at or above this band → bIsReputationEscalated. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Crime|Reputation")
    ECrimeSeverityLevel ReputationEscalationLevel = ECrimeSeverityLevel::High;

    /** At or above this band -> bIsReputationAtExecuteLevel (execute-on-defeat). Should be >= ReputationEscalationLevel. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Crime|Reputation")
    ECrimeSeverityLevel ExecuteOnDefeatLevel = ECrimeSeverityLevel::Critical;

    // -----------------------------------------------------------------------------------
    //  Guard escort handoff — used by UAIState_GoGetGuard when a personal victim runs for a guard.
    // -----------------------------------------------------------------------------------

    /** Max horizontal distance the victim will scan for a reachable guard when entering GoGetGuard. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Crime|GuardEscort")
    float GuardSearchRadius = 10000.0f;

    /** Realtime seconds the victim will wait for the guard to acknowledge (still in InvestigateAlarm) before timing out. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Crime|GuardEscort")
    float GuardAckDeadlineSeconds = 180.0f;

    /** Max distance from the thief / stored crime nav point past which the victim stops following the guard and hands off to the confront event. */
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Crime|GuardEscort")
    float HandoffMaxDistanceToThiefOrScene = 750.0f;
}
