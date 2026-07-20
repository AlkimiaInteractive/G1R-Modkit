class UAIARM_ToInvestigateCombatSound : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_CombatEndActions);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateCombatSound);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);

    default SubModules.Add(UAIARM_SensedEnemyOrHostile);
    default SubModules.Add(UAIARM_SensedCombat);
    default SubModules.Add(UAIARM_SensedWarning);
}

class UAIARM_SensedEnemyOrHostile : UAIAssessmentResponseModule
{
    // default Rules.Add(GameplayTag::AIEvent_Heard_Hostile)
    //     .RequireTrue(
    //         Assessed::IsSensedInSameTerritoryAsCharacter
    //     )
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateCombatSound, EPerceptionCharacterType::SensedCharacter));

    // default Rules.Add(GameplayTag::AIEvent_Heard_Enemy)
    //     .RequireTrue(
    //         Assessed::IsSensedInSameTerritoryAsCharacter
    //     )
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_SensedCombat : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Sensed_Combat)
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateCombatSound, EPerceptionCharacterType::SensedCharactersTarget));

    // default Rules.Add(GameplayTag::AIEvent_Heard_AttackHit)
    //     .RequireTrue(
    //         Assessed::IsIntentionalAttack |
    //         Assessed::IsInstigatorInSameTerritoryAsCharacter
    //     )
    //     .RequireFalse(
    //         Assessed::AffectedIsTrainingWithInstigator
    //     )
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateCombatSound, EPerceptionCharacterType::SensedCharacter));
    
    // default Rules.Add(GameplayTag::AIEvent_Heard_AttackHit)
    //     .RequireTrue(
    //         Assessed::IsTooManyUnintentionalHits |
    //         Assessed::IsInstigatorInSameTerritoryAsCharacter
    //     )
    //     .RequireFalse(
    //         Assessed::IsIntentionalAttack |
    //         Assessed::AffectedIsTrainingWithInstigator
    //     )
    //     .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
    //     .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateCombatSound, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_SensedWarning : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_CantBeDistracted);
    
    default Rules.Add(GameplayTag::AIEvent_Sensed_Warning)
        .RequireTrue(
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::IsTrainingFight | 
            Assessed::IsPettyFight 
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Interjection_Suspect))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_InvestigateCombatSound, EPerceptionCharacterType::SensedCharactersTarget));
}