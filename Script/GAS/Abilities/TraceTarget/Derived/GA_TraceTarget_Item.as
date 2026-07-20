class UGA_TraceTarget_Item : UGA_TraceTarget_Base
{
    // ItemWorldVisual trace (ECC_GameTraceChannel18) -> 	//ECollisionChannel::ECC_GameTraceChannel18 is ItemWorldVisualTrace

    default m_DrawDebugType = EDrawDebugTrace::None;
    default m_CollisionChannel = ECollisionChannel::ECC_GameTraceChannel18;

    default m_TraceDetectedTag = GameplayTag::State_TraceTarget_ItemDetected;

    default m_TickEnabled = true;
    default m_bCanEverTick = true;

    // bool IsValidTarget(AActor TargetActor) override
    // {
    //     AItemVisualWorld item = Cast<AItemVisualWorld>(TargetActor);
    //     if(item == nullptr)
    //         return false;
    //     if(IsBeingUsedByOtherActor(item))
    //         return false;
    //     if(!IsVisible(item))
    //         return false;

    //     return Super::IsValidTarget(TargetActor);
    // }

    bool IsBeingUsedByOtherActor(const AActor TargetActor) const override
    {
        if(TargetActor == nullptr)
            return false;

        UInteractiveComponent interactComp = Cast<UInteractiveComponent>(TargetActor.GetComponentByClass(UInteractiveComponent::StaticClass()));
        if(interactComp != nullptr)
        {
            // if(interactComp.IsAssociatedToAnActor())
            //     Print("Is Associated to an actor", 5.f, FLinearColor::Red);
            // else
            //     Print("Is NOT Associated to an actor", 5.f, FLinearColor::Green);
            return interactComp.IsAssociatedToAnActor();
        }
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnUpdateAbility_Scriptable(float DeltaTime)
    {
        // if(m_Item == nullptr)
        //     return;
        // auto interactiveComp = Cast<UInteractiveComponent>(m_Item.GetComponentByClass(UInteractiveComponent::StaticClass()));
        // if(interactiveComp == nullptr)
        //     return;

        // auto isBeingUsed = interactiveComp.GetIsBeingUsed();
        // auto actorToInteract = interactiveComp.GetActorToInteract();

        // FString toPrint = FString("Is being used: ");
        // toPrint.Append(isBeingUsed ? FString("True - Actor to interact: ") : FString("False - Actor to interact: "));
        // toPrint.Append(FString(actorToInteract == nullptr ? FString("None") : actorToInteract.GetName().ToString()));
        // Print(toPrint);
    }

    UInteractiveComponent GetInteractiveComponent(AActor TargetActor)
    {
        if(TargetActor == nullptr)
            return nullptr;

        return Cast<UInteractiveComponent>(TargetActor.GetComponentByClass(UInteractiveComponent::StaticClass()));
    }


    void RemoveOutliner(AActor TargetActor) override
    {
        Super::RemoveOutliner(TargetActor);
        auto outliner = GetOutlinerController();
        UInteractiveComponent interactiveComp = GetInteractiveComponent(TargetActor);
        if(outliner != nullptr && interactiveComp != nullptr)
        {
            outliner.QueueRemoveOutline(interactiveComp);
        }
    }


    void UpdateOutliner(AActor TargetActor) override
    {
        Super::UpdateOutliner(TargetActor);
        
        auto outliner = GetOutlinerController();
        UInteractiveComponent interactiveComp = GetInteractiveComponent(TargetActor);
        if(outliner == nullptr || interactiveComp == nullptr)
            return;

        if(IsBeingUsedByOtherActor(TargetActor))
        {
            if(GetTarget() == nullptr)
            {
                outliner.AddOutline(interactiveComp, EStencilsUsage::TelekinesisOutOfRange);
            }
            else
            {
                outliner.AddOutline(interactiveComp, EStencilsUsage::OutlineAction, true);
            }
            return;
        }
        else
        {
            EStencilsUsage newStencil = EStencilsUsage::OutlineAction;
            bool isValidDistance = IsTargetAtValidDistance(TargetActor);
            if(!isValidDistance)
                newStencil = EStencilsUsage::TelekinesisOutOfRange;
                    
            outliner.AddOutline(interactiveComp, newStencil);
        }
    }

    bool IsVisible(AActor TargetActor) override
    {
        if(Super::IsVisible(TargetActor))
            return true;
        return CheckTargetFromDirectionAndImpactPoint(TargetActor);
    }

    bool CheckTargetFromDirectionAndImpactPoint(AActor TargetActor)
    {
        FVector origin = m_LastHitResult.ImpactPoint;
        auto casterCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());

        TArray<AActor> actors_ignore;
        actors_ignore.Add(TargetActor.GetOwner()); // To ignore the character holding a pouch. May also work for other item types.

        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);
        FHitResult hit_result;

        bool hits = System::LineTraceSingle(
            origin,
            casterCharacter.GetActorLocation(),
            trace_type,
            true,
            actors_ignore,
            EDrawDebugTrace::None,
            hit_result,
            true,
            FLinearColor::Green,
            FLinearColor::Red,
            5.5f
        );
             //System::DrawDebugSphere(DesiredPosition, 3.f, 12.f, FLinearColor::Gray, 5.f, 15.f);    
        if(!hits || hit_result.GetActor() != GetAvatarActorFromActorInfo())
        {
            return false;
        }

        trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_GameTraceChannel15); //Folliage channel

        hits = System::LineTraceSingle(
            origin,
            casterCharacter.GetActorLocation(),
            trace_type,
            true,
            actors_ignore,
            EDrawDebugTrace::None,
            hit_result,
            true,
            FLinearColor::Green,
            FLinearColor::Red,
            5.5f
        );
        if(!hits || hit_result.GetActor() != GetAvatarActorFromActorInfo())
        {
            return false;
        }
        return true;
    }
}