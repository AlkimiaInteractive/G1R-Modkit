UCLASS()
class UStaff2H_Human : UWeaponMeleeItemAnimConfig
{
    //STARTFIRE
    default m_StartFireData = UStartFireData_Human::StaticClass();
    //ENDFIRE
    default m_EndFireData = UEndFireData_Human::StaticClass();
    
    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 360.0f;
    default m_RotateSpeedMagnetAI = 360.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/NH_MM_BipedStaff2HAnimBP.NH_MM_BipedStaff2HAnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_S1H_Human::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //

    //-----------------------------------------------------------------------
    // This animations should probably be removed in the future 
    // (for now we are keeping them here for safety)

    // Throw (can't throw in combat)
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra04) =   UAttack_Human_S1H_Test_Hip_LH::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =   UAttack_Human_Sff2H_Test_Parry::StaticClass();
}

UCLASS()
class UStaff2H_Human_Untrained : UStaff2H_Human
{
    // CONSUME
    default m_ConsumablesData = UConsumablesData_Human_Sff2H_Untrained::StaticClass();

    // PICKUPS
    default m_PicksData = UPicksData_Human_Sff2H_Un_Left::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_Sff2H_Un::StaticClass();

    // DRAWS
    default m_EquipData = UEquipData_Human_Staff2H_Untrained::StaticClass();
   
    // HITS
    default m_HitsData = UHitData_Sff2H_Un_Human::StaticClass();
    //
    
    // DODGES
    default m_DodgesData = UDodgesData_Sff2H_Un_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Movement/Transitions/A_Man_Sff2H_Un_Idle_to_IB_Montage.A_Man_Sff2H_Un_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataStaff2H_Human_Untrained::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Staff2H_Untrained::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Staff2H_Untrained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_Sff2H_Un_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Sff2H_Un_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_Sff2H_Un_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Sff2H_Un_T01::StaticClass();
    //
}

UCLASS()
class UStaff2H_Human_Trained : UStaff2H_Human
{
    // CONSUME
    default m_ConsumablesData = UConsumablesData_Human_Sff2H_Trained::StaticClass();

    // PICKUPS
    default m_PicksData = UPicksData_Human_Sff2H_Tr_Left::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_Sff2H_Tr::StaticClass();

    // DRAWS
    default m_EquipData = UEquipData_Human_Staff2H_Trained::StaticClass();

    // PARRIES
    default m_ParriesData = UParriesData_Sff2H_Tr_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Sff2H_Tr_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Sff2H_Tr_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Movement/Transitions/A_Man_Sff2H_Tr_Idle_to_IB_Montage.A_Man_Sff2H_Tr_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataStaff2H_Human_Trained::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Staff2H_Trained::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Staff2H_Trained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_Sff2H_Tr_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Sff2H_Tr_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_Sff2H_Tr_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Sff2H_Tr_T01::StaticClass();
    //
}

UCLASS()
class UStaff2H_Human_Master : UStaff2H_Human
{
    default m_RotateSpeedMagnetPlayer = 600.0f;

    // CONSUME
    default m_ConsumablesData = UConsumablesData_Human_Sff2H_Master::StaticClass();

    // PICKUPS
    default m_PicksData = UPicksData_Human_Sff2H_Ma_Left::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_Sff2H_Ma::StaticClass();

    // DRAWS
    default m_EquipData = UEquipData_Human_Staff2H_Master::StaticClass();
    
    // PARRIES
    default m_ParriesData = UParriesData_Sff2H_Ma_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Sff2H_Ma_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Sff2H_Ma_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Movement/Transitions/A_Man_Sff2H_Ma_Idle_to_IB_Montage.A_Man_Sff2H_Ma_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataStaff2H_Human_Master::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Staff2H_Master::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Staff2H_Master::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_Sff2H_Ma_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Sff2H_Ma_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_Sff2H_Ma_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Sff2H_Ma_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Riposte) =  UAttack_Human_Sff2H_Ma_Riposte::StaticClass();
    //
}