/** */
UCLASS()
class UAIState_Combat_Demon : UAIState_Combat_Creature_StrafingFlyer
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_UnreachableEnemy_Creature);
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Demon_Observer);

    default Config.PositioningValuesSizeMultiplier = 1.2f;

    default BaseSpeed = EWalkSpeed::Running;

    float32 TauntCooldown = 5.0f;

    // BEHAVIORS ///////
    ///// COMMON /////    
    default CommonBehavior_HighPriority
        .DoNode(UCBT_Tree_ReactToIncomingMeleeAttack());

    FString GetDisplayName() const override
    {
        return "Demon - Creature Combat";
    }
}

UCLASS()
class UCombatBehaviorSet_Demon_Observer : UCombatBehaviorSet_Creature_Observer_Strafer
{
    FString GetDisplayName() const override
    {
        return "Demon - Creature Combat";
    }

    void SetupConfigValues() override
    {
        Super::SetupConfigValues();

        Combat.Config.ReactiveBlockingChance_Trained = 0.0f;
        Combat.Config.ReactiveBlockingChance_Master = 0.0f;
    }

    default Behavior_Movement()
            .DoNode(UCBT_Tree_MoveCircleAroundEnemy())
                .AddTreeCooldown("RunAroundEnemy", 8.0f, 12.0f);

    default Behavior_Movement()
            .DoNode(UCBT_Tree_Positioning_Strafer());
}

UCLASS()
class UCombatBehaviorSetPackage_Demon_Observer : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UCombatBehaviorSet_Demon_Observer);
}