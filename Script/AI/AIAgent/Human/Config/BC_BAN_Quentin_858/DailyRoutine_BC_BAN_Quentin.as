UCLASS()
class UAIAgentConfig_Human_BC_BAN_Quentin_858 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Quentin_858::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Quentin_858_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_BanditsCamp_Plateau_MainCamp_LootCave);
    default KnownPlaces.Add(Location::Bed, n"IO_BC_BED_QUENTIN");
    default KnownPlaces.Add(Location::Home, n"IO_BC_BED_QUENTIN");

    default Schedule(7, 0, UAIState_Sit(), n"IO_BC_CHAIR_BENCH_03",150);
    default Schedule(8, 10, UAIState_Guard(), n"FP_BC_STANDAROUND_09",300);
    default Schedule(10, 0, UAIState_CheckGoods_TakeNotes(), n"FP_BC_CheckGoods_01",1000);
    default Schedule(12, 10, UAIState_Guard(), n"FP_BC_STANDAROUND_09",300);
    default Schedule(13, 30, UAIState_Sit(), n"IO_BC_CHAIR_BENCH_03",150);
    default Schedule(14, 45, UAIState_Guard(), n"FP_BC_STANDAROUND_08",300);
    default Schedule(18, 0, UAIState_Sit(), n"IO_BC_CHAIR_BENCH_03",150);
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelterNoMouth(), n"FP_BC_RAINSHELTER_25",450);
    default ScheduleIfRaining(10, 0, UAIState_CheckGoods_TakeNotes(), n"FP_BC_CheckGoods_01",450);
    default ScheduleIfRaining(12, 10, UAIState_RainShelterNoMouth(), n"FP_BC_RAINSHELTER_25",300);
    default ScheduleIfRaining(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}