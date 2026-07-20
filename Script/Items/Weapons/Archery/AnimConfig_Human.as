
UCLASS()
class UBow_Human : UBowItemAnimConfig
{
    // Throw
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";

    // Equip
    default m_EquipData = UEquipData_Human_Bow::StaticClass();

    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Bow/NH_MM_BipedBowAnimBP.NH_MM_BipedBowAnimBP_C'";
 
    // Notch, release and notch
    default m_NotchMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/N/Man_Bow_N_Reload_AnimMontage.Man_Bow_N_Reload_AnimMontage'";
    default m_NotchMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/STL/Man_Bow_STL_Reload_AnimMontage.Man_Bow_STL_Reload_AnimMontage'";
    default m_ReleaseAndNotchMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/N/Man_Bow_N_ShootReload_AnimMontage.Man_Bow_N_ShootReload_AnimMontage'";
    default m_ReleaseAndNotchMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/STL/Man_Bow_STL_ShootReload_AnimMontage.Man_Bow_STL_ShootReload_AnimMontage'";
    default m_QuickReleaseAndNotchMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/N/Man_Bow_N_QuickShootReload_AnimMontage.Man_Bow_N_QuickShootReload_AnimMontage'";
    default m_QuickReleaseAndNotchMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/STL/Man_Bow_STL_QuickShootReload_AnimMontage.Man_Bow_STL_QuickShootReload_AnimMontage'";
    
    // Notch Failure
    default m_ReleaseAndNotchFailureMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/N/Man_Bow_N_ShootReloadFailure_AnimMontage.Man_Bow_N_ShootReloadFailure_AnimMontage'";
    default m_ReleaseAndNotchFailureMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/STL/Man_Bow_STL_ShootReloadFailure_AnimMontage.Man_Bow_STL_ShootReloadFailure_AnimMontage'";
    default m_QuickReleaseAndNotchFailureMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/N/Man_Bow_N_QuickShootReloadFailure_AnimMontage.Man_Bow_N_QuickShootReloadFailure_AnimMontage'";
    default m_QuickReleaseAndNotchFailureMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Shoot/STL/Man_Bow_STL_QuickShootReloadFailure_AnimMontage.Man_Bow_STL_QuickShootReloadFailure_AnimMontage'";
    
    // HITS
    default m_HitsData = UHitData_Bow_Human::StaticClass();
    //

    // TURNS
    default m_TurnsData = UTurnsData_Bow_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Bow_Human::StaticClass();
    //

    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Bow::StaticClass();
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataBow_Human::StaticClass();
    //

    //PickUps
    default m_PicksData = UPicksData_Human_Bow_Right::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_Bow::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_Bow::StaticClass();

    // TAUNTS
    default m_TauntData = UTauntData_Bow::StaticClass();

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

}

UCLASS()
class UBow_Human_Untrained : UBow_Human
{
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Arch_Untrained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
}

UCLASS()
class UBow_Human_Trained : UBow_Human
{
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Arch_Trained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
}

UCLASS()
class UBow_Human_Master : UBow_Human
{
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Arch_Master::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
}

UCLASS()
class UCrossbow_Human : UCrossbowItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/NH_MM_BipedCrossbowAnimBP.NH_MM_BipedCrossbowAnimBP_C'";
    
    //Equipdata
    default m_EquipData = UEquipData_Human_Crossbow::StaticClass();

    //Shoot
    default m_ReleaseMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Aim_Shoot_AnimMontage.Man_Crossbow_N_Aim_Shoot_AnimMontage'";
    default m_ReleaseMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Aim_Shoot_AnimMontage.Man_Crossbow_STL_Aim_Shoot_AnimMontage'";
   
    default m_QuickReleaseMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_QuickShoot_Shoot_AnimMontage.Man_Crossbow_N_QuickShoot_Shoot_AnimMontage'";
    default m_QuickReleaseMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_QuickShoot_Shoot_AnimMontage.Man_Crossbow_STL_QuickShoot_Shoot_AnimMontage'";

    // Notch
    FStanceMapMontage UntraidedRelaxNotchMontage;
    default UntraidedRelaxNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Relax_Reload_Untrained_AnimMontage.Man_Crossbow_N_Relax_Reload_Untrained_AnimMontage'";
    default UntraidedRelaxNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Relax_Reload_Untrained_AnimMontage.Man_Crossbow_STL_Relax_Reload_Untrained_AnimMontage'";
    FStanceMapMontage TrainedRelaxNotchMontage;
    default TrainedRelaxNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Relax_Reload_Trained_AnimMontage.Man_Crossbow_N_Relax_Reload_Trained_AnimMontage'";
    default TrainedRelaxNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Relax_Reload_Trained_AnimMontage.Man_Crossbow_STL_Relax_Reload_Trained_AnimMontage'";
    FStanceMapMontage MasterRelaxNotchMontage;
    default MasterRelaxNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Relax_Reload_Master_AnimMontage.Man_Crossbow_N_Relax_Reload_Master_AnimMontage'";
    default MasterRelaxNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Relax_Reload_Master_AnimMontage.Man_Crossbow_STL_Relax_Reload_Master_AnimMontage'";
    default m_RelaxNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Untrained) = UntraidedRelaxNotchMontage;
    default m_RelaxNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Trained) = TrainedRelaxNotchMontage;
    default m_RelaxNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Master) = MasterRelaxNotchMontage;

    FStanceMapMontage UntraidedAimNotchMontage;
    default UntraidedAimNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Aim_Reload_Untrained_AnimMontage.Man_Crossbow_N_Aim_Reload_Untrained_AnimMontage'";
    default UntraidedAimNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Aim_Reload_Untrained_AnimMontage.Man_Crossbow_STL_Aim_Reload_Untrained_AnimMontage'";
    FStanceMapMontage TrainedAimNotchMontage;
    default TrainedAimNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Aim_Reload_Trained_AnimMontage.Man_Crossbow_N_Aim_Reload_Trained_AnimMontage'";
    default TrainedAimNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Aim_Reload_Trained_AnimMontage.Man_Crossbow_STL_Aim_Reload_Trained_AnimMontage'";
    FStanceMapMontage MasterAimNotchMontage;
    default MasterAimNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Aim_Reload_Master_AnimMontage.Man_Crossbow_N_Aim_Reload_Master_AnimMontage'";
    default MasterAimNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Aim_Reload_Master_AnimMontage.Man_Crossbow_STL_Aim_Reload_Master_AnimMontage'";
    default m_AimingNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Untrained) = UntraidedAimNotchMontage;
    default m_AimingNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Trained) = TrainedAimNotchMontage;
    default m_AimingNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Master) = MasterAimNotchMontage;
    
    FStanceMapMontage UntraidedQuickshootNotchMontage;
    default UntraidedQuickshootNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_QuickShoot_Reload_Untrained_AnimMontage.Man_Crossbow_N_QuickShoot_Reload_Untrained_AnimMontage'";
    default UntraidedQuickshootNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_QuickShoot_Reload_Untrained_AnimMontage.Man_Crossbow_STL_QuickShoot_Reload_Untrained_AnimMontage'";
    FStanceMapMontage TrainedQuickshootNotchMontage;
    default TrainedQuickshootNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_QuickShoot_Reload_Trained_AnimMontage.Man_Crossbow_N_QuickShoot_Reload_Trained_AnimMontage'";
    default TrainedQuickshootNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_QuickShoot_Reload_Trained_AnimMontage.Man_Crossbow_STL_QuickShoot_Reload_Trained_AnimMontage'";
    FStanceMapMontage MasterQuickshootNotchMontage;
    default MasterQuickshootNotchMontage.m_StanceMap.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_QuickShoot_Reload_Master_AnimMontage.Man_Crossbow_N_QuickShoot_Reload_Master_AnimMontage'";
    default MasterQuickshootNotchMontage.m_StanceMap.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_QuickShoot_Reload_Master_AnimMontage.Man_Crossbow_STL_QuickShoot_Reload_Master_AnimMontage'";
    default m_QuickNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Untrained) = UntraidedQuickshootNotchMontage;
    default m_QuickNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Trained) = TrainedQuickshootNotchMontage;
    default m_QuickNotchMontage.FindOrAdd(GameplayTag::Skill_Ranged_Crossbow_Master) = MasterQuickshootNotchMontage;
   
    //Notch failure
    default m_RelaxNotchFailureMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Relax_ReloadFailure_AnimMontage.Man_Crossbow_N_Relax_ReloadFailure_AnimMontage'";
    default m_RelaxNotchFailureMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Relax_ReloadFailure_AnimMontage.Man_Crossbow_STL_Relax_ReloadFailure_AnimMontage'";
    
    default m_AimingNotchFailureMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_Aim_ReloadFailure_AnimMontage.Man_Crossbow_N_Aim_ReloadFailure_AnimMontage'";
    default m_AimingNotchFailureMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_Aim_ReloadFailure_AnimMontage.Man_Crossbow_STL_Aim_ReloadFailure_AnimMontage'";
    
    default m_QuickNotchFailureMontage.FindOrAdd(EStance::Standing) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/N/Man_Crossbow_N_QuickShoot_ReloadFailure_AnimMontage.Man_Crossbow_N_QuickShoot_ReloadFailure_AnimMontage'";
    default m_QuickNotchFailureMontage.FindOrAdd(EStance::Crouching) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Shoot/STL/Man_Crossbow_STL_QuickShoot_ReloadFailure_AnimMontage.Man_Crossbow_STL_QuickShoot_ReloadFailure_AnimMontage'";

    // HITS
    default m_HitsData = UHitData_Crossbow_Human::StaticClass();
    //

    // TURNS
    default m_TurnsData = UTurnsData_Bow_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Crossbow_Human::StaticClass();
    //

    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat_Bow::StaticClass();
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataCrossBow_Human::StaticClass();
    //

    //PickUps
    default m_PicksData = UPicksData_Human_Crossbow_Right::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_Crossbow::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_Crossbow::StaticClass();

    // TAUNTS
    default m_TauntData = UTauntData_Crossbow::StaticClass();

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
}

UCLASS()
class UCrossbow_Human_Untrained : UCrossbow_Human
{
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Crossbow_Untrained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
}

UCLASS()
class UCrossbow_Human_Trained : UCrossbow_Human
{
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Crossbow_Trained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
}

UCLASS()
class UCrossbow_Human_Master : UCrossbow_Human
{
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Crossbow_Master::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
}

UCLASS()
class UProjectile_Human : UItemAnimConfig
{
    default m_EquipData = UEquipData_Human_Projectile::StaticClass();
}