
UCLASS()
class UDefault_Human_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/FistOverlay.FistOverlay_C'";

    // Consume
    default m_ConsumeData.FindOrAdd(GameplayTag::Item_Food) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_Food_Montage.A_Man_N_Consume_Food_Montage'";
	default m_ConsumeData.FindOrAdd(GameplayTag::Item_Drink) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_N_Consume_Drink_Montage.A_Man_N_Consume_Drink_Montage'";
	default m_ConsumeData.FindOrAdd(GameplayTag::Item_Potion) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ConsumePotions/A_Man_N_Consume_Potions_Montage.A_Man_N_Consume_Potions_Montage'";
	default m_ConsumeData.FindOrAdd(GameplayTag::Item_Herb) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Consumefood/A_Man_N_Consume_Herbs_Montage.A_Man_N_Consume_Herbs_Montage'";

    // Throw
    default m_ThrowItem = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_N_Throw_Montage.A_Man_N_Throw_Montage'";
    default m_ThrowItem_Crouch = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Throw/A_Man_STL_Throw_Montage.A_Man_STL_Throw_Montage'";


    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) = UAttack_Human_M_Bottom01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =   UAttack_Human_M_Left01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =  UAttack_Human_M_Right01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =    UAttack_Human_M_Top01::StaticClass();

    // Hits
    default m_HitsData = UHitData_Melee_Human::StaticClass();
    //

    // PARRIES
    default m_ParriesData = UParriesData_Default_Human::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Melee_Human::StaticClass();
    //

    // TURNS
    default m_TurnsData = UTurnsData_Melee_Human::StaticClass();
    //
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //
}
