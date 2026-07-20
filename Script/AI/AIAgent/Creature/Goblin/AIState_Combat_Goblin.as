/** */
UCLASS()
class UAIState_Combat_Goblin : UAIState_Combat_Humanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 0.5f;

    default Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::Exact;

    default BaseSpeed = EWalkSpeed::Running;

    default Config.MeleeAttackCapsuleRadiusMultiplier = 0.75f;
    default Config.PositioningValuesSizeMultiplier = 1.0f;

    //float32 TauntCooldown = 5.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 20.0f;
        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.66f;
        Config.ReactToAttackFrontDodgeChance = 0.80f;
    }

    bool ShouldMove() override
    {
        if (CharacterState.HasGameplayTag(GameplayTag::State_Goblin_BindedToTroll))
            return false;

        return Super::ShouldMove();
    }

    bool ShouldAttack() override
    {
        if (CharacterState.HasGameplayTag(GameplayTag::State_Goblin_BindedToTroll))
            return false;

        return Super::ShouldAttack();
    }

    bool CanSprint() override
    {
        return true;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Behavior_CombatMove(UCM_StopMoving()))
            .AddRequirement(UCS_Moving())
            .AddRequirement(UCS_IsBeingTargetedByTroll());

    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());  
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Goblin Base - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Goblin : UWeaponBehaviorSet_Melee
{
    //default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Torch);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    default BaseRoleSlotSize = 0.6f;

    float32 Cooldown_ThrowStone = 8.0f;
    float32 Cooldown_BottomAttack = 5.0f;
    float32 Cooldown_MainMelee = 2.0f;
    float32 Cooldown_Passive_ThrowStone = 25.0f;
    float32 Cooldown_Passive_Melee = 23.0f;

    // Attacks ///////////////
    FAttackInfo AttackLeft = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackLeft);

    FAttackInfo AttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(AttackBottom);

    FAttackInfo AttackStone = FAttackInfo(
        UCM_GoblinSpecialAttack_StoneThrow(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1000.0f,
        250.0f,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackStone);
    ////////////////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Throw Stone Active")
                .AddAttack(AttackStone)
                .AddTreeCooldown("Attack_Stone_Active", Cooldown_ThrowStone)
                .AddRequirement(UCS_EnemyVisible())
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(AttackStone.MinRange));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Bottom Attack")
                .AddAttack(AttackBottom)
                .AddTreeCooldown("Attack_Persecutory", Cooldown_BottomAttack)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                //.AddRequirement(UCS_EnemyFartherThan(150.0f));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Main Melee")
                .AddAttack(AttackLeft)
                .AddTreeCooldown("Attack_Main", Cooldown_MainMelee)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));

    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Throw Stone Passive")
                .AddAttack(AttackStone)
                .AddTreeCooldown("Attack_Stone_Passive", Cooldown_Passive_ThrowStone)
                .AddRequirement(UCS_EnemyVisible())
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(AttackStone.MinRange));
    
    default Behavior_MediumPriority()
            .AttackTree(5.0f, "Passive Melee")
                .AddAttack(AttackLeft)
                .AddTreeCooldown("Attack_Main", Cooldown_Passive_Melee)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));

    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_ChanceToDodgeBackAfterAttackWhenClose(0.3f), 0.1f);

    // default Behavior_MediumPriority()
    //         .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(20.0f, 0.2f))
    //             .AddRequirement(UCS_Not(UCS_AttackSelected()))
    //             .AddTreeCooldown("Dodge",1.0f);

    /// MOVEMENT
    // default Behavior_Movement()
    //     .DoNode(UCBT_Tree_DodgeAwayFromAttackVectors(), 0.01f);

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_StrafeAroundEnemy(), 0.3f)
    //             .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f);

    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Goblin Base - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Goblin_TargetOnlyReachableWithStones : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    default BaseRoleSlotSize = 0.6f;

    float32 Cooldown_ThrowStone = 1.5f;
    float32 Cooldown_Passive_ThrowStone = 3.0f;

    // Attacks ///////////////
    FAttackInfo AttackStone = FAttackInfo(
        UCM_GoblinSpecialAttack_StoneThrow(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1000.0f,
        250.0f,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackStone);
    ////////////////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Throw Stone Active")
                .AddAttack(AttackStone)
                .AddTreeCooldown("Attack_Stone_Active", Cooldown_ThrowStone)
                .AddRequirement(UCS_EnemyVisible())
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(AttackStone.MinRange));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Throw Stone Passive")
                .AddAttack(AttackStone)
                .AddTreeCooldown("Attack_Stone_Passive", Cooldown_Passive_ThrowStone)
                .AddRequirement(UCS_EnemyVisible())
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(AttackStone.MinRange));

    
    default Behavior_MediumPriority()
            .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenCloserThan(20.0f, 1.5f))
                .AddTreeCooldown("Dodge",1.0f);

    default Behavior_Movement()
                .DoNode(UCBT_Tree_SpreadOut_Strafer());

    default Behavior_Movement()
                .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer(), 0.1f);
    
    default Behavior_Movement()
                .DoNode(UCBT_Tree_Positioning_Strafer());
    ////////////////////

    bool ShouldUseBehavior(FString&out Reason = "") const override
    {
        if (!Super::ShouldUseBehavior(Reason))
            return false;

        if (Combat.IsTargetReachableInMelee() && Combat.AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Combat.CharacterOfInterest))
        {
            Reason = "Target reachable in melee and in same territory or combat radius.";
            return false;
        }

        return true;
    }

    FString GetDisplayName() const override
    {
        return "Goblin Base - Throw Stones - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Goblin_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    FString GetDisplayName() const override
    {
        return "Goblin Base - Creature Combat";
    }

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FAttackInfo AttackStone = FAttackInfo(
        UCM_GoblinSpecialAttack_StoneThrow(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        250.0f,
        bInRequiresPathToTarget = false);
    default AddAttack(AttackStone);

    // default Behavior_MediumPriority()
    //     .AttackTree(4.0f, "Throw Stone Passive")
    //         .AddAttack(AttackStone)
    //         .AddTreeCooldown("Attack_Stone_Passive", 10.0f)
    //         .AddRequirement(UCS_EnemyVisible())
    //         .AddRequirement(UCS_IsCurrentRole(ECombatRole::Observer))
    //         .AddRequirement(UCS_EnemyFartherThan(AttackStone.MinRange));

    // default Behavior_Movement()
    //         .DoNode(UCBT_Tree_MoveCircleAroundEnemy(), 0.01f)
    //             .SetTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}