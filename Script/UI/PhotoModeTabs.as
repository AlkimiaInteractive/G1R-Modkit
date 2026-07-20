// Copyright by THQ Nordic & Alkimia Interactive
class UPhotoModeTab_Camera : UPhotoModeCategory
{
    default m_FilterTag = GameplayTag::UI_PhotoMode_Tab_Camera;
    default m_DisplayName = LocText("UI_PhotoMode_Tab_Camera");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Camera.T_Icon_Camera");
    default m_SortOrder = 1;
}

class UPhotoModeTab_Effects : UPhotoModeCategory
{
    default m_FilterTag = GameplayTag::UI_PhotoMode_Tab_Effects;
    default m_DisplayName = LocText("UI_PhotoMode_Tab_Effects");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Effects.T_Icon_Effects");
    default m_SortOrder = 2;
}

class UPhotoModeTab_Color : UPhotoModeCategory
{
    default m_FilterTag = GameplayTag::UI_PhotoMode_Tab_Color;
    default m_DisplayName = LocText("UI_PhotoMode_Tab_Color");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Color.T_Icon_Color");
    default m_SortOrder = 3;
}

class UPhotoModeTab_Light : UPhotoModeCategory
{
    default m_FilterTag = GameplayTag::UI_PhotoMode_Tab_Light;
    default m_DisplayName = LocText("UI_PhotoMode_Tab_Light");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Light.T_Icon_Light");
    default m_SortOrder = 4;
}

class UPhotoModeTab_Weather : UPhotoModeCategory
{
    default m_FilterTag = GameplayTag::UI_PhotoMode_Tab_Weather;
    default m_DisplayName = LocText("UI_PhotoMode_Tab_Weather");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Weather.T_Icon_Weather");
    default m_SortOrder = 5;
}

class UPhotoModeTab_Character : UPhotoModeCategory
{
    default m_FilterTag = GameplayTag::UI_PhotoMode_Tab_Character;
    default m_DisplayName = LocText("UI_PhotoMode_Tab_Character");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Character.T_Icon_Character");
    default m_SortOrder = 6;
}

class UPhotoModeTab_Frame : UPhotoModeCategory
{
    default m_FilterTag = GameplayTag::UI_PhotoMode_Tab_Frame;
    default m_DisplayName = LocText("UI_PhotoMode_Tab_Frame");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Frame.T_Icon_Frame");
    default m_SortOrder = 7;
}
