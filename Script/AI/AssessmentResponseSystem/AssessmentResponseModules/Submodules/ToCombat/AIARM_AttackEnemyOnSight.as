class UAIARM_AttackEnemyOnSight_Human : UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::Species_Human);

    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    
    default SubModules.Add(UAIARM_AttackEnemyOnSight_Human_To_HumanOrOrc_GuardRole);
    default SubModules.Add(UAIARM_AttackEnemyOnSight_Human_To_HumanOrOrc_NoGuardRole);
    default SubModules.Add(UAIARM_AttackEnemyOnSight_HumanOrOrc_To_Creature);
}

class UAIARM_AttackEnemyOnSight_Orc : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Species_Orc);
    default RequireAnyOwnedTags.AddTag(GameplayTag::Species_Creature_Undead_Orc);

    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    
    default SubModules.Add(UAIARM_AttackEnemyOnSight_Orc_To_HumanOrOrc);
    default SubModules.Add(UAIARM_AttackEnemyOnSight_HumanOrOrc_To_Creature);
}

class UAIARM_AttackEnemyOnSight_Human_To_HumanOrOrc_GuardRole : UAIARM_GuardOrLeaderRole
{
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Human);
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Orc);
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Creature_Undead_Orc);

    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedWasEnemy
        )
        .RequireFalse(
            Assessed::IsEnemyStrongerCharacterInvolved |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_AttackEnemyOnSight_Human_To_HumanOrOrc_NoGuardRole : UAIARM_NoGuardNorLeaderRole
{
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Human);
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Orc);
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Creature_Undead_Orc);

    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedWasEnemy
        )
        .RequireFalse(
            Assessed::IsEnemyStrongerCharacterInvolved |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_AttackEnemyOnSight_Orc_To_HumanOrOrc : UAIAssessmentResponseModule
{
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Human);
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Orc);
    default RequireAssessedToHaveAnyOwnedTags.AddTag(GameplayTag::Species_Creature_Undead_Orc);

    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedWasEnemy
        )
        .RequireFalse(
            Assessed::IsEnemyStrongerCharacterInvolved |
            Assessed::IsPettyFight
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_AttackEnemyOnSight_HumanOrOrc_To_Creature : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);

    default RequireAssessedToHaveAllOwnedTags.AddTag(GameplayTag::Species_Creature);

    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfAssessedHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);

    default Rules.Add(GameplayTag::AIEvent_Seen_Enemy)
        .RequireTrue(
            Assessed::SensedWasEnemy
        )
        .RequireFalse(
            Assessed::IsEnemyStrongerCharacterInvolved
        )
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::SensedCharacter));
}