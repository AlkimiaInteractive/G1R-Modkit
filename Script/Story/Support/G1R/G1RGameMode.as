class AG1RMainStoryGameMode : AG1RGameModeCooperative
{
#ifdef WITH_STORY_G1R
    default MainStoryClass = G1R::UStoryG1R;
#endif

    default HUDClass = AGothicHUD;
    default PlayerStateClass = AG1RPlayerState;

    default m_MainPlayerConfig = UPlayerConfig_G1R;
    default m_WorldDefinition = UDefaultWorldDefinition;

    default bUseSeamlessTravel = true;
}