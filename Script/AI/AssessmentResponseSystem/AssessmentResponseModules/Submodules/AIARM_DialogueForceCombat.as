class UAIARM_Creature_DialogueForceCombat : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_StartRealWeaponFightFromDialogue_Creature);

    default SubModules.Add(UAIARM_StopRealFightFromDialogue);
}

/// STOP FIGHT

class UAIARM_StopRealFightFromDialogue : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_StopRealFight)
        .Then(UAIEventResponse_RemoveEnemyModifier(EPerceptionCharacterType::AllSensedEnemies))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_AssessGoToDailyRoutine, EPerceptionCharacterType::None));
}


/// START REAL WEAPON FIGHT
class UAIARM_StartRealWeaponFightFromDialogue_Creature : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));    
}

/// RELATIONSHIP

class UAIARM_DialogueMakeEnemy : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_MakeEnemy)
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter));
}


/// PERCEPTION

class UAIARM_DialogueForceSightPerception : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_ForceSightPerception)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter));
}

class UAIARM_DialogueForceHearingPerception : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_ForceHearingPerception)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::Hear, EPerceptionCharacterType::SensedCharacter));
}