UCLASS()
class UGA_Summon_Demon : UGA_Summon_NotVisible
{
    default m_PlayRate = 1.f;
    //default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Movement/Summon/Summoned_In_Montage.Summoned_In_Montage'"));
}

UCLASS()
class UGA_Summon_FireDemon : UGA_Summon_Demon
{
    default m_PlayRate = 1.f;
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Movement/Summon/Summoned_In_Montage.Summoned_In_Montage'"));
    UPROPERTY()
    TSoftObjectPtr<UAnimMontage> m_BloodMontage = TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Movement/Summon/Come_In_WithBlood_Montage.Come_In_WithBlood_Montage'");
    
    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        if(Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).HasGameplayTag(GameplayTag::Visuals_Creature_Demon_Fire_Blood))
            m_MontageToPlay = m_BloodMontage;
    }
}

UCLASS()
class UGA_Summon_LordDemon : UGA_Summon_Demon
{
    default m_PlayRate = 1.f;
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/LordDemon/Summon/Summoned_In_Montage.Summoned_In_Montage'"));
}


UCLASS()
class UGA_Summon_LesserDemon : UGA_Summon_Demon
{
    default m_PlayRate = 1.f;
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Summon/Summoned_In_Montage.Summoned_In_Montage'"));
}

UCLASS()
class UGA_Summon_LesserDemon_Kasorg : UGA_Summon_LesserDemon
{
    default m_EnableRandomDelayOnSummonAnim = true;
}

UCLASS()
class UGA_Summon_CorKalomDemon : UGA_Summon_Demon
{
    default m_PlayRate = 1.f;
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/A_LordDemon_SleeperAltar_Transform_Montage.A_LordDemon_SleeperAltar_Transform_Montage'"));
    UPROPERTY()
    AKalomTranceCharge m_KalomTranceChargeActor;

    UPROPERTY()
    FName m_TeleportWayPointActorName = n"FP_SC_CORKALOMDEMON_SPAWN_FAIL";

    
    UPROPERTY()
    UDelegateHandleContainer m_BreakFloorHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        auto gothicMovementComp = UGothicMovementComponent::Get(GetAvatarActorFromActorInfo());
        gothicMovementComp.SetCheatFlying(true);

        TArray<ACorKalomDemonCollider> outActors;
        GetAllActorsOfClass(ACorKalomDemonCollider::StaticClass(), outActors);
        if(!outActors.IsEmpty())
        {
            outActors[0].m_ColliderMesh.IgnoreActorWhenMoving(GetAvatarActorFromActorInfo(), true);
            Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).CapsuleComponent.IgnoreActorWhenMoving(outActors[0], true);
        }

        TArray<AKalomTranceCharge> outKalomActors;
        GetAllActorsOfClass(AKalomTranceCharge::StaticClass(), outKalomActors);
        if(!outKalomActors.IsEmpty())
        {            
            m_KalomTranceChargeActor = outKalomActors[0];
            m_KalomTranceChargeActor.m_CorKalomDemonCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
            m_KalomTranceChargeActor.OnCorKalomDemonSpawned();
        }   

        m_BreakFloorHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Anim_MadCorKalom_GroundBreaking, this, n"OnBreakFloor");

    }

    UFUNCTION()
    void OnBreakFloor()
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_BreakFloorHandle);
        if(m_KalomTranceChargeActor == nullptr)
            return;

        m_KalomTranceChargeActor.OnBreakFloor();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        Super::OnEndAbility_Scriptable(GameplayAbilityActorInfo, WasCancelled);
        auto gothicMovementComp = UGothicMovementComponent::Get(GetAvatarActorFromActorInfo());
        gothicMovementComp.SetCheatFlying(false);

        TArray<ACorKalomDemonCollider> outActors;
        GetAllActorsOfClass(ACorKalomDemonCollider::StaticClass(), outActors);
        if(!outActors.IsEmpty())
        {
            outActors[0].m_ColliderMesh.IgnoreActorWhenMoving(GetAvatarActorFromActorInfo(), false);
            Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).CapsuleComponent.IgnoreActorWhenMoving(outActors[0], false);
        }

        auto demonComp = UMadCorKalomDemonFightComponent::Get(GetAvatarActorFromActorInfo());
        if(demonComp != nullptr)
        {
            //@DE - Something interrupted the anim
            if(WasCancelled)
            {
                demonComp.OnDeadLock();
            }
        }
    }

    
}
