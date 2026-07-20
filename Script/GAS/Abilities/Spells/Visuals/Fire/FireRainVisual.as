UCLASS()
class UFireRainItemDefinition : UItemDefinition
{
    default m_ItemGeneric = n"Blueprint'/Game/Items/Magic/FireRain/BP_FireRain.BP_FireRain_C'";
};

UCLASS()
class AFireRain : ASpellVisualSaveable
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

	UPROPERTY(DefaultComponent, Attach =m_RootComp)
	UHitCapsuleCollisionComponent m_HitCollisionComp;
    default m_HitCollisionComp.m_WeaponData = UFireRainDefinition::StaticClass();
    default m_HitCollisionComp.SetState(EHitColliderState::None);
    default m_HitCollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_HitCollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");
 
    default m_ItemDefinition = UFireRainItemDefinition::StaticClass();

    UPROPERTY()
    FGameplayTag m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_FireRain_Start;

    UPROPERTY()
    FVector m_SelectedSpawnPos;

    default bReplicates = true;
    default ReplicateMovement = false; 
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    TMap<AActor, FActiveGameplayEffectHandle> m_Targets;

    UPROPERTY()
    TArray<AActor> m_TargetInAreaNotReachable;
    UPROPERTY()
    UFireRainDefinition m_def;

    UPROPERTY()
    float m_StormHeight = 0;

    UPROPERTY()
    FGameplayTag m_OnApplyEnvironmentDebuff = GameplayTag::Event_Debuff_Environment;
    UPROPERTY()
    FGameplayTag m_ProjectileDebuffTag = GameplayTag::Debuff_Burn;

    default bNeverApplyTickOptimizations = true;

    const FName HEIGHT_LIFE_DATA = n"FIRERAIN_HEIGHT_LIFE_DATA";

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SetCustomCollisionResponse();
       
        if(m_HitCollisionComp.m_WeaponData != nullptr)
        {
            m_def = Cast<UFireRainDefinition>(m_HitCollisionComp.m_WeaponData.Get().GetDefaultObject());
            if(m_def != nullptr)
            {
                if(!ComesFromLoadingData())
                {
                    m_StormHeight = GetMaxHeight(m_def.m_StormHeight);
                }

                m_HitCollisionComp.SetCapsuleHalfHeight(m_def.m_StormHeight *0.5f);
                m_HitCollisionComp.SetCapsuleRadius(m_def.m_StormRadius);
                
                m_HitCollisionComp.SetState(EHitColliderState::Damage);
                ActivateOverlapTimer();
            }
        }
        
        PlayEffect(GameplayTag::FX_Magic_Spell_FireRain);
    }


    void SetCustomCollisionResponse()
    {
        m_HitCollisionComp.m_CustomCollisionResponse.Add(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
    }

    void ActivateOverlapTimer()
    {
         TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OverlapCheck"), .5f, true);
    }

    UFUNCTION(BlueprintOverride)
    void OnFillSaveData_Scriptable(FReplicatedStringMap& data)
    {
        auto height = FVector(m_StormHeight, GetLifeSpan(), 0.0f);
        AddDataInto(data, HEIGHT_LIFE_DATA, height.ToString());     
    }

    UFUNCTION(BlueprintOverride)
    void OnRecoveredSavedData_Scriptable(const FReplicatedStringMap& data)
    {
        if(ContainsData(data, HEIGHT_LIFE_DATA))
        {
            const auto heightString = GetDataFrom(data, HEIGHT_LIFE_DATA);
            FVector heightVector;
            heightVector.InitFromString(heightString);
            m_StormHeight = heightVector.X;
            SetLifeSpan(heightVector.Y);
        }    
    }

    UFUNCTION()
    void OverlapCheck()
    {
        TArray<AActor> overlappingActors;
        m_HitCollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto overlapActor : overlappingActors)
        {
            if(overlapActor == GetOwner())
                continue;
            if(CanReachTarget(overlapActor))
            {
                if(!m_Targets.Contains(overlapActor))
                {
                    UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
                    UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(overlapActor);
                    FHitResult SweepResult;
                    if(m_TargetInAreaNotReachable.Contains(overlapActor))
                    {
                        m_TargetInAreaNotReachable.Remove(overlapActor);
                    }

                    DoDamage(sourceAbComp, targetAbComp, SweepResult);
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

                    RemoveDamage(overlapActor);
                }
            }
        }
    }

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        auto owner = GetOwner();
        if(OtherActor == owner)
        {
            //m_CollisionComp.OnActorDetected.Broadcast(OtherActor);
            return;
        }

        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        
        if(targetAbComp == nullptr || m_Targets.Contains(OtherActor) || m_TargetInAreaNotReachable.Contains(OtherActor))
        {
            return;
        }

        if(targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead) /*|| targetAbComp.HasGameplayTag(GameplayTag::Character_Mount)*/)
        {
            return;
        }

        auto interactiveActor = Cast<AInteractiveGasObjectActor>(OtherActor);
        if(interactiveActor != nullptr)
        {
            auto interactiveActorAbilitySystemComponent = interactiveActor.GetAbilitySystemComponent();
            if(interactiveActorAbilitySystemComponent != nullptr)
            {
                GothicGAS::ApplyDebuffGameplayEffects(interactiveActorAbilitySystemComponent, GetDebuffGameplayEffectsToApplyWhenOverlap());
                NotifyEnvironmentDebuffToInteractableGasObjectActor(interactiveActorAbilitySystemComponent);
                interactiveActor.OnImpact();
            }
            return;
        }
        else
        {
            auto environmentSpellComp = UEnvironmentInteractableSpellComponent::Get(OtherActor);
            if(environmentSpellComp != nullptr)
            {
                NotifyEnvironmentDebuffToInteractableGasObjectActor(environmentSpellComp.m_AbComp);
                return;
            }
        }

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return;


        if(!CanReachTarget(OtherActor))
        {
            m_TargetInAreaNotReachable.Add(OtherActor);
            return;
        }

        DoDamage(sourceAbComp, targetAbComp, SweepResult);

        
    }

    void DoDamage(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, FHitResult SweepResult)
    {
        //@DE - Wait until design decides if can damage allies and summoned creatures.
        // //@DE - Avoid damage allies or players.
        // AGothicCharacter target = Cast<AGothicCharacter>(targetAbComp.GetAvatar());
        // AGothicCharacter source = Cast<AGothicCharacter>(sourceAbComp.GetAvatar());
        // auto AIController = Cast<AGothicAIController>(target.Controller);

        // if(AIController == nullptr)
        //     return;
        // if(target.IsFriendlyTowards(source))
        //     return;

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(targetAbComp.GetAvatar());
        if(targetCharacter == nullptr)
            return;

        FActiveGameplayEffectHandle handle = ApplyGameplayEffectToTarget(sourceAbComp, targetAbComp, SweepResult);
        if(MagicScript::IsValidGameplayEffectHandle(handle))
        {
            m_Targets.Add(targetAbComp.GetAvatar(), handle);
            ReportPerceptionEvent(m_PerceptionStartTag, sourceAbComp.GetAvatar(), Cast<AGothicCharacter>(targetAbComp.GetAvatar()));
        }
            
    }

    TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap() const
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_BurnInfinite::StaticClass());
        return effects;
    }

    void RemoveDamage(AActor OtherActor)
    {        
        if(!m_Targets.Contains(OtherActor))
            return;

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        if(RemoveGameplayEffectToTarget(targetAbComp, m_Targets[OtherActor]))
            m_Targets.Remove(targetAbComp.GetAvatar());
    }

    bool CanReachTarget(AActor OtherActor)
    {
        TArray<AActor> actorsIgnore;
        actorsIgnore.Add(GetOwner());
        actorsIgnore.Add(OtherActor);

        //finding the spawn point for the BP_FireRain clouds
        FHitResult hitResult;

        FVector checkPosition = OtherActor.GetActorLocation();

        //System::DrawDebugSphere(checkPosition, 5.f, 32.f, FLinearColor::Red, 15.f, 5.f);
        FVector endPos = checkPosition + FVector::UpVector * m_StormHeight;
        //System::DrawDebugSphere(endPos, 5.f, 32.f, FLinearColor::Green, 15.f, 5.f);

        //System::DrawDebugLine(checkPosition, endPos, FLinearColor::MakeRandomColor(), 20.f, 10.f);

        bool hasHit = System::LineTraceSingleByProfile(
            checkPosition,
            endPos,
            FName("IgnoreOnlyPawn"),
            false,
            actorsIgnore,
            EDrawDebugTrace::None,
            hitResult,
            true, FLinearColor::Green, FLinearColor::Red, 50.f);

        //System::DrawDebugLine(checkPosition, endPos, FLinearColor::Purple, 15.f, 5.f);
        if(hasHit)
        {
            return false;
        }
        return true;
    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(OtherActor == nullptr)
            return;
        if(CheckIsOverlappingActor(OtherActor))
            return;
        
        Log("AFireRain::OnEndOverlap " + OtherActor.Name);
        RemoveDamage(OtherActor);
        
        if(m_TargetInAreaNotReachable.Contains(OtherActor))
            m_TargetInAreaNotReachable.Remove(OtherActor);
    }

    bool CheckIsOverlappingActor(AActor OtherActor)
    {
        if(m_HitCollisionComp.GetState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        m_HitCollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }

    UFUNCTION()
    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, const FHitResult&in SweepResult)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || m_HitCollisionComp.m_WeaponData == nullptr || m_Targets.Contains(targetAbComp.GetAvatar()))
        {
            return FActiveGameplayEffectHandle();
        }

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Dot;
        hit_data.WeaponUsed = m_HitCollisionComp.m_WeaponData;
        hit_data.SourceDirection = GameplayTag::Combat_Direction_Undirectional;
        return GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, SweepResult);
    }

    UFUNCTION()
    bool RemoveGameplayEffectToTarget(UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle Handle)
    {
        if(TargetAbComp != nullptr && m_Targets.Contains(TargetAbComp.GetAvatar()))
        {
            // UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
            // UWeaponDefinition weapon_def = Cast<UWeaponDefinition>(m_CollisionComp.m_WeaponData.Get().GetDefaultObject());
            // TargetAbComp.RemoveActiveGameplayEffectBySourceEffect(weapon_def.GetHitEffect().Class, sourceAbComp);	

            return TargetAbComp.RemoveActiveGameplayEffect(Handle);
            //return true;
        }
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        System::ClearAndInvalidateTimerHandle(TaskTimer);
        m_HitCollisionComp.SetState(EHitColliderState::None);

        m_HitCollisionComp.OnComponentBeginOverlap.Unbind(this, n"OnBeginOverlap");
        for(auto target : m_Targets)
        {
            UGothicAbilitySystemComponent targetGothicAbComp = Cast<UGothicAbilitySystemComponent>(GothicGAS::GetAbilitySystemComponent(target.Key));
            if(targetGothicAbComp != nullptr)
               RemoveGameplayEffectToTarget(targetGothicAbComp, target.Value);
        }

        m_TargetInAreaNotReachable.Empty();
    }

    UFUNCTION(BlueprintOverride)
    void OnSpellDisplayDebugImGui() const
    {  
        System::DrawDebugCapsule(m_HitCollisionComp.GetWorldLocation(), 
            m_HitCollisionComp.CapsuleHalfHeight, m_HitCollisionComp.CapsuleRadius,
            m_HitCollisionComp.WorldRotation, FLinearColor::Red, 0.f, 5.f);
    }

    UFUNCTION(BlueprintCallable, BlueprintPure)
    float AdjustHeightOnInterior(float Height)
    {
        //return Height;
        //FVector selectedPosition = GetMaxHeight(Height);
        //System::DrawDebugSphere(selectedPosition, 5.f, 32.f, FLinearColor::Green, 15.f, 5.f);
        //System::DrawDebugSphere(selectedPosition, 100.f, 32, FLinearColor::MakeRandomColor(), 20.f, 10.f);
        //Print(FString::ApplyFormat(selectedPosition.Z, FString()), 15.f, FLinearColor::Purple);
        return GetMaxHeight(Height);//selectedPosition.Z;
    }

    float GetMaxHeight(float ConfigHeight) const
    {
        if(!IsValid(Owner))
            return ConfigHeight;

        FVector originalPos = Owner.GetActorLocation();
        float maxHigh = ConfigHeight;

        FVector currentCheckPos = originalPos;

        TArray<AActor> actorsIgnore;
        actorsIgnore.Add(Owner);
        auto actorsAround = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter, currentCheckPos, 500.0f);
        actorsIgnore.Append(actorsAround);

        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);

        //finding the spawn point for the BP_FireRain clouds
        FHitResult hitResult;
        FVector endPos = currentCheckPos + FVector::UpVector * ConfigHeight;

        //System::DrawDebugSphere(CheckPosition, 30.f, 32, FLinearColor::MakeRandomColor(), 20.f, 10.f);
        //System::DrawDebugSphere(endPos, 30.f, 32, FLinearColor::MakeRandomColor(), 20.f, 10.f);

        FVector newEndPos = currentCheckPos + FVector(0,0,200);

        bool hasHit = System::BoxTraceSingle(
            newEndPos,
            endPos,
            FVector(75.f,75.f,75.f),
            FRotator::ZeroRotator,
            trace_type,
            false,
            actorsIgnore,
            EDrawDebugTrace::None,
            hitResult,
            true, FLinearColor::Green, FLinearColor::Red, 25.f);

        if(hasHit)
        {
            maxHigh =  hitResult.ImpactPoint.Z - currentCheckPos.Z;
            //Print(FString(hitResult.Actor.GetName()), 25.f);
            //System::DrawDebugSphere(hitResult.ImpactPoint, 30.f, 32, FLinearColor::Red, 20.f, 10.f);
        }
       
        // CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        // currentCheckPos = originalPos + FVector::ForwardVector * 100.f;
        // CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        // currentCheckPos = originalPos + -FVector::ForwardVector * 100.f;
        // CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        // currentCheckPos = originalPos + FVector::RightVector * 100.f;
        // CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        // currentCheckPos = originalPos + -FVector::RightVector * 100.f;
        // CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        //return m_SelectedSpawnPos;
        return Math::Min(ConfigHeight, maxHigh);
    }

    void CheckSpawnPosition(FVector CurrentCheckPos, float& MaxHeight, float ConfigHeight) const
    {
        FVector newHeightPosition = GetHigherSpawnLocation(CurrentCheckPos, ConfigHeight);
        float newHeight = newHeightPosition.Z - CurrentCheckPos.Z;
        
        if(newHeight > MaxHeight)
        {
            //Print(FString::ApplyFormat(newHeight, FString()));
            MaxHeight = newHeight;
        }
    }


    FVector GetHigherSpawnLocation(FVector CheckPosition, float Height) const
    {
        TArray<AActor> actorsIgnore;
        actorsIgnore.Add(Owner);

        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);

        //finding the spawn point for the BP_FireRain clouds
        FHitResult hitResult;
        FVector endPos = CheckPosition + FVector::UpVector * Height;

        //System::DrawDebugSphere(CheckPosition, 30.f, 32, FLinearColor::MakeRandomColor(), 20.f, 10.f);
        //System::DrawDebugSphere(endPos, 30.f, 32, FLinearColor::MakeRandomColor(), 20.f, 10.f);

        bool hasHit = System::LineTraceSingle(
            CheckPosition,
            endPos,
            trace_type,
            false,
            actorsIgnore,
            EDrawDebugTrace::None,
            hitResult,
            true);

        if(hasHit)
        {
            return hitResult.ImpactPoint;
        }
        return endPos;
    }

    void ReportPerceptionEvent(FGameplayTag PerceptionTag, AActor InstigatorActor, AGothicCharacter Target)
    {
        if (Target == nullptr)
            return;

        Target.Perception.ReportPerceptionEvent(
            PerceptionTag,
            Target.ActorLocation,
            SensedCharacter = Target,
            TargetActor = Target,
            InstigatorActor = InstigatorActor,
            AffectedActor = Target
        );
    }

    //@DE - They need know each application of the interactable debuff effect. I send the event due the GE is not applied if it already applied
    void NotifyEnvironmentDebuffToInteractableGasObjectActor(UAbilitySystemComponent InteractiveActorAbilitySystemComponent)
    {
        InteractiveActorAbilitySystemComponent.SendGameplayEvent(m_OnApplyEnvironmentDebuff, GetPayloadEnvironmentDebuff());
    }

    FGameplayEventData GetPayloadEnvironmentDebuff()
    {
        FGameplayEventData payload = FGameplayEventData();
        payload.EventTag = m_ProjectileDebuffTag;
        payload.Instigator = this;
        return payload;
    }
};