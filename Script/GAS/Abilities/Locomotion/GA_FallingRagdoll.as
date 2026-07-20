class UGA_FallingRagdoll : UGA_Falling
{
    default AbilityTags.AddTag(GameplayTag::Ability_Falling_Ragdoll);
    default AbilityTags.RemoveTag(GameplayTag::Ability_Movement);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Falling_Ragdoll);

    UPROPERTY()
	ARagdollFallingActor m_RagdollFallingActor = nullptr;
	UPROPERTY()
	float m_StartFallingZPosition;
    

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        m_StartFallingZPosition = GetStartFallingZPositionFromDatamodule();
        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).LandedDelegate.UnbindObject(this);
	
	    auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());

	    m_RagdollFallingActor = Cast<ARagdollFallingActor>(SpawnActor(ARagdollFallingActor::StaticClass(), gothicChar.GetActorLocation(), FRotator::ZeroRotator, FName("ARagdollFallingActor")));
        m_RagdollFallingActor.OnWorldOverlap.BindUFunction(this, n"OnWorldOverlap");
        m_RagdollFallingActor.Initialize(gothicChar);
    }

    UFUNCTION()
    void OnWorldOverlap(const FHitResult& SweepResult)
    {
        const float fallingDistance = Math::Abs(GetAvatarActorFromActorInfo().GetActorLocation().Z - m_StartFallingZPosition);

        //@DE - Removed unnecessary condition.
        // dont apply ragdoll damage when slow!
        //const float velocityZ = Math::Abs(GetAvatarActorFromActorInfo().GetVelocity().Z);
        //if (velocityZ >= 200.0f)
        //{
            Server_CheckApplyDamage(fallingDistance);
        //}

	    m_StartFallingZPosition = GetStartFallingZPositionFromDatamodule();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_FallingRagdoll::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);
        
        if(m_RagdollFallingActor != nullptr)
            m_RagdollFallingActor.DestroyActor();

	    Super::OnEndAbility_Scriptable(Info, WasCancelled);
    }
}

