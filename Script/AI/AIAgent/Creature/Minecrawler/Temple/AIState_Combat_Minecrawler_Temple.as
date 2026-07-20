UCLASS()
class  UAIState_Combat_Minecrawler_Temple: UAIState_Combat_Creature_Crablike
{
     /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Minecrawler_Temple);

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    float32 TauntCooldown = 5.0f;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.6f;
    default Config.PositioningValuesSizeMultiplier = 1.5f;

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
class UWeaponBehaviorSet_Minecrawler_Temple : UWeaponBehaviorSet_Minecrawler_Warrior
{
    // FAttackInfo AttackSpit = FAttackInfo(
    //     UCM_Attack_Extra02(), //326
    //     EAttackUsageType::Regular, 
    //     CombatScriptRoleSets::GetAttackerRoleSet(),
    //     5000.0f,
    //     InMinRange = 1000.0f,
    //     bInMaxRangeOverride = true);
    // default AddAttack(AttackSpit);

    // default Behavior_MediumPriority()
    //     .AttackTree(2.0f, "Spit Attack")
    //         .AddAttack(AttackSpit)
    //         .AddTreeCooldown("Attack_Spit", 10.0f)
    //         .AddRequirement(UCS_EnemyFartherThan(1000.0f));
    //         //.AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

}

UCLASS()
class UWeaponBehaviorSet_Minecrawler_Temple_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    FString GetDisplayName() const override
    {
        return "Minecrawler - Creature Combat";
    }

     FAttackInfo AttackSpit = FAttackInfo(
        UCM_Attack_Extra02(), //326
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetObserverRoleSet(),
        5000.0f,
        InMinRange = 1000.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackSpit);

    default Behavior_MediumPriority()
        .AttackTree(2.0f, "Spit Attack")
            .AddAttack(AttackSpit)
            .AddTreeCooldown("Attack_Spit", 12.0f)
            .AddRequirement(UCS_EnemyFartherThan(600.0f));
            //.AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(300.0f));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy(), 0.01f)
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UCombatBehaviorSetPackage_Minecrawler_Temple : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Temple_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Temple);
}