//////////////////////////////////////////////////////////////////////////////
// Sample Loadingscreen Idea
//////////////////////////////////////////////////////////////////////////////


UCLASS()
class ULoadingScreenSetupTest : UAsyncLoadingScreen_Input
{
    UPROPERTY() TSoftObjectPtr<UFont> FontLoadingText = TSoftObjectPtr<UFont>( n"/Script/Engine.Font'/Game/UI/Fonts/NotoSerif-Regular_Font.NotoSerif-Regular_Font'");
    UPROPERTY() TSoftObjectPtr<UFont> FontCompleteText = TSoftObjectPtr<UFont>( n"/Script/Engine.Font'/Game/UI/Fonts/NotoSerif-Regular_Font.NotoSerif-Regular_Font'");
    UPROPERTY() TSoftObjectPtr<UFont> FontHeadline = TSoftObjectPtr<UFont>( n"/Script/Engine.Font'/Game/UI/Fonts/Boucherie-Block_Font.Boucherie-Block_Font'" );
    UPROPERTY() TSoftObjectPtr<UFont> Font = TSoftObjectPtr<UFont>( n"/Script/Engine.Font'/Game/UI/Fonts/NotoSerif-Regular_Font.NotoSerif-Regular_Font'" );
    UPROPERTY() TSoftObjectPtr<UTexture2D> AutosaveIcon = TSoftObjectPtr<UTexture2D>( n"/Script/Engine.Texture2D'/Game/UI/Textures/LoadingScreens/T_AutosaveIcon.T_AutosaveIcon'" );

    UPROPERTY() int NumStoryLoadingScreens = 3;

    // Setup the General Layout. All of the Settings can be overwritten in the Chapter / Hint specific loadingscreens as well.
    UFUNCTION( BlueprintCallable )
    bool SetupGeneralLoadingScreen( FALoadingScreenSettings_Overwrite& _LoadingScreenSettings )
    {
        // Loading Throbber
        FSlateBrush MyBrush = _LoadingScreenSettings.ScreenSettings.LoadingWidget.ThrobberSettings.Image;
        SetupThrobberImage(  _LoadingScreenSettings, MyBrush, AutosaveIcon.ToString(), FVector2D( 128, 128 ) );
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.ThrobberSettings.Image = MyBrush;

        // Setup of the Loading Text 
        FText MyLoadingText = "UI_Loadingscreen_Loading";
        _LoadingScreenSettings.ScreenSettings.bShowLoadingCompleteText = true;
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
        _LoadingScreenSettings.ScreenSettings.LoadingWidget.bHideLoadingWidgetWhenCompletes = true;

        // Setup of the Loading Complete Text ( after finishing the loading )
        FText MyLoadingCompleteText = "UI_Loadingscreen_PressKeytoCtn";
        _LoadingScreenSettings.ScreenSettings.bShowLoadingCompleteText = true;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.LoadingCompleteText = MyLoadingCompleteText;
        
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.Font.FontObject = FontCompleteText.Get();
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.Font.Size = 20;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.Font.TypefaceFontName = n"Default";
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.Font.OutlineSettings.OutlineColor = FLinearColor::Black;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.Font.OutlineSettings.OutlineSize = 2;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.ColorAndOpacity= FLinearColor::White;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.ColorAndOpacity.SpecifiedColor.R = ( 256.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.ColorAndOpacity.SpecifiedColor.G = ( 256.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Appearance.ColorAndOpacity.SpecifiedColor.B = ( 256.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.bFadeInOutAnim = true;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Alignment.VerticalAlignment = EVerticalAlignment::VAlign_Bottom;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Alignment.HorizontalAlignment = EHorizontalAlignment::HAlign_Center;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Padding = FMargin(0.0f, 0.0f, 0.0f, 250.0f);;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Padding = FMargin(0.0f, 0.0f, 0.0f, 200.0f);;
        _LoadingScreenSettings.ScreenSettings.LoadingCompleteTextSettings.Padding = FMargin(0.0f, 0.0f, 0.0f, 250.0f);;
        
        // Setup of the Tip Widget ( Headline + Text )
        // Header of the Text Segement.
        
        _LoadingScreenSettings.ScreenSettings.TipWidget.AppearanceHeadline.Font.FontObject = FontHeadline.Get();
        // Yellow taken as a base color and then we adjust the RGB values 
        _LoadingScreenSettings.ScreenSettings.TipWidget.AppearanceHeadline.ColorAndOpacity = FLinearColor::Yellow;
        _LoadingScreenSettings.ScreenSettings.TipWidget.AppearanceHeadline.ColorAndOpacity.SpecifiedColor.R = ( 255.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.TipWidget.AppearanceHeadline.ColorAndOpacity.SpecifiedColor.G = ( 214.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.TipWidget.AppearanceHeadline.ColorAndOpacity.SpecifiedColor.B = ( 189.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.TipWidget.AppearanceHeadline.Font.TypefaceFontName = n"Default";
        _LoadingScreenSettings.ScreenSettings.TipWidget.AppearanceHeadline.Font.Size = 30;

        // Text Segment setup. Story or Tips.
        
        _LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.Font.FontObject = Font.Get();
        _LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.ColorAndOpacity = FLinearColor::Black;
        _LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.ColorAndOpacity.SpecifiedColor.R = ( 0.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.ColorAndOpacity.SpecifiedColor.G = ( 0.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.ColorAndOpacity.SpecifiedColor.B = ( 0.f / 256.f );
        _LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.Font.TypefaceFontName = n"Default";
        _LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.Font.Size = 18;
        _LoadingScreenSettings.ScreenSettings.TipWidget.Appearance.Justification = ETextJustify::Center;
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipWrapAt = 900;
        _LoadingScreenSettings.ScreenSettings.TipWidget.NumberOfLines = 2;
        //_LoadingScreenSettings.ScreenSettings.TipWidget.Padding = FMargin(0.0f, 0.0f, 0.0f, 320.0f);;
 
 
		// Example for changeing the Layout of the Screen. There are different pre defined Layouts that the Plugin supports. If you need something more custom, that needs to be coded.
        // For this we need to Adjust the different cpp files. But for now I doubt its needed !
        // check up on SLetterboxLayout.h in the plugin folder.
		_LoadingScreenSettings.ScreenSettings.Layout = EAsyncLoadingScreenLayout::ALSL_Letterbox;
        _LoadingScreenSettings.Letterbox.BottomBorderBackground.TintColor = FLinearColor::Black;
        _LoadingScreenSettings.Letterbox.BottomBorderBackground.TintColor.SpecifiedColor.A = 0.f;
        _LoadingScreenSettings.Letterbox.TipAlignment.VerticalAlignment = EVerticalAlignment::VAlign_Bottom;
        _LoadingScreenSettings.Letterbox.TopBorderBackground.TintColor = FLinearColor::Black;
        _LoadingScreenSettings.Letterbox.TopBorderBackground.TintColor.SpecifiedColor.A = 0.f;
        _LoadingScreenSettings.Letterbox.VerticalLoadingWidgetPosition = EVerticalAlignment::VAlign_Bottom;
        _LoadingScreenSettings.Letterbox.VerticalTipWidgetPosition = EVerticalAlignment::VAlign_Center;
        _LoadingScreenSettings.Letterbox.VerticalLoadingWidgetPosition = EVerticalAlignment::VAlign_Bottom;
        _LoadingScreenSettings.Letterbox.VerticalTipWidgetPosition = EVerticalAlignment::VAlign_Center;
        _LoadingScreenSettings.Letterbox.LoadingWidgetAlignment.HorizontalAlignment = EHorizontalAlignment::HAlign_Right;
        // This Padding MIGHT need to be adjusted depending on the lenght of the tooltip text. Theoretically it would be possible to calculate the padding based on the text length.
        _LoadingScreenSettings.Letterbox.TipWidgetPositionPadding = FMargin(0.0f, 850.0f, 0.0f, 0.0f);
	    _LoadingScreenSettings.Letterbox.LoadingWidgetPositionPadding = FMargin(0.0f, 0.0f, 50.0f, 0.0f);

        _LoadingScreenSettings.ScreenSettings.bAllowEngineTick = true;

        
        // Example for a different layout and some setup changes. Base is always the setup of the INI file but it can be adjusted here.
        // I would suggest not to use this one. It's just for testing/example purposes.
        //_LoadingScreenSettings.ScreenSettings.Layout = EAsyncLoadingScreenLayout::ALSL_Classic;
        //_LoadingScreenSettings.Classic.BorderBackground.TintColor = FLinearColor::Black;
        //_LoadingScreenSettings.Classic.BorderBackground.TintColor.SpecifiedColor.A = 0.5f;
        //_LoadingScreenSettings.Classic.TipAlignment.HorizontalAlignment = EHorizontalAlignment::HAlign_Center;
        //_LoadingScreenSettings.Classic.TipAlignment.VerticalAlignment = EVerticalAlignment::VAlign_Top;
        //_LoadingScreenSettings.Classic.bIsLoadingWidgetAtLeft = false;
        //_LoadingScreenSettings.Classic.bIsWidgetAtBottom = true;

        return true;
    }

    // Add all available Chapters classes here. It will go throughte list and use the first which is relevant. We could make this more elaborate and collect ALL that are relevant and choose one at random.
    UFUNCTION( BlueprintCallable )
    void AddGameSpecificLoadingScreenSettings()
    {
        LoadingScreens.Reset();
        
        // List of all loading screens. Ordered in increasing priority. 
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_BlackScreen::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_GeneralHints::StaticClass() ) ) );
		LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_Intro::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_ColonyStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_OldCampStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_NewCampStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_SwampCampStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_OldCampList::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_OldCampGomez::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_NewCampConvoy::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_OldCampJoined::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_NewCampJoined::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_SwampCampJoined::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_SleeperStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_RavenSwamp::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_LaresMole::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_CaineStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_CaineSearch::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_CaineReveal::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_YBerionStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_YBerionQuest::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_YBerionFocus::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_YBerionAlmanach::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_MiltenAlmanach::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_OldMineStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_OldMineNest::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_OldMineQueen::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_GreatPrayer::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_GreatPrayerQuest::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_GreatPrayerLukor::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_GreatPrayerKalomists::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_SaturasStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_SaturasQuest::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_FocusFriends::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_FocusMonastery::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_FocusTroll::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_FocusStonehenge::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_FocusFortress::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_FocusAll::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_FocusSaturas::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_Firemages::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_XardasStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_XardasGatekeeper::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_XardasQuest::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_UlumuluStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_UlumuluTarrok::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_OrcEnclave::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_SleeperTemple::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_UrizielStart::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_UrizielXardas::StaticClass() ) ) );
        LoadingScreens.Add( Cast<ULoadingScreenBase>( NewObject( this, ULoadingScreen_UrizielCharged::StaticClass() ) ) );
    }


    UFUNCTION( BlueprintOverride )
    bool SetupLoadingscreenSettings( FALoadingScreenSettings_Overwrite& _LoadingScreenSettings )
    {
        // The first block is a general setup and should be independend of the Gamestate itself, it could stay as is for all of the Screens I suspect.
        SetupGeneralLoadingScreen( _LoadingScreenSettings );

        // Add all the Chapters
        AddGameSpecificLoadingScreenSettings();
        
        // How many loading screens and what types?
        ULoadingScreenHelperSubsystem LoadingScreenHelper = ULoadingScreenHelperSubsystem::Get();
        ELoadingScreenType CurrentScreenType = IsValid( LoadingScreenHelper ) ? LoadingScreenHelper.GetCurrentLoadingScreenType() : ELoadingScreenType::Default;

        int DesiredScreens = CurrentScreenType == ELoadingScreenType::StoryRecap ? NumStoryLoadingScreens : 1;

        // Select the most relevant screens
        TArray<ULoadingScreenBase> SelectedScreens;


        int Index = LoadingScreens.Num()-1;

        while( SelectedScreens.Num() < DesiredScreens && Index >= 0 )
        {
            auto Screen = LoadingScreens[Index];
            
            if( Screen.IsRelevant() )
            {
                SelectedScreens.Insert(Screen, 0);
            }

            Index --;
        }
       
        // ensure there is at least one selected screen, index 0 (hints) is used as fallback
        if( SelectedScreens.Num() == 0 )
        {
            SelectedScreens.Add( LoadingScreens[ 0 ] );
        }

        // setip all screens
        for( auto Screen : SelectedScreens )
        {
            Screen.SetupLoadingscreenSettings ( _LoadingScreenSettings );
        }

        // DISABLE WAITING FOR NOW
        //_LoadingScreenSettings.ScreenSettings.bAutoCompleteWhenLoadingCompletes = true;
        //_LoadingScreenSettings.ScreenSettings.bWaitForManualStop = false;


        // Example for setting up movie clips :) For in case you want to have a movie clip in the loading screen. Can be done in the chapter specific settings as well.
        // These are pointers to the Moviefolder - you just need the name of the movie file without the extension. If the Bink plugin is enabled, then BINK will be supported as well.
        //_LoadingScreenSettings.ScreenSettings.MoviePaths.Reset();
        //_LoadingScreenSettings.ScreenSettings.MoviePaths.Add( "THQNORDIC_LOGO_Color_white" );
        //_LoadingScreenSettings.ScreenSettings.MoviePaths.Add( "temp1" );
		//_LoadingScreenSettings.ScreenSettings.MoviePaths.Add( "temp2" );

        return true;
    }

    // Holds all loading screens we can select from
    UPROPERTY()
    TArray< ULoadingScreenBase > LoadingScreens;

}