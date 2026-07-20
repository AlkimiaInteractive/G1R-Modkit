UCLASS()
class UAIState_Combat_Creature : UAIState_Combat_G1R
{
    default CooldownsOnMoveEnded.FindOrAdd(UCM_CastSpell_Base)
                                    .SetCooldown(1.0f)
                                    .AddMoveToPutOnCooldown(UCM_Taunt);

    default AssessmentModuleClass = UAIARM_State_Combat_Creature;
    
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Add(UCM_Dodge);
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Add(UCM_Attack);

    void ValidateSelectedAttack() override
    {
        Super::ValidateSelectedAttack();
        
        if (!IsAttackSelected() || !IsValid(SelectedAttack))
            return;

        // if (!Self.CanStrafe() && SelectedAttack.MinRange > DistanceToCharacterOfInterest)
        // {
        //     ResetSelectedAttack();
        //     return;
        // }
    }

    FString GetDisplayName() const override
    {
        return "Creature Combat";
    }

    default CommonBehavior_LowPriority
            .DoNode(UCBT_Tree_Taunts());

    default CommonBehavior_MediumPriority
            .DoNode(UCBT_Tree_DodgeToUnStuck());
}

UCLASS()
class UAIState_Combat_Creature_NonStrafer : UAIState_Combat_Creature
{
    default Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::CloserThan;

    void InitializeCombatPositioning() override
    {
        Positioning = UAICombatPositioning_StaticCircleAroundTarget_NoStrafing(this);
    }
}

UCLASS()
class UAIState_Combat_Creature_Strafer : UAIState_Combat_Creature
{
    default Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::Exact;

    void InitializeCombatPositioning() override
    {
        Positioning = UAICombatPositioning_StaticCircleAroundTarget(this);
    }

    bool ShouldStrafe() override
    {
        return IsValid(CharacterOfInterest) && Self.Perception.CanSee(CharacterOfInterest);
    }
}

UCLASS()
class UCombatBehaviorSet_Creature_Observer_Strafer : UCombatBehaviorSet_Observer
{
    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer(), 1.0f);
}

UCLASS()
class UCombatBehaviorSet_Creature_Observer_NonStrafer : UCombatBehaviorSet_Observer
{
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveTowardsEnemyToPreferredDistance());
}


////////
// BY CREATURE LOCOMOTION TYPE

/** Non strafing quadruped - Bloodhound, Lizards, Lurker, Molerat, Orcdog, Shadowbeast, Wolf */
UCLASS()
class UAIState_Combat_Creature_Quadruped : UAIState_Combat_Creature_NonStrafer
{
    void DefaultConfigValues() override
    {
        // QUADRUPED BASE CONFIG VALUES
        EnemyTooCloseDistance = Config.PositioningValuesSizeMultiplier * 60.0f;
        EnemyCloseDistance = Config.PositioningValuesSizeMultiplier * 170.0f;
        EnemyLungeDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
        EnemyCombatDistance = Config.PositioningValuesSizeMultiplier * 700.0f;

        Positioning.MinimumPositionDistance = Config.PositioningValuesSizeMultiplier * 150.0f;
        
        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
        }
        else if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 450.0f;
        }
        else
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 600.0f;
        }
    }

    FGothicPathfollowSettings SetupCombatPathfollowingSettings(FString AddToDebugOwnerName) override
    {
        FGothicPathfollowSettings PathfollowSettings = Super::SetupCombatPathfollowingSettings(AddToDebugOwnerName);
        PathfollowSettings.DebugOwnerName = "UAIState_Combat_Creature_Quadruped" + AddToDebugOwnerName; 
        PathfollowSettings.CrowdAgentRadiusMultiplier = PathfollowSettings.CrowdAgentRadiusMultiplier * 1.3f;   
        
        // dont scale velocity for closeby NPCs too much, quadrupeds cannot steer so easily
        PathfollowSettings.ModifyAvoidVelocitySettings.MediumRangeVelocityMultiplier = 0.6f;
        PathfollowSettings.ModifyAvoidVelocitySettings.ShortRangeVelocityMultiplier = 0.3f;
        PathfollowSettings.ModifyAvoidVelocitySettings.FastSpeedVelocityMultiplier = 0.5f;

        return PathfollowSettings;
    }
}

/** Non strafing biped - Biter, Razor, Scavengers, Snapper */
UCLASS()
class UAIState_Combat_Creature_BipedalTherapod : UAIState_Combat_Creature_NonStrafer
{
    void DefaultConfigValues() override
    {
        // QUADRUPED BASE CONFIG VALUES
        EnemyTooCloseDistance = Config.PositioningValuesSizeMultiplier * 60.0f;
        EnemyCloseDistance = Config.PositioningValuesSizeMultiplier * 170.0f;
        EnemyLungeDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
        EnemyCombatDistance = Config.PositioningValuesSizeMultiplier * 700.0f;

        Positioning.MinimumPositionDistance = Config.PositioningValuesSizeMultiplier * 150.0f;
        
        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
        }
        else if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 450.0f;
        }
        else
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 600.0f;
        }
    }

    FGothicPathfollowSettings SetupCombatPathfollowingSettings(FString AddToDebugOwnerName) override
    {
        FGothicPathfollowSettings PathfollowSettings = Super::SetupCombatPathfollowingSettings(AddToDebugOwnerName);
        PathfollowSettings.DebugOwnerName = "UAIState_Combat_Creature_BipedalTherapod" + AddToDebugOwnerName;
        PathfollowSettings.CrowdAgentRadiusMultiplier = PathfollowSettings.CrowdAgentRadiusMultiplier * 1.1f;   

        return PathfollowSettings;
    }
}

/** Strafing 6 or 8 legged - Minecrawlers */
UCLASS()
class UAIState_Combat_Creature_Crablike : UAIState_Combat_Creature_Strafer
{
    void DefaultConfigValues() override
    {
        // GROUNDED STRAFER BASE CONFIG VALUES
        EnemyTooCloseDistance = Config.PositioningValuesSizeMultiplier * 60.0f;
        EnemyCloseDistance = Config.PositioningValuesSizeMultiplier * 170.0f;
        EnemyLungeDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
        EnemyCombatDistance = Config.PositioningValuesSizeMultiplier * 700.0f;

        Positioning.MinimumPositionDistance = Config.PositioningValuesSizeMultiplier * 150.0f;
        
        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
        }
        else if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 450.0f;
        }
        else
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 600.0f;
        }
    }
}

/** Strafing flyer - Bloodfly, Harpy? */
UCLASS()
class UAIState_Combat_Creature_StrafingFlyer : UAIState_Combat_Creature_Strafer
{
    float RequiredHeightRelativeToTarget_ActiveAttacker     = 5.0f;
    float RequiredHeightRelativeToTarget_PassiveAttacker    = 5.0f;
    float RequiredHeightRelativeToTarget_Observer           = 5.0f;

    float RequiredHeightRelativeToGround_ActiveAttacker     = 5.0f;
    float RequiredHeightRelativeToGround_PassiveAttacker    = 5.0f;
    float RequiredHeightRelativeToGround_Observer           = 5.0f;

 #if WITH_IMGUI
    void DisplayPreferredDistances() override
    {
        Super::DisplayPreferredDistances();

        auto FlySettings = AI.AIController.GetCurrentPathfollowSetting().FlyDiveSettings;
        float Divergence = FlySettings.CharacterZDivergeOffset;

        if (FlySettings.AdaptZDivergeMode == EAdaptZDivergeMode::RelativeToOtherCharacter)
        {
            ImGui::Text(f"Preferred Height Relative To Target: {Divergence}");
        }
        else if (FlySettings.AdaptZDivergeMode == EAdaptZDivergeMode::RelativeToNavGround)
        {
            ImGui::Text(f"Preferred Height Relative To Ground: {Divergence}");
        }
    }

    UFUNCTION(BlueprintOverride)
    void DisplayOverheadImGui()
    {
        Super::DisplayOverheadImGui();
        
        auto FlySettings = AI.AIController.GetCurrentPathfollowSetting().FlyDiveSettings;
        float Divergence = FlySettings.CharacterZDivergeOffset;
        ImGui::Text(f"Requested H: {Divergence}");

        if (FlySettings.AdaptZDivergeMode == EAdaptZDivergeMode::RelativeToOtherCharacter)
        {
            ImGui::SameLine();
            ImGui::Text("T");
            ImGui::SameLine();
            ImGui::Text(f"({HeightRelativeToCharacterOfInterest})");
        }
        else if (FlySettings.AdaptZDivergeMode == EAdaptZDivergeMode::RelativeToNavGround)
        {
            ImGui::SameLine();
            ImGui::Text("G");
        }
    }
#endif

    FGothicPathfollowSettings SetupCombatPathfollowingSettings(FString AddToDebugOwnerName) override
    {
        FGothicPathfollowSettings PathfollowSettings = Super::SetupCombatPathfollowingSettings(AddToDebugOwnerName);
        PathfollowSettings.DebugOwnerName = "UAIState_Combat_Creature_StrafingFlyer" + AddToDebugOwnerName;
        PathfollowSettings.CrowdAgentRadiusMultiplier = PathfollowSettings.CrowdAgentRadiusMultiplier * 1.1f;   

        PathfollowSettings.FlyDiveSettings.SetFlyDiveModeToAlwaysFly();
        SetFlyHeight(PathfollowSettings.FlyDiveSettings);

        return PathfollowSettings;
    }

    void SetFlyHeight(FGothicFlyDiveSettings& FlySettings)
    {
        if (!IsValid(CharacterOfInterest))
        {
            float FlyHeightRelativeToGround = 0.f;
            if (TryGetPreferredHeightRelativeToGround(FlyHeightRelativeToGround))
            {
                FlySettings.SetAdaptHeightRelativeToNavGround(FlyHeightRelativeToGround);
            }
            else
            {
                FlySettings.SetAdaptHeightAutomatic();
            }
            
            return;
        }

        if (!IsAttackSelected() || !IsValid(SelectedAttack) || !SelectedAttack.bRequiresSpecificRelativeHeight)
        {
            float FlyHeightRelativeToTarget = 0.f;
            if (TryGetPreferredHeightRelativeToTarget(FlyHeightRelativeToTarget))
            {
                FlySettings.SetAdaptHeightRelativeToCharacter(CharacterOfInterest, FlyHeightRelativeToTarget);
            }
            else
            {
                FlySettings.SetAdaptHeightAutomatic();
            }
            
            return;
        }
        
        FlySettings.SetAdaptHeightRelativeToCharacter(CharacterOfInterest, SelectedAttack.MedianRequiredRelativeHeight);
    }

    bool TryGetPreferredHeightRelativeToTarget(float& RelativeHeight) const
    {
        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            RelativeHeight = RequiredHeightRelativeToTarget_ActiveAttacker;
            return true;
        }
        
        if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            RelativeHeight = RequiredHeightRelativeToTarget_PassiveAttacker;
            return true;
        }

        if (IsCurrentRole(ECombatRole::Observer))
        {
            RelativeHeight = RequiredHeightRelativeToTarget_Observer;
            return true;
        }

        return false;
    }

    bool TryGetPreferredHeightRelativeToGround(float& RelativeHeight) const
    {
        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            RelativeHeight = RequiredHeightRelativeToGround_ActiveAttacker;
            return true;
        }
        
        if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            RelativeHeight = RequiredHeightRelativeToGround_PassiveAttacker;
            return true;
        }

        if (IsCurrentRole(ECombatRole::Observer))
        {
            RelativeHeight = RequiredHeightRelativeToGround_Observer;
            return true;
        }

        return false;
    }

    void DefaultConfigValues() override
    {
        // FLYER BASE CONFIG VALUES
        EnemyTooCloseDistance = Config.PositioningValuesSizeMultiplier * 120.0f;
        EnemyCloseDistance = Config.PositioningValuesSizeMultiplier * 270.0f;
        EnemyLungeDistance = Config.PositioningValuesSizeMultiplier * 450.0f;
        EnemyCombatDistance = Config.PositioningValuesSizeMultiplier * 4000.0f;
        Positioning.SafeZonePadding = Config.PositioningValuesSizeMultiplier * 150.0f;

        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Config.PreferredDistance = 250.0f * Config.PositioningValuesSizeMultiplier;
        }
        else if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Config.PreferredDistance = 400.0f * Config.PositioningValuesSizeMultiplier;
        }
        else
        {
            Config.PreferredDistance = 700.0f * Config.PositioningValuesSizeMultiplier; // 3d, account for height, sqrt(horizontaldistace^2 + relativeheight^2)
        }   
    }
}

/** Non Strafing flyer - Harpy? */
UCLASS()
class UAIState_Combat_Creature_NonStrafingFlyer : UAIState_Combat_Creature_NonStrafer
{
    void DefaultConfigValues() override
    {
        // FLYER BASE CONFIG VALUES
        EnemyTooCloseDistance = Config.PositioningValuesSizeMultiplier * 120.0f;
        EnemyCloseDistance = Config.PositioningValuesSizeMultiplier * 270.0f;
        EnemyLungeDistance = Config.PositioningValuesSizeMultiplier * 450.0f;
        EnemyCombatDistance = Config.PositioningValuesSizeMultiplier * 4000.0f;
        Positioning.SafeZonePadding = Config.PositioningValuesSizeMultiplier * 150.0f;

        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Config.PreferredDistance = 250.0f;
        }
        else if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Config.PreferredDistance = 400.0f;
        }
        else
        {
            Config.PreferredDistance = 700.0f; // 3d, account for height, sqrt(horizontaldistace^2 + relativeheight^2)
        }   
    }
}

/** Non Strafing hoverer - Demon */
UCLASS()
class UAIState_Combat_Creature_NonStrafingHoverer : UAIState_Combat_Creature_Strafer
{

}

/** Strafing hoverer - Demon? */
UCLASS()
class UAIState_Combat_Creature_StrafingHoverer : UAIState_Combat_Creature_Strafer
{
    void DefaultConfigValues() override
    {
        // FLYER BASE CONFIG VALUES
        EnemyTooCloseDistance = Config.PositioningValuesSizeMultiplier * 120.0f;
        EnemyCloseDistance = Config.PositioningValuesSizeMultiplier * 270.0f;
        EnemyLungeDistance = Config.PositioningValuesSizeMultiplier * 450.0f;
        EnemyCombatDistance = Config.PositioningValuesSizeMultiplier * 4000.0f;
        Positioning.SafeZonePadding = Config.PositioningValuesSizeMultiplier * 150.0f;

        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Config.PreferredDistance = 250.0f;
        }
        else if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Config.PreferredDistance = 400.0f;
        }
        else
        {
            Config.PreferredDistance = 700.0f;
        }   
    }
}

/// Humanoid creatures, orcs and humans have separate Combat AIStates