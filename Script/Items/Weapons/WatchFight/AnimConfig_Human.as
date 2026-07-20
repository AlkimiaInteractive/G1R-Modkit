UCLASS()
class UAnimConfig_WatchFight_Human : UWeaponMeleeItemAnimConfig
{
    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 360.0f;
    default m_RotateSpeedMagnetAI = 270.0f;

    //Manual reorient
    default m_AttackRotateSpeedManualReorient = 380.0f;

    // Overlay Animation bluerprint
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/WatchFight/WatchFight_AnimBP.WatchFight_AnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_S1H_Human::StaticClass();
    
    // LOCOMOTION ANIM SETS
    default m_LocomotionSequencesData = ULocomotionSequencesData_Default_Human_Combat::StaticClass();
    //

    // Consume
    default m_ConsumablesData = UConsumablesData_Human_Fists_Untrained::StaticClass();

    //DRAWS
    default m_EquipData = UEquipData_Human_WatchFight::StaticClass();

    // HITS
    default m_HitsData = UHitData_Fists_Un_Human::StaticClass();
    //
    
    // DODGES
    default m_DodgesData = UDodgesData_Fists_Un_Human::StaticClass();
    //
}