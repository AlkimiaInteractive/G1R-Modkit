UCLASS()
class UWeaponMeleeItemAnimConfig_Orc_WatchFight : UWeaponMeleeItemAnimConfig
{
    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Orcs/Combat/WatchFight/Orc_WatchFight_AnimBP.Orc_WatchFight_AnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_Orc_Combat_Fists::StaticClass();
    //

    //PickUps
    default m_PicksData = UPicksData_Orc_Fists::StaticClass();

    // Consume
    default m_ConsumablesData = UConsumablesData_Orc_Fists::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Orc_WatchFight;

    // HITS
    default m_HitsData = UHitData_Orc_Fists::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Orc_Fists::StaticClass();
    //

    //SPEED COMBAT
    default m_SpeedsPlayer = USpeedConfig_Orc_Combat::StaticClass();
    default m_SpeedsNPC = USpeedConfig_Orc_Combat::StaticClass();
}