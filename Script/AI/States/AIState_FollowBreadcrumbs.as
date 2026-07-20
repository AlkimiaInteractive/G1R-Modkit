UCLASS()
class UAIState_FollowBreadcrumbs : UGothicCharacterSimulateableAIState 
{
    /** Spots we have visited so far (in order) */
    protected TArray<FInteractionSpotHandle> VisitedSpots;
    protected TSet<FName> VisitedSpotsNames;

    /** Spot we should be going to right now. */
    protected FInteractionSpotHandle CurrentTargetSpot;

    /** How far we can search from each spot to find the next one. */
    UPROPERTY()
    float SpotSearchRadius = 3000.0f;
    
    /** How far can we go from each breadcrumb to do an action? */
    UPROPERTY()
    float ActionRadius = 500.0f;

    /** If false, the state will end once the next possible point is the one we've started at. */
    UPROPERTY()
    bool bAllowLooping = true;

    UPROPERTY()
    FGameplayTag FollowSpotsWithTag;

    bool bDebugShowScanRadius = true;
    bool bDebugShowVisited = true;
    bool bDebugShowPredictedRoute = true;
    bool bDebugShowBreadcrumbs = true;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        CurrentTargetSpot = FindNextSpot(CharacterState.CharacterLocation);
        
        if (!CurrentTargetSpot.IsValid())
        {
            AI.GotoPreferredLocation();
            CurrentTargetSpot = FindNextSpot(CharacterState.CharacterLocation);
        }
        
        while (!CurrentTargetSpot.IsValid())
        {
            // Maybe we're loading or something, try again soon
            WaitSeconds(5.0f);
            AI.GotoPreferredLocation();
            CurrentTargetSpot = FindNextSpot(CharacterState.CharacterLocation);

            ReportTimeSkipWhateverIsLeft();
        }

        while (!bShouldExitState)
        {
            ReportTimeSkipWhateverIsLeft();

            AI.GotoPosition(CurrentTargetSpot.Location, 200.0f);
            {
                VisitedSpots.Add(CurrentTargetSpot);
                VisitedSpotsNames.Add(CurrentTargetSpot.SpotName);

                AI.PreferredLocation.PreferPosition(CurrentTargetSpot.Location, ActionRadius);

                HandleArrivedAtBreadcrumb(CurrentTargetSpot);
            }

            CurrentTargetSpot = FindNextSpot(CharacterState.CharacterLocation);

            while (!CurrentTargetSpot.IsValid())
            {
                ReportTimeSkipWhateverIsLeft();

                // Maybe we're loading or something, try again soon
                WaitSeconds(5.0f);
                CurrentTargetSpot = FindNextSpot(CharacterState.CharacterLocation);
            }

            HandleLooping();
        }
    }

    // UFUNCTION(BlueprintOverride)
    // void HandleTimeskipRequest()
    // {
    //     const float MaxDistanceToSkip = AI.PreferredLocation.RadiusFromCenter * 4.0f;

    //     float WalkingSpeed = 200.0f;
        
    //     if (!IsInDailyRoutineSimulation())
    //     {
    //         WalkingSpeed = Self.MovementComponent.MaxSpeed;
    //     } 

    //     // We're barely moving, we're stuck here for a while
    //     if (WalkingSpeed <= 10.0f)
    //         return;

    //     if (!CurrentTargetSpot.IsValid())
    //     {
    //         CurrentTargetSpot = FindNextSpot(CharacterState.CharacterLocation);
    //     }
        
    //     // No spot, we would keep standing here
    //     if (!CurrentTargetSpot.IsValid())
    //         return;

    //     FVector PrevLoction = CharacterState.CharacterLocation;
    //     FVector PrevDirection = CharacterState.CharacterLookingDirection.GetSafeNormal2D();
    //     float TotalDistanceSkipped = 0.0f;

    //     while (true)
    //     {
    //         VisitedSpots.Add(CurrentTargetSpot);
    //         VisitedSpotsNames.Add(CurrentTargetSpot.SpotName);
            
    //         CurrentTargetSpot = FindNextSpot(PrevLoction);
            
    //         if (!CurrentTargetSpot.IsValid())
    //             break;

    //         if (TotalDistanceSkipped > MaxDistanceToSkip)
    //             break;
            
    //         float DistanceBetween = PrevLoction.Distance(CurrentTargetSpot.Location);

    //         if (!ReportTimeSkip(Math::Max(World.DeltaSeconds, DistanceBetween / WalkingSpeed)))
    //             break;

    //         DebugScript::DrawLine(PrevLoction, CurrentTargetSpot.Location, FColor::Green, 0.0f, 5.0f);

    //         TotalDistanceSkipped += PrevLoction.Distance(CurrentTargetSpot.Location);
    //         PrevDirection = (CurrentTargetSpot.Location - PrevLoction).GetSafeNormal2D();
    //         PrevLoction = CurrentTargetSpot.Location;

    //         HandleLooping();
    //     }


    //     if (!UNavigationSystemV1::ProjectPoint(Self, PrevLoction, PrevLoction))
    //         return;

    //     PrevLoction += FVector::UpVector * Self.SimpleCollisionHalfHeight;

    //     VLog::Arrow(Self, f"Follow Breadcrumbs Skip: {CurrentTargetSpot.SpotName.ToString()}", CharacterState.CharacterLocation, PrevLoction, FColor::Green);

    //     Self.Teleport(PrevLoction, FRotator::MakeFromX(PrevDirection));
    // }

    /** Override to specify what should happen when the character reached one breadcrumb. */
    void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb)
    {

    }

    private void HandleLooping()
    {
        if (!bAllowLooping)
            return;

        if (VisitedSpots.Num() == 0)
            return;
        
        if (HasDetectedLoopRing())
        {
            auto Last = VisitedSpots.Last();
        
            VisitedSpots.Reset();
            VisitedSpotsNames.Reset();

            // Current target spot is already set to the spot we've started at
            // But make sure we keep going into the same direction by keeping
            // the last spot of the VisitedSpots list.
            VisitedSpots.Add(Last);
            VisitedSpotsNames.Add(Last.SpotName);

        }
        else if (HasDetectedLoopLine())
        {
            VisitedSpots.Reset();
            VisitedSpotsNames.Reset();

            // Go back the other direction
            VisitedSpots.Add(CurrentTargetSpot);
            VisitedSpotsNames.Add(CurrentTargetSpot.SpotName);

            CurrentTargetSpot = FindNextSpot(CurrentTargetSpot.Location);
        }
        else
        {
            // Not a loop, keep going!
        }
    }

    bool HasDetectedLoopRing() const
    {
        if (VisitedSpots.Num() == 0)
            return false;

        if (!CurrentTargetSpot.IsValid())
            return false;

        return VisitedSpots[0].SpotName == CurrentTargetSpot.SpotName;
    }

    bool HasDetectedLoopLine() const
    {
        if (VisitedSpots.Num() == 0)
            return false;

        if (!CurrentTargetSpot.IsValid())
            return false;

        return VisitedSpots.Last().SpotName == CurrentTargetSpot.SpotName;
    }

    /** Find the next spot to go to from our current location. */
    FInteractionSpotHandle FindNextSpot(FVector AtLocation) const
    {
        TArray<FInteractionSpotHandle> Spots = InteractionSpots::FindSpotsInRadius(AtLocation, SpotSearchRadius);
        
        if (Spots.Num() == 0)
            return FInteractionSpotHandle();

        InteractionSpots::SortSpotArrayByDistance(Spots, AtLocation);

        for (auto& Spot : Spots)                            
        {
            if (!Spot.IsActionPossibleHere(FollowSpotsWithTag))
                continue;

            if (VisitedSpots.Num() >= 1)
            {
                if (VisitedSpots.Last().SpotName == Spot.SpotName)
                    continue;
            }
            
            // Don't go anywhere twice!
            if (VisitedSpotsNames.Contains(Spot.SpotName))
                continue;

            return Spot;

        }

        // We did not find anything. See if we're at the end and we could loop
        if (bAllowLooping && VisitedSpots.Num() > 0)
        {
            for (auto& Spot : Spots)
            {
                // Maybe a ring?
                if (Spot.SpotName == VisitedSpots[0].SpotName)
                    return Spot;

                // Maybe a line?
                if (Spot.SpotName == VisitedSpots.Last().SpotName)
                    return Spot;
            }
        }

        // No other spot around, except the one we were going to last
        return FInteractionSpotHandle();
    }

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        ImGui::Text(f"Following: {FollowSpotsWithTag.ToString()}");
        ImGui::Checkbox("Show Scan Radius", bDebugShowScanRadius);
        ImGui::Checkbox("Show Visited", bDebugShowVisited);
        ImGui::Checkbox("Show Predicted Route", bDebugShowPredictedRoute);
        ImGui::Checkbox("Show Breadcrumbs", bDebugShowBreadcrumbs);

        if (bDebugShowScanRadius)
        {
            DebugScript::DrawCircle(CharacterState.CharacterLocation, SpotSearchRadius, FColor::Purple, 0.0f, 15);
        }

        if (bDebugShowVisited)
        {
            if (CurrentTargetSpot.IsValid())
            {
                DebugScript::DrawLine(CharacterState.CharacterLocation, CurrentTargetSpot.Location, FColor::Magenta, 5.0f, 0.0f);
            }

            for (int i = 0; i < VisitedSpots.Num() - 1; i++)
            {
                FInteractionSpotHandle& Start = VisitedSpots[i];
                FInteractionSpotHandle& End = VisitedSpots[i + 1];

                DebugScript::DrawLine(Start.Location, End.Location, FColor::Purple, 5.0f, 0.0f);
            }
        }

        if (bDebugShowBreadcrumbs)
        {
            DebugShowSpotsAround();
        }

        if (bDebugShowPredictedRoute)
        {
            TSet<FName> Visited = VisitedSpotsNames;
            DebugDrawNext(Visited, CurrentTargetSpot);
        }
    }
#endif

    void DebugShowSpotsAround() const
    {
        TArray<FInteractionSpotHandle> Spots = InteractionSpots::FindSpotsInRadius(CharacterState.CharacterLocation, SpotSearchRadius);

        for (auto& Spot : Spots)                            
        {
            if (!Spot.IsActionPossibleHere(FollowSpotsWithTag))
                continue;

            DebugScript::DrawSphere(Spot.Location, 25.0f, FColor::Cyan, 0.0f);
        }
    }

    void DebugDrawNext(TSet<FName>& Visited, FInteractionSpotHandle Current) const
    {
        TArray<FInteractionSpotHandle> Spots = InteractionSpots::FindSpotsInRadius(Current.Location, SpotSearchRadius);

        InteractionSpots::SortSpotArrayByDistance(Spots, Current.Location);

        for (auto& Spot : Spots)                            
        {
            if (!Spot.IsActionPossibleHere(FollowSpotsWithTag))
                continue;

            // Don't go anywhere twice!
            if (Visited.Contains(Spot.SpotName))
                continue;

            Visited.Add(Spot.SpotName);
            DebugScript::DrawLine(Current.Location, Spot.Location, FColor::Cyan, 5.0f, 0.0f);

            DebugDrawNext(Visited, Spot);
        }
    }
}









// ... in some other file ...

// UCLASS()
// class UAIState_WolfSniffRoute : UAIState_FollowBreadcrumbs
// {
//     default FollowSpotsWithTag = GameplayTag::Breadcrumb_Forest;

//     void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb) override
//     {
//         if (AI.CanDigGround())
//         {
//             AI.DigGround(Duration = 3.0f);
//         }
//     }
// }





UCLASS()
class UAIState_WolfIntimidateRoute : UAIState_FollowBreadcrumbs
{
    default FollowSpotsWithTag = GameplayTag::Breadcrumb_Forest_Path;

    void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb) override
    {
        if (Math::RandRange(0, 100) > 80)
        {
            AI.Howl(Duration = 3.0f);
        }
    }
}


UCLASS()
class UAIState_WolfSniffRoute : UAIState_FollowBreadcrumbs
{
    default FollowSpotsWithTag = GameplayTag::Breadcrumb_Forest;

    float LastTimeWeDug = 0.0f;
    float SecondsBetweenDigging = 30.0f;

    void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb) override
    {
        if (AI.CanDigGround() && (World.TimeSeconds - LastTimeWeDug) > SecondsBetweenDigging)
        {
            AI.DigGround(Duration = 3.0f);

            LastTimeWeDug = World.TimeSeconds;
        }
    }
}

UCLASS()
class UAIState_ShadowBeastIntimidateRoute : UAIState_FollowBreadcrumbs
{
    default FollowSpotsWithTag = GameplayTag::Breadcrumb_EastForest;

    void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb) override
    {
        if (Math::RandRange(0, 100) > 75)
        {
            AI.Smell(Duration = 15.0f);
        }
    }
}

UCLASS()
class UAIState_Guard_Watch_Patrolling_Route : UAIState_FollowBreadcrumbs
{
    UPROPERTY()
    FGameplayTag Path;

    UAIState_Guard_Watch_Patrolling_Route(FGameplayTag InPath)
    {
        Path = InPath;
    }

    default FollowSpotsWithTag = Path;

    void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb) override
    {
        if (Math::RandRange(0, 100) > 80)
        {
            if (AI.CanGuardWatch(CharacterState.CharacterLocation, ActionRadius))
            {
                AI.GuardWatch(Duration = 10.0f);
            }
        }
    }
}


UCLASS()
class UAIState_Smith_Generic : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    // if one interaction is not doable now, the NPC will use a backup interaction until the wanted interaction is possible.
    // This makes NPCs wait until player finishes using their spot
    default bAllowSkippingToNextWhenInteractionNotPossible = false;

     // forces NPCs to start with picking up the MetalBar at the Forge. Usually interactions spawn a item and equip it, but here we have a 
     // special setup because the metal bar should exist over multiple interactions 
    default bRestartWithFirstInteraction = true;  
}

UCLASS()
class UAISTate_Huno_Smith : UAIState_Smith_Generic
{
    default SpotNames.Add(n"IO_OC_FORGE_02");
    default SpotNames.Add(n"IO_OC_ANVIL_02");
    default SpotNames.Add(n"IO_OC_WATER_02");
    default SpotNames.Add(n"IO_OC_SHARP_02");
    default SpotNames.Add(n"IO_OC_WORKBENCH_02");

    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Forge));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Anvil));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Barrel));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_WhetStone));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Workbench));
}

UCLASS()
class UAISTate_Stone_Smith : UAIState_Smith_Generic
{
    default SpotNames.Add(n"IO_OC_FORGE_01");
    default SpotNames.Add(n"IO_OC_ANVIL_01");
    default SpotNames.Add(n"IO_OC_WATER_01");
    default SpotNames.Add(n"IO_OC_SHARP_01");
    default SpotNames.Add(n"IO_OC_WORKBENCH_01");

    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Forge));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Anvil));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Barrel));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_WhetStone));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Workbench));
}

UCLASS()
class UAISTate_Darrion_Smith : UAIState_Smith_Generic
{
    default SpotNames.Add(n"IO_SC_FORGE_01");
    default SpotNames.Add(n"IO_SC_ANVIL_01");
    default SpotNames.Add(n"IO_SC_WATER_01");
    default SpotNames.Add(n"IO_SC_SHARP_01");
    default SpotNames.Add(n"IO_SC_WORKBENCH_01");

    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Forge));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Anvil));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Barrel));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_WhetStone));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Workbench));
}

UCLASS()
class UAISTate_Orc_Smith : UAIState_Smith_Generic
{
    default SpotNames.Add(n"IO_OTOWN_FORGE_01");
    default SpotNames.Add(n"IO_OTOWN_ANVIL_01");
    default SpotNames.Add(n"IO_OTOWN_SHARP_01");

    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_OrcForge));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Anvil));
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_OrcWhetstone));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_OrcWarriorM26 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_1");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_2");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_3");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_4");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_5");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_6");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_7");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_8");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_7");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_6");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_5");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_4");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_3");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower01_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_OrcWarriorM27 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_1");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_2");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_3");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_4");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_5");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_6");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_7");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_8");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_7");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_6");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_5");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_4");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_3");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower02_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_OrcWarriorM28 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_1");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_2");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_3");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_4");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_5");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_6");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_7");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_8");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_8");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_9");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_10");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_11");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_12");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_11");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_10");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_9");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_8");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_7");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_6");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_5");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_4");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_3");
    default SpotNames.Add(n"BreadcrumbActor_OrcTerritory_Patrol_Tower03_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Bloodwyn : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Bloodwyn_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Bloodwyn_Night : UAISTate_Guard_Watch_Patrolling_Route_Bloodwyn
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard03 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
    default ChanceToDoActionOnSpot = 0.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_6");   
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD03_7");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard11 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
    default ChanceToDoActionOnSpot = 0.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_6"); 
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_4"); 
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD11_2");


    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard28_Night : UAIState_RandomInteractions_ChainedSpots_Human
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
    default ChanceToDoActionOnSpot = 0.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_6"); 
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_2");


    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard28_Day : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 0.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_6"); 
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD28_2");


    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

class UAISTate_Guard_Watch_Patrolling_Route_Guard10 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
    default ChanceToDoActionOnSpot = 0.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_4"); 
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD10_2");


    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

class UAISTate_Guard_Watch_Patrolling_Route_Guard15 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
    default ChanceToDoActionOnSpot = 0.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_4"); 
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_NIGHTWATCH_GUARD15_2");


    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Bandit12 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_1");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_2");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_3");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_4");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_5");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_6");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_7");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_8");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_9");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_10");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_11");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_12");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_13");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_14");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_13");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_12");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_11");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_10");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_9");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_8");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_7");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_6");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_5");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_4");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_3");
    default SpotNames.Add(n"BreadcrumbActor_BC_GuardPlatform_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Rogue21 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields2");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields3");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields4");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields5");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields6");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields7");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields8");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields9");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields10");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields11");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields12");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields13");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields14");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields15");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields16");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields17");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields18");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields19");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields18");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields17");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields16");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields15");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields14");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields13");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields12");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields11");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields10");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields9");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields8");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields7");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields6");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields5");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields4");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields3");
    default SpotNames.Add(n"Breadcrumb_NewCamp_RiceFields2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard07 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_1");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_2");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_3");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_4");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_5");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_6");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_7");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_8");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_9");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_10");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_11");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_12");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_13");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_14");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_15");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_16");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_17");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_18");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_19");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_20");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_21");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_22");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_21");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_20");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_19");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_18");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_17");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_16");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_15");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_14");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_13");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_12");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_11");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_10");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_9");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_8");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_7");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_6");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_5");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_4");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_3");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard08 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_1");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_2");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_3");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_4");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_5");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_6");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_7");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_8");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_7");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_6");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_5");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_4");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_3");
    default SpotNames.Add(n"Breadcrumb_OldCamp_Castle_In_Guard223_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard13 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_1");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_2");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_3");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_4");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_5");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_6");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_7");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_8");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_9");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_10");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_11");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_12");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_13");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_12");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_11");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_10");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_9");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_8");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_7");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_6");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_5");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_4");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_3");
    default SpotNames.Add(n"Breadcrumb_OldCamp_GuardPalisade_Market_Guard229_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard19 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_2");


    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard20 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Cell_Guard239_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard21 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_17");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_18");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_19");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_20");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_21");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_22");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_23");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_24");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_25");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_26");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_25");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_24");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_23");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_22");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_21");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_20");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_19");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_18");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_17");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}


UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard22 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_17");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_18");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_19");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_20");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_19");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_18");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_17");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard242_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}


UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard23 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Market_Guard243_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard23_Night : UAIState_RandomInteractions_ChainedSpots_Human
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_20");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_21");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_22");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_23");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_24");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_25");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_26");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_27");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_28");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_29");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_30");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_31");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_32");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_33");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_34");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_35");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_36");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_37");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_38");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_39");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_40");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_41");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_42");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_43");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_44");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_45");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_46");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_47");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_48");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_49");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_50");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_51");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_52");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_53");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_54");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_55");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_56");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_55");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_54");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_53");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_52");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_51");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_50");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_49");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_48");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_47");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_46");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_45");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_44");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_43");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_42");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_41");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_40");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_39");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_38");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_37");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_36");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_35");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_34");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_33");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_32");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_31");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_30");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_29");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_28");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_27");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_26");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_25");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_24");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_23");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_22");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_21");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Market_Guard243_20");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard24 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard244_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}


UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard24_Night : UAIState_RandomInteractions_ChainedSpots_Human
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;

    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Arena_Guard244_17");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Arena_Guard244_19");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Arena_Guard244_20");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Arena_Guard244_19");
    default SpotNames.Add(n"BreadcrumbActor_OC_GuardPalisade_Night_Arena_Guard244_17");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}


UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard25 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_17");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Castle_Out_Guard245_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}


UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Guard41 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way
    

    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_FallenTower_Guard293N_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage));
}


UCLASS()
class UAIState_Guard_Watch_Patrolling_Route_Bullit : UAIState_RandomInteractions_ChainedSpots_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Drugs_Forced_Alcohol_High);

    default ChanceToDoActionOnSpot = 0.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_17");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_18");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_19");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_20");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_21");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_22");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_23");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_24");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_25");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_26");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_27");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_28");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_29");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_30");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_31");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_32");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_33");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_34");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_35");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_36");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_37");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_38");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_39");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_40");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_41");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_42");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_41");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_40");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_39");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_38");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_37");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_36");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_35");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_34");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_33");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_32");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_31");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_30");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_29");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_28");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_27");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_26");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_25");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_24");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_23");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_22");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_21");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_20");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_19");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_18");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_17");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_16");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_Drunk_2");
    

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Fletcher : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_1");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_15");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_14");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_13");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_12");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_11");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_10");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_9");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_8");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_7");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_6");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_5");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_4");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_3");
    default SpotNames.Add(n"BreadcrumbActor_OC_CAMP_FLETCHER_2");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage));
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Route_Fletcher_Night : UAISTate_Guard_Watch_Patrolling_Route_Fletcher
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
}

UCLASS()
class UAISTate_GorNaDrak_Watch_Patrolling_Route_KalomsCamp : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_Start");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_01");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_02");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_03");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_04");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_05");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_06");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_07");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_08");
    default SpotNames.Add(n"BreadcrumbActor_OG_KalomsRoute_09");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage));
}

UCLASS()
class UAIState_OC_EBR_Gomez_100_LeaveStage : UAIState_RandomInteractions_ChainedSpots_Human
{
    default SpotNames.Add(n"BreadcrumbActor_OC_LeaveStage_01");
    default SpotNames.Add(n"BreadcrumbActor_OC_LeaveStage_2");
    default SpotNames.Add(n"BreadcrumbActor_OC_LeaveStage_End");
    
}

UCLASS()
class UAIState_Guard_Watch_Night_Patrolling_Route : UAIState_FollowBreadcrumbs
{
    UPROPERTY()
    FGameplayTag Path;

    UAIState_Guard_Watch_Night_Patrolling_Route(FGameplayTag InPath)
    {
        Path = InPath;
    }

    default FollowSpotsWithTag = Path;

    void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb) override
    {
        int RandomNum = Math::RandRange(0, 100);

        if ( RandomNum > 60)
        {
            if (AI.CanGuardWatch(CharacterState.CharacterLocation, ActionRadius))
            {
                AI.GuardWatch(Duration = 10.0f);
            }
        }
        else if (RandomNum > 50)
        {
            AI.SleepStanding(Duration = 10.0f);
        }
    }
}

UCLASS()
class UAIState_SC_NOV_GuideMainGate : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideMainGate_Novice", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideMainGate_Novice", EWalkSpeed::Running));
         
}

UCLASS()
class UDailyRoutine_GenericNovice_Guide_MainGate : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_GuideMainGate(), Location::Anywhere);

    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        AutoSwitchToRoutine = NPCState.FindDefaultDailyRoutine().Class;

#ifdef WITH_STORY_G1R
        G1R::UStoryG1R::Get().Novice_Guide_MainGate = 0; 
#endif
    }
}


UCLASS()
class UAIState_SC_NOV_GuideSmith : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideSmithy_Novice", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideSmithy_Novice", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_GenericNovice_Guide_Smith : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_GuideSmith(), Location::Anywhere);

    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        AutoSwitchToRoutine = NPCState.FindDefaultDailyRoutine().Class;

#ifdef WITH_STORY_G1R
        G1R::UStoryG1R::Get().Novice_Guide_Smithy = 0; 
#endif
    }
}


UCLASS()
class UAIState_SC_NOV_GuideTemple : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideTemple_Novice", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideTemple_Novice", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_GenericNovice_Guide_Temple : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_GuideTemple(), Location::Anywhere);

    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        AutoSwitchToRoutine = NPCState.FindDefaultDailyRoutine().Class;
        
#ifdef WITH_STORY_G1R
        G1R::UStoryG1R::Get().Novice_Guide_Temple = 0; 
#endif
    }
}


UCLASS()
class UAIState_SC_NOV_GuideKalom : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideKalom_Novice", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideKalom_Novice", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_GenericNovice_Guide_Kalom : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_GuideKalom(), Location::Anywhere);

    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        AutoSwitchToRoutine = NPCState.FindDefaultDailyRoutine().Class;
        
#ifdef WITH_STORY_G1R
        G1R::UStoryG1R::Get().Novice_Guide_Kalom = 0; 
#endif
    }
}


UCLASS()
class UAIState_SC_NOV_GuideTrain : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideTrain_Novice", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuideTrain_Novice", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_GenericNovice_Guide_Train : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_GuideTrain(), Location::Anywhere);

    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        AutoSwitchToRoutine = NPCState.FindDefaultDailyRoutine().Class;
        
#ifdef WITH_STORY_G1R
        G1R::UStoryG1R::Get().Novice_Guide_Train = 0; 
#endif
    }
}