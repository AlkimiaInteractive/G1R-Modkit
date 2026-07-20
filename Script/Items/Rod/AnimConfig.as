
UCLASS()
class URod_Human : UItemAnimConfig
{
    default m_EquipData = UEquipData_Human_Rod::StaticClass();

    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/Items/FishingRod/FishingRodOverlay.FishingRodOverlay_C'";

     // TURNS
    default m_TurnsData = UTurnsData_Rod_Human::StaticClass();
    //
}