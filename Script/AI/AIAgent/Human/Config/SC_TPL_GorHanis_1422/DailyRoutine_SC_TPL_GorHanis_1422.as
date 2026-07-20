UCLASS()
class UAIAgentConfig_Human_SC_TPL_GorHanis_1422 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_GorHanis_1422::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_TPL_GorHanis_1422_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_62);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GORHANIS");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GORHANIS");
}

UCLASS()
class UDailyRoutine_SC_TPL_GorHanis_1422_Start : UDailyRoutine_SC_TPL_GorHanis_1422_Ownership
{
    default Schedule(7, 45, UAIState_Eat(), n"IO_OC_CHAIR_115",500);
    default Schedule(8, 30, UAIState_Smoke(), n"FP_OC_STANDAROUND_02",500);
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_31",500);
    default Schedule(16, 0, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_04",500);
    default Schedule(17, 15, UAIState_Campfire(), n"FP_OC_STANDAROUND_85",500);
    default Schedule(23, 45, UAIState_Sleep(), Location::Bed,WaypointRadius = 500);

    default ScheduleIfRaining(5, 0, UAIState_RainShelter_Guard(), Location::Home,500);
    default ScheduleIfRaining(16, 0, UAIState_RainShelter_Guard(), n"IO_OC_CHAIR_BENCH_25",500);
    default ScheduleIfRaining(17, 0, UAIState_RainShelter_Guard(), Location::Home,500);
    default ScheduleIfRaining(23, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsGorHanis, 0, 0, 
        UAIState_TrainingFightWith_OCArena(
            UAIWorldEventTimed_ArenaFight_KirgoVsGorHanis,
            n"OC_GRD_Kirgo_251",
            GameplayTag::Action_Ambient_Practice1HSword), 
        n"FP_OC_ARENAFIGHT_KirgoVsGorHanis_GorHanis",200);

    default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_GorHanisVsKharim, 0, 0, 
        UAIState_TrainingFightWith_OCArena(
            UAIWorldEventTimed_ArenaFight_GorHanisVsKharim,
            n"OC_SLD_Kharim_729",
            GameplayTag::Action_Ambient_Practice1HSword), 
        n"FP_OC_ARENAFIGHT_GorHanisVsKharim_GorHanis",200);

    // default ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_GorHanisVsMud, 0, 0, 
    //     UAIState_TrainingFightWith_OCArena(
    //         UAIWorldEventTimed_ArenaFight_GorHanisVsMud,
    //         n"OC_VLK_Mud_574",
    //         GameplayTag::Action_Ambient_Practice1HSword), 
    //     n"FP_OC_ARENAFIGHT_GorHanisVsMud_GorHanis", 200);
}

UCLASS()
class UDailyRoutine_SC_TPL_GorHanis_1422_Wait : UDailyRoutine_SC_TPL_GorHanis_1422_Ownership
{
    default Schedule(7, 45, UAIState_Eat(), n"IO_OC_CHAIR_115",500);
    default Schedule(8, 30, UAIState_Smoke(), n"FP_OC_STANDAROUND_02",500);
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_31",500);
    default Schedule(16, 0, UAIState_Campfire(), n"FP_OC_STANDAROUND_85",500);
    default Schedule(23, 45, UAIState_Sleep(), Location::Bed,WaypointRadius = 500);

    default ScheduleIfRaining(5, 0, UAIState_RainShelter_Guard(), Location::Home,500);
    default ScheduleIfRaining(16, 0, UAIState_RainShelter_Guard(), n"IO_OC_CHAIR_BENCH_25",500);
    default ScheduleIfRaining(17, 0, UAIState_RainShelter_Guard(), Location::Home,500);
    default ScheduleIfRaining(23, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_TPL_GorHanis_1422_AfterFireMage : UAIState_DailyRoutine_Human
{
    default Schedule(7, 45, UAIState_PracticeSword_1H(), n"FP_SC_PRACTICESWORD_05",500);
    default Schedule(8, 30, UAIState_Smoke(), n"FP_SC_SMOKE_10",500);
    default Schedule(10, 0, UAIState_SitAround(), n"IO_SC_BENCH_22",500);
    default Schedule(14, 30, UAIState_Smoke(), n"FP_SC_SMOKE_10",500);
    default Schedule(18, 45, UAIState_PracticeSword_1H(), n"FP_SC_PRACTICESWORD_05",500);
    default Schedule(10, 0, UAIState_SitAround(), n"IO_SC_BENCH_22",500);
    default Schedule(23, 45, UAIState_Sleep(), n"IO_SC_BED_NAMELESS_02");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

}

UCLASS()
class UDailyRoutine_SC_TPL_GorHanis_1422_Guide : UDailyRoutine_SC_TPL_GorHanis_1422_Ownership
{
     default Schedule(7, 45, UAIState_StandAround(), n"FP_OC_FIGHTTRAINING_5",200);
}

UCLASS()
class UDailyRoutine_SC_TPL_GorHanis_1422_ArenaGreetings : UDailyRoutine_SC_TPL_GorHanis_1422_Ownership
{
    default Schedule(19, 0, UAIState_ArenaGreetings(), n"FP_OC_ARENAFIGHT2",200);
}

UCLASS()
class UDailyRoutine_SC_TPL_GorHanis_1422_ArenaAfterFight : UDailyRoutine_SC_TPL_GorHanis_1422_Ownership
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(15);
    default AutoSwitchToRoutine = UDailyRoutine_SC_TPL_GorHanis_1422_Start;

    default Schedule(19, 0, UAIState_ArenaGreetings(), n"FP_OC_ARENAFIGHT2",200);
}