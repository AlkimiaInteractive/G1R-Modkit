class UAIARM_CharmedEffects : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_CharmedEffects_Main);
    default SubModules.Add(UAIARM_CharmedEffects_ToCharmedState);
    default SubModules.Add(UAIARM_CharmedEffects_FromCharmedState);
}

class UAIARM_CharmedEffects_Main : UAIAssessmentResponseModule
{
    // Charmed effects
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Charm_Started_OnSelf)
        .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_JoinPartyOf(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Charm_Ended_OnSelf)
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    //
}

class UAIARM_CharmedEffects_ToCharmedState : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_CharmedEffects_ToCharmedState_FromDailyRoutine);
    default SubModules.Add(UAIARM_CharmedEffects_ToCharmedState_FromConflict);
}

class UAIARM_CharmedEffects_ToCharmedState_FromDailyRoutine : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_DailyRoutine);

    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Charm_Started_OnSelf)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Charmed, EPerceptionCharacterType::None));
    
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Charm_Loaded)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Charmed, EPerceptionCharacterType::None));
}

class UAIARM_CharmedEffects_ToCharmedState_FromConflict : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict);

    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Charm_Started_OnSelf)
        .RequireFalse(
            Assessed::LivingStandingEnemiesPerceived |
            Assessed::LivingStandingHostilesPerceived
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Charmed, EPerceptionCharacterType::None));
    
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Charm_Loaded)
        .RequireFalse(
            Assessed::LivingStandingEnemiesPerceived |
            Assessed::LivingStandingHostilesPerceived
        )
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Charmed, EPerceptionCharacterType::None));
}

class UAIARM_CharmedEffects_FromCharmedState : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Charmed);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
} 

class UAIARM_FearEffects : UAIAssessmentResponseModule
{
    // Fear effects
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Fear_Started_OnSelf)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Fear, EPerceptionCharacterType::None)
            .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared)
            .AddContextTag(GameplayTag::VoicelineContext_MagicFear));
    
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Fear_Loaded)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Fear, EPerceptionCharacterType::None));
    //
}

class UAIARM_SleepEffects : UAIAssessmentResponseModule
{
    // Sleep effects
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Sleep_Started_OnSelf)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_MagicSleep, EPerceptionCharacterType::None)
        .AddContextTag(GameplayTag::VoicelineContext_MagicFear));
    //
}

class UAIARM_ControlEffects : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_StateControlled);
    
    // Control effects
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Control_Started_OnSelf)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Controlled, EPerceptionCharacterType::None));
    //
}

class UAIARM_StateControlled : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Controlled);

    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Control_Ended_OnSelf)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}

class UAIARM_ParalyzedEffects : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_ParalyzedEffects_Main);
    default SubModules.Add(UAIARM_ParalyzedEffects_FromParalyzedState);
}

class UAIARM_ParalyzedEffects_Main : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);

    // Paralyzed effects
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Paralyzed_Started_OnSelf)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Paralyzed, EPerceptionCharacterType::None));
    //
}

class UAIARM_ParalyzedEffects_FromParalyzedState : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);

    default Rules.Add(GameplayTag::AIEvent_State_Done)
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}

class UAIARM_TransformationPerceived : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Transform_Ended_OnOther)
        .Then(UAIEventResponse_ForgetWitnessedTransformation())
        .Then(UAIEventResponse_CopyAllActiveModifiersFromTransformedCharacter());
    
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Transform_Started_OnOther)
        .RequireTrue(
            Assessed::SensedIsFriendly
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic_Friendly, EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_SpellEffect_Transform_Started_OnOther)
        .RequireTrue(
            Assessed::SensedWasEnemy
        )
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_General_Surprise_Magic_Enemy, EPerceptionCharacterType::SensedCharacter));
}