
UCLASS()
class ATelekinesisFocusStoneBridge : AActor
{
    default bReplicates = true;
    default ReplicateMovement = false; 

    UPROPERTY()
    AFocusStoneBridgeItem m_TelekinesisBridgeWorldItem;

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_DisplacementRoot;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_Group1Root;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_Group2Root;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_Group3Root;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UGothicFXComponent m_FXComponent;

    UPROPERTY(DefaultComponent, Attach=m_DisplacementRoot)
    USceneComponent m_WorldItemSpawnPosition;

    default bNeverApplyTickOptimizations = true;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSubclassOf<AFocusStoneBridgeItem> m_FocusStoneItemClass;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AGothicCharacter m_UserCharacter;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Replicated, ReplicatedUsing= OnRep_ExtendedPercentage)
    float m_ExtendedPercentage = 0.f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_ExtendedPercentageInternal = 0.f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Replicated)
    bool m_Extended = false;

    UPROPERTY()
    FGameplayTag m_ExtendedTag = GameplayTag::Event_FocusStone_TelekinesisBridge_Extended;

    UPROPERTY(NotVisible)
    FName m_SaveGameKey = n"FocusStone_TelekinesisBridge_Extended_Percentage";

    default bNeverApplyTickOptimizations = true;

    UPROPERTY(NotVisible)
    FGameplayTag m_FX_PullStartTag = GameplayTag::FX_Environment_TelekinesisBridge_Pull_Start;
    UPROPERTY(NotVisible)
    FGameplayTag m_FX_PullLoopTag = GameplayTag::FX_Environment_TelekinesisBridge_Pull_Loop;
    UPROPERTY(NotVisible)
    FGameplayTag m_FX_PullEndTag = GameplayTag::FX_Environment_TelekinesisBridge_Pull_Stop;

    UPROPERTY()
    FGothicFXInstanceHandle m_LoopSFXHandle;


    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        if(m_TextRender != nullptr)
        {
            m_TextRender.SetRelativeLocation(FVector(0,0,100));       
            m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
            m_TextRender.SetTextRenderColor(FColor::Green);
            m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
            m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
            m_TextRender.SetHiddenInGame(true);
        }
        if(m_ArrowComponent != nullptr)
        {
            m_ArrowComponent.SetWorldRotation(FRotator(90, 0, 0));
            m_ArrowComponent.SetHiddenInGame(true);
        }      

    } 

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(GetLocalRole() != ENetRole::ROLE_Authority)
            return;

        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.95f)
            {

                m_Extended = true;
                m_ExtendedPercentage = 1;
                UpdatePosition(m_ExtendedPercentage);
                return;
            }
            else
            {
                m_ExtendedPercentage = savedState;
                UpdatePosition(m_ExtendedPercentage);
            }         
        }
        SpawnTelekinesisBridgeWorldItem();
    }

    void SpawnTelekinesisBridgeWorldItem()
    {
        if(m_TelekinesisBridgeWorldItem == nullptr)
        {
            m_TelekinesisBridgeWorldItem = Cast<AFocusStoneBridgeItem>(SpawnActor(m_FocusStoneItemClass, m_WorldItemSpawnPosition.GetWorldLocation()));
            m_TelekinesisBridgeWorldItem.AttachToComponent(m_WorldItemSpawnPosition);
            m_TelekinesisBridgeWorldItem.m_TelekinesisBridgeActor = this;
        }
    }

    UFUNCTION()
    void OnRep_ExtendedPercentage()
    {
        UpdatePosition(m_ExtendedPercentage);
    }

    UFUNCTION(BlueprintEvent)
    void UpdatePosition(float NewPosition)
    {
    }

    
    UFUNCTION(BlueprintCallable, CallInEditor, meta = (DisplayName = "Play"))
	void Play()
    {
        auto world = GetWorld();
        if(world == nullptr)
            return;
        if(!world.IsGameWorld())
            return;
        PLAYFORDEBUG();

    }

	UFUNCTION(BlueprintCallable, CallInEditor, meta = (DisplayName = "Restart"))
	void Restart()
    {
        auto world = GetWorld();
        if(world == nullptr)
            return;
        if(!world.IsGameWorld())
            return;

        UpdatePosition(0);
        SpawnTelekinesisBridgeWorldItem();
        m_ExtendedPercentage = 0.f;
        m_ExtendedPercentageInternal = 0.f;
        m_Extended = false;

        STOPFORDEBUG();
    }


    UFUNCTION(BlueprintCallable, CallInEditor, meta = (DisplayName = "Resume"))
	void Resume()
    {
        auto world = GetWorld();
        if(world == nullptr)
            return;
        if(!world.IsGameWorld())
            return;
        RESUMEFORDEBUG();

    }

	UFUNCTION(BlueprintCallable, CallInEditor, meta = (DisplayName = "Stop"))
	void Stop()
    {
        auto world = GetWorld();
        if(world == nullptr)
            return;
        if(!world.IsGameWorld())
            return;
        STOPFORDEBUG();
    }

    UFUNCTION(BlueprintEvent)
    void PLAYFORDEBUG()
    {

    }

    UFUNCTION(BlueprintEvent)
    void RESUMEFORDEBUG()
    {

    }

    UFUNCTION(BlueprintEvent)
    void STOPFORDEBUG()
    {
        
    }

    UFUNCTION(BlueprintEvent, BlueprintCallable, NetMulticast)
    void ActivateVisuals()
    {

    }

    UFUNCTION()
    void DoStopMovement()
    {
        if(GetLocalRole() != ENetRole::ROLE_Authority)
            return;
        StopMovement();
        m_ExtendedPercentage = m_ExtendedPercentageInternal;
        AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, m_ExtendedPercentage);
    }


    UFUNCTION(BlueprintEvent, BlueprintCallable, NetMulticast)
    void StopMovement()
    {

    }

    UFUNCTION(BlueprintEvent, BlueprintCallable)
    void OnExtended()
    {
        if(GetLocalRole() != ENetRole::ROLE_Authority)
            return;
        AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, 1);
        m_Extended = true;
        if(m_UserCharacter!=nullptr)
            m_UserCharacter.GetGothicAbilitySystemComponent().SendGameplayEvent(m_ExtendedTag);
    }



    void DestroyInteractActor()
    {
        if(m_TelekinesisBridgeWorldItem != nullptr)
            m_TelekinesisBridgeWorldItem.DoDestroy();
        m_TelekinesisBridgeWorldItem = nullptr;
    }

    UFUNCTION(BlueprintEvent, BlueprintCallable)
    void ActivateNiagaraVisuals()
    {

    }

    UFUNCTION(BlueprintEvent, BlueprintCallable)
    void DeactivateNiagaraVisuals()
    {

    }

    UFUNCTION(BlueprintCallable)
    void PlayActivateFX()
    {
        PlayPullStartFX();
        PlayPullLoopFX();
    }

    UFUNCTION(BlueprintCallable)
    void PlayStopFX()
    {
        PlayStopPullFX();
        StopPullLoopFX();
    }

    void PlayPullStartFX()
    {
        m_FXComponent.PlayEffect(m_FX_PullStartTag, nullptr);
    }
    void PlayStopPullFX()
    {
        m_FXComponent.PlayEffect(m_FX_PullEndTag, nullptr);
    }

    void PlayPullLoopFX()
    {
        m_FXComponent.StopFXInstance(m_LoopSFXHandle, false);
        m_LoopSFXHandle = m_FXComponent.PlayEffect(m_FX_PullLoopTag, nullptr);
    }

    void StopPullLoopFX()
    {
        m_FXComponent.StopFXInstance(m_LoopSFXHandle, false);
    }



}