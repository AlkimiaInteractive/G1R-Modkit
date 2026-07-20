UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard06_221 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard06_221::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard06_221_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD221");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD221");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard06_221_Start : UDailyRoutine_OC_GRD_Guard06_221_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(7, 30, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_11",1000);
    default Schedule(8, 30, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_02",700);
    default Schedule(11, 0, UAIState_Rest(), n"IO_OC_CHAIR_BENCH_11",1000);
    default Schedule(11, 30, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_02",700);
    default Schedule(14, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_69", 800);
    default Schedule(15, 0, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_02",700);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_69", 800);
    default Schedule(21, 45, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_04",1000);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed);
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_85",500);
    default ScheduleIfRaining(14, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_69", 800);
    default ScheduleIfRaining(15, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_85",500);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_69", 800);
    default ScheduleIfRaining(21, 45, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_91",500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard06_221_InExtremoWait : UDailyRoutine_OC_GRD_Guard06_221_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(7, 30, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_11",1000);
    default Schedule(11, 0, UAIState_Rest(), n"IO_OC_CHAIR_BENCH_11",1000);
    default Schedule(14, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_69", 800);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_69", 800);
    default Schedule(21, 45, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_04",1000);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard06_221_Ot : UDailyRoutine_OC_GRD_Guard06_221_Ownership
{
    default Schedule(7, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_38");
}