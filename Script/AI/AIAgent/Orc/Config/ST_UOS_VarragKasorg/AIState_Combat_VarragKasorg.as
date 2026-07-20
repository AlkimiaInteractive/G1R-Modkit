/** */
UCLASS()
class UAIState_Combat_Varrag_Kasorg : UAIState_Combat_Orc_Base
{
    // default CombatBehaviorSetPackage.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy::StaticClass());
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Varrag_Kasorg::StaticClass());
    default TauntCooldown = 1.0f;
    FString GetDisplayName() const override
    {
        return "Combat - Varrag Kasorg - Sff1H";
    }
}

UCLASS()
class UWeaponBehaviorSet_Varrag_Kasorg_Sff1H : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Staff_TwoHand_Spell_BallLightning);

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    default BaseRoleSlotSize = 0.01f;
    default BaseRolePriority = 1000000000.0f;

    // Attacks ///////////////
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

    FAttackInfo BallLightingAttack = FAttackInfo(
        UCM_OrcShamanSpell_BallLightning_CastChargedBasedOnDistance(400.0f,1500.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        InMinRange = 400.0f,
        InMaxRange = 1500.0f,
        bInMaxRangeOverride = true);
    default AddAttack(BallLightingAttack);

    FAttackInfo BallLightingMeleeAttack = FAttackInfo(
        UCM_OrcShamanSpell_BallLightning_CastChargedBasedOnDistance(0.0f,400.0f), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        InMinRange = 0.0f,
        InMaxRange = 400.0f,
        bInMaxRangeOverride = true);
    default AddAttack(BallLightingMeleeAttack);
    ////////////////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
                .AttackTree(1.0f, "Bottom Attack")
                    .AddAttack(AttackBottom)
                    .AddTreeCooldown("Melee", 2.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(300.0f));

    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Ball Lightning")
                    .AddAttack(BallLightingMeleeAttack)
                    .AddTreeCooldown("MeleeBallLightning", 15.0f)
                    .AddRequirement(UCS_TargetIsLowerAltitude())
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(400.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(2.0f, "Ball Lightning")
                    .AddAttack(BallLightingAttack)
                    .AddTreeCooldown("BallLightning", 2.0f)
                    .AddRequirement(UCS_TargetIsLowerAltitude())
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                    //.AddRequirement(UCS_EnemyFartherThan(350.0f));

    default Behavior_MediumPriority()
                .AttackTree(3.0f, "Side Combo")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Melee", 2.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                    //.AddRequirement(UCS_EnemyCloserThan(350.0f));
    
    default Behavior_MediumPriority()
                .AttackTree(4.0f, "Passive Attacker")
                    .AddAttack(AttackLeftRight)
                    .AddTreeCooldown("Melee_Passive", 10.0f)
                    .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                    .AddRequirement(UCS_EnemyCloserThan(300.0f));

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
class UCombatBehaviorSetPackage_Varrag_Kasorg : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Varrag_Kasorg_Sff1H::StaticClass());
}