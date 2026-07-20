UCLASS()
class UTorch1H_Human : UWeaponMeleeItemAnimConfig
{
    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 360.0f;
    default m_RotateSpeedMagnetAI = 360.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/NH_MM_BipedTorch1HAnimBP.NH_MM_BipedTorch1HAnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_S1H_Human::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //

    //PickUps
    default m_PicksData = UPicksData_Human_T1H_Left::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_T1H::StaticClass();

    // Loot
    default m_LootsData = ULootsData_Human_T1H::StaticClass();

    //STARTFIRE
    default m_StartFireData = UStartFireData_Human::StaticClass();
    //ENDFIRE
    default m_EndFireData = UEndFireData_Human::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_Torch1H::StaticClass();
    default m_NonCombatEquipData = UEquipData_Human_Torch1H_NonCombat::StaticClass();

    // HITS
    default m_HitsData = UHitData_Torch_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_T1H_Human::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_T1H::StaticClass(); 
    //

    //-----------------------------------------------------------------------
    // This animations should probably be removed in the future 
    // (for now we are keeping them here for safety)

    // Throw (can't throw in combat)
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra04) =   UAttack_Human_S1H_Test_Hip_LH::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =   UAttack_Human_S2H_Test_Parry::StaticClass();

}

UCLASS()
class UTorch1H_Human_Untrained : UTorch1H_Human
{   
    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Movement/Transitions/A_Man_T1H_Un_Idle_to_IB_Montage.A_Man_T1H_Un_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    // default m_ExecutionData = UExecutionDataT1H_Human_Untrained::StaticClass();
    default m_ExecutionData = UExecutionDataT1H_Human_Trained::StaticClass();
    //

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_T1H_Un_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =     UAttack_Human_T1H_Un_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_T1H_Un_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UAttack_Human_T1H_Un_B01::StaticClass();
    //

    // COMBOS TEST POSE TO POSE
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Torch_PTP_L01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Torch_PTP_T01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UAttack_Human_Torch_PTP_B01::StaticClass();
    //
}

UCLASS()
class UTorch1H_Human_Trained : UTorch1H_Human
{ 
    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Movement/Transitions/A_Man_T1H_Idle_to_IB_Montage.A_Man_T1H_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataT1H_Human_Trained::StaticClass();
    //

    // PARRIES
    default m_ParriesData = UParriesData_T1H_Tr_Human::StaticClass();
    //

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_T1H_Tr_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =     UAttack_Human_T1H_Tr_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_T1H_Tr_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UAttack_Human_T1H_Tr_B01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_T1H_Tr_Demo_L01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_T1H_Tr_Demo_T01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UAttack_Human_T1H_Tr_Demo_B01::StaticClass();
    //

    // COMBOS TEST POSE TO POSE
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Torch_PTP_L01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Torch_PTP_T01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UAttack_Human_Torch_PTP_B01::StaticClass();
    //
}

UCLASS()
class UTorch1H_Human_Master : UTorch1H_Human
{
    default m_RotateSpeedMagnetPlayer = 600.0f;

    // BLOCK
    default m_BlockMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Movement/Transitions/A_Man_T1H_Idle_to_IB_Montage.A_Man_T1H_Idle_to_IB_Montage'";
    //

    // EXECUTIONS
    // default m_ExecutionData = UExecutionDataT1H_Human_Master::StaticClass();
    default m_ExecutionData = UExecutionDataT1H_Human_Trained::StaticClass();
    //

    // PARRIES
    default m_ParriesData = UParriesData_T1H_Ma_Human::StaticClass();
    //

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_T1H_Ma_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =     UAttack_Human_T1H_Ma_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_T1H_Ma_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UAttack_Human_T1H_Ma_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Riposte) =     UAttack_Human_T1H_Ma_Riposte::StaticClass();
    //

    // COMBOS TEST POSE TO POSE
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Torch_PTP_L01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Torch_PTP_T01::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UAttack_Human_Torch_PTP_B01::StaticClass();
    //
}

UCLASS()
class UTorch1H_Human_Ma_PoseToPose : UTorch1H_Human
{
    // PARRIES
    default m_ParriesData = UParriesData_T1H_Ma_Human::StaticClass();
    //

    // COMBOS TEST POSE TO POSE
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_Torch_PTP_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_Torch_PTP_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UAttack_Human_Torch_PTP_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Riposte) =     UAttack_Human_T1H_Ma_Riposte::StaticClass();
    //
}
