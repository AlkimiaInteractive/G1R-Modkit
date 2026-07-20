class UGA_GolemStone_FX_Crackle : UGA_Creature_FX_Sound
{
    UPROPERTY()
    FGameplayTag m_StartTeleportTag = GameplayTag::Event_Teleport_StoneGolem_Start;
    UPROPERTY()
    FGameplayTag m_EndTeleportTag = GameplayTag::Event_Teleport_StoneGolem_End;

    default AbilityTags.AddTag(GameplayTag::Ability_Creature_Golem_Stone_Crackle);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_Golem_Stone_Crackle);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_Golem_Stone_Crackle);

    default m_FxTag = GameplayTag::FX_Creature_Golem_Stone_Crackle;

    UPROPERTY()
    UDelegateHandleContainer m_StartTeleportHandle;
    UPROPERTY()
    UDelegateHandleContainer m_EndTeleportHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        m_StartTeleportHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), m_StartTeleportTag, this, n"OnStartTeleport");
        m_EndTeleportHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), m_EndTeleportTag, this, n"OnEndTeleport");
    }

    UFUNCTION()
    void OnStartTeleport()
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = gothicChar.GetFXComponent();
        if(fxComponent == nullptr)
            return;
        fxComponent.StopFXInstance(m_HoldSFXHandle, false);   
    }

    UFUNCTION()
    void OnEndTeleport()
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = gothicChar.GetFXComponent();
        if(fxComponent == nullptr)
            return;
        fxComponent.StopFXInstance(m_HoldSFXHandle, false);   
        m_HoldSFXHandle = fxComponent.PlayEffect(m_FxTag, nullptr); 
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_StartTeleportHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_EndTeleportHandle);
        Super::OnEndAbility_Scriptable(GameplayAbilityActorInfo, WasCancelled);
    }
    
}