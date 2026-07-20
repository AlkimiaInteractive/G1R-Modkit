UCLASS()
class UMace2H_Human : UWeaponMeleeItemAnimConfig
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
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/NH_MM_BipedMace2HAnimBP.NH_MM_BipedMace2HAnimBP_C'";

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
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =   UAttack_Human_A2H_Test_Parry::StaticClass();
}

UCLASS()
class UMace2H_Human_Untrained : UMace2H_Human
{
    // CONSUME
    default m_ConsumablesData = UConsumablesData_Human_M2H_Untrained::StaticClass();

    // PICKUPS
    default m_PicksData = UPicksData_Human_M2H_Un_Left::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_M2H_Un::StaticClass();

    // DRAWS
    default m_EquipData = UEquipData_Human_Mace2H_Untrained::StaticClass();
    
    // HITS
    default m_HitsData = UHitData_M2H_Un_Human::StaticClass();
    //
    
    // DODGES
    default m_DodgesData = UDodgesData_M2H_Un_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Movement/Transitions/A_Man_M2H_Un_Idle_to_IB_Montage.A_Man_M2H_Un_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataM2H_Human_Untrained::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_A2H_Untrained::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Mace2H_Untrained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_M2H_Un_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_M2H_Un_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_M2H_Un_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_M2H_Un_T01::StaticClass();
    //
}

UCLASS()
class UMace2H_Human_Trained : UMace2H_Human
{
    //PickUps
    default m_PicksData = UPicksData_Human_M2H_Tr_Left::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_M2H_Trained::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_M2H_Tr::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Mace2H_Trained::StaticClass();

    // PARRIES
    default m_ParriesData = UParriesData_M2H_Tr_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_M2H_Tr_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_M2H_Tr_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Movement/Transitions/A_Man_M2H_Tr_Idle_to_IB_Montage.A_Man_M2H_Tr_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataM2H_Human_Trained::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_A2H_Trained::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Mace2H_Trained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_M2H_Tr_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_M2H_Tr_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_M2H_Tr_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_M2H_Tr_T01::StaticClass();
    //
}

UCLASS()
class UMace2H_Human_Master : UMace2H_Human
{

    default m_RotateSpeedMagnetPlayer = 600.0f;

    //PickUps
    default m_PicksData = UPicksData_Human_M2H_Ma_Left::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_M2H_Master::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_M2H_Ma::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Mace2H_Master::StaticClass();

    // PARRIES
    default m_ParriesData = UParriesData_M2H_Ma_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_M2H_Ma_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_M2H_Ma_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Movement/Transitions/A_Man_M2H_Ma_Idle_to_IB_Montage.A_Man_M2H_Ma_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataM2H_Human_Master::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_A2H_Master::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Mace2H_Master::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_M2H_Ma_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_M2H_Ma_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_M2H_Ma_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_M2H_Ma_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Riposte) =  UAttack_Human_M2H_Ma_Riposte::StaticClass();
    //
}