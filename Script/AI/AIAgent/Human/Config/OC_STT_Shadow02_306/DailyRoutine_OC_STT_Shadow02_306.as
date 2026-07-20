UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow02_306 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow02_306::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow02_306_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_19);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SHADOW306");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SHADOW306");

    default Schedule(7, 0, UAIState_Pee(), n"FP_OC_PEE_02");
    default Schedule(7, 15, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_46");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_19",300.0f);
    default Schedule(17, 30, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_46",1000.0f);
    default Schedule(18, 30, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_46",1000.0f);
    default Schedule(23, 0, UAIState_Sleep(), n"IO_OC_BED_SHADOW306", WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), n"FP_OC_RAINSHELTER_142",500);
    default ScheduleIfRaining(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_03",3000.0f);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ArenaSpectatorSchedule(UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_03");
}