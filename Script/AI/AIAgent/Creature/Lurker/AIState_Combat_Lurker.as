UCLASS()
class UAIState_Combat_Lurker : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Lurker);

    //float32 TauntCooldown = 5.0f;

    default Config.PositioningValuesSizeMultiplier = 1.5f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 1.5f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 80.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.5f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Lurker - Creature Combat";
    }

    FGothicPathfollowSettings SetupCombatPathfollowingSettings(FString AddToDebugOwnerName) override
    {
        FGothicPathfollowSettings Settings = AI.CharacterState.DefaultPathfollowingSetting;
        Settings.DebugOwnerName = AddToDebugOwnerName + "UAIState_Lurker_Combat";

        // offset is relative to the NavGround: -10 means 10 units closer to the water surface
        if (ensure(CharacterOfInterest != nullptr))
        {
            Settings.FlyDiveSettings.SetAdaptHeightRelativeToCharacter(CharacterOfInterest, -15.f); 
        }

        return Settings;
    }
}

UCLASS()
class UWeaponBehaviorSet_Lurker_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    FString GetDisplayName() const override
    {
        return "Lurker - Creature Combat";
    }

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);

        default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(400.0f));
}

UCLASS()
class UWeaponBehaviorSet_Lurker : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    // ATTACKS /////////
    FAttackInfo DefensiveMeleeAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
                90.0f,
        //400.0f,
        bInMaxRangeOverride = true);
        //InAttackDirectionRequirement = EAttackDirectionRequirement::Any);
    default AddAttack(DefensiveMeleeAttack);

    FAttackInfo MeleeAttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(MeleeAttackRightSingle);

    FAttackInfo MeleeAttackLeftSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(MeleeAttackLeftSingle);

    FAttackInfo MeleeAttackLeftCombo = FAttackInfo(
        UCM_AttackCCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(MeleeAttackLeftCombo);

    FAttackInfo MeleeAttackRightCombo = FAttackInfo(
        UCM_AttackCCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(MeleeAttackRightCombo);

    FAttackInfo MeleeAttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(MeleeAttackBottomSingle);

    FAttackInfo MeleeAttackBottomRightCombo = FAttackInfo(
        UCM_AttackCCombo_BottomRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(MeleeAttackBottomRightCombo);

    FAttackInfo MeleeAttackBottomLeftCombo = FAttackInfo(
        UCM_AttackCCombo_BottomLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(MeleeAttackBottomLeftCombo);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.3f), 0.1f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);
    
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Defensive Attack")
                .AddAttack(DefensiveMeleeAttack)
                .AddTreeCooldown("Attack_Defensive", 5.0f)
                .AddRequirement(UCS_EnemyCloserThan(100.0f));
                //.AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Any));

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Bottom Attack")
                .AddAttack(MeleeAttackBottomSingle)
                .AddAttack(MeleeAttackBottomLeftCombo)
                .AddAttack(MeleeAttackBottomRightCombo)
                .AddTreeCooldown("Attack_Persecutory", 6.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(250.0f));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(MeleeAttackRightSingle)
                .AddAttack(MeleeAttackLeftSingle)
                .AddAttack(MeleeAttackLeftCombo)
                .AddAttack(MeleeAttackRightCombo)
                .AddTreeCooldown("Attack_Main", 2.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Passive Melee")
                .AddAttack(MeleeAttackRightSingle)
                .AddAttack(MeleeAttackLeftSingle)
                .AddTreeCooldown("Attack_Main", 12.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    /// MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}


UCLASS()
class UWeaponBehaviorSet_Lurker_Water : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Swimming);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_WaterWalking);

    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 1.5f;
    default TauntCooldown_General = 1.5f;

    FAttackInfo Water_Attack = FAttackInfo(
         UCM_Attack_Left(), 
         EAttackUsageType::Regular, 
         CombatScriptRoleSets::GetAttackerRoleSet(),
         InMaxRelativeHeight = 30.0f,
         InMinRelativeHeight = -30.0f,
         InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
         bInRequiresSpecificRelativeHeight = true);
    default AddAttack(Water_Attack);

    // BEHAVIORS ///////
    
        default Behavior_MediumPriority()
            .AttackTree(1, "Water")
                .AddAttack(Water_Attack)
                .AddTreeCooldown("Attack_Main", 3.0f);
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));


    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
    //             .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    /// BASE MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 60.0f;
        Combat.EnemyCloseDistance = 170.0f;
        Combat.EnemyLungeDistance = 350.0f;

        Combat.Positioning.MinimumPositionDistance = 150.0f;
        
        if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker) && Combat.CharacterOfInterest != nullptr)
        {
            Combat.Config.PreferredDistance = 350.0f;
        }
        else
        {
            Combat.Config.PreferredDistance = 450.0f;
        }
    }
}

UCLASS()
class UWeaponBehaviorSet_Lurker_Diving : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Diving);

    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 1.5f;
    default TauntCooldown_General = 1.5f;

    FAttackInfo Water_Attack = FAttackInfo(
         UCM_Attack_Left(), 
         EAttackUsageType::Regular, 
         CombatScriptRoleSets::GetAttackerRoleSet(),
         InAttackDirectionRequirement = EAttackDirectionRequirement::Any,
         InMaxRelativeHeight = 30.0f,
         InMinRelativeHeight = -30.0f,
         bInRequiresSpecificRelativeHeight = true);
    default AddAttack(Water_Attack);

    // BEHAVIORS ///////
    
        default Behavior_MediumPriority()
            .AttackTree(1, "Water")
                .AddAttack(Water_Attack)
                //.AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Any))
                .AddTreeCooldown("Attack_Main", 3.0f);
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));


    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());
    
    /// BASE MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 60.0f;
        Combat.EnemyCloseDistance = 170.0f;
        Combat.EnemyLungeDistance = 350.0f;

        Combat.Positioning.MinimumPositionDistance = 150.0f;
        
        if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker) && Combat.CharacterOfInterest != nullptr)
        {
            Combat.Config.PreferredDistance = 350.0f;
        }
        else
        {
            Combat.Config.PreferredDistance = 450.0f;
        }
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Lurker : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Lurker_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Lurker);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Lurker_Water);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Lurker_Diving);
}
