UCLASS()
class UAIState_Combat_Golem_Stone_Bridge : UAIState_Combat_NonStrafingHumanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Golem_Stone_Bridge);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);

    default MovesToPutOnCooldownWhenDamagedAndNotImmuneSuperArmor.Reset();

    default Config.MeleeAttackCapsuleRadiusMultiplier = 1.10f;
    default Config.PositioningValuesSizeMultiplier = 2.0f;

    float32 TauntCooldown = 5.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();
        
        EnemyTooCloseDistance = 80.0f;
        EnemyCombatDistance = 5000.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.5f;  
    }

    // BEHAVIORS ///////
    ///// COMMON /////    
    // default CommonBehavior_HighPriority
    //     .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Stone Golem Bridge - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Stone_Bridge_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    FString GetDisplayName() const override
    {
        return "Stone Golem Bridge - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Golem_Stone_Bridge : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);
    
    default Roles.Add(ECombatRole::ActiveAttacker);
    default BaseRoleSlotSize = 5.0f;
    default BaseRolePriority = 10.0f;

    default TauntCooldown_Base = 3.0f;
    default TauntCooldown_General = 3.0f;

    // ATTACKS /////////
    FAttackInfo MeleeAttackSingle = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(MeleeAttackSingle);

    FAttackInfo MeleeAttackCombo = FAttackInfo(
        UCM_AttackSCombo_LeftRight(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(),);   
        // 400.0f,
        //        bInRequiresPathToTarget = false,
        // bInMaxRangeOverride = true);
    default AddAttack(MeleeAttackCombo);

    FAttackInfo LongRangeGrenadeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        2500.0f,
        //600.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(LongRangeGrenadeAttack);

    FAttackInfo StoneWave = FAttackInfo(
        UCM_GolemSpecialAttack_Stone_StoneWave(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        1200.0f,
        300.0f,
        bInRequiresPathToTarget = true,
        bInMaxRangeOverride = true);
    default AddAttack(StoneWave);
    ///////////////////

    // BEHAVIORS ///////
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer_NoFeignRetreat());
                
       default Behavior_MediumPriority()
            .AttackTree(2.0f)
                .AddAttack(StoneWave)
                .AddTreeCooldown("Attack_Wave", 4.0f);
                //.AddRequirement(UCS_EnemyFartherThan(300.0f));

    default Behavior_MediumPriority()
            .AttackTree(1.0f)
                // .AddAttack(MeleeAttackSingle)
                .AddAttack(MeleeAttackCombo)
                .AddTreeCooldown("Attack_Main", 1.5f);

    default Behavior_MediumPriority()
        .AttackTree(6.0f, "Grenade")
            .AddAttack(LongRangeGrenadeAttack)
            .AddTreeCooldown("Attack_Grenade", 2.0f)
            .AddRequirement(UCS_EnemyFartherThan(300.0f))
            .AddRequirement(UCS_Not(UCS_IsReachableInMelee()));
            //.AddRequirement(UCS_EnemyFartherThan(500.0f));

    /// BASE MOVEMENT
    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());

    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////
}


UCLASS()
class UWeaponBehaviorSet_Golem_TargetOnlyReachableWithStones : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    default BaseRoleSlotSize = 0.6f;

    float32 Cooldown_ThrowStone = 1.5f;
    float32 Cooldown_Passive_ThrowStone = 3.0f;

    FAttackInfo LongRangeGrenadeAttack = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet(), 
        2500.0f,
        //600.0f,
        bInRequiresPathToTarget = false,
        bInMaxRangeOverride = true);
    default AddAttack(LongRangeGrenadeAttack);
    ////////////////////////////

    // BEHAVIORS ///////
    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Throw Stone Active")
                .AddAttack(LongRangeGrenadeAttack)
                .AddTreeCooldown("Attack_Stone_Active", Cooldown_ThrowStone)
                .AddRequirement(UCS_EnemyVisible());
                //.AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                //.AddRequirement(UCS_EnemyFartherThan(LongRangeGrenadeAttack.MinRange));
    
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
        return "Golem Base - Throw Stones - Creature Combat";
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Golem_Stone_Bridge : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_TargetOnlyReachableWithStones);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Stone_Bridge_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Golem_Stone_Bridge);
}