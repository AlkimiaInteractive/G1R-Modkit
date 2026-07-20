UCLASS()
class ABossFightUIHelper : APlayerDetectionActorBase
{
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    FName m_BossUniqueName;
    UPROPERTY()
    bool m_Initialized = false;

    UPROPERTY()
    AGothicCharacterState m_BossCharacterState;
    UPROPERTY()
    FGameplayTag m_BossArenaTag;// = GameplayTag::State_Inside_BossArena;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Super::BeginPlay();
        InitializeBossInfo();
    }
    void InitializeBossInfo()
    {
        auto characterState = AGothicCharacterState::FindByUniqueName(m_BossUniqueName);
        if(characterState != nullptr)
        {
            m_BossCharacterState = characterState;
            BindBossDelegates();
            m_Initialized = true;
        }
        
    }

    void BindBossDelegates()
    {
    }

    void OnCharacterEnter(AGothicCharacter character) override
    {
        Super::OnCharacterEnter(character);
        if(!m_Initialized)
            InitializeBossInfo();
        if(!m_Initialized)
            return;
        character.GetGothicAbilitySystemComponent().AddTag(m_BossArenaTag);
        //Add tag to player
        //Send notification to Marc
    }

    void OnCharacterExit(AGothicCharacter character) override
    {
        Super::OnCharacterExit(character);
        character.GetGothicAbilitySystemComponent().RemoveTag(m_BossArenaTag);
        //Remove tag to player
        //Send notification to Marc
    }

    // if(m_ArenaPlayerDetector == nullptr)
    //     {
    //         ActivateDetectionTimer();
    //         return;
    //     }

    //     if(System::IsTimerActiveHandle(TaskTimer))
    //         System::ClearAndInvalidateTimerHandle(TaskTimer);
        
    //     RegisterArea();

    // }

    // void ActivateDetectionTimer()
    // {
    //     if(System::IsTimerActiveHandle(TaskTimer))
    //         System::ClearAndInvalidateTimerHandle(TaskTimer);
    //     TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"FindAreaActor"), .5f, true);
    // }
}