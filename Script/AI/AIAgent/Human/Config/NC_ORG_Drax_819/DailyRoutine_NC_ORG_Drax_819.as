UCLASS()
class UAIAgentConfig_Human_NC_ORG_Drax_819 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Drax_819::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Drax_819_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"Bed_Drax_819");
    default Schedule(7, 30, UAIState_LightFire(), n"FP_OC_LIGHTFIRE_01",400);
    default Schedule(8, 0, UAIState_Eat(), n"IO_CHAIR_EF_DRAX_CAMP",400);
    default Schedule(9, 0, UAIState_Smalltalk(), n"FP_SMALLTALK_A_START_PATH_1_5_2",400);
    default Schedule(11, 0, UAIState_PracticeBow(), n"FP_OC_PRACTICEBOW_01",400);
    default Schedule(15, 0, UAIState_Eat(), n"IO_CHAIR_EF_DRAX_CAMP",400);
    default Schedule(16, 0, UAIState_Smalltalk(), n"FP_SMALLTALK_A_START_PATH_1_5_2",400);
    default Schedule(18, 0, UAIState_CarveWood(), n"IO_CHAIR_EF_DRAX_CAMP",400);
    default Schedule(21, 0, UAIState_Eat(), n"IO_CHAIR_EF_DRAX_CAMP",400);
    default Schedule(22, 0, UAIState_SitCampfire(), n"IO_CHAIR_EF_DRAX_CAMP",400);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"Bed_Drax_819", WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_CarveWood(), n"IO_CHAIR_EF_DRAX_CAMP",500);
}

UCLASS()
class UDailyRoutine_NC_ORG_Drax_819_Guide : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_NC_ORG_Drax_819_Guide(), Location::Anywhere);
    default Schedule(20, 0, UAIState_NC_ORG_Drax_819_Guide_Night(), Location::Anywhere);
}

UCLASS()
class UAIState_NC_ORG_Drax_819_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 120.f;
    default WaitAtPlaceAction = UAIState_PlayKnife::StaticClass();
    default bReturnToPathStart = true;
    default RoutineToReturnTo = UDailyRoutine_NC_ORG_Drax_819_Start::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_start",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_02",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_03",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_04",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_05",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_06",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_07",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_08",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_09",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_10",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_11",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCampDrax_12",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_17",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_NewCamp_end",EWalkSpeed::Running));
    
}

UCLASS()
class UAIState_NC_ORG_Drax_819_Guide_Night : UAIState_NC_ORG_Drax_819_Guide
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
}