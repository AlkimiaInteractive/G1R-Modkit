UCLASS()
class UAIState_ClaimVictory : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Immortal);

    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_TrainingFightResult_Victory);
    default AIStateTag = GameplayTag::AIState_Conflict_TrainingFightResult_Victory;
    default DefaultConflictType = EConflictType::None;

    default AssessmentModuleClass = UAIARM_State_TrainingFightResult;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        
        AI.WaitUntilNoLongerSpeaking();

        if (CharacterState.Character.IsSwimming() || CharacterState.Character.IsDiving() || CharacterState.Character.IsClimbingLadderOrWall())
        {
            AI.Say(GameplayTag::Sound_Voice_Reaction_WatchFight_End_GoodFight, EPerceptionNoiseLoudness::Loud, CharacterOfInterest);
        }
        else
        {
            WaitForLastTaskToEnd(
                AI.UndrawWeapon(),
                AI.Say(GameplayTag::Sound_Voice_Reaction_WatchFight_End_GoodFight, EPerceptionNoiseLoudness::Loud, CharacterOfInterest)
            );
        }

        AI.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(GameplayTag::Memory_Character_Defeated, 
                                             CharacterOfInterest.CharacterState,
                                             AI.CharacterState);

        WaitSeconds(2.0f);

        AI.CharacterState.LeaveTrainingFight();
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
        WaitSeconds(5.0f);
    }
}