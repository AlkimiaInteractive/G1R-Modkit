UCLASS()
class UAIState_Combat_Bloodfly : UAIState_Combat_Creature_StrafingFlyer
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Bloodfly);

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    default Config.PositioningValuesSizeMultiplier = 1.5f;

    default RequiredHeightRelativeToTarget_ActiveAttacker     = 5.0f;
    default RequiredHeightRelativeToTarget_PassiveAttacker    = 5.0f;
    default RequiredHeightRelativeToTarget_Observer           = 5.0f;

    default RequiredHeightRelativeToGround_ActiveAttacker     = 5.0f;
    default RequiredHeightRelativeToGround_PassiveAttacker    = 5.0f;
    default RequiredHeightRelativeToGround_Observer           = 5.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        //To test observers not moving
        //Config.PreferredDistance = 50.0f;
        EnemyTooCloseDistance = 100.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.5f;
    }

    //float32 TauntCooldown = 5.0f;

    FString GetDisplayName() const override
    {
        return "Bloodfly - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Bloodfly_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    FString GetDisplayName() const override
    {
        return "Bloodfly - Creature Combat";
    }
    
    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(200.0f));
   
    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS()
class UWeaponBehaviorSet_Bloodfly : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    float MeleeMaxRelativeHeight = 30.0f;
    float MeleeMinRelativeHeight = -25.0f;
    // ATTACKS /////////
    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        250.0f,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = true,);
        // bInRequiresSpecificRelativeHeight = true);
    default AddAttack(AttackTopSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        150.0f,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,);
        // bInRequiresSpecificRelativeHeight = true);
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        150.0f,
        // InMaxRelativeHeight = MeleeMaxRelativeHeight,
        // InMinRelativeHeight = MeleeMinRelativeHeight,
        bInMaxRangeOverride = true,);
        // bInRequiresSpecificRelativeHeight = true);
    default AddAttack(AttackRightSingle);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Top Attack")
                .AddAttack(AttackTopSingle)
                .AddTreeCooldown("Attack_Lunge", 10.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(200, 300));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Main Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                .AddTreeCooldown("Attack_Main", 2.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Passive Melee")
                .AddAttack(AttackLeftSingle)
                .AddAttack(AttackRightSingle)
                .AddTreeCooldown("Attack_Passive", 7.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer_Flyer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());

    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Bloodfly : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Bloodfly_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Bloodfly);
}