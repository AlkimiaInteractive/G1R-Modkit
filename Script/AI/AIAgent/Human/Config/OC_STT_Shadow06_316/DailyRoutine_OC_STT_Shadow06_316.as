UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow06_316 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow06_316::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow06_316_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_12);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW316");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW316");

    default Schedule(1, 0, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_05",500.0f);
    default Schedule(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(7, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_27",500);
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_37",1000.0f);
    default Schedule(18, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_90",1000.0f);
    default Schedule(23, 0, UAIState_SitCampfire(), n"IO_OC_CHAIR_BENCH_90",1000.0f);

    default ScheduleIfRaining(1, 0, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_05",500.0f);
    default ScheduleIfRaining(2, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), Location::Home,500);
    default ScheduleIfRaining(18, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_90",1000.0f);
    default ScheduleIfRaining(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_04");
    default ScheduleIfRaining(23, 0, UAIState_SitCampfire(), n"IO_OC_CHAIR_BENCH_90",1000.0f);

    default ArenaSpectatorSchedule(UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_03");
}