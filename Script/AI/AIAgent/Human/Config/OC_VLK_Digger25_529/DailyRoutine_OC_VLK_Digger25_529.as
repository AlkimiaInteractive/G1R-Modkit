UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger25_529 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger25_529::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger25_529_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_48);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER529");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER529");

    default Schedule(6, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_07");
    default Schedule(6, 32, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_07");
    default Schedule(12, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_07");
    default Schedule(13, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_07");
    default Schedule(16, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_51");
    default Schedule(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_41");
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_51");
    default Schedule(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(22, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}
