UCLASS()
class UAIState_Combat_Orc_Sff1H_Shaman : UAIState_Combat_Orc_Base
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Orc_Sff1H_Shaman::StaticClass());

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 1000.0f;
        EnemyCombatDistance = 32000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    FString GetDisplayName() const override
    {
        return "Combat - Orc Shaman - Sff1H";
    }

    // default CommonBehavior_Movement
    //     .DoNode(UCBT_MoveToDoSelectedAttack());
}

UCLASS()
class UWeaponBehaviorSet_Orc_Sff1H_Shaman : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    //default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Fist);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Torch);

    // Attacks ///////////////
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackLeftRightLeft = FAttackInfo(
        UCM_AttackSCombo_LeftRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRightLeft);

    FAttackInfo AttackLeftBottom = FAttackInfo(
        UCM_AttackSCombo_LeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftBottom);

    FAttackInfo AttackRightTop = FAttackInfo(
        UCM_AttackSCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightTop);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottom);

    FAttackInfo AttackFireball = FAttackInfo(
        UCM_OrcShamanSpell_FireBall_CastChargedBasedOnDistance(40.0f,8000.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        // 400.0f,
        40000.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(AttackFireball);


    // BEHAVIORS ///////    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackBottom)
                .AddTreeCooldown("Attack", 6.0f)
                .AddRequirement(UCS_EnemyCloserThan(700.0f));
    
    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackFireball)
                .AddTreeCooldown("Attack", 7.0f)
                .AddRequirement(UCS_EnemyFartherThan(300.0f));

    default Behavior_MediumPriority()
            .AttackTree()
                //.AddAttack(AttackRightTop)
                .AddAttack(AttackLeftBottom)
                .AddAttack(AttackLeftRightLeft)
                .AddTreeCooldown("Attack_Main", 4.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree()
                .AddAttack(AttackLeft)
                .AddAttack(AttackLeftRightLeft)
                .AddAttack(AttackLeftRightLeft)
                .AddTreeCooldown("Attack_Main", 4.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_LowPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(130.0f,10.0f))
                .AddTreeCooldown("Dodge",2.0f);
    ////////////////////
    
    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 200.0f;
        Combat.EnemyCloseDistance = 500.0f;

        Combat.Config.PreferredDistance = 1000.0f;
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Orc_Sff1H_Shaman : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Orc_Sff1H_Shaman::StaticClass());
}