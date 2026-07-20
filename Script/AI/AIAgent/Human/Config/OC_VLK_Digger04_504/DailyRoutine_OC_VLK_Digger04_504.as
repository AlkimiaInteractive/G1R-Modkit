UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger04_504 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger04_504::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger04_504_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_56);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER504");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER504");

    default Schedule(6, 30, UAIState_RepairBuilding(), n"IO_OC_CHAIR_BENCH_48",3000);
    default Schedule(8, 30, UAIState_Rest(), n"IO_OC_CHAIR_BENCH_48");
    default Schedule(9, 30, UAIState_RepairBuilding(), n"IO_OC_CHAIR_BENCH_48",3000);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_48");
    default Schedule(14, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_01");
    default Schedule(18, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_48");
    default Schedule(21, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_48");
    default Schedule(22, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_16");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    //default Schedule(13, 0, UAIState_ServeFoodAndEat(), n"FP_OC_CALDRUON_LINE_1",1500.f);


    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger04_504_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WaitInextremo(), n"FP_OC_INEXTREMO_02", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger04_504_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(7, 0, UAIState_WatchInExtremo(), n"FP_OC_INEXTREMO_02", 200);
}