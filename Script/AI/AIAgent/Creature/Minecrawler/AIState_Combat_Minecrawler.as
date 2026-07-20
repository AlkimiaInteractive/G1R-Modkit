UCLASS()
class UAIState_Combat_Minecrawler : UAIState_Combat_Creature_Crablike
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Minecrawler);

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.55f;
    default Config.PositioningValuesSizeMultiplier = 1.5f;

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
        return "Minecrawler - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Minecrawler_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    FString GetDisplayName() const override
    {
        return "Minecrawler - Creature Combat";
    }

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FAttackInfo AttackBottomRight = FAttackInfo(
        UCM_AttackCCombo_BottomRight(), //411
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomRight);

     default Behavior_MediumPriority()
            .AttackTree(1.0f, "Bottom Attack obs")
                .AddAttack(AttackBottomRight)
                .AddTreeCooldown("Attack_Bottom", 5.0f)
                .AddRequirement(UCS_EnemyInsideDistanceRange(450.0f,750.0f));
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::Observer));

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer()); 

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy(), 0.01f)
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);

}

UCLASS()
class UWeaponBehaviorSet_Minecrawler : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    // ATTACKS /////////
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), //322
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackRight = FAttackInfo(
        UCM_Attack_Right(), //345
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRight);

    FAttackInfo AttackRightLeft = FAttackInfo(
        UCM_AttackCCombo_RightLeft(), //345
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightLeft);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), //411
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottom);

    FAttackInfo AttackBottomRight = FAttackInfo(
        UCM_AttackCCombo_BottomRight(), //411
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomRight);

      FAttackInfo AttackBottomLeft = FAttackInfo(
        UCM_AttackCCombo_BottomLeft(), //411
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomLeft);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Bottom Attack")
                .AddAttack(AttackBottomRight)
                .AddAttack(AttackBottomLeft)
                .AddTreeCooldown("Attack_Bottom", 7.0f)
                .AddRequirement(UCS_EnemyFartherThan(250.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Main Melee")
                .AddAttack(AttackRightLeft, 0.75f)
                .AddAttack(AttackBottomRight, 0.25f)
                .AddTreeCooldown("Attack_Main", 3.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Passive Melee")
                .AddAttack(AttackRight)
                .AddAttack(AttackLeft)
                .AddTreeCooldown("Attack_PAssive", 2.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));    

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Minecrawler : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler);
}