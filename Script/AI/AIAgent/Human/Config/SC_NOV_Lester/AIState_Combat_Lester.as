UCLASS()
class UAIState_Combat_Human_Lester : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    /// Behavior Sets
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Items);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_HumanOrc);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Observer);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Swimming);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Lester_Special); 
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Melee);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Magic);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Archery);

    default bTauntsEnabled = true;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        Config.bUseWeaponSkillLevels = true;

        EnemyTooCloseDistance = 5.0f;
        EnemyCombatDistance = 750.0f;

        Config.ReactToAttackBackDodgeChance_Untrained = 0.0f;
        Config.ReactToAttackFrontDodgeChance_Untrained = 0.1f;
        Config.ReactToAttackBackDodgeChance_Trained = 0.2f;

        Config.ReactiveBlockingChance_Trained = 0.2f;
        Config.ReactToAttackFrontDodgeChance_Trained = 0.33f;

        Config.ReactToAttackBackDodgeChance_Master = 0.3f;

        Config.ReactiveBlockingChance_Master = 0.33f;
        Config.ReactToAttackFrontDodgeChance_Master = 0.5f;        
    }

    // BEHAVIORS ///////
    /// MAIN ACTIONS //
    default CommonBehavior_MediumPriority
        .DoNode(UCBT_Tree_ExitBlockStanceWhenEnemyFarOrBlockedLongEnough(), 0.01f);

    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Human_M1H_LesterVSGolem : UWeaponBehaviorSet_Human_M1H
{
   // ATTACKS /////////
    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackBottomSingle);

     FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackTopSingle);

    FAttackInfo AttackCombo_RightBottom = FAttackInfo(
        UCM_AttackSCombo_RightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightBottom);

    FAttackInfo AttackCombo_LeftTop = FAttackInfo(
        UCM_AttackSCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftTop);

    FAttackInfo AttackCombo_LeftRightBottom = FAttackInfo(
        UCM_AttackCCombo_LeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightBottom);

    FAttackInfo AttackCombo_RightLeftTop = FAttackInfo(
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftTop);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeft);

    
    FAttackInfo FistOfWind = FAttackInfo(
        UCM_Spell_Lester_FistOfWind(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(FistOfWind);

    FAttackInfo FistOfWindLongRange = FAttackInfo(
        UCM_Spell_Lester_FistOfWind(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        500.0f, //1200
        0.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(FistOfWindLongRange);
    ///////////////////
    
    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Main Melee")
                    .AddAttack(AttackCombo_LeftTop)
                    .AddAttack(AttackCombo_RightBottom)
                    .AddAttack(AttackCombo_LeftRightBottom)
                    .AddAttack(AttackCombo_LeftRightLeft)
                    .AddAttack(AttackCombo_RightLeftTop)
                    .AddTreeCooldown(CooldownID_MainMelee, 3.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    // default Behavior_MediumPriority()
    //             .AttackTree(1.0f, "Fist of Wind")
    //                 .AddAttack(FistOfWind)
    //                 .AddTreeCooldown("Spell", 7.0f)
    //                 .AddRequirement(UCS_EnemyCloserThan(150.0f))
    //                 .AddRequirement(UCS_FacingEnemy());

    // default Behavior_MediumPriority()
    //             .AttackTree(1.0f, "Fist of Wind")
    //                 .AddAttack(FistOfWindLongRange)
    //                 .AddTreeCooldown("SpellLong", 7.0f)
    //                 .AddRequirement(UCS_EnemyCloserThan(350.0f))
    //                 .AddRequirement(UCS_Not(UCS_IsReachableInMelee()))
    //                 .AddRequirement(UCS_FacingEnemy());

    // default Behavior_MediumPriority()
    //             .AttackTree(2.0f, "Passive Melee")
    //                 .AddAttack(AttackBottomSingle)
    //                 .AddAttack(AttackTopSingle)
    //                 .AddTreeCooldown(CooldownID_PassiveMelee, 15.0f)
    //                 .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (!Combat.Self.IsCurrentlyDrawnWeaponSkillMaster())
        {
            Reason = "Skill not Master";
            return false;
        }

        return true;
    }

    bool IsCharacterCorrectTrainingLevel(const AGothicCharacter Character) const override
    {
        if (!Character.IsMeleeOneHandedMaster())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Lester_Special : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_M1H_LesterVSGolem);
}