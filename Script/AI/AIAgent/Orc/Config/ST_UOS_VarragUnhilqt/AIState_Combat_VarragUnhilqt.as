UCLASS()
class UAIState_Combat_Varrag_Unhilqt : UAIState_Combat_Orc_Base
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Varrag_Unhilqt::StaticClass());

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 700.0f;
        EnemyCombatDistance = 5000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    FString GetDisplayName() const override
    {
        return "Combat - Varrag Unihlqt - Sff1H / Fists";
    }

    // default CommonBehavior_Movement
    //     .DoNode(UCBT_MoveToDoSelectedAttack());
}

UCLASS()
class UWeaponBehaviorSet_Varrag_Unhilqt_Sff1H : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_ChainLightning);

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    default BaseRoleSlotSize = 0.01f;
    default BaseRolePriority = 1000000000.0f;

    FAttackInfo TestAttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        700.0f);
    default AddAttack(TestAttackLeft);    

    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackLeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRight);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottom);

    FAttackInfo ChainLightingAttack = FAttackInfo(
        UCM_OrcShamanSpell_ChainLightning_CastForSeconds(10.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        InMinRange = 500.0f,
       // 1500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(ChainLightingAttack);

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Attack")
                    .AddAttack(AttackBottom)
                    .AddTreeCooldown("Melee", 5.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(300.0f));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Chain Lightning")
                    .AddAttack(ChainLightingAttack)
                    .AddTreeCooldown("ChainLightning", 5.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                    //.AddRequirement(UCS_EnemyFartherThan(350.0f));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Side Combo")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Melee", 4.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                    //.AddRequirement(UCS_EnemyCloserThan(350.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(4.0f, "Passive Attacker")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Melee_Passive", 10.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(350.0f));

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f,11.0f))
                .AddTreeCooldown("Dodge",1.5f);
    
    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.01f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_Positioning_Strafer(), 0.1f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}

UCLASS()
class UWeaponBehaviorSet_Varrag_Unhilqt_Fists : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Fist);

    default BaseRoleSlotSize = 0.01f;

    // Attacks ///////////////
    FAttackInfo TestAttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(TestAttackLeft);    

    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackLeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRight);

    FAttackInfo AttackLeftRightTop = FAttackInfo(
        UCM_AttackSCombo_LeftRightTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftRightTop);

    FAttackInfo AttackLeftTop = FAttackInfo(
        UCM_AttackSCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftTop);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottom);


    // BEHAVIORS ///////    
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Active Attacker")
                .AddAttack(AttackLeftRight)
                .AddTreeCooldown("Melee", 4.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Passive Attacker")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Melee_Passive", 10.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(300.0f));

    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Varrag_Unhilqt : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Varrag_Unhilqt_Sff1H::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Varrag_Unhilqt_Fists::StaticClass());
}