UCLASS()
class UAIAgentConfig_Human_OC_ORG_Mordrag_826 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_ORG_Mordrag_826::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_ORG_Mordrag_826_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_67);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_MORDRAG");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_MORDRAG");
}

UCLASS()
class UDailyRoutine_OC_ORG_Mordrag_826_Start : UDailyRoutine_OC_ORG_Mordrag_826_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(8, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_05",200);
    default Schedule(22, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_63",500);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(10, 0, UAIState_RainShelter_Guard(), Location::Home,500);
}


UCLASS()
class UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated: UAIState_DailyRoutine_Human
{
    default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_NewCamp);

    default Schedule(10, 0, UAIState_SitAround(), n"IO_NC_CHAIR_12");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_ORG_Mordrag_826_Guide : UAIState_DailyRoutine_Human
{
    default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_NewCamp);

    default Schedule(7, 0, UAIState_OC_ORG_Mordrag_826_Guide(), Location::Anywhere);
    default Schedule(20, 0, UAIState_OC_ORG_Mordrag_826_Guide_Night(), Location::Anywhere);

}

UCLASS()
class UAIState_OC_ORG_Mordrag_826_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 50.f;
    default WaitAtPlaceAction = UAIState_StandAround::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_OC_ORG_Mordrag_826_Guide::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_start",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_2",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_1",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_2",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_3",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_4",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_5",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_6",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_7",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_8",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_9",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_10",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_11",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_12",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_13",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_14",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_15",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_16",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_17",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_end",EWalkSpeed::Running));
}

UCLASS()
class UAIState_OC_ORG_Mordrag_826_Guide_Night : UAIState_OC_ORG_Mordrag_826_Guide
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
}

UCLASS()
class UDailyRoutine_OC_ORG_Mordrag_826_GuideWait : UAIState_DailyRoutine_Human
{
    default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_NewCamp);

    default Schedule(0, 0, UAIState_Smoke(), n"FP_NC_MORDRAGWAIT");
}
