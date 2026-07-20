/** */
UCLASS()
class UAIState_Combat_Goblin_TrollTest : UAIState_Combat_Creature
{
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Goblin_TrollTest);

    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 0.5f;

    default Config.PreferredDistanceBehavior = EPreferredDistanceBehavior::Exact;

    default BaseSpeed = EWalkSpeed::Running;

    float32 TauntCooldown = 5.0f;

    void DefaultConfigValues() override
    {
        EnemyTooCloseDistance = 20.0f;
        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.66f;
        Config.ReactToAttackFrontDodgeChance = 0.80f;
    }

    // BEHAVIORS ///////
    ///// COMMON /////    
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    /// NO MOVING FOR TEST
    // default CommonBehavior_Movement
    //     .DoNode(UCBT_Tree_Positioning());

    // default CommonBehavior_MediumPriority
    //     .DoNode(UCBT_Tree_DodgeAwayFromEnemyWhenClose());

    ///// TESTING /////
    default CustomTestingBehavior.MediumPriorityTree
        .DoNode(UCBT_Tree_Wait());
    
    ////////////////////
    
    void TestConfigValues() override
    {
        
    }

    FString GetDisplayName() const override
    {
        return "Goblin Troll Test - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Goblin_TrollTest : UWeaponBehaviorSet_Melee
{
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    ////////////////////

    void SetupConfigValues() override
    {
        Combat.EnemyTooCloseDistance = 30.0f;  
        Combat.EnemyCloseDistance = 250.0f;
        Combat.EnemyLungeDistance = 300.0f;

        Combat.Config.PreferredDistance = 220.0f;
        Combat.Positioning.MinimumPositionDistance = 50.0f;

        if (Combat.IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Combat.Config.PreferredDistance = 350.0f;
            Combat.Positioning.MinimumPositionDistance = 100.0f;
        }
    }
}

UCLASS()
class UCombatBehaviorSetPackage_Goblin_TrollTest : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Goblin_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Goblin_TrollTest);
}