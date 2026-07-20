UCLASS()
class UGA_Summon_XardasSleeper_Skeleton : UGA_Summon
{
    default	TriggerBeginOn(GameplayTag::Action_DoSummon);
    default m_PlayRate = 1.f;
    
    UPROPERTY()
    float m_CollisionActivationOffsetTime = 1.f;
    
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Skeleton/Chained/A_SkeletonSleeper_Chained_Out_01_Montage.A_SkeletonSleeper_Chained_Out_01_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Skeleton/Chained/A_SkeletonSleeper_Chained_Out_02_Montage.A_SkeletonSleeper_Chained_Out_02_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Skeleton/Chained/A_SkeletonSleeper_Chained_Out_03_Montage.A_SkeletonSleeper_Chained_Out_03_Montage'")); // Need more displacement
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Skeleton/Chained/A_SkeletonSleeper_Chained_Out_04_Montage.A_SkeletonSleeper_Chained_Out_04_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Skeleton/Chained/A_SkeletonSleeper_Chained_Out_05_Montage.A_SkeletonSleeper_Chained_Out_05_Montage'"));

    UPROPERTY()
    UDelegateHandleContainer m_OnActivateVisuals;

    UPROPERTY()
    UDelegateHandleContainer m_OnStateFallingRequest;

    UPROPERTY()
    bool m_TriggeredVisuals = false;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        if(!HasAuthority())
            return;

        Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).AddTag(GameplayTag::State_Scripting_Action);
        m_TriggeredVisuals = false;
        m_OnActivateVisuals = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_Skeletons_ActivateVisuals, this, n"OnActivateVisuals");
        m_OnStateFallingRequest = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::State_Falling, this, n"OnStateFallingRequest");
    }

    
    UFUNCTION()
    void OnStateFallingRequest(FGameplayEventData GameplayEventData)
    {
        //Print(FString("OnStateFallingRequest"));
        auto Character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());

        Character.GothicMovementComponent.SetMovementMode(EMovementMode::MOVE_Falling);
        auto summonedComp = UXardasSleeperSkeletonsSummonedComponent::Get(GetAvatarActorFromActorInfo());
        summonedComp.RestoreCharacterMovementAndCollisions(Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()));

        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnStateFallingRequest);
    }

    UFUNCTION()
    void OnActivateVisuals(FGameplayEventData GameplayEventData)
    {
        TriggerOnceActivateVisuals();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        Super::OnEndAbility_Scriptable(GameplayAbilityActorInfo, WasCancelled);
        if(!HasAuthority())
            return;

        //@DE - On case of interrumption, avoid block the flow.
        TriggerOnceActivateVisuals();
        Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).RemoveTag(GameplayTag::State_Scripting_Action);
        
        auto summonedComp = UXardasSleeperSkeletonsSummonedComponent::Get(GetAvatarActorFromActorInfo());
        summonedComp.RestoreCharacterMovementAndCollisions(Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()), true);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnStateFallingRequest);
        
        GameplayAbilityActorInfo.GetAbilitySystemComponent().SendGameplayEvent(GameplayTag::Event_DoSummon_Completed, FGameplayEventData());
        FGameplayAbilitySpec OutSpec;
        GetAbilitySystemComponentFromActorInfo().FindAbilitySpecFromClass(GetClass(), OutSpec);
        GetAbilitySystemComponentFromActorInfo().ClearAbility(OutSpec.Handle);
        
    }
    
    void TriggerOnceActivateVisuals()
    {
        if(!HasAuthority())
            return;
        if(m_TriggeredVisuals == true)
            return;

        m_TriggeredVisuals = true;
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnActivateVisuals);
        auto summonedComp = UXardasSleeperSkeletonsSummonedComponent::Get(GetAvatarActorFromActorInfo());
        summonedComp.OnActivateVisuals();
    }
}
