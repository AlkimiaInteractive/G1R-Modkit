UCLASS()
class UAIState_Combat_Varrag_Hashor : UAIState_Combat_Orc_Base
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Varrag_Hashor::StaticClass());
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_HumanOrc);

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 1000.0f;
        EnemyCombatDistance = 1200.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.25f;
        Config.ReactToAttackFrontDodgeChance = 0.33f;
    }

    FString GetDisplayName() const override
    {
        return "Combat - Varrag Hashor - Sff1H";
    }
}

UCLASS()
class UWeaponBehaviorSet_Varrag_Hashor_Sff1H : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_Pyrokinesis);

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    default BaseRoleSlotSize = 0.01f;
    default BaseRolePriority = 1000000000.0f;

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

    FAttackInfo PyrokinesisAttack = FAttackInfo(
        UCM_OrcShamanSpell_Pyrokinesis_CastForSeconds(10.0f),
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        InMinRange = 500.0f,
        InMaxRange = 1500.0f,
        bInRequiresPathToTarget = true,
        bInMaxRangeOverride = true);
    default AddAttack(PyrokinesisAttack);

    FAttackInfo FirewallAttack = FAttackInfo(
        UCM_OrcShamanSpell_Firewall(), //UCM_Attack_Extra04 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        4000.0f,
        40.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(FirewallAttack);

    // BEHAVIORS ///////
   default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f,11.0f))
                .AddTreeCooldown("Dodge",2.0f);

    default Behavior_HighPriority()
            .DoNode(UCBT_Tree_VarragStopCasting(), 0.01f);

    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Attack")
                    .AddAttack(AttackBottom)
                    .AddTreeCooldown("Melee", 5.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(300.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Firewall")
                    .AddAttack(FirewallAttack)
                    .AddTreeCooldown("Attack_Magic_Area", 15.0f)
                    .AddRequirement(UCS_EnemyFartherThan(600.0f));
                    //.AddRequirement(UCS_EnemyTooClose());

    default Behavior_MediumPriority()
        .AttackTree(2.0f, "Pyrokinesis")
            .AddAttack(PyrokinesisAttack)
            .AddTreeCooldown("Attack_Magic", 1.0f)
            .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
            //.AddRequirement(UCS_EnemyFartherThan(400.0f));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Side Combo")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Attack_Main", 10.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(400.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(4.0f, "Passive Attacker")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Melee_Passive", 10.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(400.0f));
    
    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.01f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_Positioning_Strafer(), 0.1f);
    ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Varrag_Hashor : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Varrag_Hashor_Sff1H::StaticClass());
}