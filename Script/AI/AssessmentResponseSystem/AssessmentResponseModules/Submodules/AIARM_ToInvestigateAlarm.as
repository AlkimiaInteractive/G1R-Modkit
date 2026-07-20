class UAIARM_ToInvestigateAlarm : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);

    default Rules.Add(GameplayTag::AIEvent_Heard_Alert_Crime)
        // .RequireTrue(
        //     Assessed::IsSensedInSameTerritoryAsCharacter
        // )
        .Then(UAIEventResponse_SyncronizeMemorizedCrimes(EPerceptionCharacterType::AffectedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateAlarm, EPerceptionCharacterType::SensedCharacter));
}

/**
 * Generic confront-criminal dispatch wrapper for guards reaching the crime scene via InvestigateAlarm.
 */
class UAIARM_ConfrontCriminalAtCrimeScene_InvestigateAlarm : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateAlarm);

    default SubModules.Add(UAIARM_ConfrontCriminalAtCrimeScene_Fallback_InvestigateAlarm);
}

/** Sibling wrapper for the personal victim path (GoGetGuard escort). Same dispatch shape. */
class UAIARM_ConfrontCriminalAtCrimeScene_GoGetGuard : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);

    default SubModules.Add(UAIARM_ConfrontCriminalAtCrimeScene_Fallback_GoGetGuard);
}

/**
 * Fallback: any AIEvent_Guard_ConfrontedCriminalAtCrimeScene whose ContextTags do not match
 * a ported crime lands here. 
 *
 * When a new crime is added:
 *   1. Add UAIARM_Crime_<X>_ConfrontAtCrimeScene_* submodules under the wrappers above.
 *   2. Add Assessed::EventIsForCrime<X> predicate.
 *   3. Add .RequireFalse(Assessed::EventIsForCrime<X>) here so this fallback stops handling
 *      the newly-ported crime.
 */
class UAIARM_ConfrontCriminalAtCrimeScene_Fallback_InvestigateAlarm : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateAlarm);

    default Rules.Add(GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene)
        .RequireFalse(
            Assessed::EventIsForCrimeTheft
            // | Assessed::EventIsForCrimeTrespassing   // uncomment when Trespassing ports
            // | Assessed::EventIsForCrimeInteraction   // uncomment when Interaction / Lockpicking ports
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}

/** Sibling fallback for the GoGetGuard escort path. */
class UAIARM_ConfrontCriminalAtCrimeScene_Fallback_GoGetGuard : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);

    default Rules.Add(GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene)
        .RequireFalse(
            Assessed::EventIsForCrimeTheft
            // | Assessed::EventIsForCrimeTrespassing
            // | Assessed::EventIsForCrimeInteraction
        )
        .Then(UAIEventResponse_AddHostileModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_WatchHostile, EPerceptionCharacterType::Instigator));
}
