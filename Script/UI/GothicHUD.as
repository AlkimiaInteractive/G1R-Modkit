UCLASS()
class AGothicHUD: AGothicHUDBase
{   
    default m_HUDConfiguration.AddBlueprintPath(UHUDBorderWarningController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/Player/Control/WB_HUDBorderWarning.WB_HUDBorderWarning_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDDisplayNameGothicFontController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/Crosshair/W_DisplayName_GothicFont.W_DisplayName_GothicFont_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDDisplayInteractController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/Interact/W_ObjectInteraction.W_ObjectInteraction_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDCraftingController::GetBlueprintNameMain(), n"WidgetBlueprint'/Game/UI/Crafting/W_Crafting_Main.W_Crafting_Main_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDCraftingController::GetBlueprintNameProgress(), n"WidgetBlueprint'/Game/UI/Crafting/W_Crafting_InProgress.W_Crafting_InProgress_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDCrosshairController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/Crosshair/BP_CrosshairWidget.BP_CrosshairWidget_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDManagementController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/ManagementUI/W_ManagementUI_Main.W_ManagementUI_Main_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDOpenContainerController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/LootContainers/W_LootContainer_Chest.W_LootContainer_Chest_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDLootController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/LootContainers/W_LootContainer_Corpse.W_LootContainer_Corpse_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDTradingController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/TradingNew/W_Trading_Main.W_Trading_Main_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDSleepUIController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/SleepUI/W_SleepUI_Base.W_SleepUI_Base_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDSimpleTextMessageController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/SimpleTextMessage/W_SimpleTextMessage.W_SimpleTextMessage_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDQuickSlotController::GetCrossbarBlueprintName(), n"WidgetBlueprint'/Game/UI/QuickSlot/W_Crossbar.W_Crossbar_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDQuickSlotController::GetHotbarBlueprintName(), n"WidgetBlueprint'/Game/UI/QuickSlot/W_Hotbar.W_Hotbar_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDQuickSlotController::GetTransformedHotbarBlueprintName(), n"WidgetBlueprint'/Game/UI/QuickSlot/W_Hotbar_Transformed.W_Hotbar_Transformed_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDQuickSlotController::GetWheelBlueprintName(), n"WidgetBlueprint'/Game/UI/QuickSlot/W_QuickWheel_DEPRECATED.W_QuickWheel_DEPRECATED_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDQuickSlotController::GetControlledHotbarBlueprintName(), n"WidgetBlueprint'/Game/UI/QuickSlot/W_Hotbar_Controlled.W_Hotbar_Controlled_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDLockPickUIController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/LockPick/W_LockPickUI.W_LockPickUI_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDNotificationController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/Notifications/W_NotificationMain.W_NotificationMain_C'", 100);
    default m_HUDConfiguration.AddBlueprintPath(UHUDAnimatedBookUIController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/AnimatedBook/W_AnimatedBookUI.W_AnimatedBookUI_C'");
    default m_HUDConfiguration.AddBlueprintPath("WritingWidget", n"WidgetBlueprint'/Game/UI/AnimatedBook/W_WritingUI.W_WritingUI_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDArmorCustomizationController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/ArmorCustomization/W_ArmorCustomization_Main.W_ArmorCustomization_Main_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDCinematicController::GetBlueprintNameCinematicMain(), n"WidgetBlueprint'/Game/UI/Conversation/W_CinematicMain.W_CinematicMain_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDCinematicController::GetBlueprintNameCinematicTop(), n"WidgetBlueprint'/Game/UI/Conversation/W_CinematicTop.W_CinematicTop_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDMapController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/ManagementUI/Map/W_Map_Main.W_Map_Main_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDAmmoLeftController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/Player/W_AmmoLeftWidget.W_AmmoLeftWidget_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDDisplayHealthBarController::GetCombatTargetMarkerBlueprintName(), n"WidgetBlueprint'/Game/UI/Crosshair/W_CombatTargetMarker.W_CombatTargetMarker_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDDisplayBossHealthBarController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/Crosshair/W_HUDBossInformation.W_HUDBossInformation_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDCheatModeController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/Common/W_GenericModalOkCancel.W_GenericModalOkCancel_C'");
    default m_HUDConfiguration.AddBlueprintPath(UHUDPhotoModeController::GetBlueprintName(), n"WidgetBlueprint'/Game/UI/PhotoMode/W_PhotoMode_Main.W_PhotoMode_Main_C'");
}
