UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant16_926 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant16_926::StaticClass();

}


UCLASS()
class UDailyRoutine_NC_BAU_Peasant16_926_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_01);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT926");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT926");

    default Schedule(8, 20, UAIState_WashSelf(), n"FP_NC_WASHSELF_05");
    default Schedule(8, 40, UAIState_Smalltalk(), n"FP_SMALLTALK_B_SIT_B_OW_04");
    default Schedule(13, 0, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_26",500);
    default Schedule(14, 0, UAIState_Smalltalk(), n"FP_SMALLTALK_B_SIT_B_OW_04");
    default Schedule(20, 20, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(8, 20, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_02", 500);
    default ScheduleIfRaining(8, 40, UAIState_Smalltalk(), n"FP_SMALLTALK_B_SIT_B_OW_5");
    default ScheduleIfRaining(13, 0, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_02", 500);
    default ScheduleIfRaining(14, 0, UAIState_Smalltalk(), n"FP_SMALLTALK_B_SIT_B_OW_5");
    default ScheduleIfRaining(20, 20, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}