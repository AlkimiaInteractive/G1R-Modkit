/** */
UCLASS()
class UAIState_Combat_Skeleton_Warrior : UAIState_Combat_Humanoid
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Skeleton_Warrior::StaticClass());

    // Cooldown timers local variables

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;
    }

    FString GetDisplayName() const override
    {
        return "Skeleton Warrior - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_SkeletonWarrior_Melee : UWeaponBehaviorSet_Skeleton_Melee_Base
{
    default BaseRoleSlotSize = 0.8f;
    default BaseRolePriority = 1.3f;
    
    default Cooldown_BottomAttack = 4.0f;
    default Cooldown_MainMelee = 3.0f;
    default Cooldown_Finisher = 3.5f;
    default Cooldown_PassiveMelee = 8.0f;

    FAttackInfo AttackBottomJump = FAttackInfo(
        UCM_Attack_Extra02(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackBottomJump);

     // BEHAVIORS ///////    
    default Behavior_MediumPriority()
            .AttackTree(0.0f, "Bottom Jump Attack")
                .AddAttack(AttackBottomJump)
                .AddTreeCooldown("Finisher", Cooldown_Finisher)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker))
                .AddRequirement(UCS_EnemyFartherThan(150.0f));
}

UCLASS()
class UCombatBehaviorSetPackage_Skeleton_Warrior : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Skeleton_Observer::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_SkeletonWarrior_Melee::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Skeleton_Melee_Swim);
}