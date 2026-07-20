UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger01_501 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger01_501::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger01_501_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_29);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER501");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER501");

    default Schedule(7, 0, UAIState_Eat(), n"IO_OC_CHAIR_54",200);
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_17",200);
    default Schedule(10, 0, UAIState_Sweep(), n"FP_OC_SWEEP_21", WaypointRadius = 3000);
    default Schedule(17, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_35");
    default Schedule(18, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_17",200);
    default Schedule(20, 30, UAIState_Campfire(), n"FP_OC_CAMPFIRE_35", WaypointRadius = 500);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(10, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_80",750);
    default ScheduleIfRaining(17, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(20, 30, UAIState_Campfire(), n"FP_OC_CAMPFIRE_35", WaypointRadius = 500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger01_501_Wait : UDailyRoutine_OC_VLK_Digger01_501_Start
{
    default Schedule(7, 0, UAIState_Eat(), n"IO_OC_CHAIR_54",200);
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_17",200);
    default Schedule(10, 0, UAIState_Sweep(), n"FP_OC_SWEEP_21", WaypointRadius = 200);
    default Schedule(17, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_35");
    default Schedule(18, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_17",200);
    default Schedule(20, 30, UAIState_Campfire(), n"FP_OC_CAMPFIRE_35", WaypointRadius = 500);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}