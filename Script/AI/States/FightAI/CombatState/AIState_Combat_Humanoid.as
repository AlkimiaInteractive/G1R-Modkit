UCLASS()
class UAIState_Combat_Humanoid : UAIState_Combat_G1R
{
    default CooldownsOnMoveEnded.FindOrAdd(UCM_CastSpell_Base)
                                    .SetCooldown(1.0f)
                                    .AddMoveToPutOnCooldown(UCM_Taunt);
                                    
    default AssessmentModuleClass = UAIARM_State_Combat_Creature;
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Add(UCM_Dodge::StaticClass());
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Add(UCM_Attack::StaticClass());
    
    void InitializeCombatPositioning() override
    {
        Positioning = UAICombatPositioning_StaticCircleAroundTarget(this);
    }

    FString GetDisplayName() const override
    {
        return "Humanoid Combat";
    }

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

    default CommonBehavior_LowPriority
            .DoNode(UCBT_Tree_Taunts());
    
    default CommonBehavior_MediumPriority
            .DoNode(UCBT_Tree_DodgeToUnStuck());


    FGothicPathfollowSettings SetupCombatPathfollowingSettings(FString AddToDebugOwnerName) override
    {
        FGothicPathfollowSettings PathfollowSettings = Super::SetupCombatPathfollowingSettings(AddToDebugOwnerName);
        PathfollowSettings.DebugOwnerName = "UAIState_Combat_Humanoid" + AddToDebugOwnerName;

        PathfollowSettings.CrowdAgentRadiusMultiplier = PathfollowSettings.CrowdAgentRadiusMultiplier * 1.3f;   
        PathfollowSettings.CrowdAgentSeparationWeight = 35.f;
        PathfollowSettings.ModifyAvoidVelocitySettings.MediumRangeVelocityMultiplier = 0.6f;
        PathfollowSettings.ModifyAvoidVelocitySettings.ShortRangeVelocityMultiplier = 0.4f;

        return PathfollowSettings;
    }
}

/** Non strafing humanoid - Zombie, Troll, Fire golem, Ice golem */
UCLASS()
class UAIState_Combat_NonStrafingHumanoid : UAIState_Combat_G1R
{
    default AssessmentModuleClass = UAIARM_State_Combat_Creature;
    
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Add(UCM_Dodge::StaticClass());
    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Add(UCM_Attack::StaticClass());

    default Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::CloserThan;

    void ValidateSelectedAttack() override
    {
        Super::ValidateSelectedAttack();
        
        if (!IsAttackSelected() || !IsValid(SelectedAttack))
            return;

        if (!Self.CanStrafe() && SelectedAttack.MinRange > DistanceToCharacterOfInterest)
        {
            ResetSelectedAttack();
            return;
        }
    }

    void InitializeCombatPositioning() override
    {
        Positioning = UAICombatPositioning_StaticCircleAroundTarget_NoStrafing(this);
    }

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
        PathfollowSettings.DebugOwnerName = "UAIState_Combat_NonStrafingHumanoid" + AddToDebugOwnerName;

        PathfollowSettings.CrowdAgentRadiusMultiplier = PathfollowSettings.CrowdAgentRadiusMultiplier * 1.3f;   
        PathfollowSettings.CrowdAgentSeparationWeight = 35.f;
        PathfollowSettings.ModifyAvoidVelocitySettings.MediumRangeVelocityMultiplier = 0.6f;
        PathfollowSettings.ModifyAvoidVelocitySettings.ShortRangeVelocityMultiplier = 0.4f;

        return PathfollowSettings;
    }

    default CommonBehavior_LowPriority
            .DoNode(UCBT_Tree_Taunts());
}