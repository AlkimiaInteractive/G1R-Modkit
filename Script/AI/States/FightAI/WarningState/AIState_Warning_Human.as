/** State in which we are aware of an enemy's presence but have not decided to enter combat yet */
/** For creatures */
UCLASS()
class UAIState_Warning_Human : UAIState_Warning 
{
    default AssessmentModuleClass = UAIARM_State_Warning_Human;

    /** Voicelines that can be said as the first warning*/
    UPROPERTY()
    private TArray<FGameplayTag> _WarningShoutVoicelines_Starter;

    /** Voicelines that can be said only as a subsequent warning */
    UPROPERTY()
    private TArray<FGameplayTag> _WarningShoutVoicelines_Later;

    /** Tracks the amount of subsequent warnings of the same type independently of total warnings */
    UPROPERTY()
    private int WarningTypeCounter = 0;

    void WarnOther() override
    {
        FGameplayTag VoiceTag = GetVoiceTagToWarn();
        if (VoiceTag.IsValid() && AI.CharacterState.Voiceline.HasVoicelineFor(VoiceTag))
        {
            AI.Say(VoiceTag, Loudness = EPerceptionNoiseLoudness::Loud, TargetCharacter = CharacterOfInterest);
        }
        WarningTypeCounter++;

        Super::WarnOther();
    }

    FString GetDisplayName() const override
    {
        return "Human Warning";
    }

    UFUNCTION()
    protected void CheckWarningTypeAndVoicelines()
    {
        
    }

    protected void SetWarningVoicelines(TArray<FGameplayTag> WarningShoutVoicelines_Starter, TArray<FGameplayTag> WarningShoutVoicelines_Later) final
    {
        if (_WarningShoutVoicelines_Starter == WarningShoutVoicelines_Starter && _WarningShoutVoicelines_Later == WarningShoutVoicelines_Later)
            return;

        _WarningShoutVoicelines_Starter = WarningShoutVoicelines_Starter;
        _WarningShoutVoicelines_Later = WarningShoutVoicelines_Later;
        WarningTypeCounter = 0;
    }

    FGameplayTag GetVoiceTagToWarn()
    {
        CheckWarningTypeAndVoicelines();

        TArray<FGameplayTag> VoicelineArray = _WarningShoutVoicelines_Starter;
        if (WarningTypeCounter > 0)
        {
            VoicelineArray = _WarningShoutVoicelines_Later;
        }

        if (VoicelineArray.IsEmpty())
            return FGameplayTag();

        if (VoicelineArray.Num() == 1)
            return VoicelineArray[0];

        return VoicelineArray[Math::RandRange(0, VoicelineArray.Num() - 1)];
    }
}