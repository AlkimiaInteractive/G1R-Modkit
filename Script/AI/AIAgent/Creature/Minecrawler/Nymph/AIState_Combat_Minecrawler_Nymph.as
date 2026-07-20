UCLASS()
class UAIState_Combat_Minecrawler_Nymph : UAIState_Combat_Creature_Crablike
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Minecrawler_Nymph);

    default MoveCooldownSecondsOnDamagedAndNotImmuneSuperArmor = 1.0f;

    float32 TauntCooldown = 5.0f;

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyTooCloseDistance = 80.0f;
        Config.CooldownJustGotHit = 10.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.5f;  
    }

    // BEHAVIORS ///////
    ///// COMMON /////
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());
    
    ////////////////////

    void TestConfigValues() override
    {
        // Distances common to all roles and weapons
        EnemyTooCloseDistance = 1700.0f;
        EnemyCombatDistance = EnemyTooCloseDistance+ 1500.0f;

        EnemyCloseDistance = EnemyTooCloseDistance+ 100.0f;
        EnemyLungeDistance = EnemyTooCloseDistance+ 300.0f;

        Config.ReactiveBlockingChance_Master = 1.0f;
        Config.ReactToAttackFrontDodgeChance_Master = 0.f;

        Config.BlockingTime = 2.0f;
    }

    FString GetDisplayName() const override
    {
        return "Minecrawler Nymph - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_Minecrawler_Nymph_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    FString GetDisplayName() const override
    {
        return "Minecrawler Nymph - Creature Combat";
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy(), 0.01f)
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);
}

UCLASS()
class UWeaponBehaviorSet_Minecrawler_Nymph : UWeaponBehaviorSet_Minecrawler
{
    default BaseRoleSlotSize = 0.6f;
    default BaseRolePriority = 0.0f;
}

UCLASS()
class UCombatBehaviorSetPackage_Minecrawler_Nymph : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Nymph_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Minecrawler_Nymph);
}