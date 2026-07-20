UCLASS()
class UAIState_MagicSleep : UAIState_Conflict
{
    default AssessmentModuleClass = UAIARM_State_MagicSleep;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_MagicSleep);
    default AIStateTag = GameplayTag::AIState_MagicSleep;

    default IsTickingTask = true;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();
        
        while (Self.HasGameplayTag(GameplayTag::Debuff_Sleep) || Self.HasGameplayTag(GameplayTag::Debuff_Blind))
        {            
            WaitOneTick();
        }

        WaitSeconds(1.5f);

        auto FakePerception = FRememberedPerception();
        FakePerception.Origin.Character = Self;
        FakePerception.Origin.CharacterState = Self.CharacterState;

        AI.AssessHostilesAndEnemiesAround(FakePerception);
    }

    FString GetDisplayName() const override
    {
        return "Magic Sleep State";
    }
}