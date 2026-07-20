UCLASS()
class UWeaponBehaviorSet_Human_M2H : UWeaponBehaviorSet_Melee_Human
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);

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
class UWeaponBehaviorSet_Human_M2H_Untrained : UWeaponBehaviorSet_Human_M2H
{
    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
        //150.0f);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackLeftSingle);

    FAttackInfo AttackTopSingle = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackTopSingle);

    FAttackInfo AttackBottomSingle = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottomSingle);
    ///////////////////
    
    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Main Melee")
                    .AddAttack(AttackRightSingle)
                    .AddAttack(AttackLeftSingle)
                    .AddAttack(AttackBottomSingle)
                    .AddAttack(AttackTopSingle)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // default Behavior_MediumPriority()
    //             .AttackTree(2.0f, "Passive Melee")
    //                 .AddAttack(AttackRightSingle)
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
        if (Character.IsMeleeOrcTrained() || Character.IsMeleeOrcMaster())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UWeaponBehaviorSet_Human_M2H_Trained : UWeaponBehaviorSet_Human_M2H
{
    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackRightSingle);

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

    FAttackInfo AttackCombo_LeftRight = FAttackInfo(
        UCM_AttackCCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRight);

    FAttackInfo AttackCombo_RightLeftRight = FAttackInfo(
        UCM_AttackCCombo_RightLeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftRight);

    FAttackInfo AttackCombo_LeftRightLeft = FAttackInfo(
        UCM_AttackCCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightLeft);

    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Main Melee")
                    .AddAttack(AttackTopSingle, 0.5f)
                    .AddAttack(AttackBottomSingle, 0.5f)
                    .AddAttack(AttackCombo_LeftRight)
                    .AddAttack(AttackCombo_LeftRightLeft)
                    .AddAttack(AttackCombo_RightLeftRight)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // default Behavior_MediumPriority()
    //             .AttackTree(2.0f, "Passive Melee")
    //                 .AddAttack(AttackRightSingle)
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
        if (!Character.IsMeleeOrcTrained())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UWeaponBehaviorSet_Human_M2H_Master : UWeaponBehaviorSet_Human_M2H
{
    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::PassiveAttacker));
    default AddAttack(AttackRightSingle);

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

    FAttackInfo AttackCombo_LeftTop = FAttackInfo(
        UCM_AttackCCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftTop);

    FAttackInfo AttackCombo_LeftRightBottom = FAttackInfo(
        UCM_AttackSCombo_LeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_LeftRightBottom);

    FAttackInfo AttackCombo_RightLeftTop = FAttackInfo(
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftTop);

    FAttackInfo AttackCombo_RightLeftRightBottom = FAttackInfo(
        UCM_AttackSCombo_RightLeftRightBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackCombo_RightLeftRightBottom);    
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Main Melee")
                    .AddAttack(AttackTopSingle, 0.5f)
                    .AddAttack(AttackBottomSingle, 0.5f)
                    .AddAttack(AttackCombo_LeftTop)
                    .AddAttack(AttackCombo_LeftRightBottom)
                    .AddAttack(AttackCombo_RightLeftTop)
                    .AddAttack(AttackCombo_RightLeftRightBottom)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.4f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    // default Behavior_MediumPriority()
    //             .AttackTree(2.0f, "Passive Melee")
    //                 .AddAttack(AttackRightSingle)
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
        if (!Character.IsMeleeOrcMaster())
            return false;

        return Super::IsCharacterCorrectTrainingLevel(Character);
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Human_M2H : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_M2H_Untrained::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_M2H_Trained::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_M2H_Master::StaticClass());
}