UCLASS()
class UAIAgentConfig_Human_SC_TPL_GorNaDrak_1439: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_GorNaDrak_1439::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_GorNaDrak_1439_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_02");
    default Schedule(9, 0, UAIState_GuideToSwampCamp_GorNaDrak_Templar23(), n"FP_SC_SMALLTALK_09");
    default Schedule(16, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_09");
    default Schedule(19, 0, UAIState_GuideToOldMine_GorNaDrak_Templar23(), n"FP_OM_SMALLTALK_02");    
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::Never;
    default ScheduleTimeOffsetMinutesMax = 0;
    default ScheduleTimeOffsetMinutesMin = 0;
}

UCLASS()
class UDailyRoutine_SC_TPL_GorNaDrak_1439_Rest: UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_02");
}

UCLASS()
class UDailyRoutine_SC_TPL_GorNaDrak_1439_FMTaken : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_09");
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_02");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::Never;
}

UCLASS()
class UDailyRoutine_SC_TPL_GorNaDrak_1439_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_SC_GUARD_49");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_TPL_GorNaDrak_1439_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(2, 0, UAISTate_GorNaDrak_Watch_Patrolling_Route_KalomsCamp(), n"BreadcrumbActor_OG_KalomsRoute_Start");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}



UCLASS()
class UAIState_GuideToSwampCamp_GorNaDrak_Templar23 : UAIState_MoveTogether
{
    default GuideName = n"SC_TPL_GorNaDrak_1439";
    default FollowerName = n"SC_TPL_Templar23_1440";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_start", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_01", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_02", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_03", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_04", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_05", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_06", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_07", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_08", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_09", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_10", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_11", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_12", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_13", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_14", EWalkSpeed::Walking));
}

class UAIState_GuideToOldMine_GorNaDrak_Templar23 : UAIState_MoveTogether
{
    default GuideName = n"SC_TPL_GorNaDrak_1439";
    default FollowerName = n"SC_TPL_Templar23_1440";

    default GuideWaitForFollowerDistance = 200.f;
    default FollowerSprintWhenFurtherAwayThan = 400.f;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_14", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_13", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_12", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_11", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_10", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_09", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_08", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_07", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_06", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_05", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_04", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_03", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_02", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_01", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_start", EWalkSpeed::Walking));
}




