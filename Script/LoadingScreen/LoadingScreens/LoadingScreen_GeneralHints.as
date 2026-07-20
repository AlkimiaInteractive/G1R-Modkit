//////////////////////////////////////////////////////////////////////////////
// General Hint Loading Screens
//////////////////////////////////////////////////////////////////////////////

UCLASS()
class ULoadingScreen_GeneralHints : ULoadingScreenBase
{
    default BackgroundImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:Images/Loadingscreens/OldCamp");
    default ScreenType = ELoadingScreenType::Default;

    // Method used to setup the Loading Screen Chapter specific data
    bool SetupLoadingscreenSettings( FALoadingScreenSettings_Overwrite& _LoadingScreenSettings ) override
    {
        Super::SetupLoadingscreenSettings( _LoadingScreenSettings );
        
        // Here you can add a selection of Hints, it will choose one at random
        FText MyTextID = "UI_Loadingscreen_Hint1";
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Add( MyTextID );
        MyTextID = "UI_Loadingscreen_Hint2";
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Add( MyTextID );
        MyTextID = "UI_Loadingscreen_Hint3";
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Add( MyTextID );
        MyTextID = "UI_Loadingscreen_Hint4";
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Add( MyTextID );
        MyTextID = "UI_Loadingscreen_Hint5";
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Add( MyTextID );
        MyTextID = "UI_Loadingscreen_Hint6";
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Add( MyTextID );
        MyTextID = "UI_Loadingscreen_Hint7";
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Add( MyTextID );

        return true;
    }
}
