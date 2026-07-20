/** */
UCLASS()
class UAIState_Combat_Skeleton : UAIState_Combat_Skeleton_Base
{
    /////////////////////////////////
    //      PARAMETERS
    /////////////////////////////////
    default CombatBehaviorSetManager.AddPackage(UCombatBehaviorSetPackage_Skeleton::StaticClass());
}

UCLASS()
class UWeaponBehaviorSet_RegularSkeleton_Melee : UWeaponBehaviorSet_Skeleton_Melee_Base
{
    default BaseRoleSlotSize = 0.6f;
    default BaseRolePriority = 1.1f;

    default Cooldown_BottomAttack = 5.0f;
    default Cooldown_Finisher = 4.0f;
    default Cooldown_MainMelee = 3.5f;
    default Cooldown_PassiveMelee = 10.0f;

    
    FAttackInfo AttackFrwrd = FAttackInfo(
        UCM_Attack_Extra01(), 
        EAttackUsageType::Regular, 
        CombatScriptRoleSets::GetAttackerRoleSet());
    default AddAttack(AttackFrwrd);

     // BEHAVIORS ///////    
    default Behavior_MediumPriority()
            .AttackTree(0.0f, "AttackFrwrd Attack")
                .AddAttack(AttackFrwrd)
                .AddTreeCooldown("Finisher", Cooldown_Finisher)
                .AddRequirement(UCS_IsCurrentRole(ECombatRole::ActiveAttacker));
                //.AddRequirement(UCS_EnemyFartherThan(300.0f));
}

UCLASS()
class UCombatBehaviorSetPackage_Skeleton : UCombatBehaviorSetPackage
{
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Skeleton_Observer);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_RegularSkeleton_Melee);
    default CombatBehaviorSetClasses.Add(UWeaponBehaviorSet_Skeleton_Melee_Swim);
}