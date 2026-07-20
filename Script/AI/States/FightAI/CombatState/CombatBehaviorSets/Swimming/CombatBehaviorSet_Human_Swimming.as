UCLASS()
class UCombatBehaviorSet_Human_Swimming : UWeaponBehaviorSet
{
    default Roles.Add(ECombatRole::PassiveAttacker);
    default Roles.Add(ECombatRole::ActiveAttacker);

    float32 AttackBehaviorCooldownMultiplier = 1.0f;

    float32 TauntCooldown = 5.0f;

    // BEHAVIORS ///////
    // default Behavior_MediumPriority()
    //             .DoNode(UCBT_Tree_EnterBlockStanceAndMoveBackWhenReceivedDamagePercentInSeconds(0.3f, 7.0f), 0.5f)
    //                 .SetTreeCooldown("BlockStance", 20.0f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////

    // ATTACKS /////////
    FAttackInfo AttackRightSingle = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 120.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRightSingle);

    FAttackInfo AttackLeftSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular,
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 120.0f,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeftSingle);
    ///////////////////

    // BEHAVIORS ///////    
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Main Melee")
                    .AddAttack(AttackRightSingle)
                    .AddAttack(AttackLeftSingle)
                    .AddTreeCooldown(CooldownID_MainMelee, 1.5f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Passive Melee")
                    .AddAttack(AttackRightSingle)
                    .AddAttack(AttackLeftSingle)
                    .AddTreeCooldown(CooldownID_PassiveMelee, 15.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (Combat.Self.HasDrawnRangedWeapon())
        {
            Reason = "Ranged weapon drawn";
            return false;
        }

        if (!Combat.Self.IsSwimming())
        {
            Reason = "Not swimming";
            return false;
        }

        return true;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Human_Swimming : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Human_Swimming::StaticClass());
}