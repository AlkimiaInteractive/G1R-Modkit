class UAIARM_Crime_Human : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_Human_DialogueFight);
    default SubModules.Add(UAIARM_Crime_Human_Defeated);

    default SubModules.Add(UAIARM_Crime_Human_BlockedWhenDefeated);    
}

class UAIARM_Crime_Human_BlockedWhenDefeated : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default SubModules.Add(UAIARM_PastCrime_Perception);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation);
    default SubModules.Add(UAIARM_Crime_Human_WeaponOrFistsDrawn);
    default SubModules.Add(UAIARM_Crime_Human_Murder);
    default SubModules.Add(UAIARM_Crime_Human_Assault);
    // default SubModules.Add(UAIARM_AntiCrime_Human_Assault);
    default SubModules.Add(UAIARM_Crime_Human_DirectThreat);
    default SubModules.Add(UAIARM_Crime_Human_Pickpocket);
    default SubModules.Add(UAIARM_Crime_Pickpocket_WarningEscalation);
    default SubModules.Add(UAIARM_Crime_Human_Interaction);
    default SubModules.Add(UAIARM_Crime_Human_Theft);
    default SubModules.Add(UAIARM_Crime_Theft_WarningEscalation);
    default SubModules.Add(UAIARM_Crime_Theft_GuardEscortHandoff);
    default SubModules.Add(UAIARM_Crime_Human_SuspiciousSound_TheftConfirmed);
    default SubModules.Add(UAIARM_Crime_Human_Trespassing);
    default SubModules.Add(UAIARM_Crime_Human_BlockingPath);
    default SubModules.Add(UAIARM_Crime_Human_Creeping);
    default SubModules.Add(UAIARM_Crime_Human_Creeping_EscalateToWarning);
    default SubModules.Add(UAIARM_Crime_Human_Creeping_WarningEscalation);
}

class UAIARM_Crime_Orc : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_PastCrime_Perception);
    default SubModules.Add(UAIARM_Crime_GeneralEscalation);
    default SubModules.Add(UAIARM_Crime_Orc_DialogueFight);
    default SubModules.Add(UAIARM_Crime_Orc_Defeated);
    default SubModules.Add(UAIARM_Crime_Orc_WeaponOrFistsDrawn);
    default SubModules.Add(UAIARM_Crime_Orc_Murder);
    default SubModules.Add(UAIARM_Crime_Orc_Assault);
    default SubModules.Add(UAIARM_Crime_Orc_DirectThreat);
    default SubModules.Add(UAIARM_Crime_Orc_Pickpocket);
    default SubModules.Add(UAIARM_Crime_Human_Theft);
    default SubModules.Add(UAIARM_Crime_Theft_WarningEscalation);
    default SubModules.Add(UAIARM_Crime_Theft_GuardEscortHandoff);
    default SubModules.Add(UAIARM_Crime_Orc_BlockingPath);
    default SubModules.Add(UAIARM_Crime_Orc_Creeping);
}

class UAIARM_PastCrime_Perception : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Seen_NonEnemy)
        .RequireFalse(
            Assessed::SensedIsPlayer
        )
        .Then(UAIEventResponse_EvaluatePastCrimes(EPerceptionCharacterType::SensedCharacter));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_Player)
        .Then(UAIEventResponse_EvaluatePastCrimes(EPerceptionCharacterType::SensedCharacter));        
    
    default Rules.Add(GameplayTag::AIEvent_PreSensed_Player)
        .Then(UAIEventResponse_UpdateCrimeSeverityTowardsPlayer());
}