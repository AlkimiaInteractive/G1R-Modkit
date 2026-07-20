UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Fists : UWeaponMeleeItemAnimConfig
{
    default m_BlockMontage = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Idles/Transitions/A_OrcM_Fists_Idle_to_IB_Montage.A_OrcM_Fists_Idle_to_IB_Montage'";

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/OrcM_Fists_AnimBP.OrcM_Fists_AnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_Orc_Combat_Fists::StaticClass();
    //

    //PickUps
    default m_PicksData = UPicksData_Orc_Fists::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Orc_Fists::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Orc_Fists;
    
    // PARRIES
    // default m_ParriesData = UParriesData_S1H_Tr_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Orc_Fists::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Orc_Fists::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Orc_Fists::StaticClass();
    
    //SPEED COMBAT
    default m_SpeedsPlayer = USpeedConfig_Orc_Combat::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Orc_Combat::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Orc_Fists_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Orc_Fists_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Orc_Fists_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Orc_Fists_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =  UAttack_Orc_Fists_Spc_B01::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra06) = UComboAttackConfig_Orc_ThrowStone_Fists;
    //

    // TEST LH HIP
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =   UAttack_Orc_Test_LH::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Fists : UWeaponMeleeItemAnimConfig_Orc_Combat_Fists
{
    // TAUNTS
    default m_TauntData = UTauntData_UndeadOrc_Fists::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Shaman_Combat_Fists : UWeaponMeleeItemAnimConfig_Orc_Combat_Fists
{
    // TAUNTS
    default m_TauntData = UTauntData_Orc_Shaman_Fists::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_UndeadOrc_Shaman_Combat_Fists : UWeaponMeleeItemAnimConfig_Orc_Combat_Fists
{
    // TAUNTS
    default m_TauntData = UTauntData_UndeadOrc_Shaman_Fists::StaticClass();
}