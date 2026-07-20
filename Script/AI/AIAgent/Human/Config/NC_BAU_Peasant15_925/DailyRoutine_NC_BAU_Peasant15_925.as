UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant15_925 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant15_925::StaticClass();

}


UCLASS()
class UDailyRoutine_NC_BAU_Peasant15_925_Start : UAIState_DailyRoutine_Human
{
    
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_02);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT925");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT925");

    default Schedule(8, 20, UAIState_WashSelf(), n"FP_NC_WASHSELF_06");
    default Schedule(8, 40, UAIState_Smalltalk(), n"FP_SMALLTALK_A_SIT_A_OW_03");
    default Schedule(13, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_27");
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_SMALLTALK_A_SIT_A_OW_03");
    default Schedule(20, 20, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 20, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_01", 300);
    default ScheduleIfRaining(8, 40, UAIState_Smalltalk(), n"FP_SMALLTALK_A_SIT_A_OW_4");
    default ScheduleIfRaining(13, 0, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_01", 300);
    default ScheduleIfRaining(14, 0, UAIState_Smalltalk(), n"FP_SMALLTALK_A_SIT_A_OW_4");
    default ScheduleIfRaining(20, 20, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}