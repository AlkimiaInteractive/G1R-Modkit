class UAIARM_Crime_Human_DialogueFight : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_DialogueFight_Perceptions);
    default SubModules.Add(UAIARM_Crime_DialogueFight_Responses);
    default SubModules.Add(UAIARM_Crime_PastDialogueFight_Responses);
}

class UAIARM_Crime_Orc_DialogueFight : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_DialogueFight_Perceptions);
    default SubModules.Add(UAIARM_Crime_DialogueFight_Orc_Responses);
    default SubModules.Add(UAIARM_Crime_PastDialogueFight_Responses);
}

class UAIARM_Crime_DialogueFight_Perceptions : UAIAssessmentResponseModule
{
    // REAL FIGHT
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_LootAfter_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));


    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_NoPostActions_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    

    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_ToDeath_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_ToDeath_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_ToDeath_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Fists_ToDeath_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));


    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_LootAfter_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));


    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_NoPostActions_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_NoPostActions_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_NoPostActions_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_NoPostActions_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));


    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartRealFight_Weapon_ToDeath_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    
    // PETTY FIGHT
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_LootAfter_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_LootAfter_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_LootAfter_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_LootAfter_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));


    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_NoPostActions_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_NoPostActions_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_NoPostActions_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_NoPostActions_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    

    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_ToDeath_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_ToDeath_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_ToDeath_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Fists_ToDeath_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));


    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_LootAfter_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));


    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_NoPostActions_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));


    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_UntilDefeated)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_UntilDefeated, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_Permanent)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_Permanent, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));

    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_MinimalDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_MinimalDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
    
    default Rules.Add(GameplayTag::AIEvent_StartPettyFight_Weapon_ToDeath_RegularDuration)
        .Then(UAIEventResponse_AssessCrime(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_RegularDuration, EPerceptionCharacterType::SensedCharacter, EPerceptionCharacterType::Self));
}

class UAIARM_Crime_DialogueFight_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_DialogueFight_Weapon_NoPostActions);
    default SubModules.Add(UAIARM_Crime_DialogueFight_Weapon_LootAfter);
    default SubModules.Add(UAIARM_Crime_DialogueFight_Weapon_ToDeath);
    default SubModules.Add(UAIARM_Crime_DialogueFight_Fist_NoPostActions);
    default SubModules.Add(UAIARM_Crime_DialogueFight_Fist_LootAfter);
    default SubModules.Add(UAIARM_Crime_DialogueFight_Fist_ToDeath);
}

class UAIARM_Crime_DialogueFight_Orc_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_DialogueFight_Orc);
}

/// REAL WEAPON FIGHT

class UAIARM_Crime_DialogueFight_Weapon_NoPostActions : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true)); 

    default Rules.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));    
}

class UAIARM_Crime_DialogueFight_Weapon_LootAfter : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true));
    
    default Rules.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));
}

class UAIARM_Crime_DialogueFight_Weapon_ToDeath : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true));

    default Rules.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));    
}

class UAIARM_Crime_DialogueFight_Orc : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));

    default Rules.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true));

    default Rules.Add(GameplayTag::Crime_Dialogue_RealFight_Fists)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));

    default Rules.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true)); 
}


/// START REAL FIST FIGHT

class UAIARM_Crime_DialogueFight_Fist_NoPostActions : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true));
    
    default Rules.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));
}

class UAIARM_Crime_DialogueFight_Fist_LootAfter : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true));
    
    default Rules.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));
}

class UAIARM_Crime_DialogueFight_Fist_ToDeath : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true));

    default Rules.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath)
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, b_TargetIsPriority = true));    
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// PAST CRIME  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UAIARM_Crime_PastDialogueFight_Responses : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_PastDialogueFight_Responses_All);
    default SubModules.Add(UAIARM_Crime_PastDialogueFight_Responses_FightOrFlight);   
}

class UAIARM_Crime_PastDialogueFight_Responses_All : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Crime_PastDialogueFight_Responses_ModifiersOnly);
}

class UAIARM_Crime_PastDialogueFight_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee_GetGuardHelp);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::Debuff_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Defeated);

    default SubModules.Add(UAIARM_Crime_PastDialogueFight_Weapon_Responses_FightOrFlight);
}

class UAIARM_Crime_PastDialogueFight_Responses_ModifiersOnly: UAIAssessmentResponseModule
{
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default RequiredOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    default SubModules.Add(UAIARM_Crime_PastDialogueFight_Weapon_Responses_ModifiersOnly);
}

/// RULES

class UAIARM_Crime_PastDialogueFight_Weapon_Responses_ModifiersOnly : UAIAssessmentResponseModule
{
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddUseFistsModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddLootModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));

    // Affected is self
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::AffectedIsProtected
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_AddExecuteModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator));
}

class UAIARM_Crime_PastDialogueFight_Weapon_Responses_FightOrFlight : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Defeated);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_MagicSleep);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::AIState_Conflict_Flee);

    default SubModules.Add(UAIARM_Crime_PastDialogueFight_Weapon_Responses_ModifiersOnly);

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_PettyFight)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical
        )
        .Then(UAIEventResponse_ForceAwarenessOfCharacter(EPerceptionSense::See, EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::SensedCharacter))
        .Then(UAIEventResponse_SwitchStateWithConflictType(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::SensedCharacter, EConflictType::PettyFight, b_TargetIsPriority = true));

    // Affected is self
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));
    
    // Affected is protected
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::InstigatorIsStrongerThanSelf
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator)
            .AddContextTagToTarget(GameplayTag::VoicelineContext_AttackedCharge));
    
    // Affected is friendly
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical
        )
        .RequireFalse(
            Assessed::AffectedIsProtected |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Combat, EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_VoiceReaction(GameplayTag::Sound_Voice_Reaction_Combat_Start, EPerceptionCharacterType::Instigator));

    // Instigator is stronger
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsSelf |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));

    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedWasFriendly |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
    
    default Rules.Add(GameplayTag::AIEvent_Seen_PastCrimeInstigator)
        .EventHasTag(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath)
        .RequireTrue(
            Assessed::AffectedIsProtected |
            Assessed::IsCrimeSeverityCritical |
            Assessed::InstigatorIsStrongerThanSelf
        )
        .RequireFalse(
            Assessed::AffectedWasFriendly |
            Assessed::IsAnyFriendlyEnforcerOrLeaderInvolved
        )
        .Then(UAIEventResponse_AddEnemyModifier(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_LeavePartyOf(EPerceptionCharacterType::Instigator))
        .Then(UAIEventResponse_SwitchState(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, EPerceptionCharacterType::Instigator)
                .AddContextTag(GameplayTag::Action_Ambient_GetJumpscared));
}