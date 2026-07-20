class UAIARM_Orc : UAIARM_General_Base
{
    default SubModules.Add(UAIARM_ParalyzedEffects);
    default SubModules.Add(UAIARM_SleepEffects);
    default SubModules.Add(UAIARM_ControlEffects);
    default SubModules.Add(UAIARM_FearEffects);
    default SubModules.Add(UAIARM_CharmedEffects);

    default SubModules.Add(UAIARM_Orc_ActiveResponse);
}  

class UAIARM_Orc_ActiveResponse : UAIARM_MainActiveResponse_Base
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Controlled);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Controlled);

    default SubModules.Add(UAIARM_Orc_TestSimple);
    default SubModules.Add(UAIARM_Orc_Main);
    default SubModules.Add(UAIARM_ToFollowCharacter);
}

class UAIARM_Orc_TestSimple : UAIAssessmentResponseModule
{
    default RequireAnyOwnedTags.AddTag(GameplayTag::Combat_TestCharacterSimple);

    default SubModules.Add(UAIARM_TestCharacterSimple);
}

class UAIARM_Orc_Main : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Combat_TestCharacterSimple);

    default SubModules.Add(UAIARM_TransformationPerceived);
    default SubModules.Add(UAIARM_ForgiveTrainingEnemies);

    default SubModules.Add(UAIARM_Disengage);
    default SubModules.Add(UAIARM_TurnToAttacker);
    default SubModules.Add(UAIARM_Crime_Orc);

    // SEE CRIME INSTIGATOR
    default SubModules.Add(UAIARM_AttackEnemyOnSight_Orc);
    default SubModules.Add(UAIARM_Human_JoinConflict);
    // default SubModules.Add(UAIARM_Human_JoinFriendlyOrProtectedInCombat);

    // default SubModules.Add(UAIARM_ToWatchFight);

    default SubModules.Add(UAIARM_StartTraining);

    default SubModules.Add(UAIARM_DialogueMakeEnemy);
    default SubModules.Add(UAIARM_DialogueForceSightPerception);
    default SubModules.Add(UAIARM_DialogueForceHearingPerception);

    default SubModules.Add(UAIARM_ToInvestigateAlarm);
    default SubModules.Add(UAIARM_ConfrontCriminalAtCrimeScene_InvestigateAlarm);
    default SubModules.Add(UAIARM_ConfrontCriminalAtCrimeScene_GoGetGuard);
    default SubModules.Add(UAIARM_ToInvestigateCombatSound);
    default SubModules.Add(UAIARM_ToInvestigateIdentifiedSound);
    default SubModules.Add(UAIARM_ToInvestigateSuspiciousSound);
    default SubModules.Add(UAIARM_ToInteractWithItem);

    default SubModules.Add(UAIARM_ReactToDefeatedCharacter_NotConflict); // TODO
    default SubModules.Add(UAIARM_ReactToDefeatedCharacter_Search); // TODO

    default SubModules.Add(UAIARM_ToChaseAndLookForHidingCharacter);
}