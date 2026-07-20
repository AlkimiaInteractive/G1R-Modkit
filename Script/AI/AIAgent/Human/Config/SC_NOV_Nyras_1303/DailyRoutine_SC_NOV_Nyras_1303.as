UCLASS()
class UAIAgentConfig_Human_SC_NOV_Nyras_1303 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Nyras_1303::StaticClass();
}


UCLASS()
class UDailyRoutine_SC_NOV_Nyras_1303_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Nyras);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NYRAS");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NYRAS");
}


UCLASS()
class UDailyRoutine_SC_NOV_Nyras_1303_Start : UDailyRoutine_SC_NOV_Nyras_1303_Ownership
{
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_BENCH_17");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_23");
    default Schedule(12, 56, UAIState_Eat(), n"IO_SC_BENCH_17");
    default Schedule(13, 56, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_23");
    default Schedule(21, 30, UAIState_Eat(), n"IO_SC_BENCH_17");
    default Schedule(22, 30, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_23");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_NOV_Nyras_1303_Wait: UDailyRoutine_SC_NOV_Nyras_1303_Ownership
{
    default Schedule(7, 0, UAIState_Stand(), n"FP_SC_NYRAS_WAIT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Nyras_1303_Prepareritual : UDailyRoutine_SC_NOV_Nyras_1303_Ownership
{
    default Schedule(7, 0, UAIState_NyrasGoToFocus(n"FP_NYRAS_FOCUS"), NAME_None,200);
}

UCLASS()
class UDailyRoutine_SC_NOV_Nyras_1303_AfterCinematic : UDailyRoutine_SC_NOV_Nyras_1303_Ownership
{
    default Schedule(7, 0, UAIState_StandAround(), n"FP_NYRAS_FOCUS_AFTERCINEMATIC",200);
}


UCLASS()
class UDailyRoutine_SC_NOV_Nyras_1303_Guide : UDailyRoutine_SC_NOV_Nyras_1303_Ownership
{
    default Schedule(7, 0, UAIState_OC_NOV_Nyras_Guide(), NAME_None);
}

UCLASS()
class UDailyRoutine_SC_NOV_Nyras_1303_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OG_SMALLTALK_01");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OG_GROUND_01", 100);
    default Schedule(16, 0, UAIState_Smoke_Seated(), n"IO_OG_CHAIR_BENCH_02");
    default Schedule(20, 0, UAIState_Eat_Seated(), n"FP_OG_GROUND_01", 100);
    default Schedule(23, 0, UAIState_Smoke_Ground(), n"IO_OG_WATERPIPE_01");

    default ScheduleIfRaining(12, 0, UAIState_Meditate(), n"FP_OG_RAINSHELTER_03",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Nyras_1303_CampDivided_Ambient : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_StandAround(), n"FP_OG_STAND_01");

    default ScheduleIfRaining(12, 0, UAIState_StandAround(), n"FP_OG_STAND_01",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UAIState_NyrasGoToFocus : UGothicCharacterSimulateableAIState 
{
    UAIState_NyrasGoToFocus(FName InWaitPosition)
    {
        WaitPosition = InWaitPosition;
    }

    UPROPERTY()
    FName WaitPosition;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        SetWalkSpeed(EWalkSpeed::Running);

        while(!bShouldExitState)
        {
            AI.TryUseFreepointAt(GameplayTag::Action_Ambient_StandAround,WaitPosition,TimeLimitSeconds=60.0f);
            WaitSeconds(1.0f);
        }
    }
}

UCLASS()
class UAIState_OC_NOV_Nyras_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 300.f;
    default WaitAtPlaceAction = UAIState_StandAround::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_SC_NOV_Nyras_1303_Prepareritual::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Running;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_end", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_15", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_14", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_13", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_11", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_12", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_11", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"SwampCamp_To_OldMine_10", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_10", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_9", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone6", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone7", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone8", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone9", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone10", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone11", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone12", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Nyras_To_Focus_Stone13", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_NYRAS_FOCUS", EWalkSpeed::Running));

}