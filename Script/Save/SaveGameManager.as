
UCLASS()
class UPersistentDataSubsystemFinal : UPersistentDataSubsystem
{
    default m_autosavePermaDeathTimer = 100.0f;

    default m_ScreenshotTimeout = 5.f;
	default m_SaveScreenshotEnabled = true;
	default m_ScreenshotResolutionX = 1280;
	default m_ScreenshotResolutionY = 720;

    UFUNCTION(BlueprintOverride)
    UGothicPersistentDataList LoadOrCreateSettings(const UGothicLocalPlayer localPlayer)
    {
        UGothicFinalList finalSave = Cast<UGothicFinalList>(UGothicPersistentDataList::LoadOrCreateSettings(localPlayer, UGothicFinalList::StaticClass()));
	    return finalSave;
    }

    UFUNCTION(BlueprintOverride)
    UGothicPersistentDataGame LoadOrCreateDataGame()
    {
        UGothicFinalDataGame finalSave = Cast<UGothicFinalDataGame>(Gameplay::CreateSaveGameObject(UGothicFinalDataGame::StaticClass()));
	    return finalSave;
    }

}