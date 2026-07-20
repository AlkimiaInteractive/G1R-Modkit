UCLASS()
class UAIState_Warning_Harpy : UAIState_Warning_Creature
{
    // Increase to determine the distance at which Warning is skipped to Combat
    default TooCloseDistance = 550.0f;

    // Distance the NPC will try to maintain during Warning, moving away from the threat if closer by dodging or strafing
    default MinimumDistance = 1000.0f;

    float FlyRelativeHeight = 100.0f;
    float FlyAbsoluteHeight = 150.0f;

    FGothicPathfollowSettings SetupPathfollowingSettings(FString AddToDebugOwnerName) override
    {
        auto PathfollowSettings = Super::SetupPathfollowingSettings(AddToDebugOwnerName + "_Harpy");
        PathfollowSettings.CrowdAgentRadiusMultiplier = PathfollowSettings.CrowdAgentRadiusMultiplier * 1.1f;   

        PathfollowSettings.FlyDiveSettings.SetFlyDiveModeToAlwaysFly();
        SetFlyHeight(PathfollowSettings.FlyDiveSettings);

        return PathfollowSettings;
    }

    void SetFlyHeight(FGothicFlyDiveSettings& FlySettings)
    {
        if (!IsValid(CharacterOfInterest))
        {
            FlySettings.SetAdaptHeightRelativeToNavGround(150.0f);
            return;
        }
        
        FlySettings.SetAdaptHeightRelativeToCharacter(CharacterOfInterest, 100.0f);
    }

    bool ShouldTaunt() override
    {
        if (!Super::ShouldTaunt())
            return false;
        
        if (IsValid(CharacterOfInterest) && Math::Abs(CharacterOfInterest.FeetLocation.Z - Self.FeetLocation.Z) < FlyRelativeHeight)
            return false;

        if (!IsValid(CharacterOfInterest))
            return false;

        return true;
    }
}