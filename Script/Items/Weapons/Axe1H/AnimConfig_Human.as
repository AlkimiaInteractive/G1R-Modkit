
UCLASS()
class UAxe1H_Human : UWeaponMeleeItemAnimConfig
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
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/NH_MM_BipedAxe1HAnimBP.NH_MM_BipedAxe1HAnimBP_C'";
    // default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/NH_MM_BipedSword1HAnimBP.NH_MM_BipedSword1HAnimBP_C'";    

    // TURNS
    default m_TurnsData = UTurnsData_S1H_Human::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //
    
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
    //

    //-----------------------------------------------------------------------
    // This animations should probably be removed in the future 
    // (for now we are keeping them here for safety)

    // Throw (can't throw in combat)
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra04) =   UAttack_Human_S1H_Test_Hip_LH::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =   UAttack_Human_S1H_Test_Parry::StaticClass();
}

UCLASS()
class UAxe1H_Human_Untrained : UAxe1H_Human
{
    // Consume
    default m_ConsumablesData = UConsumablesData_Human_A1H_Untrained::StaticClass();

    //PickUps
    default m_PicksData = UPicksData_Human_A1H_Un_Left::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_A1H_Un::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Axe1H_Untrained::StaticClass();

    // HITS
    default m_HitsData = UHitData_A1H_Un_Human::StaticClass();
    //
    
    // DODGES
    default m_DodgesData = UDodgesData_A1H_Un_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Movement/Transitions/A_Man_S1H_Un_Idle_to_IB_Montage.A_Man_S1H_Un_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataA1H_Human_Untrained::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_A1H_Untrained::StaticClass();
    //
    
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Axe1H_Untrained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
    //

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   AttackAnimConfig::Human::Axe1H::Untrained::Bottom;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     AttackAnimConfig::Human::Axe1H::Untrained::Left;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    AttackAnimConfig::Human::Axe1H::Untrained::Right;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      AttackAnimConfig::Human::Axe1H::Untrained::Top;
    //
}

UCLASS()
class UAxe1H_Human_Trained : UAxe1H_Human
{
    // Consume
    default m_ConsumablesData = UConsumablesData_Human_A1H_Trained::StaticClass();

    //PickUps
    default m_PicksData = UPicksData_Human_A1H_Tr_Left::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_A1H_Tr::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Axe1H_Trained::StaticClass();

    // PARRIES
    default m_ParriesData = UParriesData_A1H_Tr_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_A1H_Tr_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_A1H_Tr_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Movement/Transitions/A_Man_A1H_Tr_Idle_to_IB_Montage.A_Man_A1H_Tr_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataA1H_Human_Trained::StaticClass();
    //

    // TAUNTS  
    default m_TauntData = UTauntData_A1H_Trained::StaticClass();
    //
    
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Axe1H_Trained::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
    //

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   AttackAnimConfig::Human::Axe1H::Trained::Bottom;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     AttackAnimConfig::Human::Axe1H::Trained::Left;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    AttackAnimConfig::Human::Axe1H::Trained::Right;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      AttackAnimConfig::Human::Axe1H::Trained::Top;
    //
}

UCLASS()
class UAxe1H_Human_Master : UAxe1H_Human
{
    default m_RotateSpeedMagnetPlayer = 600.0f;

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_A1H_Master::StaticClass();

    //PickUps
    default m_PicksData = UPicksData_Human_A1H_Ma_Left::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_A1H_Ma::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Axe1H_Master::StaticClass();

    // PARRIES
    default m_ParriesData = UParriesData_A1H_Ma_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_A1H_Ma_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_A1H_Ma_Human::StaticClass();
    //

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Movement/Transitions/A_Man_A1H_Ma_Idle_to_IB_Montage.A_Man_A1H_Ma_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataA1H_Human_Master::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_A1H_Master::StaticClass();
    //
    
    //SPEEDS
    default m_SpeedsPlayer = USpeedConfig_Player_Axe1H_Master::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Human::StaticClass();
    //

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   AttackAnimConfig::Human::Axe1H::Master::Bottom;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     AttackAnimConfig::Human::Axe1H::Master::Left;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    AttackAnimConfig::Human::Axe1H::Master::Right;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      AttackAnimConfig::Human::Axe1H::Master::Top;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Riposte) =  AttackAnimConfig::Human::Axe1H::Master::Riposte;
    //
}