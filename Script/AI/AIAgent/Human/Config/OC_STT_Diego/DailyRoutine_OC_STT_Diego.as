UCLASS()
class UAIAgentConfig_Human_OC_STT_Diego : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Diego::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_STT_Diego_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_3);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIEGO");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIEGO");
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_Start : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_EZ_DEMO_Guard");
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_OldCamp : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(3, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_14_DIEGO",300);
    default Schedule(5, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 300); 
    default Schedule(7, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_14_DIEGO",400);
    default Schedule(11, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_33");
    default Schedule(15, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_14_DIEGO",300);
    default Schedule(16, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_33");
    default Schedule(18, 0, UAIState_SitCampfire(), n"IO_OC_CHAIR_30");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 400); 

    default ScheduleIfRaining(3, 0, UAIState_RainShelter_Shadow(), n"IO_OC_CHAIR_BENCH_14_DIEGO",500);
    default ScheduleIfRaining(5, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), n"IO_OC_CHAIR_BENCH_14_DIEGO",500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_Ocwait : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(12, 0, UAIState_Stand(), n"FP_OC_DIEGO_WAIT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_FourFriendsMeeting : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OM_DIEGO_CAMP");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_TalkToIan : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(8, 0, UAIState_SC_NOV_Diego_GuideToIan(),NAME_None);
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_OldCampMarket : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(3, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_12");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_LightHouse : UDailyRoutine_OC_STT_Diego_Ownership
{

    default OverrideAllowBlockingPathWhileStationary = false;
    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_DIEGO_CAMP2");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

}

UCLASS()
class UDailyRoutine_OC_STT_Diego_ShWait : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(23, 0, UAIState_Inspect(), n"FP_ST_DIEGO_FOCUS_START");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_GuideSh : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(23, 00, UAIState_OC_STT_Diego_GuideStonehenge(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_ShGate : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(12, 0, UAIState_Inspect(), n"FP_ST_DIEGO_FOCUS_GATE5", 2000);
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_ShGateWait : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(12, 0, UAIState_Stand(), n"FP_ST_DIEGO_FOCUS_GATE");
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_Waitatfocus : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(12, 0, UAIState_GuidePC(), n"FP_ST_DIEGO_END");
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_Waitatwheel : UAIState_DailyRoutine_Human
{
    //default Schedule(12, 0, UAIState_Stay(), n"FP_ST_DIEGO_FOCUS_START");
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_WaitGuideIan : UDailyRoutine_OC_STT_Diego_Ownership
{
    default Schedule(12, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_6");
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_Follow : UDailyRoutine_OC_STT_Diego_Ownership
{
	default bSimulateRoutineTasksFromStartTime = false;

	default Schedule(23, 0, UAIState_FollowHero(150), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_FollowStoneHenge : UDailyRoutine_OC_STT_Diego_Ownership
{
    default bSimulateRoutineTasksFromStartTime = false;

    default Schedule(23, 0, UAIState_FollowHeroWhenCloseThenChangeRoutine(), Location::Anywhere);
}

UCLASS()
class UAIState_OC_STT_Diego_GuideStonehenge : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_ST_DIEGO_FOCUS_GATE", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_ST_DIEGO_FOCUS_GATE_02", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_ST_DIEGO_FOCUS_GATE", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_OC_STT_Diego_PrepareFocus : UDailyRoutine_OC_STT_Diego_Ownership
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(15);
    default AutoSwitchToRoutine = UDailyRoutine_OC_STT_Diego_ShWait;

    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_DIEGO_CAMP2");
}

UCLASS()
class UAIState_SC_NOV_Diego_GuideToIan : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 15.f;
    default WaitAtPlaceAction = UAIState_StandAround::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_OC_STT_Diego_WaitGuideIan::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_start", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_WaterfallToIan_1", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_WaterfallToIan_2", EWalkSpeed::Running));

}

UCLASS()
class UAIState_GuideHeroToFocusGate : UAIState_OC_STT_Diego_GuideStonehenge 
{
    default RoutineToReturnTo = UDailyRoutine_OC_STT_Diego_ShGate::StaticClass();
}

UCLASS()
class UAIState_FollowHeroWhenCloseThenChangeRoutine : UAIState_FollowWhenCloseThenDoRoutine
{
    default FollowCharacterUniqueName = n"Hero";
    default RoutineToDoAfterLosingTarget = UDailyRoutine_OC_STT_Diego_ShGateWait;
    default DistanceUntilStop = 5000.f;
    default FollowDistance = 150.0f;
    default SprintWhenFurtherAwayThan = 750.f;
    default bCopyWalkSpeed = true;
}