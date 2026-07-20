UCLASS(Abstract)
class UWeaponBehaviorSet_Human_Archery : UWeaponBehaviorSet_Ranged
{    
    ///// MOVEMENT /////    
    // default Behavior_MediumPriority()
    //         .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f,10.0f))
    //                  .AddRequirement(UCS_Not(UCS_EnemyDefeated()));

    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());


    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::FartherThan;

        // GROUNDED STRAFER RANGED CONFIG VALUES
        Combat.EnemyTooCloseDistance = Combat.Config.PositioningValuesSizeMultiplier * 150.0f;
        Combat.EnemyCloseDistance = Combat.Config.PositioningValuesSizeMultiplier * 400.0f;
        Combat.EnemyLungeDistance = Combat.Config.PositioningValuesSizeMultiplier * 500.0f;
        Combat.EnemyCombatDistance = Combat.Config.PositioningValuesSizeMultiplier * 3000.0f;

        Combat.Positioning.MinimumPositionDistance = Combat.Config.PositioningValuesSizeMultiplier * 150.0f;
        
        if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Combat.Positioning.MinimumPositionDistance = 30.0f;
            Combat.Config.PreferredDistance = Combat.Config.PositioningValuesSizeMultiplier * 750.0f;
        }
        else if (Combat.IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Combat.Positioning.MinimumPositionDistance = 150.0f;
            Combat.Config.PreferredDistance = Combat.Config.PositioningValuesSizeMultiplier * 950.0f;
        }
    }
}

UCLASS()
class UWeaponBehaviorSet_Human_Bow : UWeaponBehaviorSet_Human_Archery
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Bow);

    // ATTACKS /////////
    FAttackInfo AimedShotsMultiple = FAttackInfo(
        UCM_AimedShots(1.0f, 0.2f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 500.0f,
        InMaxRange = 3000.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AimedShotsMultiple);

    FAttackInfo AimedShotsSingle = FAttackInfo(
        UCM_AimedShots(1.0f, 0.4f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 500.0f,
        InMaxRange = 3000.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(AimedShotsSingle);

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Multiple Aimed Shots")
                    .AddAttack(AimedShotsMultiple)
                    .AddTreeCooldown("AimedShot", UNodeCooldownCalculation_WeaponSkillLevel(3.0f))
                    .AddTreeCooldownActivation("Taunt", 3.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Passive Single Shot")
                    .AddAttack(AimedShotsSingle)
                    .AddTreeCooldown("AimedShot", UNodeCooldownCalculation_WeaponSkillLevel(5.0f))
                    .AddTreeCooldownActivation("Taunt", 1.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Human_Crossbow : UWeaponBehaviorSet_Human_Archery
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Crossbow);

    // ATTACKS /////////
    FAttackInfo CrossbowShot = FAttackInfo(
        UCM_CrossbowShot(2.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMinRange = 500.0f,
        InMaxRange = 3000.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(CrossbowShot);

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Main Shot")
                    .AddAttack(CrossbowShot)
                    .AddTreeCooldown("AimedShot", UNodeCooldownCalculation_WeaponSkillLevel(3.0f))
                    .AddTreeCooldownActivation("Taunt", 3.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Passive Shot")
                    .AddAttack(CrossbowShot)
                    .AddTreeCooldown("AimedShot", UNodeCooldownCalculation_WeaponSkillLevel(5.0f))
                    .AddTreeCooldownActivation("Taunt", 1.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    ////////////////////

    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

    }
}

UCLASS()
class UCombatBehaviorSetPackage_Human_Archery : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_Bow::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Human_Crossbow::StaticClass());
}