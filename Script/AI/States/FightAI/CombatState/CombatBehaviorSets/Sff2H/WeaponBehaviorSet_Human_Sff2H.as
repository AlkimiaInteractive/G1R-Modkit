UCLASS()
class UWeaponBehaviorSet_Human_Sff2H : UWeaponBehaviorSet_Melee_Human
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);

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

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 10.0f))
                .AddTreeCooldown("Dodge", 2.0f)
                .AddRequirement(UCS_Not(UCS_EnemyDefeated()));
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Human_Sff2H_Untrained : UWeaponBehaviorSet_Human_Sff2H
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
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackBottomSingle);

    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackTopSingle);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Vertical Attack")
                    .AddAttack(AttackTopSingle)
                    .AddAttack(AttackBottomSingle)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 7.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackRightSingle)
                    .AddAttack(AttackLeftSingle)
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
        if (Character.IsMeleeTwoHandedTrained() || Character.IsMeleeTwoHandedMaster())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UWeaponBehaviorSet_Human_Sff2H_Trained : UWeaponBehaviorSet_Human_Sff2H
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

    FAttackInfo AttackCombo_BottomTopBottom = FAttackInfo(
        UCM_AttackCCombo_BottomTopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomTopBottom);

    FAttackInfo AttackCombo_TopBottomTop = FAttackInfo(
        UCM_AttackCCombo_TopBottomTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopBottomTop);

    FAttackInfo AttackCombo_BottomTop = FAttackInfo(
        UCM_AttackCCombo_BottomTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomTop);

    FAttackInfo AttackCombo_TopBottom = FAttackInfo(
        UCM_AttackCCombo_TopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopBottom);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Vertical Attack")
                    .AddAttack(AttackCombo_BottomTopBottom)
                    .AddAttack(AttackCombo_TopBottomTop)
                    .AddAttack(AttackCombo_TopBottom)
                    .AddAttack(AttackCombo_BottomTop)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 6.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackRightSingle, 0.5f)
                    .AddAttack(AttackLeftSingle, 0.5f)
                    .AddAttack(AttackCombo_TopBottom)
                    .AddAttack(AttackCombo_BottomTop)
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
        if (!Character.IsMeleeTwoHandedTrained())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UWeaponBehaviorSet_Human_Sff2H_Master : UWeaponBehaviorSet_Human_Sff2H
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

    FAttackInfo AttackCombo_BottomRight = FAttackInfo(
        UCM_AttackCCombo_BottomRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomRight);

    FAttackInfo AttackCombo_TopLeft = FAttackInfo(
        UCM_AttackCCombo_TopLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopLeft);

    FAttackInfo AttackCombo_BottomTopRight = FAttackInfo(
        UCM_AttackSCombo_BottomTopRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomTopRight);

    FAttackInfo AttackCombo_TopBottomLeft = FAttackInfo(
        UCM_AttackSCombo_TopBottomLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopBottomLeft);

    FAttackInfo AttackCombo_BottomTopBottom = FAttackInfo(
        UCM_AttackSCombo_BottomTopBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_BottomTopBottom);

    FAttackInfo AttackCombo_TopBottomTop = FAttackInfo(
        UCM_AttackSCombo_TopBottomTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_TopBottomTop);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Vertical Attack")
                    .AddAttack(AttackCombo_BottomRight)
                    .AddAttack(AttackCombo_TopLeft)
                    .AddAttack(AttackCombo_BottomTopRight)
                    .AddAttack(AttackCombo_TopBottomLeft)
                    .AddAttack(AttackCombo_BottomTopBottom)
                    .AddAttack(AttackCombo_TopBottomTop)
                    .AddTreeCooldown(CooldownID_ChasingAttack, 4.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyFartherThan(200.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Main Melee")
                    .AddAttack(AttackRightSingle)
                    .AddAttack(AttackLeftSingle)
                    .AddAttack(AttackCombo_BottomTopBottom)
                    .AddAttack(AttackCombo_TopBottomTop)
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
        if (!Character.IsMeleeTwoHandedMaster())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Human_Sff2H : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_Sff2H_Untrained::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_Sff2H_Trained::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_Sff2H_Master::StaticClass());
}