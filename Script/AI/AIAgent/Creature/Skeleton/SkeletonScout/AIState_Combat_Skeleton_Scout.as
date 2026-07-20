/** */
UCLASS()
class UAIState_Combat_Skeleton_Scout : UAIState_Combat_Skeleton_Base
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Skeleton_Scout::StaticClass());

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        EnemyCombatDistance = 1000.0f;

        Config.ReactToAttackBackDodgeChance = 0.33f;
        Config.ReactToAttackFrontDodgeChance = 0.66f;
    }
    
    ////////////////////

    FString GetDisplayName() const override
    {
        return "Skeleton Scout - Creature Combat";
    }
}

UCLASS()
class UWeaponBehaviorSet_SkeletonScout_Melee : UWeaponBehaviorSet_Skeleton_Melee_Base
{
    default BaseRoleSlotSize = 0.8f;
    default BaseRolePriority = 1.2f;

    default Cooldown_BottomAttack = 6.0f;
    default Cooldown_MainMelee = 2.5f;
    default Cooldown_Finisher = 3.0f;
    default Cooldown_PassiveMelee = 10.0f;

    FAttackInfo AttackDwnUp = FAttackInfo(
        UCM_Attack_Top(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackDwnUp);

    FAttackInfo AttackDwnUpCombo = FAttackInfo(
        UCM_AttackCCombo_BottomTop(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackDwnUpCombo);

     // BEHAVIORS ///////    
    default Behavior_MediumPriority()
            .AttackTree(0.0f, "DwnUp Attack")
                .AddAttack(AttackDwnUp)
                .AddAttack(AttackDwnUpCombo)
                .AddTreeCooldown("Finisher", Cooldown_Finisher)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                //.AddRequirement(UCS_EnemyFartherThan(300.0f));
}

UCLASS()
class UWeaponBehaviorSet_SkeletonScout_Bow : UWeaponBehaviorSet_Skeleton_Bow_Base
{
    default BaseRoleSlotSize = 1.0f;
    default BaseRolePriority = 1.2f;
}

UCLASS()
class UCombatBehaviorSetPackage_Skeleton_Scout : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Skeleton_Observer::StaticClass());
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Skeleton_Melee_Swim);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_SkeletonScout_Melee::StaticClass());
}