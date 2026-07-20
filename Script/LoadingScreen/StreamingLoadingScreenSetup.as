//////////////////////////////////////////////////////////////////////////////
// Sample Loadingscreen Idea
//////////////////////////////////////////////////////////////////////////////


UCLASS()
class UStreamingLoadingScreenSetup : UAsyncLoadingScreen_Input
{
    UPROPERTY() TSoftObjectPtr<UFont> FontLoadingText = TSoftObjectPtr<UFont>( n"/Script/Engine.Font'/Game/UI/Fonts/NotoSerif-Regular_Font.NotoSerif-Regular_Font'");
    UPROPERTY() TSoftObjectPtr<UTexture2D> AutosaveIcon = TSoftObjectPtr<UTexture2D>( n"/Script/Engine.Texture2D'/Game/UI/Textures/LoadingScreens/T_AutosaveIcon.T_AutosaveIcon'" );
    
    // Setup the General Layout. All of the Settings can be overwritten in the Chapter / Hint specific loadingscreens as well.
    UFUNCTION( BlueprintCallable )
    bool SetupGeneralLoadingScreen( FALoadingScreenSettings_Overwrite& _LoadingScreenSettings )
    {
        // This is HARDCODED in SOURCE to not wait for any Manual Stop and end Automatically when loading finishes
        //_LoadingScreenSettings.ScreenSettings.bAutoCompleteWhenLoadingCompletes = true;
        //_LoadingScreenSettings.ScreenSettings.bWaitForManualStop = false;

		_LoadingScreenSettings.ScreenSettings.Layout = EAsyncLoadingScreenLayout::ALSL_Letterbox;
		_LoadingScreenSettings.ScreenSettings.bUseRenderedFrameAsBackground = true;

        _LoadingScreenSettings.Letterbox.BottomBorderBackground.TintColor = FLinearColor::Transparent;
        _LoadingScreenSettings.Letterbox.BottomBorderBackground.TintColor.SpecifiedColor.A = 0.f;
        _LoadingScreenSettings.Letterbox.TopBorderBackground.TintColor = FLinearColor::Transparent;
        _LoadingScreenSettings.Letterbox.TopBorderBackground.TintColor.SpecifiedColor.A = 0.f;

        _LoadingScreenSettings.Letterbox.VerticalLoadingWidgetPosition = EVerticalAlignment::VAlign_Bottom;
        _LoadingScreenSettings.Letterbox.LoadingWidgetAlignment.HorizontalAlignment = EHorizontalAlignment::HAlign_Right;
        
        // This Padding MIGHT need to be adjusted depending on the lenght of the tooltip text. Theoretically it would be possible to calculate the padding based on the text length.
	    _LoadingScreenSettings.Letterbox.LoadingWidgetPositionPadding = FMargin(0.0f, 0.0f, 50.0f, 0.0f);

        // Loading Throbber
        FSlateBrush MyBrush = _LoadingScreenSettings.ScreenSettings.LoadingWidget.ThrobberSettings.Image;
        SetupThrobberImage(  _LoadingScreenSettings, MyBrush, AutosaveIcon.ToString(), FVector2D( 128, 128 ) );
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.ThrobberSettings.Image = MyBrush;

        // Setup of the Loading Text 
        FText MyLoadingText = "UI_Loadingscreen_Loading";
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.LoadingText = MyLoadingText;
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.Appearance.Font.FontObject = FontLoadingText.Get();
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.Appearance.Font.Size = 14;
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.Appearance.Font.TypefaceFontName = n"Default";
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.Appearance.ColorAndOpacity= FLinearColor::Yellow;
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.Appearance.ColorAndOpacity.SpecifiedColor.R = ( 255.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.Appearance.ColorAndOpacity.SpecifiedColor.G = ( 214.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.Appearance.ColorAndOpacity.SpecifiedColor.B = ( 189.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.LoadingIconAlignment.VerticalAlignment = EVerticalAlignment::VAlign_Center;
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.TextAlignment.VerticalAlignment = EVerticalAlignment::VAlign_Center;

        return true;
    }

    UFUNCTION( BlueprintOverride )
    bool SetupLoadingscreenSettings( FALoadingScreenSettings_Overwrite& _LoadingScreenSettings )
    {
        // The first block is a general setup and should be independend of the Gamestate itself, it could stay as is for all of the Screens I suspect.
        SetupGeneralLoadingScreen( _LoadingScreenSettings );

        return true;
    }
}