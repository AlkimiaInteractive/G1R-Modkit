UCLASS()
class UAIAgentConfig_Human_SC_NOV_Talas_1300 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Talas_1300::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Talas_1300_Start : UAIState_DailyRoutine_Human
{
    default Schedule(24, 0, UAIState_Smoke(), n"FP_SC_SMOKE_01");
}

UCLASS()
class UDailyRoutine_SC_NOV_Talas_1300_OldCampWait : UAIState_DailyRoutine_Human
{
    default Schedule(24, 0, UAIState_Wait(), n"FP_OC_TALAS_WAIT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_SC_NOV_Talas_1300_GuideGobbocave : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_SC_NOV_Talas_1300_GuideGobbocave(), Location::Anywhere);
    default Schedule(20, 0, UAIState_SC_NOV_Talas_1300_GuideGobbocave_Night(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_SC_NOV_Talas_1300_StayGobbo : UAIState_DailyRoutine_Human
{
    default Schedule(7, 45, UAIState_Stay(), n"FP_OW_29_TALAS");
}


UCLASS()
class UDailyRoutine_SC_NOV_Talas_1300_Returntocamp : UAIState_DailyRoutine_Human
{
    default Schedule(7, 45, UAIState_SC_NOV_Talas_1300_ReturnToCamp(), Location::Anywhere);
    default Schedule(20, 0, UAIState_SC_NOV_Talas_1300_ReturnToCamp_Night(), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_SC_NOV_Talas_1300_Backincamp : UAIState_DailyRoutine_Human
{
    default Schedule(24, 0, UAIState_Smoke(), n"FP_SC_SMOKE_01");

    default ScheduleIfRaining(24, 0, UAIState_Smoke(), n"FP_SC_SMOKE_08");
}


UCLASS()
class UDailyRoutine_SC_NOV_Talas_1300_GuideOrcCemetery : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_SC_NOV_Talas_1300_GuideOrcCemetery(), Location::Anywhere);
    default Schedule(20, 0, UUAIState_SC_NOV_Talas_1300_GuideOrcCemetery_Night(), Location::Anywhere);

}

UCLASS()
class UDailyRoutine_SC_NOV_Talas_1300_WaitOrcCemeteryGuide : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"FP_OG_GUIDEWAIT_TALAS");
}

UCLASS()
class UAIState_SC_NOV_Talas_1300_GuideGobbocave : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 450.f;
    default WaitAtPlaceAction = UAIState_Smoke::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_SC_NOV_Talas_1300_StayGobbo::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_GobboCave_start", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_GobboCave_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_GobboCave_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_GobboCave_4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_GobboCave_5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_GobboCave_6", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_6", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_GobboCave_7", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_OW_29_TALAS", EWalkSpeed::Running));
}

UCLASS()
class UAIState_SC_NOV_Talas_1300_GuideGobbocave_Night : UAIState_SC_NOV_Talas_1300_GuideGobbocave
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
}

UCLASS()
class UAIState_SC_NOV_Talas_1300_ReturnToCamp : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 120.f;
    default WaitAtPlaceAction = UAIState_StandAround::StaticClass();
    default bReturnToPathStart = true;
    default RoutineToReturnTo = UDailyRoutine_SC_NOV_Talas_1300_Start::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_OW_29_TALAS", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_7", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_8", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_9", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_10", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_11", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_12", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_13", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_14", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_end", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_GobboCave_SwampCamp", EWalkSpeed::Running));
}

UCLASS()
class UAIState_SC_NOV_Talas_1300_ReturnToCamp_Night : UAIState_SC_NOV_Talas_1300_ReturnToCamp
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
}

UCLASS()
class UAIState_SC_NOV_Talas_1300_GuideOrcCemetery : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 190.f;
    default WaitAtPlaceAction = UAIState_Smoke::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_SC_NOV_Talas_1300_WaitOrcCemeteryGuide::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_end", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_15", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_14", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_13", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_12", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_11", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_OrcCemetery_0", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_OrcCemetery_1", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_8", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_OrcCemetery_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_OrcCemetery_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_SwampCampTo_OrcCemetery_end", EWalkSpeed::Running));
}

UCLASS()
class UUAIState_SC_NOV_Talas_1300_GuideOrcCemetery_Night : UAIState_SC_NOV_Talas_1300_GuideOrcCemetery
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
}