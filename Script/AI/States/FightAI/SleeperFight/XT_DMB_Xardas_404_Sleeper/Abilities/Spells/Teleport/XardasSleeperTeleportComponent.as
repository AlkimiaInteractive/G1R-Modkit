delegate void FGameplayTeleportDelegate();

class UXardasSleeperTeleportComponent : UCreatureTeleportComponent
{
    // UPROPERTY()
    // FGameplayTeleportDelegate OnMovementCompletedDelegate;

    UPROPERTY()
    TArray<AXardasSleeperTeleportSpotVisual> m_CentralSpots;
    UPROPERTY()
    TArray<AXardasSleeperTeleportSpotVisual> m_MinionSpots;

    UPROPERTY()
    AMinionSpot_XardasSleeper m_InitialMinionSpot;
    
    // UPROPERTY()
    // private FTimerHandle TaskTimer;

    UPROPERTY()
    FGameplayTag m_CentralTeleportSpot = GameplayTag::Teleport_XardasSleeper_ToCentralSpot;


    UClass GetTeleportSpotFilterClass(bool CentralSpot)
    {
        auto currentCharacter =  Cast<AGothicCharacter>(GetOwner());
        auto xardasDefinition = Cast<UCharacterDefinition_Human_XT_DMB_Xardas_404_Sleeper>(currentCharacter.GetCharacterDefinition());
        if(CentralSpot)
            return xardasDefinition.m_TeleportGroundSpotFilterClass;
        else
            return xardasDefinition.m_TeleportMinionSpotFilterClass;
    }   

    AXardasSleeperTeleportSpotVisual GetCentralTeleportSpot()
    {
        if(m_CentralSpots.IsEmpty())
        {
            GetAllActorsOfClass(GetTeleportSpotFilterClass(true), m_CentralSpots);
            SetupSpots(m_CentralSpots);
        }
        if(m_CentralSpots.IsEmpty())
        {
            return nullptr;
        }
        return m_CentralSpots[0];
    }

    AXardasSleeperTeleportSpotVisual GetMinionSpot()
    {
        if(m_MinionSpots.IsEmpty())
        {
            GetAllActorsOfClass(GetTeleportSpotFilterClass(false), m_MinionSpots);
            SetupSpots(m_MinionSpots);
        }
        if(m_MinionSpots.IsEmpty())
        {
            return nullptr;
        }
        //return m_MinionSpots[4];
        return GetActiveMinionSpotBySequence();
    }

    AXardasSleeperTeleportSpotVisual GetMinionVisibilityTeleportSpot()
    {
        if(m_MinionSpots.IsEmpty())
        {
            GetAllActorsOfClass(GetTeleportSpotFilterClass(false), m_MinionSpots);
            SetupSpots(m_MinionSpots);
        }
        if(m_MinionSpots.IsEmpty())
        {
            return nullptr;
        }
        return GetMinionVisibilityRandomTeleportSpot();
    }

    AXardasSleeperTeleportSpotVisual GetMinionVisibilityRandomTeleportSpot()
    {
        m_MinionSpots.Shuffle();
        float distanceMin = MAX_flt;
        AXardasSleeperTeleportSpotVisual selectedSpot = nullptr;
        for(auto spot : m_MinionSpots)
        {
            if(spot.IsTargetVisible())
            {
                auto target = Cast<AGothicCharacter>(GetOwner()).GetTargetedActor();
                if(target == nullptr)
                    return nullptr;

                float currentDistance = spot.GetActorLocation().Distance(target.GetActorLocation());
                if(currentDistance < distanceMin )
                {
                    selectedSpot = spot;
                    distanceMin = currentDistance;
                }
            }
        }
        if(selectedSpot == GetTargetTeleportSpot() && GetTargetTeleportSpot() != nullptr)
            return nullptr;
        return selectedSpot;
        //Request visibility to all spots.
        //If one has visibility, deactivate origin trace, teleport and activate trace.
        //else stay until next timer update
    }

    void SetupSpots(TArray<AXardasSleeperTeleportSpotVisual> Spots)
    {
        for(auto spot : Spots)
        {
            spot.SetupSpot(this);
        }
    }

    AXardasSleeperTeleportSpotVisual GetActiveRandomMinionSpot()
    {
        m_MinionSpots.Shuffle();
        for(auto minionSpot : m_MinionSpots)
        {
            if(!Cast<AMinionSpot_XardasSleeper>(minionSpot).m_SpotCompleted)
                return minionSpot;
        }
        return nullptr;
    }

    AXardasSleeperTeleportSpotVisual GetActiveMinionSpotBySequence()
    {
        m_MinionSpots.Shuffle();
        for(auto spot : m_MinionSpots)
        {
            auto minionSpot = Cast<AMinionSpot_XardasSleeper>(spot);
            if(IsMinionSpotValid(minionSpot))
            {
                if(m_InitialMinionSpot == nullptr)
                {
                    m_InitialMinionSpot = minionSpot;
                    
                }
                return minionSpot;

            }
        }
        return nullptr;
    }

    bool IsMinionSpotValid(AMinionSpot_XardasSleeper Spot)
    {
        if(Spot == nullptr)
            return false;
        return !Spot.m_SpotCompleted;

    }

    ATeleportSpotVisual GetTeleportSpot(FGameplayTag SpotTag)
    {
        if(SpotTag == m_CentralTeleportSpot)
            return GetCentralTeleportSpot();
        else
            return GetMinionSpot();
    }

    // void DoTeleport()
    // {
    //     auto TeleportSpot = Cast<AXardasSleeperTeleportSpotVisual>(GetTargetTeleportSpot());
    //     if(TeleportSpot != nullptr)
    //     {   
    //         auto currentCharacter =  Cast<AGothicCharacter>(GetOwner());
    //         if(TeleportSpot.ShouldRotateCharacter())
    //         {
    //             currentCharacter.SetActorRotation(TeleportSpot.GetSpotRotation());
    //         }

    //         currentCharacter.SetActorEnableCollision(false);

    //         FVector TeleportLocation = TeleportSpot.GetTeleportLocation();
    //         auto capsuleComp = currentCharacter.CapsuleComponent.GetScaledCapsuleHalfHeight();
    //         TeleportLocation.Z += capsuleComp;
    //         FHitResult hitResult;
    //         currentCharacter.SetActorLocation(TeleportLocation, false, hitResult, true);
    //         currentCharacter.Controller.SetControlRotation(currentCharacter.GetActorRotation());
    //         // bool result = currentCharacter.Teleport(TeleportLocation, currentCharacter.GetActorRotation());
    //         // if(result)
    //         //     Print("Teleport Success", 5.f, FLinearColor::Green);
    //         // else
    //         //     Print("Teleport fail",  5.f, FLinearColor::Green);

    //         //System::DrawDebugBox(TeleportLocation, FVector(50), FLinearColor::Red, FRotator::ZeroRotator, 20, 10);
    //     }
       
    //     if(System::IsTimerActiveHandle(TaskTimer))
    //         System::ClearAndInvalidateTimerHandle(TaskTimer);
    //     TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnMovementCompleted"), .15f, false);
    // }

    // UFUNCTION()
    // void OnMovementCompleted()
    // {
    //     //Print("OnMovementCompleted", 5.f, FLinearColor::Purple);
    //     auto currentCharacter =  Cast<AGothicCharacter>(GetOwner());
    //     currentCharacter.SetActorEnableCollision(true);
    //     Cast<AXardasSleeperTeleportSpotVisual>(GetTargetTeleportSpot()).OnMovementCompleted();
    //     OnMovementCompletedDelegate.ExecuteIfBound();
    // }

    void OnMovementCompleted() override
    {
        Cast<AXardasSleeperTeleportSpotVisual>(GetTargetTeleportSpot()).OnMovementCompleted();
        Super::OnMovementCompleted();
    
    }

    void OnTeleportCompleted()
    {
        Cast<AXardasSleeperTeleportSpotVisual>(GetTargetTeleportSpot()).OnTeleportCompleted();
    }


    // void RequestTeleportMinionSpotWithVisibility(AMinionSpot_XardasSleeper OriginSpot)
    // {
    //     for(auto spot : m_MinionSpots)
    //     {
    //         if(spot == OriginSpot)
    //             continue;
    //         if(spot.IsTargetVisible())
    //             continue;
            
    //     }
    //     //Request visibility to all spots.
    //     //If one has visibility, deactivate origin trace, teleport and activate trace.
    //     //else stay until next timer update
    // }
    
}

// class UGE_XardasSleeper_TeleportCooldown : UScriptGameplayEffect
// {
//     //Tags of the gameplay effect (This help to get the effect from the ability system)
// 	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Sleeper_Xardas_Teleport_Cooldown);

// 	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
//     default DurationMagnitude.ScalableFloatMagnitude.Value = 3; // Duration in seconds of the effect
// 	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;

// 	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Sleeper_Xardas_Teleport_Cooldown);

//     default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Debuff_Sleeper_Xardas_Teleport_Cooldown);

// }
