// Copyright by THQ Nordic & Alkimia Interactive

// These are the base classes for HUD notification widgets.
// m_Importance affects in which notification area the notification will be shown (the functionality evolved so the name might be misleading now)
// m_Group defines which thematic group the notification belongs to. These groups are used in the settings to change the duration for the notifications.
// m_AllowedDuringConversations and m_AllowedDuringLooting denote whether the notification is allowed to be shown during conversations or looting and are true unless set to false.
// (some notifications would be distracting during dialogs, while others would overlap with the loot UI)

// Base class for notifications shown in the top left of the HUD
UCLASS()
class UHUDNotificationWidget_LowestImportance : UHUDNotificationWidgetBase
{
    default m_Importance = EHUDNotificationImportance::Lowest;
};
// Base class for notifications shown in the center right of the HUD
UCLASS()
class UHUDNotificationWidget_LowImportance : UHUDNotificationWidgetBase
{
    default m_Importance = EHUDNotificationImportance::Low;
    default m_AllowedDuringLooting = false;
};
// Base class for notifications shown in the top right of the HUD
UCLASS()
class UHUDNotificationWidget_MediumImportance : UHUDNotificationWidgetBase
{
    default m_Importance = EHUDNotificationImportance::Medium;
};
// Base class for notifications shown in the top center of the HUD
UCLASS()
class UHUDNotificationWidget_HighImportance : UHUDNotificationWidgetBase
{
    default m_Importance = EHUDNotificationImportance::High;
};
// Base class for notifications shown on the right side of the HUD
UCLASS()
class UHUDNotificationWidget_HighestImportance : UHUDNotificationWidgetBase
{
    default m_Importance = EHUDNotificationImportance::Highest;
};



class UHUDNotificationWidget_SaveGame : UHUDNotificationWidget_LowestImportance
{
};
// Base class for gameplay attribute notifications shown on the right side of the HUD
UCLASS()
class UHUDNotificationWidget_GameplayAttributeAS : UHUDNotificationWidget_GameplayAttribute
{
    default m_Importance = EHUDNotificationImportance::Low;
    default m_Group = EHUDNotificationGroup::Character;
};
UCLASS()
class UHUDNotificationWidget_Glossary : UHUDNotificationWidget_LowImportance
{
    default m_Group = EHUDNotificationGroup::Quest;
    default m_AllowedDuringConversations = false;
};
UCLASS()
class UHUDNotificationWidget_Item : UHUDNotificationWidget_LowImportance
{
    default m_Group = EHUDNotificationGroup::Inventory;
};
UCLASS()
class UHUDNotificationWidget_Key : UHUDNotificationWidget_LowImportance
{
    default m_Group = EHUDNotificationGroup::Inventory;
    default m_AllowedDuringConversations = false;
};
UCLASS()
class UHUDNotificationWidget_LevelUpStats : UHUDNotificationWidget_GameplayAttributeAS
{
    default m_Group = EHUDNotificationGroup::Character;
};
UCLASS()
class UHUDNotificationWidget_Objective : UHUDNotificationWidget_LowImportance
{
    default m_Group = EHUDNotificationGroup::Quest;
};
UCLASS()
class UHUDNotificationWidget_Recipe : UHUDNotificationWidget_LowImportance
{
    default m_Group = EHUDNotificationGroup::Inventory;
};
UCLASS()
class UHUDNotificationWidget_Skill : UHUDNotificationWidget_LowImportance
{
    default m_Group = EHUDNotificationGroup::Character;
};

UCLASS()
class UHUDNotificationWidget_Area : UHUDNotificationWidget_MediumImportance
{
    default m_Group = EHUDNotificationGroup::Quest;
};
UCLASS()
class UHUDNotificationWidget_Quest : UHUDNotificationWidget_MediumImportance
{
    default m_Group = EHUDNotificationGroup::Quest;
};

UCLASS()
class UHUDNotificationWidget_LevelUp : UHUDNotificationWidget_HighImportance
{
    default m_Group = EHUDNotificationGroup::Character;
};
UCLASS()
class UHUDNOtificationWidget_NewChapter : UHUDNotificationWidget_HighImportance
{
    // The icons for the different chapters
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "HUD Notification Widget", meta=(DisplayName="Chapter Icons"))
    TMap<int32, TSoftObjectPtr<UTexture2D>> m_ChapterIcons;

    // Set the actual chapter icons
    default m_ChapterIcons.Add(1, TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Notifications/T_ChapterImage_Ch1.T_ChapterImage_Ch1"));
    default m_ChapterIcons.Add(2, TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Notifications/T_ChapterImage_Ch2.T_ChapterImage_Ch2"));
    default m_ChapterIcons.Add(3, TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Notifications/T_ChapterImage_Ch3.T_ChapterImage_Ch3"));
    default m_ChapterIcons.Add(4, TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Notifications/T_ChapterImage_Ch4.T_ChapterImage_Ch4"));
    default m_ChapterIcons.Add(5, TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Notifications/T_ChapterImage_Ch5.T_ChapterImage_Ch5"));
    default m_ChapterIcons.Add(6, TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Notifications/T_ChapterImage_Ch6.T_ChapterImage_Ch6"));

    default m_AllowedDuringConversations = false;
    default m_AllowedDuringLooting = false;
};
