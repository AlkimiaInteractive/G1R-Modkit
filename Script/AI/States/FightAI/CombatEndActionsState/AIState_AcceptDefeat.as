UCLASS()
class UAIState_AcceptDefeat : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Immortal);

    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_TrainingFightResult_Defeat);
    default AIStateTag = GameplayTag::AIState_Conflict_TrainingFightResult_Defeat;
    default DefaultConflictType = EConflictType::None;
    
    default AssessmentModuleClass = UAIARM_State_TrainingFightResult;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        
        AI.WaitUntilNoLongerSpeaking();

        if (CharacterState.Character.IsSwimming() || CharacterState.Character.IsDiving() || CharacterState.Character.IsClimbingLadderOrWall())
        {
            AI.Say(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YesYes, EPerceptionNoiseLoudness::Loud, CharacterOfInterest);
        }
        else
        {
            WaitForLastTaskToEnd(
                AI.UndrawWeapon(),
                AI.Say(GameplayTag::Sound_Voice_Reaction_Combat_Beaten_YesYes, EPerceptionNoiseLoudness::Loud, CharacterOfInterest)
            );
        }

        AI.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(GameplayTag::Memory_Character_Defeated, 
                                             AI.CharacterState, 
                                             CharacterOfInterest.CharacterState);

        WaitSeconds(2.0f);
        
        AI.CharacterState.LeaveTrainingFight();
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
        WaitSeconds(5.0f);
    }
}