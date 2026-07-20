class AXardasSleeperTeleportSpotVisual : ATeleportSpotVisual
{
    default m_SpotConfigClass = UXardasSleeperTeleportSpotConfigBase::StaticClass();

    UPROPERTY()
    AGothicCharacter m_XardasChar;

    UPROPERTY()
    UXardasSleeperTeleportComponent m_XardasTeleportComp;

    UPROPERTY()
    FGameplayTag m_DoingTeleportTag = FGameplayTag();

    void SetupSpot(UCreatureTeleportComponent TeleportComponent) override
    {
        Super::SetupSpot(TeleportComponent);
        m_XardasTeleportComp = Cast<UXardasSleeperTeleportComponent>(TeleportComponent);
        m_XardasChar = Cast<AGothicCharacter>(TeleportComponent.GetOwner());
    }

    UFUNCTION(BlueprintCallable)
    void ActivateSpot()
    {
        RemoveDoingTeleportTag();
    }

    void AddDoingTeleportTag()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(m_XardasChar.GetAbilitySystemComponent());
        abComp.AddTag(m_DoingTeleportTag);
    }

    void RemoveDoingTeleportTag()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(m_XardasChar.GetAbilitySystemComponent());
        abComp.RemoveTag(m_DoingTeleportTag);
    }
}

