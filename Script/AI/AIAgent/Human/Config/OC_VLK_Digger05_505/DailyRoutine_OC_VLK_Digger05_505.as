UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger05_505 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger05_505::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger05_505_Start : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_7);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER505");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER505");

    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_68");
    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_70");
    default Schedule(10, 0, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_01");
    default Schedule(13, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_04");
    default Schedule(15, 0, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_01");
    default Schedule(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_70");
    default Schedule(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_70");
    default ScheduleIfRaining(10, 0, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_70");
    default ScheduleIfRaining(22, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

}