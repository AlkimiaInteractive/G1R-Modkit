UCLASS()
class UAIAgentConfig_Human_OC_STT_Shadow04_313 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_STT_Shadow04_313::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_STT_Shadow04_313_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_64);
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_15_SHADOW04",100.0f);
    default Schedule(7, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_48");
    default Schedule(9, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_15_SHADOW04",100.0f);
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_15_SHADOW04",100.0f);
    default Schedule(14, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_25",1000.0f);
    default Schedule(17, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_15_SHADOW04",300.0f);
    default Schedule(23, 0, UAIState_Sleep(), n"IO_OC_BED_SHADOW313", WaypointRadius = 500);

    default ScheduleIfRaining(6, 0, UAIState_RainShelter_Shadow(), n"FP_OC_RAINSHELTER_197",100.0f);
    default ScheduleIfRaining(13, 0, UAIState_Eat(), n"FP_OC_RAINSHELTER_197",100.0f);
    default ScheduleIfRaining(14, 0, UAIState_RainShelter_Shadow(), n"FP_OC_RAINSHELTER_197",1000.0f);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), n"IO_OC_BED_SHADOW313", WaypointRadius = 500);
}