UCLASS()
class ABattleBarrierVisual : AActor
{
    default bReplicates = true;

    UPROPERTY(DefaultComponent)
    UBattleBlockingBarrierComponent m_BattleBlockingBarrierManager;
    
    UPROPERTY(BlueprintReadWrite)
    FGameplayTag m_FX_CloseBarrierTag = FGameplayTag::Empty;
    UPROPERTY(BlueprintReadWrite)
    FGameplayTag m_FX_LoopBarrierTag = FGameplayTag::Empty;
    UPROPERTY(BlueprintReadWrite)
    FGameplayTag m_FX_OpenBarrierTag = FGameplayTag::Empty;

    UPROPERTY(BlueprintReadWrite)
    FGameplayTag m_FX_HitBarrierTag = GameplayTag::FX_Environment_BattleBarrier_Wall_Hit;

    UPROPERTY()
    FGothicFXInstanceHandle m_LoopSFXHandle;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(m_BattleBlockingBarrierManager.m_Activated)
        {
            DoCheck();
        }
    } 

    void DoCheck()
    {
        if(m_BattleBlockingBarrierManager == nullptr)
        {
            FString text = FString("m_BattleBlockingBarrierManager is EMPTY on: ");
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
            return;
        }
        if(m_BattleBlockingBarrierManager.m_DetectionRegionVolume == nullptr)
        {
            FString text = FString("m_DetectionRegionVolume is EMPTY on: ");
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
            return;
        }
        auto regionTrait= Cast<URegionTrait_BattlePlayerBlockingBarrier>(m_BattleBlockingBarrierManager.m_DetectionRegionVolume.FindTraitByClass(URegionTrait_BattlePlayerBlockingBarrier::StaticClass()));
        if(regionTrait == nullptr)
        {
            FString text = FString("URegionTrait_BattlePlayerBlockingBarrier is EMPTY on: ");
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
        }
    }

    UFUNCTION(BlueprintCallable, BlueprintEvent, NetMulticast)
    void SetState(bool Openned)
    {
        
    }

    UFUNCTION(BlueprintCallable, BlueprintEvent, NetMulticast)
    void OpenDoor(bool Reverse)
    {

    }

    UFUNCTION(BlueprintCallable)
    void PlayCloseBarrierFX()
    {
        PlayCloseFX();
        PlayLoopFX();
    }

    UFUNCTION(BlueprintCallable)
    void PlayOpenBarrierFX()
    {
        PlayOpenFX();
        StopLoopFX();
    }

    void PlayCloseFX()
    {
        PlayFX(m_FX_CloseBarrierTag);
    }
    void PlayOpenFX()
    {
        PlayFX(m_FX_OpenBarrierTag);
    }

    void PlayLoopFX()
    {
        StopLoopFX();
        m_LoopSFXHandle = PlayFX(m_FX_LoopBarrierTag);
    }

    void StopLoopFX()
    {
        auto fxComp = GetFXComp();
        if(fxComp == nullptr)
        {
            PrintError(f"fxComp is null on: {GetName()}");
            return;
        }
        fxComp.StopFXInstance(m_LoopSFXHandle, false);
    }

    
    FGothicFXInstanceHandle PlayFX(FGameplayTag FXTag)
    {
        if(FXTag == FGameplayTag::Empty)
            return FGothicFXInstanceHandle();
        
        auto fxComp = GetFXComp();
        if(fxComp == nullptr)
        {
            PrintError(f"fxComp is null on: {GetName()}");
            return FGothicFXInstanceHandle();;
        }
        return fxComp.PlayEffect(FXTag, nullptr);
    }
    UFUNCTION(BlueprintEvent)
    UGothicFXComponent GetFXComp()
    {
        return nullptr;
    }

    UFUNCTION(BlueprintCallable)
    void OnHit()
    {
        auto fxComp = GetFXComp();
        if(fxComp == nullptr)
        {
            return;
        }
        fxComp.PlayEffect(m_FX_HitBarrierTag, nullptr);
    }

}