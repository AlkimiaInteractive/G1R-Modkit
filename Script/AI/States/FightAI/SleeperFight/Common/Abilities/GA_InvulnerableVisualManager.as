UCLASS()
class UGA_InvulnerableVisualManager : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    UDelegateHandleContainer m_OnActivateInvulnerableVisualHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnDeactivateInvulnerableVisualHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnSpawnExplosionVisualHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnSpawnShieldVisualHandle;

    UPROPERTY()
    UInvulnerableVisualComponent m_InvVisualComp;
    UPROPERTY()
    bool m_ShouldCreateVisual = true;
        UPROPERTY()
    UDelegateHandleContainer m_OnDieMeBeforeHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_InvVisualComp = GetInvulnerableVisualComponent();
        m_InvVisualComp.CreateInvulnerableVisual(GetAvatarActorFromActorInfo());

        //Bind activate and deactivate tags
        //Bind ondeath deactivate tag.
        //Avoid multiple activation


        m_OnDieMeBeforeHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Die_Me_Before, this, n"DoEndAbility");

        m_OnActivateInvulnerableVisualHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Visuals_Invulnerable_Activate, this, n"OnActivateInvulnerableVisual");
        m_OnDeactivateInvulnerableVisualHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Visuals_Invulnerable_Deactivate, this, n"OnDeactivateInvulnerableVisual");
        //@DE - Custom activation and explosion visual for teleports while the loop visual is active
        m_OnSpawnExplosionVisualHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Visuals_Invulnerable_SpawnExplosion, this, n"OnSpawnExplosionVisual");
        m_OnSpawnShieldVisualHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Visuals_Invulnerable_SpawnShield, this, n"OnSpawnShieldVisual");
        

    }

    UInvulnerableVisualComponent GetInvulnerableVisualComponent()
    {
        return nullptr;
    }

    UFUNCTION()
    void OnActivateInvulnerableVisual(FGameplayEventData EventData)
    {
        if(m_InvVisualComp != nullptr)
            m_InvVisualComp.ActivateInvulnerableVisual();
    }

    UFUNCTION()
    void OnDeactivateInvulnerableVisual(FGameplayEventData EventData)
    {
        if(m_InvVisualComp != nullptr)
            m_InvVisualComp.DeactivateInvulnerableVisual();
    }
    //@DE - Custom activation and explosion visual for teleports while the loop visual is active
    UFUNCTION()
    void OnSpawnExplosionVisual(FGameplayEventData EventData)
    {
        if(m_InvVisualComp != nullptr)
            m_InvVisualComp.SpawnExplosionVisual();
    }

    //@DE - Custom activation and explosion visual for teleports while the loop visual is active
    UFUNCTION()
    void OnSpawnShieldVisual(FGameplayEventData EventData)
    {
        if(m_InvVisualComp != nullptr)
            m_InvVisualComp.SpawnShieldVisual();
    }

    UFUNCTION()
    void DoEndAbility(FGameplayEventData EventData)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeHandle);
        if(m_InvVisualComp != nullptr)
            m_InvVisualComp.DestroyInvulnerableVisual();
        EndAbility();
    }

    void ClearBindings()
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnActivateInvulnerableVisualHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDeactivateInvulnerableVisualHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnSpawnExplosionVisualHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnSpawnShieldVisualHandle);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        ClearBindings();
        if(m_InvVisualComp != nullptr)
            m_InvVisualComp.DestroyInvulnerableVisual();
    }
}