class UAIARM_Crime_Human_Defeated : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Human_Defeated_Self);
    default SubModules.Add(UAIARM_Crime_Human_Defeated_Other);
}

class UAIARM_Crime_Human_Defeated_Self : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Self_Perception);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Responses_Self);
}

class UAIARM_Crime_Human_Defeated_Other : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default SubModules.Add(UAIARM_AntiCrime_Defeated_Other_Perception);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Other_Perception_SelfDefeated);
    // default SubModules.Add(UAIARM_Crime_Defeated_Other_Perception);
    default SubModules.Add(UAIARM_Crime_DefeatedAgain_Other_Perception);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Responses_Other_NoLivingStandingEnemiesOrHostilesLeft);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Responses_Other_EnemiesStillStanding);
    // default SubModules.Add(UAIARM_Crime_Defeated_Responses_Other_NoLivingStandingEnemiesOrHostilesLeft);
    // default SubModules.Add(UAIARM_Crime_Defeated_Responses_Other_EnemiesStillStanding);
    default SubModules.Add(UAIARM_Crime_DefeatedAgain_Responses);
}

class UAIARM_Crime_Orc_Defeated : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Other_Perception);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Other_Perception_SelfDefeated);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Self_Perception);
    // default SubModules.Add(UAIARM_Crime_Defeated_Other_Perception);
    default SubModules.Add(UAIARM_Crime_DefeatedAgain_Other_Perception);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Responses_Self);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Responses_Other_NoLivingStandingEnemiesOrHostilesLeft);
    default SubModules.Add(UAIARM_AntiCrime_Defeated_Responses_Other_EnemiesStillStanding);
    // default SubModules.Add(UAIARM_Crime_Defeated_Responses_Other_NoLivingStandingEnemiesOrHostilesLeft);
    // default SubModules.Add(UAIARM_Crime_Defeated_Responses_Other_EnemiesStillStanding);
    default SubModules.Add(UAIARM_Crime_DefeatedAgain_Responses);
}

// class UAIARM_Crime_Defeated_Other_Perception : UAIAssessmentResponseModule
// {
//     // default RequireNotPursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Anti_Defeated_Other);
//     // default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_Defeated);

//     // default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated_Other)
//     //     .RequireTrue(
//     //         Assessed::AffectedWasEnemy
//     //     )
//     //     .RequireFalse(
//     //         Assessed::SelfIsTrainingWithAffected |
//     //         Assessed::AffectedWasCombatForgivenBefore
//     //     )
//     //     .Then(UAIEventResponse_RegisterCrime(GameplayTag::Crime_Defeated, EPerceptionCharacterType::AffectedCharacter, EPerceptionCharacterType::Self));
// }

class UAIARM_Crime_DefeatedAgain_Other_Perception : UAIAssessmentResponseModule
{
    default RequirePursueCrimesOnAssessedCharacter.AddTag(GameplayTag::Crime_DefeatedAgain);

    default Rules.Add(GameplayTag::AIEvent_Sensed_Defeated_Other)
        .RequireTrue(
            Assessed::AffectedWasEnemy |
            Assessed::AffectedWasCombatForgivenBefore
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithAffected
        )
        // .Then(UAIEventResponse_ForgetAllCrimesOfType(EPerceptionCharacterType::Instigator, GameplayTag::Crime_IgnoredWarning_WeaponDrawn))
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_DefeatedAgain, EPerceptionCharacterType::AffectedCharacter, EPerceptionCharacterType::Self));
}

// class UAIARM_Crime_Defeated_Responses_Other_NoLivingStandingEnemiesOrHostilesLeft : UAIAssessmentResponseModule
// {
//     default Rules.Add(GameplayTag::Crime_Defeated)
//         .RequireTrue(
//             Assessed::IsCrimeSeverityLow
//         )
//         .RequireFalse(
//             Assessed::LivingStandingEnemiesPerceived |
//             Assessed::InstigatorIsTrespassing
//         )
//         .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::Instigator)
//             .AddContextTag(GameplayTag::VoicelineContext_ForgetFight));
    
//     default Rules.Add(GameplayTag::Crime_Defeated)
//         .RequireTrue(
//             Assessed::IsCrimeSeverityMinimal
//         )
//         .RequireFalse(
//             Assessed::LivingStandingEnemiesPerceived |
//             Assessed::InstigatorIsTrespassing
//         )
//         .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::Instigator)
//             .AddContextTag(GameplayTag::VoicelineContext_ForgetFight));
    
//     default Rules.Add(GameplayTag::Crime_Defeated)
//         .RequireTrue(
//             Assessed::InstigatorIsTrespassing
//         )
//         .RequireFalse(
//             Assessed::LivingStandingEnemiesPerceived
//         )
//         .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));

//     default Rules.Add(GameplayTag::Crime_Defeated)
//         .RequireTrue(
//             Assessed::IsCrimeSeverityCritical
//         )
//         .RequireFalse(
//             // Assessed::LivingStandingHostilesPerceived |
//             Assessed::LivingStandingEnemiesPerceived
//         )
//         .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
//         .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));
// }

// class UAIARM_Crime_Defeated_Responses_Other_EnemiesStillStanding : UAIAssessmentResponseModule
// {
//     default Rules.Add(GameplayTag::Crime_Defeated)
//         .RequireTrue(
//             Assessed::IsCrimeSeverityLow |
//             Assessed::LivingStandingEnemiesPerceived
//         )
//         .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator));
    
//     default Rules.Add(GameplayTag::Crime_Defeated)
//         .RequireTrue(
//             Assessed::IsCrimeSeverityMinimal |
//             Assessed::LivingStandingEnemiesPerceived
//         )
//         .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator));

//     default Rules.Add(GameplayTag::Crime_Defeated)
//         .RequireTrue(
//             Assessed::IsCrimeSeverityCritical |
//             Assessed::LivingStandingEnemiesPerceived
//         )
//         .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));
// }

class UAIARM_Crime_DefeatedAgain_Responses : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_DefeatedAgain)
        .RequireFalse(
            // Assessed::LivingStandingHostilesPerceived |
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_CombatEndActions, EPerceptionCharacterType::None));

    default Rules.Add(GameplayTag::Crime_DefeatedAgain)
        .RequireTrue(
            Assessed::LivingStandingEnemiesPerceived
        )
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator));
}