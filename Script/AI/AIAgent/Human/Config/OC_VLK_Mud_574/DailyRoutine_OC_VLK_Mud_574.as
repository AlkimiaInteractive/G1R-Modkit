UCLASS()
class UAIAgentConfig_Human_OC_VLK_Mud_574 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Mud_574::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_VLK_Mud_574_Start : UDailyRoutine_Digger
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_MUD");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_MUD");

    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_04_MUD",200.0f);
    default Schedule(7, 0, UAIState_SitAround(), n"IO_OC_CHAIR_04_MUD",200.0f);
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_04_MUD",200.0f);
    default Schedule(14, 30, UAIState_SitAround(), n"IO_OC_CHAIR_04_MUD",200.0f);
    default Schedule(23, 0, UAIState_Sleep(), n"IO_OC_BED_MUD", WaypointRadius = 500);
    //default Schedule(13, 0, UAIState_ServeFoodAndEat(), n"FP_OC_CALDRUON_LINE_1",1500.f);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_15",500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    // default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsMud, 0, 0, 
    //     UAIState_TrainingFightWith_OCArena(
    //         UAIWorldEventTimed_ArenaFight_KirgoVsMud,
    //         n"OC_GRD_Kirgo_251",
    //         GameplayTag::Action_Ambient_Practice1HMace), 
    //     n"FP_OC_ARENAFIGHT_KirgoVsMud_Mud", 200);
        
    // default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_GorHanisVsMud, 0, 0, 
    //     UAIState_TrainingFightWith_OCArena(
    //         UAIWorldEventTimed_ArenaFight_GorHanisVsMud,
    //         n"SC_TPL_GorHanis_1422",
    //         GameplayTag::Action_Ambient_Practice1HMace), 
    //     n"FP_OC_ARENAFIGHT_GorHanisVsMud_Mud", 200);
        
    // default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KharimVsMud, 0, 0, 
    //     UAIState_TrainingFightWith_OCArena(
    //         UAIWorldEventTimed_ArenaFight_KharimVsMud,
    //         n"OC_SLD_Kharim_729",
    //         GameplayTag::Action_Ambient_Practice1HMace), 
    //     n"FP_OC_ARENAFIGHT_KharimVsMud_Mud", 200);
}

class UAIWorldEvent_Explicit_MyExplicitEvent : UAIWorldEventExplicit
{
    default MaxAllowedNonMainParticipants = 4;
    default MainParticipantUniqueNames.Add(n"SomeCharacterName");
}

UCLASS()
class UDailyRoutine_OC_VLK_Mud_574_Kalomists : UAIState_DailyRoutine_Human
{
    default Schedule(10, 30, UAIState_Listen(), n"FP_OG_LISTEN_04",200.0f);
    default Schedule(12, 0, UAIState_Pray(), n"FP_OG_PRAY_3", 200.0f);
    default Schedule(14, 0, UAIState_RoastScavenger(), n"IO_OG_ROSTISSERIE_01",200.0f);
    default Schedule(15, 0, UAIState_Eat(), n"FP_OG_STANDAROUND_8",200.0f);
    default Schedule(16, 30, UAIState_Listen(), n"FP_OG_LISTEN_04",200.0f);
    default Schedule(18, 0, UAIState_Pray(), n"FP_OG_PRAY_3", 200.0f);
    default Schedule(21, 0, UAIState_Smoke(), n"FP_OG_STANDAROUND_8", 200.0f);
    default Schedule(23, 0, UAIState_Eat_Ground(), n"FP_OG_PRAY_3",200.0f);
    default Schedule(0, 30, UAIState_Meditate(), n"FP_OG_PRAY_3",200.0f);
    default Schedule(4, 0, UAIState_Smoke_Ground(), n"IO_OG_WATERPIPE_03",200.0f);
    default Schedule(7, 0, UAIState_Meditate(), n"FP_OG_PRAY_3",200.0f);
}

UCLASS()
class UDailyRoutine_OC_VLK_Mud_574_Follow : UAIState_DailyRoutine_Human
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHero(250), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_VLK_Mud_574_WaitOutsideNC : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_NC_FOLLOWER_WAIT",100);
}

UCLASS()
class UDailyRoutine_OC_VLK_Mud_574_WaitOutsideOC : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_OC_FOLLOWER_WAIT",100);
}

UCLASS()
class UDailyRoutine_OC_VLK_Mud_574_WaitOutsideSC : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_SC_FOLLOWER_WAIT",100);
}

UCLASS()
class UDailyRoutine_OC_VLK_Mud_574_WaitOutsideKalom : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_SC_KALOM_FOLLOWER_WAIT",100);
}