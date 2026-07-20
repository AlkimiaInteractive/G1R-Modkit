UCLASS()
class UAIState_Combat_Varrag_Ruuushk : UAIState_Combat_Orc_Base
{
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Varrag_Ruuushk::StaticClass());

    FString GetDisplayName() const override
    {
        return "Combat - Varrag Ruuushk - Sff1H";
    }
}

UCLASS()
class UWeaponBehaviorSet_Varrag_Ruuushk_Sff1H : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_StormOfFire);

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    default BaseRoleSlotSize = 0.01f;
    default BaseRolePriority = 1000000000.0f;

    // Attacks ///////////////
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

    FAttackInfo StormOfFireAttack = FAttackInfo(
        UCM_OrcShamanSpell_StormOfFire(), //UCM_Attack_Extra04 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1500.0f,
        500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(StormOfFireAttack);

    FAttackInfo StormOfFireMeleeAttack = FAttackInfo(
        UCM_OrcShamanSpell_StormOfFire(), //UCM_Attack_Extra04 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1500.0f,
        100.0f,
        bInMaxRangeOverride = true);
    default AddAttack(StormOfFireMeleeAttack);

    // BEHAVIORS ///////    
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Attack")
                    .AddAttack(AttackBottom)
                    .AddTreeCooldown("Melee", 5.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(300.0f));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Storm of Fire")
                    .AddAttack(StormOfFireAttack)
                    .AddTreeCooldown("Attack_Magic", 2.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                    //.AddRequirement(UCS_EnemyFartherThan(350.0f));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Storm of Fire")
                    .AddAttack(StormOfFireMeleeAttack)
                    .AddTreeCooldown("Melee_Attack_Magic", 15.0f)
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
    // ////////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Varrag_Ruuushk : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Varrag_Ruuushk_Sff1H::StaticClass());
}