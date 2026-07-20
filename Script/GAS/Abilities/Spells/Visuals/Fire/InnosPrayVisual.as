UCLASS()
class AInnosPray : ASpellVisual
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

	UPROPERTY(DefaultComponent, Attach =m_RootComp)
	UHitCapsuleCollisionComponent m_CollisionComp;
    default m_CollisionComp.m_WeaponData = UInnosPrayDefinition::StaticClass();
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY()
    FVector m_SelectedSpawnPos;

    default bReplicates = true;
    default ReplicateMovement = false; 

    UPROPERTY()
    UInnosPrayDefinition m_def;

    default bNeverApplyTickOptimizations = true;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SetCustomCollisionResponse();
        if(m_CollisionComp.m_WeaponData != nullptr)
        {
            m_def = Cast<UInnosPrayDefinition>(m_CollisionComp.m_WeaponData.Get().GetDefaultObject());
            if(m_def != nullptr)
            {
                m_CollisionComp.SetCapsuleHalfHeight(m_def.m_StormHeight *0.5f);
                m_CollisionComp.SetCapsuleRadius(m_def.m_StormRadius);
                SetLifeSpan(m_def.m_LifeTime);
                m_CollisionComp.SetState(EHitColliderState::Damage);
            }
        }
    }

    void SetCustomCollisionResponse()
    {
        m_CollisionComp.m_CustomCollisionResponse.Add(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
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

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        
        if(targetAbComp == nullptr)
        {
            return;
        }

        if(targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return;
        }

        //TODO check if is colliding with the FireBeacon then apply a lit on or a gameplayevent
        #ifdef WITH_STORY_G1R
		if (G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr 
			&& G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasBeenStarted())
		{
			const auto interactiveActor = Cast<AInteractiveGasObjectActor>(OtherActor);
            if(interactiveActor == nullptr || !interactiveActor.GetRootComponent().ComponentHasTag(FName("InnosPray")))
                return;
            auto fireComponent = interactiveActor.GetFireComponent();
            fireComponent.StartLit();
		}
        #endif /* #if WITH_STORY_G1R */
        
    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(OtherActor == nullptr)
            return;
        Log("AInnosPray::OnEndOverlap " + OtherActor.Name);
        //RemoveDamage(OtherActor);
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        m_CollisionComp.SetState(EHitColliderState::None);
        m_CollisionComp.OnComponentBeginOverlap.Unbind(this, n"OnBeginOverlap");
    }

    UFUNCTION(BlueprintOverride)
    void OnSpellDisplayDebugImGui() const
    {  
        System::DrawDebugCapsule(m_CollisionComp.GetWorldLocation(), 
            m_CollisionComp.CapsuleHalfHeight, m_CollisionComp.CapsuleRadius,
            m_CollisionComp.WorldRotation, FLinearColor::Red, 0.f, 5.f);
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

    float GetMaxHeight(float ConfigHeight)
    {
        FVector originalPos = Owner.GetActorLocation();
        float maxHigh = 0;

        FVector currentCheckPos = originalPos;
        CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);
       

        currentCheckPos = originalPos + FVector::ForwardVector * 100.f;
        CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        currentCheckPos = originalPos + -FVector::ForwardVector * 100.f;
        CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        currentCheckPos = originalPos + FVector::RightVector * 100.f;
        CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        currentCheckPos = originalPos + -FVector::RightVector * 100.f;
        CheckSpawnPosition(currentCheckPos,  maxHigh, ConfigHeight);

        //return m_SelectedSpawnPos;
        return Math::Min(ConfigHeight, maxHigh);
    }

    void CheckSpawnPosition(FVector CurrentCheckPos, float& MaxHeight, float ConfigHeight)
    {
        FVector newHeightPosition = GetHigherSpawnLocation(CurrentCheckPos, ConfigHeight);
        float newHeight = newHeightPosition.Z - CurrentCheckPos.Z;
        
        if(newHeight > MaxHeight)
        {
            //Print(FString::ApplyFormat(newHeight, FString()));
            MaxHeight = newHeight;
        }
    }


    FVector GetHigherSpawnLocation(FVector CheckPosition, float Height)
    {
        TArray<AActor> actorsIgnore;
        actorsIgnore.Add(Owner);

        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);

        //finding the spawn point for the BP_InnosPray clouds
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
};