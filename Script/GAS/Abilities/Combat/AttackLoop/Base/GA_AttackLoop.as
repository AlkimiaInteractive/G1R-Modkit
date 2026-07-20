USTRUCT() 

struct FNonReachableHitData
{
    UPROPERTY()
    UPrimitiveComponent m_AttackerHitComp;
    UPROPERTY()
    FHitResult m_HitResult;

    FNonReachableHitData(UPrimitiveComponent AttackerHitComp, FHitResult HitResult)
    {
        m_AttackerHitComp = AttackerHitComp;
        m_HitResult = HitResult;
    }
}

class UGA_AttackLoop : UGameplayAbilityAttackLoop
{
    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
    
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    TArray<AActor> m_TargetInAreaNotReachable;

    UPROPERTY()
    TMap<AActor, FNonReachableHitData> m_NonReachableHits;

    UFUNCTION(BlueprintOverride)
    void OnNotifyBegin_Scriptable()
    {
        ActivateOverlapTimer();
    }


    UFUNCTION(BlueprintOverride)
    void OnNotifyEnd_Scriptable()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }


    UFUNCTION(BlueprintOverride)
    bool IsValidTarget_Scriptable(AActor Target)
    {
        auto gothicChar = Cast<AGothicCharacter>(Target);
        if(gothicChar == nullptr)
            return false;
        return true;
    }

    void ActivateOverlapTimer()
    {
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OverlapCheck"), .5f, true);
    }

    UFUNCTION(BlueprintOverride)
    void OnNonValidTarget_Scriptable(UPrimitiveComponent HitComp, FHitResult Hit)
    {
        auto target = Hit.GetActor();
        if(m_NonReachableHits.Contains(target))
            return;
        m_NonReachableHits.Add(target, FNonReachableHitData(HitComp, Hit));
    }

    UFUNCTION()
    void OverlapCheck()
    {
        TArray<AActor> overlappingActors = GetOverlappingActorsFromHitTask(AGothicCharacter::StaticClass());
        
        for(auto overlapActor : overlappingActors)
        {
            if(overlapActor == GetAvatarActorFromActorInfo())
                continue;
            if(CanReachTarget(overlapActor))
            {
                if(!m_Targets.Contains(overlapActor))
                {
                    if(m_TargetInAreaNotReachable.Contains(overlapActor))
                    {
                        m_TargetInAreaNotReachable.Remove(overlapActor);
                    }
                    UPrimitiveComponent HitComp = m_CollisionComponent; 
                    FHitResult Hit = FHitResult();
                    Hit.Actor = overlapActor;
                    if(m_NonReachableHits.Contains(overlapActor))
                    {
                        HitComp = m_NonReachableHits[overlapActor].m_AttackerHitComp;
                        Hit = m_NonReachableHits[overlapActor].m_HitResult;
                    }
                    OnOverlapEnterDamage(HitComp, Hit);
                }
            }
            else
            {
                if(m_Targets.Contains(overlapActor))
                {
                    if(!m_TargetInAreaNotReachable.Contains(overlapActor))
                    {
                        m_TargetInAreaNotReachable.Add(overlapActor);
                    }

                    OnOverlapExit(overlapActor);
                }
            }
        }
    }

    TArray<AActor> GetOverlappingActors()
    {
        return TArray<AActor>();
    }

    FVector GetShapeOriginPosition()
    {
        auto socketName = m_CollisionComponent.GetAttachSocketName();
        auto mesh = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).Mesh;
        return mesh.GetSocketLocation(socketName);
    }

    bool CanReachTarget(AActor OtherActor)
    {
        TArray<AActor> actorsIgnore;
        actorsIgnore.Add(GetAvatarActorFromActorInfo());
        actorsIgnore.Add(OtherActor);

        //finding the spawn point for the BP_FireRain clouds
        FHitResult hitResult;

        FVector checkPosition = OtherActor.GetActorLocation();

        //System::DrawDebugSphere(checkPosition, 5.f, 32.f, FLinearColor::Red, 15.f, 5.f);
        FVector endPos = GetShapeOriginPosition();//Tiene que ser el anchor point de la shape no el size
        //System::DrawDebugSphere(endPos, 5.f, 32.f, FLinearColor::Green, 15.f, 5.f);

        //System::DrawDebugLine(checkPosition, endPos, FLinearColor::Black, 20.f, 10.f);

        bool hasHit = System::LineTraceSingleByProfile(
            checkPosition,
            endPos,
            FName("IgnoreOnlyPawn"),
            false,
            actorsIgnore,
            EDrawDebugTrace::None,
            hitResult,
            true, FLinearColor::Green, FLinearColor::Red, 5.f);

        //System::DrawDebugLine(checkPosition, endPos, FLinearColor::Purple, 15.f, 5.f);
        if(hasHit)
        {
            return false;
        }
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo, bool WasCancelled)
    {
        if(!m_Targets.IsEmpty())
        {
            for(auto target : m_Targets)
            {
                OnOverlapExit(target.Key);
            }
                
        }

        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }
}