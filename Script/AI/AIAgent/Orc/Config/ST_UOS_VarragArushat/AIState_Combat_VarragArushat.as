UCLASS()
class UAIState_Combat_Varrag_Arushat : UAIState_Combat_Orc_Base
{
    // default CombatBehaviorSetPackage.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy::StaticClass());
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Varrag_Arushat::StaticClass());

    FString GetDisplayName() const override
    {
        return "Combat - Varrag Arushat - Sff1H";
    }
}

UCLASS()
class UWeaponBehaviorSet_Varrag_Arushat_Sff1H : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_BreathOfDeath);

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

    FAttackInfo AttackLeftBottom = FAttackInfo(
        UCM_AttackSCombo_LeftBottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftBottom);

    FAttackInfo BreathOfDeathAttack = FAttackInfo(
        UCM_OrcShamanSpell_BreathOfDeath(), //UCM_Attack_Extra04 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1500.0f,
        400.0f,
        bInMaxRangeOverride = true,
        bInRequiresPathToTarget = false);
    default AddAttack(BreathOfDeathAttack);

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Combo")
                    .AddAttack(AttackLeftBottom)
                    .AddTreeCooldown("Melee", 4.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(300.0f));
                    //.AddRequirement(UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan(3, 5.0f));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Breath of Death")
                    .AddAttack(BreathOfDeathAttack)
                    .AddTreeCooldown("BreathOfDeathNoHit", 15.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                    //.AddRequirement(UCS_EnemyFartherThan(400.0f))
                    //.AddRequirement(UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan(2,30.0f));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Breath of Death")
                    .AddAttack(BreathOfDeathAttack)
                    .AddTreeCooldown("BreathOfDeath", 4.0f, 1.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    //.AddRequirement(UCS_EnemyFartherThan(400.0f))
                    .AddRequirement(UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan(2,30.0f));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Side Combo")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Melee", 4.0f, 1.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Passive Attacker")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Melee_Passive", 10.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(400.0f));

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f,11.0f))
                .AddTreeCooldown("Dodge",1.5f);

    // MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.01f);

    default Behavior_Movement()
        .DoNode(UCBT_Tree_Positioning_Strafer(), 0.1f);
    //////////////////
}

UCLASS()
class UCombatBehaviorSetPackage_Varrag_Arushat : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Varrag_Arushat_Sff1H::StaticClass());
}