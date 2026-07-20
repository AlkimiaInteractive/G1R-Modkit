/** */
UCLASS()
class UAIState_Combat_Goblin_Green : UAIState_Combat_Goblin
{
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Goblin_Green);

    FString GetDisplayName() const override
    {
        return "Green Goblin - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Goblin_Green : UWeaponBehaviorSet_Goblin
{
    default BaseRolePriority = 0.1f;

    default Cooldown_ThrowStone = 8.0f;
    default Cooldown_BottomAttack = 5.0f;
    default Cooldown_MainMelee = 2.0f;
    default Cooldown_Passive_ThrowStone = 25.0f;
    default Cooldown_Passive_Melee = 23.0f;

	FString GetDisplayName() const override
    {
        return "Green Goblin - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Goblin_Water : UWeaponBehaviorSet_Melee
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
        .DoNode(UCBT_Tree_MoveToDoSelectedAttack_Strafer());

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
class UCombatBehaviorSetPackage_Goblin_Green : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Goblin_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Goblin_TargetOnlyReachableWithStones);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Goblin_Green);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Goblin_Water);
}