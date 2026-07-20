UCLASS()
class UAIState_Combat_Human_Gorn : UAIState_Combat_Human
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////

    /// Behavior Sets
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Items);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_HumanOrc);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Observer);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Human_Swimming);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Gorn_Special); 
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
class UWeaponBehaviorSet_Human_A2H_GornVSTroll : UWeaponBehaviorSet_Human_A2H
{
    // ATTACKS /////////
    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackTopSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackCombo_LeftTop = FAttackInfo(
        UCM_AttackCCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftTop);

    FAttackInfo AttackCombo_RightLeftTop = FAttackInfo(
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftTop);

    FAttackInfo AttackCombo_LeftRightBottom = FAttackInfo(
        UCM_AttackSCombo_LeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightBottom);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeft);

    FAttackInfo AttackCombo_LeftRightLeftTop = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeftTop);

    FAttackInfo AttackCombo_RightLeftRightBottom = FAttackInfo(
        UCM_AttackSCombo_RightLeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeftTop);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottomSingle);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(120.0f, 10.0f))
                .AddTreeCooldown("Dodge", 2.0f)
                .AddRequirement(UCS_Not(UCS_EnemyDefeated()));
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Attack")
                    .AddAttack(AttackBottomSingle)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 8.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackTopSingle)
                    .AddAttack(AttackCombo_LeftTop)
                    .AddAttack(AttackCombo_RightLeftTop)
                    .AddAttack(AttackCombo_LeftRightLeft)
                    .AddAttack(AttackCombo_LeftRightBottom)
                    .AddAttack(AttackCombo_LeftRightLeftTop)
                    .AddAttack(AttackCombo_RightLeftRightBottom)
                    .AddTreeCooldown(CooldownID_MainMelee, 7.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Passive Melee")
                    .AddAttack(AttackRightSingle)
                    .AddAttack(AttackLeftSingle)
                    .AddTreeCooldown(CooldownID_PassiveMelee, 15.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
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

        if (!IsValid(Combat.CharacterOfInterest))
        {
            Reason = "No target";
            return false;
        }

        if (!Combat.CharacterOfInterest.IsSpecies(GameplayTag::Species_Creature_Troll))
        {
            Reason = "Target is not a troll";
            return false;
        }

        return true;
    }

    bool IsCharacterCorrectTrainingLevel(const AGothicCharacter Character) const override
    {
        if (!Character.IsMeleeTwoHandedMaster())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Gorn_Special : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_A2H_GornVSTroll);
}