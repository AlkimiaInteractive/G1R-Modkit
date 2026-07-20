//////////////////////////////////////////////////////////////////////////////
// Intro Loading Screen
//////////////////////////////////////////////////////////////////////////////
// We are using the loading screen system to play the game intro video for a more immersive transition
// from the main menu into the game while loading the content during video playback

UCLASS()
class ULoadingScreen_Intro : ULoadingScreenBase
{
    UPROPERTY() TSoftObjectPtr<UFont> FontHoldToSkip = TSoftObjectPtr<UFont>( n"/Script/Engine.Font'/Game/UI/Fonts/NotoSerif-Regular_Font.NotoSerif-Regular_Font'" );
    default ScreenType = ELoadingScreenType::GameIntro;
	
    // Method used to setup the Loading Screen Chapter specific data
    bool SetupLoadingscreenSettings( FALoadingScreenSettings_Overwrite& _LoadingScreenSettings ) override
    {
		Super::SetupLoadingscreenSettings( _LoadingScreenSettings );
		
		// Make sure the letterbox layout is enabled, without an extra horizontal bar
		_LoadingScreenSettings.ScreenSettings.Layout = EAsyncLoadingScreenLayout::ALSL_Letterbox;
		
		// The loading screen should stay until the video has finished
        _LoadingScreenSettings.ScreenSettings.MinimumLoadingScreenDisplayTime = -1;
        _LoadingScreenSettings.ScreenSettings.bAutoCompleteWhenLoadingCompletes = false;
        _LoadingScreenSettings.ScreenSettings.bWaitForManualStop = false;
		
		// The user may skip the video. This will only work, if the loading has finished
		_LoadingScreenSettings.ScreenSettings.bMoviesAreSkippable = true;
		
		// The widget overlay must be enabled, in case we want to show a text when loading is complete or the loading widget
		_LoadingScreenSettings.ScreenSettings.bShowWidgetOverlay = true;
		
		// We could use the loading complete text field to show a hint to skip the intro video. Enable if desired
        _LoadingScreenSettings.ScreenSettings.bShowLoadingCompleteText = false;
        FText MyLoadingCompleteText = "UI_Loadingscreen_IntroSkip";
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.LoadingCompleteText = MyLoadingCompleteText;
		
		// No loading widget during the game intro
		_LoadingScreenSettings.ScreenSettings.bShowLoadingWidget = false;

		// The tip text field will be used to display the movie subtitles + make sure no tip texts from other loading screens are used
		_LoadingScreenSettings.ScreenSettings.TipWidget.bSupportsSubtitles = true;
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipTextHeadLine.Reset();
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Reset();

		// Subtitles color and outline
		_LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.ColorAndOpacity = FColor::FromHex("f7d3c3");
		_LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.Font.OutlineSettings.OutlineColor = FLinearColor::Black;
		_LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.Font.OutlineSettings.OutlineSize = 2;

        _LoadingScreenSettings.ScreenSettings.Background.Images.Reset();
		
		// Add our intro video to the list
		_LoadingScreenSettings.ScreenSettings.PlaybackType = EMoviePlaybackType::MT_Normal;
		_LoadingScreenSettings.ScreenSettings.MoviePaths.Reset();
        _LoadingScreenSettings.ScreenSettings.MoviePaths.Add( "G1R_Intro" );
		// BFG_SKlingel: Override the sync interval for the intro movie to band-aid fix some stuttering issue.
        _LoadingScreenSettings.ScreenSettings.OverrideSyncIntervalForMovies = 1;
		// BFG_SKlingel: Set up hold-to-skip
		_LoadingScreenSettings.ScreenSettings.SkipKeys.Add(EKeys::SpaceBar);
		_LoadingScreenSettings.ScreenSettings.SkipKeys.Add(EKeys::Escape);
		_LoadingScreenSettings.ScreenSettings.SkipKeys.Add(EKeys::LeftMouseButton);
		_LoadingScreenSettings.ScreenSettings.SkipKeys.Add(EKeys::Gamepad_FaceButton_Bottom);
		_LoadingScreenSettings.ScreenSettings.SkipKeys.Add(EKeys::Gamepad_FaceButton_Right);
		_LoadingScreenSettings.ScreenSettings.HoldToSkipDuration = 1.0;
		_LoadingScreenSettings.ScreenSettings.HoldToSkipProgressMaterial = TSoftObjectPtr<UMaterial>(n"/Script/Engine.Material'/Game/UI/Materials/M_InputHint.M_InputHint'");
		_LoadingScreenSettings.ScreenSettings.HoldToSkipProgressMaterialParameter = n"FillPercentage";
		_LoadingScreenSettings.ScreenSettings.HoldToSkipSize = FVector2f( 32.0f, 32.0f );
		_LoadingScreenSettings.ScreenSettings.HoldToSkipText = "UI_Loadingscreen_IntroSkip";
        _LoadingScreenSettings.ScreenSettings.HoldToSkipTextAppearance.Font.FontObject = FontHoldToSkip.Get();
		_LoadingScreenSettings.ScreenSettings.HoldToSkipTextAppearance.ColorAndOpacity = FColor::FromHex("f7d3c3");
        _LoadingScreenSettings.ScreenSettings.HoldToSkipTextAppearance.Font.TypefaceFontName = n"Default";
        _LoadingScreenSettings.ScreenSettings.HoldToSkipTextAppearance.Font.Size = 16;
		_LoadingScreenSettings.ScreenSettings.HoldToSkipTextAppearance.Font.OutlineSettings.OutlineColor = FLinearColor::Black;
		_LoadingScreenSettings.ScreenSettings.HoldToSkipTextAppearance.Font.OutlineSettings.OutlineSize = 1;
		
		ULoadingScreenHelperSubsystem LoadingScreenHelper = ULoadingScreenHelperSubsystem::Get();
		
		// The game intro should be played for new games only, so make sure to enable the default loading screen in all other cases
        if (IsValid(LoadingScreenHelper))
		{
			LoadingScreenHelper.SetCurrentLoadingScreenType(ELoadingScreenType::Default);
		}

        return true;
    }
}
