/** */
UCLASS()
class UAIState_Combat_Lizard_Fire : UAIState_Combat_Creature_Quadruped
{
    // /////////////////////////////////
    // //      PARAMETERS
    // /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Lizard_Fire);

    FAttackMoveData SpecialFlamebreathAttack;
    FGameplayTag FlamebreathAttackTag = GameplayTag::Combat_Attack_Top;
    float FlamebreathMinRange = 300.0f;
    float FlamebreathMaxRange = 700.0f;

    //float32 TauntCooldown = 5.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        Config.ReactToAttackBackDodgeChance = 0.2f;
        Config.ReactToAttackFrontDodgeChance = 0.25f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
            .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    default CommonBehavior_HighPriority
            .DoNode(UCBT_Tree_CancelAttackIfNotInDistanceRangeOrNotFacingEnemy(FlamebreathAttackTag), 0.0f);
    
    ////////////////////

    void TestConfigValues() override
    {
        EnemyCloseDistance = 400.0f;

        Config.PreferredDistance = EnemyCloseDistance;       
    }

    FString GetDisplayName() const override
    {
        return "Fire Lizard - Creature Combat";
    }
}


UCLASS()
class UWeaponBehaviorSet_Lizard_Fire_Observer : UCombatBehaviorSet_Creature_Observer_NonStrafer
{
    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    FString GetDisplayName() const override
    {
        return "Fire Lizard - Creature Combat";
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Lizard_Fire : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Jaw);

    default TauntCooldown_Base = 5.0f;
    default TauntCooldown_General = 5.0f;

    // ATTACKS /////////
    FAttackInfo MeleeAttackRight = FAttackInfo(
        UCM_Attack_Right(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(MeleeAttackRight);

    FAttackInfo MeleeAttackBottom = FAttackInfo(
        UCM_Attack_Bottom(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker));
    default AddAttack(MeleeAttackBottom);

    FAttackInfo BackAttack = FAttackInfo(
        UCM_Attack_Left(), 
        EAttackUsageType::Control, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker),
        InAttackDirectionRequirement = EAttackDirectionRequirement::Back);
    default AddAttack(BackAttack);

    FAttackInfo FlamebreathAttack = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetRoleSet(ECombatRole::ActiveAttacker), 
        700.0f,
        300.0f,
        bInRequiresPathToTarget = false);
    default AddAttack(FlamebreathAttack);
    FGameplayTag FlamebreathAttackTag = GameplayTag::Action_Attack_Top;
    ///////////////////

    // BEHAVIORS ///////
    // default Behavior_MediumPriority()
    //     .DoNode(UCBT_Tree_MoveBackAfterAttackWhenClose(), 0.2f);
    
    default Behavior_MediumPriority()
            .AttackTree(4.0f, "Tail Attack")
                .AddAttack(BackAttack)
                .AddTreeCooldown("Attack_Defensive", 3.0f)
                .AddRequirement(UCS_EnemyCloserThan(120.0f))
                .AddRequirement(UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement::NotFront));

    default Behavior_MediumPriority()
            .AttackTree(1.0f, "Flamebreath Start")
                .AddAttack(FlamebreathAttack)
                .AddTreeCooldown("Attack_Flamebreath", 6.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyInsideDistanceRange(FlamebreathAttack.MinRange, FlamebreathAttack.MaxRange));

    default Behavior_MediumPriority()
            .AttackTree(2.0f, "Bottom Melee")
                .AddAttack(MeleeAttackBottom)
                .AddTreeCooldown("Attack_Persecutory", 6.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(200.0f));

    default Behavior_MediumPriority()
            .AttackTree(3.0f, "Side Melee")
                .AddAttack(MeleeAttackRight)
                .AddTreeCooldown("Attack_Main", 2.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
    
    default Behavior_MediumPriority()
            .AttackTree(5.0f, "Passive Attacker")
                .AddAttack(MeleeAttackRight)
                .AddTreeCooldown("Melee_Passive", 12.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    /// MOVEMENT
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_NonStrafer());

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 10.0f, 15.0f)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::PassiveAttacker));
    
    default Behavior_Movement()
        .DoNode(UCBT_Tree_MoveToPreferredDistanceIfFarther(100.0f));
    ////////////////////

    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.EnemyTooCloseDistance = 180.0f;
    }
}


UCLASS()
class UWeaponBehaviorSet_Lizard_Fire_Water : UWeaponBehaviorSet_Melee
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
class UCombatBehaviorSetPackage_Lizard_Fire : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Lizard_Fire_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Lizard_Fire);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Lizard_Fire_Water);
}