UCLASS()
class UAIAgentConfig_Human_OC_WOC_Velaya_108 : UAIAgentConfig_Human_Woman
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_WOC_Velaya_108::StaticClass();
    
}

UCLASS()
class UDailyRoutine_OC_WOC_Velaya_108_Ownership : UAIState_DailyRoutine_Human
{
}

UCLASS()
class UDailyRoutine_OC_WOC_Velaya_108_Ownership_Swamp : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_YBERION");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_YBERION");
}


UCLASS()
class UDailyRoutine_OC_WOC_Velaya_108_Start : UDailyRoutine_OC_WOC_Velaya_108_Ownership
{
    default Schedule(1, 0, UAIState_BrushHair(), n"IO_OC_CHAIR_138",150);
    default Schedule(9, 0, UAIState_HoldTray(), n"FP_OC_VELAYA_HOLDTRAY",300);
    default Schedule(9, 30, UAIState_Smoke_Ground(), n"IO_OC_GOMEZ_PIPE",150);
    default Schedule(10, 30, UAIState_HoldTray(), n"FP_OC_VELAYA_HOLDTRAY",300);
    default Schedule(11, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_06",500);
    default Schedule(14, 0, UAIState_HoldTray(), n"FP_OC_VELAYA_HOLDTRAY",300);
    default Schedule(15, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_06",500);
    default Schedule(18, 0, UAIState_Bath(), n"IO_OC_GOMEZ_BATH",500);
    default Schedule(21, 30, UAIState_HoldTray(), n"FP_OC_VELAYA_HOLDTRAY",300);
}

UCLASS()
class UDailyRoutine_OC_WOC_Velaya_108_Saved : UDailyRoutine_OC_WOC_Velaya_108_Ownership
{
    default Schedule(1, 0, UAIState_BrushHair(), n"IO_OC_CHAIR_138",150);
    default Schedule(9, 30, UAIState_Smoke_Ground(), n"IO_OC_GOMEZ_PIPE",150);
    default Schedule(18, 0, UAIState_Bath(), n"IO_OC_GOMEZ_BATH",500);
}

UCLASS()
class UDailyRoutine_OC_WOC_Velaya_108_Finale : UDailyRoutine_OC_WOC_Velaya_108_Ownership
{
    default Schedule(9, 0, UAIState_Stay(), n"FP_OC_SPEAK_GOMEZ_ROOM",200);

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}

UCLASS()
class UDailyRoutine_OC_WOC_Velaya_108_SwampCamp : UDailyRoutine_OC_WOC_Velaya_108_Ownership_Swamp
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(30);
    default AutoSwitchToRoutine = UDailyRoutine_OC_WOC_Velaya_108_Rest;

    default Schedule(8, 0, UAIState_RunToReadBook(),n"IO_SC_CHAIR_1");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

    default RolesWhileAssigned.AddTag(GameplayTag::State_Perceptions_Ignore_NPCs); 
}

UCLASS()
class UDailyRoutine_OC_WOC_Velaya_108_Rest : UDailyRoutine_OC_WOC_Velaya_108_Ownership_Swamp
{
    default Schedule(6, 0, UAIState_Eat(),n"IO_SC_CHAIR_1");
    default Schedule(8, 30, UAIState_ReadBook(),n"IO_SC_CHAIR_1");
    default Schedule(12, 30, UAIState_Eat(),n"IO_SC_CHAIR_1");
    default Schedule(13, 30, UAIState_BrushHair(),n"IO_SC_CHAIR_1");
    default Schedule(23, 30, UAIState_Sleep(),Location::Bed);
}