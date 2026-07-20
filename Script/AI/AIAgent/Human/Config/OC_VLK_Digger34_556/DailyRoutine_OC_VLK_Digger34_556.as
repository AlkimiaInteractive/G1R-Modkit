UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger34_556 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger34_556::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger34_556_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_30);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER556");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER556");

    default Schedule(7, 0, UAIState_Eat(), n"IO_OC_CHAIR_79",200);
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_09",200);
    default Schedule(10, 0, UAIState_StandAround(), n"FP_OC_SMALLTALK_17",2000);
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_42",200);
    default Schedule(14, 30, UAIState_StandAround(), n"FP_OC_SMALLTALK_17",2000);
    default Schedule(18, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_09",200);
    default Schedule(20, 30, UAIState_Drink(), n"FP_OC_CAMPFIRE_25");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(13, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_25");
    default ScheduleIfRaining(14, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(20, 30, UAIState_Drink(), n"FP_OC_CAMPFIRE_25");
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
