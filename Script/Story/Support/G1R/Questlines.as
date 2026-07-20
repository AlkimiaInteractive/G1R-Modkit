#ifdef WITH_STORY_G1R

class UQuestline_G1R_OldCamp : UQuestline
{
    default m_FilterTag = GameplayTag::UI_Filter_Quest_OldCamp;
    default m_DisplayName = LocText("Text_FilterOldCamp");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_OldCamp.T_Icon_OldCamp");
    default m_SortOrder = 1;
}

class UQuestline_G1R_NewCamp : UQuestline
{
    default m_FilterTag = GameplayTag::UI_Filter_Quest_NewCamp;
    default m_DisplayName = LocText("Text_FilterNewCamp");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_NewCamp.T_Icon_NewCamp");
    default m_SortOrder = 2;
}

class UQuestline_G1R_SwampCamp : UQuestline
{
    default m_FilterTag = GameplayTag::UI_Filter_Quest_SwampCamp;
    default m_DisplayName = LocText("Text_FilterSwampCamp");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_SwampCamp.T_Icon_SwampCamp");
    default m_SortOrder = 3;
}

#endif /** Keep this at the bottom */
