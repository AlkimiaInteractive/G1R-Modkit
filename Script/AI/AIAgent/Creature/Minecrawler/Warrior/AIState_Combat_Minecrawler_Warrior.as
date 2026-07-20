UCLASS()
class UAIState_Combat_Minecrawler_Warrior : UAIState_Combat_Creature_Crablike
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Minecrawler_Warrior);

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    //float32 TauntCooldown = 5.0f;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.6f;
    default Config.PositioningValuesSizeMultiplier = 2.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 80.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;  
    }

    // BEHAVIORS ///////
    ///// COMMON /////    
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Minecrawler Warrior - Creature Combat";
    }
}

UCLASS()
class UAIState_Combat_Minecrawler_Warrior_Large : UAIState_Combat_Creature_Crablike
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Minecrawler_Warrior_Large);

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    //float32 TauntCooldown = 5.0f;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.6f;
    default Config.PositioningValuesSizeMultiplier = 2.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 80.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;  
    }

    // BEHAVIORS ///////
    ///// COMMON /////    
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Minecrawler Warrior - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Minecrawler_Warrior_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FString GetDisplayName() const override
    {
        return "Minecrawler - Creature Combat";
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(300.0f));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy(), 0.01f)
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Minecrawler_Warrior : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 2.0f;

    default TauntCooldown_Base = 2.0f;
    default TauntCooldown_General = 2.0f;

    // ATTACKS /////////
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), //437
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackLeftRight = FAttackInfo(
        UCM_AttackCCombo_LeftRight(), //437
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRight);

    FAttackInfo AttackRight = FAttackInfo(
        UCM_Attack_Right(), //409
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRight);

    FAttackInfo AttackRightLeft = FAttackInfo(
        UCM_AttackCCombo_RightLeft(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightLeft);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), //519
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottom);

    FAttackInfo AttackBottomRight = FAttackInfo(
        UCM_AttackCCombo_BottomRight(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomRight);

    FAttackInfo AttackBottomLeft = FAttackInfo(
        UCM_AttackCCombo_BottomLeft(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomLeft);
    
    FAttackInfo AttackTop = FAttackInfo(
        UCM_Attack_Top(), //326
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackTop);

    FAttackInfo AttackTopDefensive = FAttackInfo(
        UCM_Attack_Extra01(), //326
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any);
    default AddAttack(AttackTopDefensive);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Defensive Attack")
                .AddAttack(AttackTopDefensive)
                .AddTreeCooldown("Attack_Defensive", 7.0f)
                .AddRequirement(UCS_EnemyCloserThan(180.0f))
                .AddRequirement(UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan(2, 10.0f));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Bottom Attack")
                .AddAttack(AttackBottomRight)
                .AddAttack(AttackBottomLeft)
                .AddTreeCooldown("Attack_Bottom", 7.0f)
                .AddRequirement(UCS_EnemyFartherThan(250.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(AttackRightLeft)
                .AddAttack(AttackRightLeft)
                .AddAttack(AttackLeftRight)
                .AddTreeCooldown("Attack_Main", 2.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Passive Melee")
                .AddAttack(AttackRight)
                .AddAttack(AttackLeft)
                .AddTreeCooldown("Attack_PAssive", 10.0f)
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
class UCombatBehaviorSetPackage_Minecrawler_Warrior : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Warrior_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Warrior);
}


UCLASS()
class UWeaponBehaviorSet_Minecrawler_Warrior_Large : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_MinecrawlerLeg);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 2.0f;

    default TauntCooldown_Base = 2.0f;
    default TauntCooldown_General = 2.0f;

    // ATTACKS /////////
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), //437
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackLeftRight = FAttackInfo(
        UCM_AttackCCombo_LeftRight(), //437
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRight);

    FAttackInfo AttackRight = FAttackInfo(
        UCM_Attack_Right(), //409
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRight);

    FAttackInfo AttackRightLeft = FAttackInfo(
        UCM_AttackCCombo_RightLeft(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightLeft);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), //519
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottom);

    FAttackInfo AttackBottomRight = FAttackInfo(
        UCM_AttackCCombo_BottomRight(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomRight);

    FAttackInfo AttackBottomLeft = FAttackInfo(
        UCM_AttackCCombo_BottomLeft(),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomLeft);
    
    FAttackInfo AttackTop = FAttackInfo(
        UCM_Attack_Top(), //326
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackTop);

    FAttackInfo AttackTopDefensive = FAttackInfo(
        UCM_Attack_Extra01(), //326
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InAttackDirectionRequirement = EAttackDirectionRequirement::Any);
    default AddAttack(AttackTopDefensive);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Defensive Attack")
                .AddAttack(AttackTopDefensive)
                .AddTreeCooldown("Attack_Defensive", 10.0f)
                .AddRequirement(UCS_EnemyCloserThan(300.0f));
                //.AddRequirement(UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan(3, 5.0f));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Bottom Attack")
                .AddAttack(AttackBottomRight)
                .AddAttack(AttackBottomLeft)
                .AddTreeCooldown("Attack_Bottom", 10.0f)
                .AddRequirement(UCS_EnemyFartherThan(500.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(AttackRightLeft)
                .AddAttack(AttackRightLeft)
                .AddAttack(AttackLeftRight)
                .AddTreeCooldown("Attack_Main", 7.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Passive Melee")
                .AddAttack(AttackRight)
                .AddAttack(AttackLeft)
                .AddTreeCooldown("Attack_PAssive", 12.0f)
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
class UCombatBehaviorSetPackage_Minecrawler_Warrior_Large : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Warrior_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Warrior_Large);
}