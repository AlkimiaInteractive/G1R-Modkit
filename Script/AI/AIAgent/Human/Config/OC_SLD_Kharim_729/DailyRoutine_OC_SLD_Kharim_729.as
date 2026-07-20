UCLASS()
class UAIAgentConfig_Human_OC_SLD_Kharim_729 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_SLD_Kharim_729::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_SLD_Kharim_729_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_61);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_KHARIM");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_KHARIM");
}

UCLASS()
class UDailyRoutine_OC_SLD_Kharim_729_Start : UDailyRoutine_OC_SLD_Kharim_729_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(7, 30, UAIState_StandAround(), n"FP_OC_STANDAROUND_04",500);
    default Schedule(11, 0, UAIState_Smith_Sharp(), n"IO_OC_SHARP_04",500);
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_04",500);
    default Schedule(14, 0, UAIState_PracticeMace_1H_NoDummy(), n"FP_OC_FIGHTTRAINING_04",500);
    default Schedule(15, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_04",500);
    default Schedule(17, 0, UAIState_Campfire(), n"FP_OC_STANDAROUND_85",500);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Guard(), Location::Home,500);
    default ScheduleIfRaining(14, 0, UAIState_RainShelter_Guard(), n"IO_OC_CHAIR_BENCH_25",500);
    default ScheduleIfRaining(15, 0, UAIState_RainShelter_Guard(), Location::Home,500);

    default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsKharim, 0, 0, 
        UAIState_TrainingFightWith_OCArena(
            UAIWorldEventTimed_ArenaFight_KirgoVsKharim,
            n"OC_GRD_Kirgo_251",
            GameplayTag::Action_Ambient_Practice1HMace), 
        n"FP_OC_ARENAFIGHT_KirgoVsKharim_Kharim",200);

    default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_GorHanisVsKharim, 0, 0, 
        UAIState_TrainingFightWith_OCArena(
            UAIWorldEventTimed_ArenaFight_GorHanisVsKharim,
            n"SC_TPL_GorHanis_1422",
            GameplayTag::Action_Ambient_Practice1HMace), 
        n"FP_OC_ARENAFIGHT_GorHanisVsKharim_Kharim",200);

    // default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KharimVsMud, 0, 0, 
    //     UAIState_TrainingFightWith_OCArena(
    //         UAIWorldEventTimed_ArenaFight_KharimVsMud,
    //         n"OC_VLK_Mud_574",
    //         GameplayTag::Action_Ambient_Practice1HMace), 
    //     n"FP_OC_ARENAFIGHT_KharimVsMud_Kharim", 200);
}

UCLASS()
class UDailyRoutine_OC_SLD_Kharim_729_Guide : UDailyRoutine_OC_SLD_Kharim_729_Ownership
{
    default Schedule(7, 45, UAIState_StandAround(), n"FP_OC_FIGHTTRAINING_5",200);
}

UCLASS()
class UDailyRoutine_OC_SLD_Kharim_729_Wait : UDailyRoutine_OC_SLD_Kharim_729_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(7, 30, UAIState_StandAround(), n"FP_OC_STANDAROUND_04",500);
    default Schedule(11, 0, UAIState_Smith_Sharp(), n"IO_OC_SHARP_04",500);
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_04",500);
    default Schedule(14, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_04",500);
    default Schedule(17, 0, UAIState_Campfire(), n"FP_OC_STANDAROUND_85",500);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Guard(), Location::Home,500);
    default ScheduleIfRaining(14, 0, UAIState_RainShelter_Guard(), n"IO_OC_CHAIR_BENCH_25",500);
    default ScheduleIfRaining(15, 0, UAIState_RainShelter_Guard(), Location::Home,500);
}

UCLASS()
class UDailyRoutine_OC_SLD_Kharim_729_AfterFireMages : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"IO_NC_CHAIR_BENCH_60");
    default Schedule(7, 30, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_60",500);
    default Schedule(13, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_60",500);
    default Schedule(15, 30, UAIState_SitAround(), n"IO_NC_CHAIR_27",500);
    default Schedule(18, 0, UAIState_Drink(), n"IO_NC_CHAIR_27",500);
    default Schedule(22, 0, UAIState_Sleep_Table(), n"IO_NC_CHAIR_27",500);
    default Schedule(1, 30, UAIState_SitAround(), n"IO_NC_CHAIR_BENCH_60",500);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

}