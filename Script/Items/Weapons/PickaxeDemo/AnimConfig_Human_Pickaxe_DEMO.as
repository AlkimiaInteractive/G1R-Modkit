UCLASS()
class UPickaxe_DEMO_Human : UWeaponMeleeItemAnimConfig
{
    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/Test_A2H/Pickaxe/NH_MM_PickAxe_DEMO_AnimBP.NH_MM_PickAxe_DEMO_AnimBP_C'";

    // PARRIES
    default m_ParriesData = UParriesData_S1H_Tr_Human::StaticClass();
    //

    // TURNS
    default m_TurnsData = UTurnsData_S1H_Human::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //

    // CONSUME
    default m_ConsumablesData = UConsumablesData_Human_A2H_Untrained::StaticClass();

    // PICKUPS
    default m_PicksData = UPicksData_Human_A2H_Un_Left::StaticClass();

    // DRAWS
    default m_EquipData = UEquipData_Human_Axe2H_Untrained::StaticClass();
    
    // HITS
    default m_HitsData = UHitData_S1H_Un_Human::StaticClass();
    //
    
    // DODGES
    default m_DodgesData = UDodgesData_S1H_Un_Human::StaticClass();
    //

    // EXECUTIONS
    default m_ExecutionData = UExecutionDataM1H_Human_Untrained::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_S1H_Untrained::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Human_PickAxe_DEMO_Un_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Human_PickAxe_DEMO_Un_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Human_PickAxe_DEMO_Un_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Human_PickAxe_DEMO_Un_T01::StaticClass();
    //


    //-----------------------------------------------------------------------
    // This animations should probably be removed in the future 
    // (for now we are keeping them here for safety)

    //Consume (only potions can be consumed in combat)
    default m_ConsumeData.FindOrAdd(GameplayTag::Item_Food) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_Food_Montage.A_Man_N_Consume_Food_Montage'";
	default m_ConsumeData.FindOrAdd(GameplayTag::Item_Drink) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_N_Consume_Drink_Montage.A_Man_N_Consume_Drink_Montage'";
	default m_ConsumeData.FindOrAdd(GameplayTag::Item_Herb) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_Herbs_Montage.A_Man_N_Consume_Herbs_Montage'";

    // Throw (can't throw in combat)
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";

}
