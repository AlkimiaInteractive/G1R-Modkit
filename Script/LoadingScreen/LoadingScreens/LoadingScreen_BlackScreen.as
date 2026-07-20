//////////////////////////////////////////////////////////////////////////////
// Intro Loading Screen
//////////////////////////////////////////////////////////////////////////////
// We are using the loading screen system to play the game intro video for a more immersive transition
// from the main menu into the game while loading the content during video playback

UCLASS()
class ULoadingScreen_BlackScreen : ULoadingScreenBase
{
    UPROPERTY() TSoftObjectPtr<UFont> FontHoldToSkip = TSoftObjectPtr<UFont>( n"/Script/Engine.Font'/Game/UI/Fonts/NotoSerif-Regular_Font.NotoSerif-Regular_Font'" );
    default ScreenType = ELoadingScreenType::BlackScreen;
	
    // Method used to setup the Loading Screen Chapter specific data
    bool SetupLoadingscreenSettings( FALoadingScreenSettings_Overwrite& _LoadingScreenSettings ) override
    {
		Super::SetupLoadingscreenSettings( _LoadingScreenSettings );
		
		// Make sure the letterbox layout is enabled, without an extra horizontal bar
		_LoadingScreenSettings.ScreenSettings.Layout = EAsyncLoadingScreenLayout::ALSL_Center;
		
		// The loading screen should stay until the video has finished
        _LoadingScreenSettings.ScreenSettings.MinimumLoadingScreenDisplayTime = -1;
        _LoadingScreenSettings.ScreenSettings.bAutoCompleteWhenLoadingCompletes = true;
        _LoadingScreenSettings.ScreenSettings.bWaitForManualStop = false;
		
		// The widget overlay must be enabled, in case we want to show a text when loading is complete or the loading widget
		_LoadingScreenSettings.ScreenSettings.bShowWidgetOverlay = false;
		
		// We could use the loading complete text field to show a hint to skip the intro video. Enable if desired
        _LoadingScreenSettings.ScreenSettings.bShowLoadingCompleteText = false;
        FText MyLoadingCompleteText = "UI_Loadingscreen_IntroSkip";
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.LoadingCompleteText = MyLoadingCompleteText;
		
		// No loading widget during the game intro
		_LoadingScreenSettings.ScreenSettings.bShowLoadingWidget = false;

        return true;
    }
}
