UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Melee : UWeaponMeleeItemAnimConfig
{
    default m_BlockMontage = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Idles/Transitions/A_OrcM_S1H_Idle_to_IB_Montage.A_OrcM_S1H_Idle_to_IB_Montage'";
    
    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/OrcM_Sword_AnimBP.OrcM_Sword_AnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_Orc_Combat_Sword::StaticClass();
    //

    //PickUps
    default m_PicksData = UPicksData_Orc_S1H::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Orc_S1H::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Orc_Melee::StaticClass();
    
    // PARRIES
    // default m_ParriesData = UParriesData_S1H_Tr_Human::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Orc_Sword::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Orc_Sword::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Orc_S1H::StaticClass();
    
    // TEST LH HIP
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =   UAttack_Orc_Test_LH::StaticClass();

    //SPEED COMBAT
    default m_SpeedsPlayer = USpeedConfig_Orc_Combat::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Orc_Combat::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Sword : UWeaponMeleeItemAnimConfig_Orc_Combat_Melee
{
    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UAttack_Orc_S1H_B01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UAttack_Orc_S1H_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UAttack_Orc_S1H_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UAttack_Orc_S1H_T01::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra06) = UComboAttackConfig_Orc_ThrowStone_Melee;
    //
}

UCLASS()
class UWeaponMeleeItemAnimConfig_UndeadOrc_Combat_Melee_Sword : UWeaponMeleeItemAnimConfig_Orc_Combat_Melee_Sword
{
    // TAUNTS
    default m_TauntData = UTauntData_UndeadOrc_S1H::StaticClass();
}