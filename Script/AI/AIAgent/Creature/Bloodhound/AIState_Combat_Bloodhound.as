UCLASS()
class UAIState_Combat_Bloodhound : UAIState_Combat_Creature_Quadruped
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Bloodhound);

    float32 TauntCooldown = 5.0f;

    default Config.PositioningValuesSizeMultiplier = 1.2f;
    default Config.MeleeAttackCapsuleRadiusMultiplier = 1.0f;

    bool CanSprint() override
    {
        return true;
    }

    // BEHAVIORS ///////
    ///// COMMON /////    
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Bloodhound - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Bloodhound_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;
    
    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenClose());

        default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Bloodhound : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    // TAUNT CD /////////

    default TauntCooldown_Base = 2.0f;
    default TauntCooldown_General = 2.0f;

    // ATTACKS /////////
    FAttackInfo AttackRight = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 180,
        bInMaxRangeOverride = true);
    default AddAttack(AttackRight);

    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),
        InMaxRange = 180,
        bInMaxRangeOverride = true);
    default AddAttack(AttackLeft);

    FAttackInfo AttackSComboRightLeft = FAttackInfo(
        UCM_AttackSCombo_RightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 180,
        bInMaxRangeOverride = true);
    default AddAttack(AttackSComboRightLeft);

    FAttackInfo AttackSComboLeftRight = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 180,
        bInMaxRangeOverride = true);
    default AddAttack(AttackSComboLeftRight);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 500,
        bInMaxRangeOverride = true);
    default AddAttack(AttackBottom);

    FAttackInfo AttackSComboBottomRightLeft = FAttackInfo(
        UCM_AttackSCombo_BottomRightLeft(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InMaxRange = 500,
        bInMaxRangeOverride = true);
    default AddAttack(AttackSComboBottomRightLeft);
    ///////////////////

    float32 TauntCooldown = 5.0f;

    // BEHAVIORS ///////    
    default Behavior_MediumPriority()
        .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.3f), 0.1f);

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);

    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(150.0f, 1.5f));
    
    default Behavior_MediumPriority()
            .AttackTree(0.0f, "Bottom Attack")
                .AddAttack(AttackBottom)
                .AddAttack(AttackSComboBottomRightLeft)
                .AddTreeCooldown("Attack_Far", 5.0f)
                .AddRequirement(UCS_EnemyFartherThan(300.0f))
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Main melee")
                .AddAttack(AttackBottom)
                //.AddAttack(AttackRight)
                .AddAttack(AttackSComboRightLeft, 4.0f)
                .AddAttack(AttackSComboLeftRight, 4.0f)
                .AddTreeCooldown("Attack_Main", 1.3f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Passive melee")
                .AddAttack(AttackLeft)
                .AddAttack(AttackRight)
                .AddTreeCooldown("Attack_Passive", 12.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    /// BASE MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    
    ////////////////////
}


UCLASS()
class UWeaponBehaviorSet_Bloodhound_Water : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Swimming);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_WaterWalking);
    
    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.0f;

    default TauntCooldown_Base = 1.5f;
    default TauntCooldown_General = 1.5f;

     FAttackInfo Water_Attack = FAttackInfo(
         UCM_Attack_Left(), 
         EAttackUsageType::Regular, 
         CombatScriptRoleSets::GetAttackerRoleSet(),
         InAttackDirectionRequirement = EAttackDirectionRequirement::Any);
     default AddAttack(Water_Attack);

    // BEHAVIORS ///////
    
        default Behavior_MediumPriority()
            .AttackTree(1, "Water")
                .AddAttack(Water_Attack)
                .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::Any))
                .AddTreeCooldown("Attack_Main", 3.0f);
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));


    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
    //             .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
    //             .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    /// BASE MOVEMENT    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 60.0f;
        Combat.EnemyCloseDistance = 170.0f;
        Combat.EnemyLungeDistance = 350.0f;

        Combat.Positioning.MinimumPositionDistance = 150.0f;
        
        if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker) && Combat.CharacterOfInterest != nullptr)
        {
            Combat.Config.PreferredDistance = 350.0f;
        }
        else
        {
            Combat.Config.PreferredDistance = 450.0f;
        }
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Bloodhound : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Bloodhound_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Bloodhound);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Bloodhound_Water);
}