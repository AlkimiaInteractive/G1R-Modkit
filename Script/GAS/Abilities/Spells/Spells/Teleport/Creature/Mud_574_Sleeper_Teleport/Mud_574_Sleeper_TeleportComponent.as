
class UMud_Sleeper_TeleportComponent : UCreatureTeleportComponent
{
    UPROPERTY()
    UClass m_TeleportSpotFilterClass = AMud_Sleeper_TeleportSpotVisual::StaticClass();


    UClass GetTeleportSpotFilterClass()
    {
        return m_TeleportSpotFilterClass;
    }

}
