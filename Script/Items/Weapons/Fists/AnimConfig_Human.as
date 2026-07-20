
UCLASS()
class UFists_Human : UWeaponMeleeItemAnimConfig
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
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Fist/NH_MM_BipedFistsAnimBP.NH_MM_BipedFistsAnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_S1H_Human::StaticClass();
    //

    // Loot
    default m_LootsData = ULootsData_Human_Fists_Un::StaticClass();
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Fists_Untrained::StaticClass();
    //

    //-----------------------------------------------------------------------
    // This animations should probably be removed in the future 
    // (for now we are keeping them here for safety)

    // Throw (can't throw in combat)
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra04) =   UAttack_Human_S1H_Test_Hip_LH::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =   UAttack_Human_Fists_Test_Parry::StaticClass();
}

UCLASS()
class UFists_Human_Untrained : UFists_Human
{    
    // Consume
    default m_ConsumablesData = UConsumablesData_Human_Fists_Untrained::StaticClass();

    //PickUps
    default m_PicksData = UPicksData_Human_Fists_Un_Left::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Fists_Untrained::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_Fists_Un::StaticClass();

    // TAUNTS
    default m_TauntData = UTauntData_Fists_Untrained::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Fists_Un_Human::StaticClass();
    //
    
    // DODGES
    default m_DodgesData = UDodgesData_Fists_Un_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Movement/Transitions/A_Man_Fists_Un_Idle_to_IB_Montage.A_Man_Fists_Un_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataFists_Human_Untrained::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Fists_Untrained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_Fists_Un_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Fists_Un_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_Fists_Un_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Fists_Un_T01::StaticClass();
    //
}

UCLASS()
class UFists_Human_Trained : UFists_Human
{        
    // Consume
    default m_ConsumablesData = UConsumablesData_Human_Fists_Trained::StaticClass();

    //PickUps
    default m_PicksData = UPicksData_Human_Fists_Tr_Left::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Fists_Trained::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_Fists_Tr::StaticClass();

    // TAUNTS
    default m_TauntData = UTauntData_Fists_Trained::StaticClass();
    //

    // PARRIES
    default m_ParriesData = UParriesData_Fists_Tr_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Fists_Tr_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Fists_Tr_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Movement/Transitions/A_Man_Fists_Tr_Idle_to_IB_Montage.A_Man_Fists_Tr_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataFists_Human_Trained::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Fists_Trained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_Fists_Tr_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Fists_Tr_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_Fists_Tr_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Fists_Tr_T01::StaticClass();
    //
}

UCLASS()
class UFists_Human_Master : UFists_Human
{      

    default m_RotateSpeedMagnetPlayer = 600.0f;

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_Fists_Master::StaticClass();

    //PickUps
    default m_PicksData = UPicksData_Human_Fists_Ma_Left::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Fists_Master::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_Fists_Ma::StaticClass();

    // TAUNTS
    default m_TauntData = UTauntData_Fists_Master::StaticClass();
    //
    
    // PARRIES
    default m_ParriesData = UParriesData_Fists_Ma_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Fists_Ma_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Fists_Ma_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Movement/Transitions/A_Man_Fists_Ma_Idle_to_IB_Montage.A_Man_Fists_Ma_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataFists_Human_Master::StaticClass();
    //

    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Fists_Master::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_Fists_Ma_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Fists_Ma_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_Fists_Ma_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Fists_Ma_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Riposte) =  UAttack_Human_Fists_Ma_Riposte::StaticClass();
    //
}