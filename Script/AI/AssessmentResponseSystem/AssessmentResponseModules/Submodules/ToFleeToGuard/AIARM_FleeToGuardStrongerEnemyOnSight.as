class UAIARM_Human_FleeFromEnemy : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);

    default SubModules.Add(UAIARM_FleeToGuardStrongerEnemyOnSight);
    default SubModules.Add(UAIARM_FleeFromStrongerEnemyCreaturesIfTooClose);
    default SubModules.Add(UAIARM_FleeFromStrongerEnemyUponFriendlyDeath);
}

class UAIARM_FleeToGuardStrongerEnemyOnSight : UAIAssessmentResponseModule
{
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Human);
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Orc);
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Creature_Undead_Orc);

    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Theft);

    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedIsStrongerThanSelf |
            Assessed::SensedWasEnemy
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithSensed |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsPettyFight |
            Assessed::IsTrainingFight
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::SensedCharacter)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}

class UAIARM_FleeFromStrongerEnemyUponFriendlyDeath : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_FleeFromStrongerEnemyUponFriendlyDeath_ToFlee);
    default SubModules.Add(UAIARM_FleeFromStrongerEnemyUponFriendlyDeath_ToDisengage);
}

class UAIARM_FleeFromStrongerEnemyUponFriendlyDeath_ToFlee : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Sensed_OtherKilled)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorWasEnemy |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithSensed
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::SensedCharacter)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared)); 
}

class UAIARM_FleeFromStrongerEnemyUponFriendlyDeath_ToDisengage : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_NeverDisengage);

    default Rules.Add(GameplayTag::AIEvent_Sensed_OtherKilled)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::InstigatorWasEnemy |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithSensed |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::SensedCharacter)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}

class UAIARM_FleeFromStrongerEnemyCreaturesIfTooClose : UAIAssessmentResponseModule
{
    default RequireAssessedToHaveAllOwnedTags.AddTag(GameplayTag::Species_Creature);

    default SubModules.Add(UAIARM_FleeFromStrongerEnemyCreaturesIfTooClose_ToFlee);
    default SubModules.Add(UAIARM_FleeFromStrongerEnemyCreaturesIfTooClose_ToDisengage);
}

class UAIARM_FleeFromStrongerEnemyCreaturesIfTooClose_ToFlee : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default Rules.Add(GameplayTag::AIEvent_Seen_EnemyTooClose)
        .RequireTrue(
            Assessed::SensedIsStrongerThanSelf |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithSensed
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::SensedCharacter)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared)); 
}

class UAIARM_FleeFromStrongerEnemyCreaturesIfTooClose_ToDisengage : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_NeverDisengage);
    
    default Rules.Add(GameplayTag::AIEvent_Seen_EnemyTooClose)
        .RequireTrue(
            Assessed::SensedIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::SelfIsTrainingWithSensed |
            Assessed::IsSensedInSameTerritoryAsCharacter
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Disengage, EPerceptionCharacterType::SensedCharacter)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}