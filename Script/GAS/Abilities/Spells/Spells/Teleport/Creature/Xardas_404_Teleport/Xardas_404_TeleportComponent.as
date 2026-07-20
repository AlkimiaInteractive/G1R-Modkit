
class UXardas_404_TeleportComponent : UCreatureTeleportComponent
{
    UPROPERTY()
    UClass m_TeleportSpotFilterClass = AXardas_404_TeleportSpotVisual::StaticClass();


    UClass GetTeleportSpotFilterClass()
    {
        return m_TeleportSpotFilterClass;
    }

}
