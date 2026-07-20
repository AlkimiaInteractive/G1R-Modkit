UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger12_513 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger12_513::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger12_513_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_16);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER513");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER513");

    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_42");
    default Schedule(9, 0, UAIState_Sweep(), n"FP_OC_SWEEP_15",3000.f);
    default Schedule(14, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_48", 1500.0f);
    default Schedule(16, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_42",1500.f);
    //default Schedule(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_03", 2000.0f);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(9, 0, UAIState_RainShelter_Digger(), n"FP_OC_SWEEP_15",500);
    default ScheduleIfRaining(14, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_03",500);
    default ScheduleIfRaining(14, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_03", 2000.0f);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ArenaSpectatorSchedule(UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_03");
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger12_513_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_06", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger12_513_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_06", 200);
}