
class UGA_Teleport_Scripted_PlayMontage : UGA_Creature_PlayMontage_Base
{    
    UPROPERTY()
    TSubclassOf<UScriptedTeleportSpotConfig> m_SpotConfigClass = UScriptedTeleportSpotConfig::StaticClass();
    
    UPROPERTY()
    UGameplayTeleportSpotConfigBase m_SpotConfig;
    

    UPROPERTY()
    FGameplayTag m_CurrentTeleportTag;
    UPROPERTY()
    ATeleportSpotVisual m_CurrentTeleportSpot;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbilityBeforeAssetPreload_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                                        FGameplayEventData TriggerEventData)
    {
        m_CurrentTeleportTag = TriggerEventData.EventTag;
        m_Montage = GetMontage(m_CurrentTeleportTag);
    }


    TSoftObjectPtr<UAnimMontage> GetMontage(FGameplayTag MontageTag)
    {
        return GetConfig().GetMontageForTag(MontageTag);
    }

    UGameplayTeleportSpotConfigBase GetConfig()
    {
        if(m_SpotConfig == nullptr)
        {
            m_SpotConfig = Cast<UGameplayTeleportSpotConfigBase>(m_SpotConfigClass.GetDefaultObject());
        }
        return m_SpotConfig;
    }


    UFUNCTION(BlueprintOverride)
    void OnLaunchSpell_Scriptable()
    {
        EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnPlayMontageFailed_Scriptable()
    {
        //Print("", 10.f, FLinearColor::Red);
       EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnInterruptedMontage_Scriptable()
    {
       //Print("OnInterruptedMontage_Scriptable", 10.f, FLinearColor::Red);
       EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnCompletedMontage_Scriptable()
    {
       //Print("OnCompletedMontage_Scriptable", 10.f, FLinearColor::Red);
       EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnBlendOutMontage_Scriptable()
    {
        //Print("OnBlendOutMontage_Scriptable", 10.f, FLinearColor::Red);
       EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnCancelledMontage_Scriptable()
    {
        //Print("OnCancelledMontage_Scriptable", 10.f, FLinearColor::Red);
       EndAbility();
    }


    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        FGameplayEventData Payload;
        GameplayAbilityActorInfo.AbilitySystemComponent.SendGameplayEvent(m_CurrentTeleportTag, Payload);
    }
}