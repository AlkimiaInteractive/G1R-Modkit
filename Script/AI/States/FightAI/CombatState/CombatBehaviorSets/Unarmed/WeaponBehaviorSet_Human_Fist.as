UCLASS()
class UWeaponBehaviorSet_Human_Fist : UWeaponBehaviorSet_Melee_Human
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Fist);

    float32 AttackBehaviorCooldownMultiplier = 1.0f;

    float32 TauntCooldown = 5.0f;

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamagePercentInSeconds(0.3f, 7.0f), 0.5f)
                    .AddTreeCooldown("BlockStance", 20.0f);

    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());

    // default Behavior_MediumPriority()
    //         .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 10.0f))
    //             .AddRequirement(UCS_Not(UCS_EnemyDefeated()));
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Human_Fist_Untrained : UWeaponBehaviorSet_Human_Fist
{
    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottomSingle);

    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackTopSingle);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 10.0f))
                .AddTreeCooldown("Dodge", 2.0f)
                .AddRequirement(UCS_Not(UCS_EnemyDefeated()));

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Attack")
                    .AddAttack(AttackBottomSingle)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 7.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackRightSingle)
                    .AddAttack(AttackLeftSingle)
                    .AddAttack(AttackTopSingle)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // default Behavior_MediumPriority()
    //             .AttackTree(3.0f, "Passive Melee")
    //                 .AddAttack(AttackRightSingle)
    //                 .AddAttack(AttackLeftSingle)
    //                 .AddTreeCooldown(CooldownID_PassiveMelee, 15.0f)
    //                 .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (!Combat.Self.IsCurrentlyDrawnWeaponSkillUntrained())
        {
            Reason = "Skill not Untrained";
            return false;
        }

        return true;
    }

    bool IsCharacterCorrectTrainingLevel(const AGothicCharacter Character) const override
    {
        if (Character.IsMeleeFistsTrained() || Character.IsMeleeFistsMaster())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UWeaponBehaviorSet_Human_Fist_Trained : UWeaponBehaviorSet_Human_Fist
{
    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackTopSingle);

    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackCCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo AttackCombo_RightLeft = FAttackInfo(
        UCM_AttackCCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeft);

    FAttackInfo AttackCombo_RightLeftBottom = FAttackInfo(
        UCM_AttackSCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftBottom);

    FAttackInfo AttackCombo_RightLeftRight = FAttackInfo(
        UCM_AttackSCombo_RightLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftRight);

    FAttackInfo AttackCombo_BottomRight = FAttackInfo(
        UCM_AttackCCombo_BottomRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomRight);

    FAttackInfo AttackCombo_BottomLeft = FAttackInfo(
        UCM_AttackCCombo_BottomLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomLeft);

    FAttackInfo AttackCombo_BottomLeftRight = FAttackInfo(
        UCM_AttackSCombo_BottomLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomLeftRight);

    FAttackInfo AttackCombo_BottomRightLeft = FAttackInfo(
        UCM_AttackSCombo_BottomRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomRightLeft);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 10.0f))
                .AddTreeCooldown("Dodge", 2.0f)
                .AddRequirement(UCS_Not(UCS_EnemyDefeated()));

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Attack")
                    .AddAttack(AttackTopSingle)
                    .AddAttack(AttackCombo_BottomRight)
                    .AddAttack(AttackCombo_BottomLeft)
                    .AddAttack(AttackCombo_BottomLeftRight)
                    .AddAttack(AttackCombo_BottomRightLeft)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 6.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackTopSingle)
                    .AddAttack(AttackCombo_LeftRight)
                    .AddAttack(AttackCombo_RightLeft)
                    .AddAttack(AttackCombo_RightLeftBottom)
                    .AddAttack(AttackCombo_RightLeftRight)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // default Behavior_MediumPriority()
    //             .AttackTree(3.0f, "Passive Melee")
    //                 .AddAttack(AttackRightSingle)
    //                 .AddAttack(AttackLeftSingle)
    //                 .AddTreeCooldown(CooldownID_PassiveMelee, 15.0f)
    //                 .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (!Combat.Self.IsCurrentlyDrawnWeaponSkillTrained())
        {
            Reason = "Skill not Trained";
            return false;
        }

        return true;
    }

    bool IsCharacterCorrectTrainingLevel(const AGothicCharacter Character) const override
    {
        if (!Character.IsMeleeFistsTrained())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UWeaponBehaviorSet_Human_Fist_Master : UWeaponBehaviorSet_Human_Fist
{
    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackLeftSingle);

    // Combos Main
    FAttackInfo AttackCombo_RightLeftTop = FAttackInfo(
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftTop);

    FAttackInfo AttackCombo_RightLeftRight = FAttackInfo(
        UCM_AttackSCombo_RightLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftRight);

    FAttackInfo AttackCombo_LeftRightLeftTop = FAttackInfo(
        UCM_AttackCCombo_LeftRightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeftTop);

    // Combos Persecutory
    FAttackInfo AttackCombo_BottomLeftTop = FAttackInfo(
        UCM_AttackSCombo_BottomLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomLeftTop);

    FAttackInfo AttackCombo_BottomRightLeft = FAttackInfo(
        UCM_AttackSCombo_BottomRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomRightLeft);

    FAttackInfo AttackCombo_BottomLeftRightLeft = FAttackInfo(
        UCM_AttackCCombo_BottomLeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomLeftRightLeft);

    FAttackInfo AttackCombo_BottomRightLeftTop = FAttackInfo(
        UCM_AttackCCombo_BottomRightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomRightLeftTop);

    FAttackInfo AttackCombo_RightLeftBottom = FAttackInfo(
        UCM_AttackCCombo_RightLeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftBottom);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(120.0f, 10.0f))
                .AddTreeCooldown("Dodge", 2.0f)
                .AddRequirement(UCS_Not(UCS_EnemyDefeated()));

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Attack")
                    .AddAttack(AttackCombo_BottomLeftTop)
                    .AddAttack(AttackCombo_BottomRightLeft)
                    .AddAttack(AttackCombo_BottomLeftRightLeft)
                    .AddAttack(AttackCombo_BottomRightLeftTop)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 4.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackCombo_RightLeftTop)
                    .AddAttack(AttackCombo_RightLeftRight)
                    .AddAttack(AttackCombo_RightLeftBottom)
                    .AddAttack(AttackCombo_LeftRightLeftTop)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // default Behavior_MediumPriority()
    //             .AttackTree(3.0f, "Passive Melee")
    //                 .AddAttack(AttackRightSingle)
    //                 .AddAttack(AttackLeftSingle)
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
        if (!Character.IsMeleeFistsMaster())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Human_Fists : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_Fist_Untrained::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_Fist_Trained::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_Fist_Master::StaticClass());
}