/** */
// UCLASS()
// class UAIState_Combat_AITestDummy : UAIState_Combat_Humanoid
// {
//     /////////////////////////////////
//     //      PARAMETERS
//     /////////////////////////////////
//     default CombatBehaviorSetPackage.Add(UWeaponBehaviorSet_AITestDummy_Observer());
//     default CombatBehaviorSetPackage.Add(UWeaponBehaviorSet_AITestDummy());
//     default CombatBehaviorSetPackage.Add(UCombatBehaviorSet_UnreachableEnemy());

//     // Cooldown timers local variables

//     void SetupCommonConfigValues() override
//     {
//         EnemyCombatDistance = 1000.0f;
//         Config.CooldownDodge = 2.0f;

//         Config.ReactToAttackBackDodgeChance = 0.33f;
//         Config.ReactToAttackFrontDodgeChance = 0.66f;
//     }

//     void SetupCommonBehaviors() override
//     {
//         AddBehavior(UCombatBehavior_PutDodgesAndAttacksOnCooldownAfterNoticingDamageOnSelfAndNotImmuneSuperArmor(1.5f));
        
//         
//         AddBehavior(UCombatBehavior_ReactToIncomingAttackFromFront());

//         AddBehavior(UCombatBehavior_ShortTauntOrSkipWhenLungeOrOutOfRange());

//         AddBehavior(UCombatBehavior_StayAwayWhenTooClose());

//         AddBehavior(UCombatBehavior_CalculatePreferredPositionAndRunToIt());
//     }

//     FString GetDisplayName() const override
//     {
//         return "AITestDummy - Creature Combat";
//     }
// }

// UCLASS()
// class UWeaponBehaviorSet_AITestDummy_Observer : UCombatBehaviorSet_Observer
// {
//     void SetupConfigValues() override
//     {
//         Combat.EnemyTooCloseDistance = 180.0f;
//         Combat.Config.PreferredDistance = 450.0f;
//     }

//     void SetupBehaviors() override
//     {
//         Combat.AddBehavior(UCombatBehavior_ShortTauntAfterDodgeWhenCloseOrLungeDistance());
//         Combat.AddBehavior(UCombatBehavior_LongTauntOrWaitWhenOutOfRangeAndEnemyFacingMe());
//     }
// }

// UCLASS()
// class UWeaponBehaviorSet_AITestDummy : UWeaponBehaviorSet_Melee
// {
//     default WeaponTagContainer.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    
//     void SetupConfigValues() override
//     {
//         Combat.EnemyTooCloseDistance = 0.0f;
//         Combat.EnemyCloseDistance = 100.0f;
//         Combat.EnemyLungeDistance = 180.0f;
//         Combat.Config.CooldownMultiplierAfterCombo = 2.0f;

//         Combat.Config.PreferredDistance = 300.0f;

//         Combat.Config.CooldownAttackBottom = 5.0f;
//         Combat.Config.ComboCooldowns.Add(UCM_AttackCCombo_BottomRight::StaticClass(), 7.0f);
//         Combat.Config.ComboCooldowns.Add(UCM_AttackCCombo_BottomLeft::StaticClass(), 7.0f);
//         Combat.Config.ComboCooldowns.Add(UCM_AttackCCombo_LeftRight::StaticClass(), 2.0f);
//         Combat.Config.ComboCooldowns.Add(UCM_AttackCCombo_RightLeft::StaticClass(), 2.0f);
//         Combat.Config.ComboCooldowns.Add(UCM_AttackCCombo_LeftRightLeft::StaticClass(), 2.5f);
//         Combat.Config.CooldownAttackLeft = 1.0f;
//         Combat.Config.CooldownAttackRight = 1.0f;

//         Combat.AddMainAttack(UCM_Attack_Left(), 100.0f);
//         Combat.AddMainAttack(UCM_Attack_Right(), 100.0f);

//         if (!Combat.IsCurrentRole(ECombatRole::PassiveAttacker))
//         {
//             Combat.AddMainAttack(UCM_AttackCCombo_LeftRight(), 100.0f, 2.0f);
//             Combat.AddMainAttack(UCM_AttackCCombo_RightLeft(), 100.0f, 2.0f);
//             Combat.AddMainAttack(UCM_AttackCCombo_LeftRightLeft(), 100.0f);

//             Combat.AddPersecutoryAttack(UCM_Attack_Bottom(), 2.0f);
//             Combat.AddPersecutoryAttack(UCM_AttackCCombo_BottomRight(), 180.0f);
//             Combat.AddPersecutoryAttack(UCM_AttackCCombo_BottomLeft(), 180.0f);
//         }
//     }

//     void SetupBehaviors() override
//     {
//         if (Combat.IsCurrentRole(ECombatRole::ActiveAttacker))
//         {
//             Combat.AddBehavior(UCombatBehavior_RunToDistanceAndAttackPersecutory(), 10.0f);
//             Combat.AddBehavior(UCombatBehavior_RunToDistanceAndAttackMain(), 3.5f);

//             Combat.AddBehavior(UCombatBehavior_AggressiveTauntOrSkipWhenLunge());
//             Combat.AddBehavior(UCombatBehavior_LongTauntOrWaitWhenOutOfRangeAndEnemyFacingMe());
//         }
//         else if (Combat.IsCurrentRole(ECombatRole::PassiveAttacker))
//         {

//             Combat.AddBehavior(UCombatBehavior_RunToDistanceAndAttackMain(), CooldownSeconds = 20.0f);

//             Combat.AddBehavior(UCombatBehavior_LongTauntOrWaitWhenOutOfRangeAndEnemyFacingMe());
//         }
//     }
// }