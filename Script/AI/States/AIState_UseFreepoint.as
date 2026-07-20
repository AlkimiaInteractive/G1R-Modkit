/**
 * Use a freepoint in the preferred location of the character.
 * 
 * Succeeds when the freepoint was used at least once.
 * Fails if the Freepoint was not used at all (e.g. because none was available or it was occupied).
 */
UCLASS()
class UAIState_UseFreepoint : UGothicCharacterSimulateableAIState
{
    UAIState_UseFreepoint(FGameplayTag Action, 
        float InTimeLimit = -1.0f, 
        int   InLoopCount = -1,
        float InWaitSecondsIfFailed = 2.0f, 
        float InSearchRadiusMultiplier = 1.0f,
        float InMinSecondsBetweenActivations = 0.0f)
    {
        PossibleActions.AddTag(Action);

        WaitSecondsIfFailed          = InWaitSecondsIfFailed;
        MinSecondsBetweenActivations = InMinSecondsBetweenActivations;
        FreepointUseTimeLimit        = InTimeLimit;
        SearchRadiusMultiplier       = InSearchRadiusMultiplier;
        
        LoopCount = InLoopCount;
    }

    UPROPERTY(EditAnywhere)
    FGameplayTagContainer PossibleActions;

    /** How long to wait until we try again after failing to use the freepoint. */
    UPROPERTY(EditAnywhere)
    float WaitSecondsIfFailed = 2.0f;

    /** How long to wait until we try to use the freepoint again. */
    UPROPERTY(EditAnywhere)
    float MinSecondsBetweenActivations = 2.0f;

    /** Maximum amount of seconds the freepoint should be used. -1 means infinite. */
    UPROPERTY(EditAnywhere)
    float FreepointUseTimeLimit = -1.0f;

    /** Multiplier for the radius in which freepoints are searched (applied to preferred location radius) */
    UPROPERTY(EditAnywhere)
    float SearchRadiusMultiplier = 1.0f;

    /** How often to re-use the freepoint before ending the state. -1 means infinite. */
    UPROPERTY(EditAnywhere)
    int LoopCount = -1;

    bool bDebugIsUsingSpot = false;
    bool bDebugLastUseWasSuccessful = false;

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DisplayImGui()
    {
        if (PossibleActions.Num() == 1)
        {
            ImGui::Text(f"Possible Action: {PossibleActions.GameplayTags[0].ToString()}");
        }
        else
        {
            ImGui::Text("Possible Actions:");
            for (auto Action : PossibleActions.GameplayTags)
            {
                ImGui::BulletText(Action.ToString());
            }
        }

        
        ImGui::Text("IsUsingSpot:");
        ImGui::SameLine();
        ImGui::BoolIcon(bDebugIsUsingSpot);
        
        ImGui::Text("Last Use Was Successful:");
        ImGui::SameLine();
        ImGui::BoolIcon(bDebugLastUseWasSuccessful);

        ImGui::Separator();

        float Radius = AI.PreferredLocation.RadiusFromCenter * SearchRadiusMultiplier;
        FVector Location = AI.PreferredLocation.CenterPoint;

        DebugScript::DrawCircle(Location + FVector::UpVector * 10.0f, Radius, FColor::Cyan, alpha = 0);
        DebugScript::DrawLine(CharacterState.CharacterLocation, Location, FColor::Cyan, 0);

        auto Spots = InteractionSpots::FindSpotsInRadius(Location, Radius);

        ImGui::Text("Potential spots:");
        
        ImGui::Indent();
        for (auto Spot : Spots)
        {
            FColor TextColor;

            if (!Spot.IsAnyOfActionsPossibleHere(PossibleActions))
            {
                TextColor = FColor(64, 64, 64);
                ImGui::TextColored(TextColor, f"{Spot.SpotName} (Action not supported)");
            }
            else if (Spot.CanBeClaimedBy_TryMultipleActions(CharacterState, PossibleActions))
            {
                TextColor = FColor::Green;
                ImGui::TextColored(TextColor, f"{Spot.SpotName} (Claimable)");
            }
            else
            {
                TextColor = FColor::Orange;
                ImGui::TextColored(TextColor, f"{Spot.SpotName} (Non claimable)");
            }

            if (ImGui::IsItemHovered())
            {
                DebugScript::DrawLine(CharacterState.ActorLocation, Spot.Location, TextColor, 0);

                FString Tooltip;

                if (!Spot.CanBeClaimedBy_TryMultipleActions(CharacterState, PossibleActions))
                {
                    Tooltip += "Cannot claim because:\n";
                    for (auto Action : PossibleActions.GameplayTags)
                    {
                        for (auto& Reason : InteractionSpots.DebugCanPawnClaimSpotFailReason(Spot, CharacterState, Action))
                        {
                            Tooltip += " .. " + Reason + "\n";
                        }
                    }
                }

                ImGui::SetTooltipOnHover(Tooltip);
            }
        }
        ImGui::Unindent();
    }
#endif

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.GotoPreferredLocation();

        bool bUsedOnce = false;
        while(LoopCount == -1 || LoopCount > 0)
        {
            if (IsInDailyRoutineSimulation())
            {
                ReportTimeSkipWhateverIsLeft();
            }

            float LastTimeUsedFreepoint = World.TimeSeconds;

            if (bShouldExitState)
                break;

            bDebugIsUsingSpot = true;
            if (!AI.TryUseFreepointAtPreferredLocation(PossibleActions, SearchRadiusMultiplier, FreepointUseTimeLimit).WasSuccessful())
            {
                bDebugIsUsingSpot = false;
                bDebugLastUseWasSuccessful = false;
                WaitSeconds(WaitSecondsIfFailed);
            }
            else
            {
                bDebugIsUsingSpot = false;
                bUsedOnce = true;
                bDebugLastUseWasSuccessful = true;
            }

            if (bShouldExitState)
                break;

            float TimeSpentUsingFreepoint = World.TimeSeconds - LastTimeUsedFreepoint;

            if (TimeSpentUsingFreepoint < MinSecondsBetweenActivations)
            {
                WaitSeconds(World.TimeSeconds - LastTimeUsedFreepoint);
            }

            if (bShouldExitState)
                break;
            
            if (LoopCount != -1)
            {
                LoopCount--;
            }

            WaitOneTick();
        }

        if (!bUsedOnce)
        {
            EndTaskAsFailure();
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnGracefulExitRequested()
    {
        bShouldExitState = true;
        StopWaitingAndContinueTask();
    }
}
