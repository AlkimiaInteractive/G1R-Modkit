UCLASS(Abstract)
class UAIState_Combat_Orc_Base : UAIState_Combat_HumanOrc
{
    default Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::Exact;

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 0.5f;
    default Config.PositioningValuesSizeMultiplier = 3.0f;

    //default FarSpeed = EWalkSpeed::Sprinting;
    default MovementSpeedChangeDistanceToCollisionRadiusRatio = 10.0f;

    float32 TauntCooldown = 5.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();
        
        EnemyCombatDistance = 5000.0f;

        Config.ReactToAttackBackDodgeChance = 0.3f;
        Config.ReactToAttackFrontDodgeChance = 0.3f;
        Config.TauntVoiceProbability = MAX_flt;
        
        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            // Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 250.0f;
            Positioning.SafeZonePadding = 100;
        }
        else if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            // Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
            Positioning.SafeZonePadding = 150;
        }
        else
        {
            // Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 500.0f;
            Positioning.SafeZonePadding = 150;
        }
    }
    bool CanSprint() override
    {
        return true;
    }
    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    ////////////////////

    FGothicPathfollowSettings SetupCombatPathfollowingSettings(FString AddToDebugOwnerName) override
    {
        FGothicPathfollowSettings PathfollowSettings = Super::SetupCombatPathfollowingSettings(AddToDebugOwnerName);

        PathfollowSettings.CrowdAgentRadiusMultiplier = PathfollowSettings.CrowdAgentRadiusMultiplier * 1.8f;
        PathfollowSettings.CrowdAgentSeparationWeight = 35.f;
        PathfollowSettings.ModifyAvoidVelocitySettings.MediumRangeVelocityMultiplier = 0.6f;
        PathfollowSettings.ModifyAvoidVelocitySettings.ShortRangeVelocityMultiplier = 0.5f;

        return PathfollowSettings;
    }
}

UCLASS()
class UAIState_Combat_Orc_Generic : UAIState_Combat_Orc_Base
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    //default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Items);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_HumanOrc);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Orc_Observer);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Orc_ThrowStones);
    //default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Orc_Swimming);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Orc_Melee);

    FString GetDisplayName() const override
    {
        return "Combat - Orc";
    }
}

UCLASS()
class UCombatBehaviorSet_Orc_Observer : UCombatBehaviorSet_Observer
{
    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Config.ReactiveBlockingChance_Trained = 0.0f;
        Combat.Config.ReactiveBlockingChance_Master = 0.0f;
    }

    // BEHAVIORS ///////
    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////

}

UCLASS()
class UWeaponBehaviorSet_Orc_TargetOnlyReachableWithStones : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Axe);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Fist);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    default BaseRoleSlotSize = 0.6f;

    float32 Cooldown_ThrowStone = 3.0f;
    float32 Cooldown_Passive_ThrowStone = 4.0f;

    // Attacks ///////////////
    FAttackInfo AttackStone = FAttackInfo(
        UCM_OrcSpecialAttack_StoneThrow(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1500.0f,
        250.0f,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackStone);
    ////////////////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Throw Stone Active")
                .AddAttack(AttackStone)
                .AddTreeCooldown("Attack_Stone_Active", Cooldown_ThrowStone)
                .AddRequirement(UCS_EnemyVisible())
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(AttackStone.MinRange));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Throw Stone Passive")
                .AddAttack(AttackStone)
                .AddTreeCooldown("Attack_Stone_Passive", Cooldown_Passive_ThrowStone)
                .AddRequirement(UCS_EnemyVisible())
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(AttackStone.MinRange));

    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (Combat.IsTargetReachableInMelee() && Combat.AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Combat.CharacterOfInterest))
        {
            Reason = "Target reachable in melee and in same territory or combat radius.";
            return false;
        }

        return true;
    }

    FString GetDisplayName() const override
    {
        return "Orc Base - Throw Stones - Creature Combat";
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Orc_ThrowStones : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_TargetOnlyReachableWithStones);
}

UCLASS()
class UCombatBehaviorSetPackage_Orc_Observer : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Orc_Observer);
}