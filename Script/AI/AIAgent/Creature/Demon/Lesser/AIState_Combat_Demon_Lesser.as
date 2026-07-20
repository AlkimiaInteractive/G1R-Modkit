/** */
UCLASS()
class UAIState_Combat_Demon_Lesser : UAIState_Combat_Demon
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Demon_Lesser::StaticClass());

    FString GetDisplayName() const override
    {
        return "Fire Demon - Creature Combat";
    }

    void DefaultConfigValues() override
    {
        Config.ReactToAttackBackDodgeChance = 0.5f;
        Config.ReactToAttackFrontDodgeChance = 0.5f;
    }
}

UCLASS()
class UWeaponBehaviorSet_Demon_Lesser : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Claw);

    default TauntCooldown_Base = 1.0f;
    default TauntCooldown_General = 1.0f;

    // ATTACKS /////////
    FAttackInfo AttackRightCombo = FAttackInfo(
        UCM_AttackCCombo_RightLeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackRightCombo);

    FAttackInfo AttackLeftCombo = FAttackInfo(
        UCM_AttackCCombo_LeftTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeftCombo);
    ///////////////////

   default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 1.5f))
                .AddTreeCooldown("Dodge",1.5f);

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Main Melee")
                .AddAttack(AttackLeftCombo)
                .AddAttack(AttackRightCombo)
                .AddTreeCooldown("Attack_Main", 2.0f);
    
    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS()
class UCombatBehaviorSetPackage_Demon_Lesser : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Demon_Lesser::StaticClass());
}