UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger07_507 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger07_507::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger07_507_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_33);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER507");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER507");

    default Schedule(7, 15, UAIState_Pee(), n"FP_OC_PEE_14");
    default Schedule(7, 25, UAIState_Eat(), n"FP_OC_CAMPFIRE_29");
    default Schedule(8, 30, UAIState_StandAround(), n"FP_OC_STANDAROUND_45", 1500);
    default Schedule(10, 15, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_03", WaypointRadius = 200);
    default Schedule(13, 30, UAIState_Eat(), n"FP_OC_CAMPFIRE_29");
    default Schedule(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_03", WaypointRadius = 200);
    default Schedule(16, 30, UAIState_Sweep(), n"FP_OC_SWEEP_19", WaypointRadius = 1500);
    default Schedule(18, 30, UAIState_StandAround(), n"FP_OC_STANDAROUND_45", 1500);
    default Schedule(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 15, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(10, 15, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_03", WaypointRadius = 200);
    default ScheduleIfRaining(13, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_03", WaypointRadius = 200);
    default ScheduleIfRaining(16, 30, UAIState_Sweep(), n"FP_OC_SWEEP_19", WaypointRadius = 1500);
    default ScheduleIfRaining(18, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
