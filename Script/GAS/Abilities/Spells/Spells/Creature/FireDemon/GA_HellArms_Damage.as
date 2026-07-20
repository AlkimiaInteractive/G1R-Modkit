class UGA_HellArms_Damage : UGameplayAblilitySpellDamageNotify
{
    UPROPERTY()
    AFireDemonHellArmVisual m_hellArm;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable()
    {
        DoAttack();
    }

    UFUNCTION(BlueprintCallable)
    void DoAttack()
    {
        m_hellArm = Cast<AFireDemonHellArmVisual>(GetAvatarActorFromActorInfo());
        if(m_hellArm == nullptr)
            EndAbility();

        auto montage = m_hellArm.GetRandomMontage();
        if(montage == nullptr)
            EndAbility();

        PlayMontageTask(montage);
    }

    UFUNCTION(BlueprintOverride)
    void OnNotifyDamageBegin_Scriptable(float TotalDuration)
    {
        if(m_hellArm != nullptr)
            m_hellArm.EnableCollision();

    }

    UFUNCTION(BlueprintOverride)
    void OnNotifyDamageEnd_Scriptable()
    {
        if(m_hellArm != nullptr)
            m_hellArm.DisableCollision();
    }

    UFUNCTION(BlueprintOverride)
    void OnCompleted_Scriptable()
    {
        DestroyArm();
        DoEndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnInterrupted_Scriptable()
    {
        DestroyArm();
        DoEndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnCancelled_Scriptable()
    {
        DestroyArm();
        DoEndAbility();
    }

    void DestroyArm()
    {
        if(m_hellArm != nullptr)
            m_hellArm.DoDestroyActor();
    }
}