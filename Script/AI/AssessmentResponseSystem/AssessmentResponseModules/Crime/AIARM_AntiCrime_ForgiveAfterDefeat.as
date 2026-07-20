class UAIARM_AntiCrime_Defeated_Other_Perception : UAIAssessmentResponseModule
{
    // default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Anti_Defeated_Other);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated_Other)
        .RequireTrue(
            Assessed::AffectedWasEnemy
        )
        .RequireFalse(
            Assessed::AffectedWasCombatForgivenBefore |
            Assessed::SelfIsTrainingWithAffected |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_ForgiveAllCrimesRelevantToSelf(EPerceptionCharacterType::AffectedCharacter))
        .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer())
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Anti_Defeated_Other, EPerceptionCharacterType::AffectedCharacter, EPerceptionCharacterType::Instigator));
}

class UAIARM_AntiCrime_Defeated_Other_Perception_SelfDefeated : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated_Other)
        .RequireTrue(
            Assessed::AffectedWasFriendly
        )
        .RequireFalse(
            Assessed::InstigatorWasCombatForgivenBefore |
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_SuppressAllCrimes(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer());
}

class UAIARM_AntiCrime_Defeated_Self_Perception : UAIAssessmentResponseModule
{
    // default RequirePursueCrimesOnAssessedInstigator.AddTag(GameplayTag::Crime_Anti_Defeated_Self);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated_Self)
        .RequireTrue( 
            Assessed::InstigatorWasEnemy
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithInstigator |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_SuppressAllCrimes(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer())
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Anti_Defeated_Self, EPerceptionCharacterType::Instigator, EPerceptionCharacterType::Self));
}

class UAIARM_AntiCrime_Defeated_Responses_Self : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Self)
        .RequireFalse(
            Assessed::IsCrimeSeverityCritical |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityMedium
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YesYes, EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Self)
        .RequireFalse(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::IsCrimeSeverityLow
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YoullBeSorryForThis, EPerceptionCharacterType::Instigator));
}

class UAIARM_AntiCrime_Defeated_Responses_Other_NoLivingStandingEnemiesOrHostilesLeft : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Other)
        .RequireTrue(
            Assessed::IsCrimeSeverityMinimal
        )
        .RequireFalse(
            Assessed::LivingStandingEnemiesPerceived |
            Assessed::InstigatorIsTrespassing
        )
        .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None, EConflictType::TrueFight)
            .AddContextTag(GameplayTag::VoicelineContext_ForgetFight));
    
    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Other)
        .RequireTrue(
            Assessed::InstigatorIsTrespassing
        )
        .RequireFalse(
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None, EConflictType::TrueFight));

    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Other)
        .RequireFalse(
            Assessed::IsCrimeSeverityCritical |
            Assessed::IsCrimeSeverityMinimal |
            Assessed::LivingStandingEnemiesPerceived |
            Assessed::InstigatorIsTrespassing
        )
        .Then(UAIEventResponse_RememberForgiving(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None, EConflictType::TrueFight)
            .AddContextTag(GameplayTag::VoicelineContext_ForgiveThisTime));

    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Other)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None, EConflictType::TrueFight));
}

class UAIARM_AntiCrime_Defeated_Responses_Other_EnemiesStillStanding : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Other)
        .RequireTrue(
            Assessed::IsCrimeSeverityLow |
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Other)
        .RequireTrue(
            Assessed::IsCrimeSeverityMinimal |
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Other)
        .RequireFalse(
            Assessed::IsCrimeSeverityCritical |
            Assessed::IsCrimeSeverityHigh |
            Assessed::IsCrimeSeverityMedium |
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_RememberForgiving(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator));

    default Rules.Add(GameplayTag::Crime_Anti_Defeated_Other)
        .RequireTrue(
            Assessed::IsCrimeSeverityCritical |
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));
}