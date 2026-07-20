UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard01_204 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard01_204::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard01_204_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD204");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD204");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard01_204_Start : UDailyRoutine_OC_GRD_Guard01_204_Ownership
{
    default Schedule(6, 45, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(7, 45, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_02",700);
    default Schedule(10, 0, UAIState_Rest(), n"IO_OC_CHAIR_BENCH_10",1000);
    default Schedule(10, 30, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_02",700);
    default Schedule(12, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(14, 30, UAIState_Sleep(), Location::Bed);
    default Schedule(16, 0, UAIState_PracticeSword_1H(), n"FP_OC_FIGHTTRAINING_02",700);
    default Schedule(18, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(22, 0, UAIState_SitAround(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(6, 45, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(7, 45, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_86",500);
    default ScheduleIfRaining(12, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(15, 30, UAIState_Sleep(), Location::Bed);
    default ScheduleIfRaining(16, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_86",500);
    default ScheduleIfRaining(18, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(22, 0, UAIState_SitAround(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed);
    
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard01_204_InExtremoWait : UDailyRoutine_OC_GRD_Guard01_204_Ownership
{
    default Schedule(6, 45, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(10, 0, UAIState_Rest(), n"IO_OC_CHAIR_BENCH_10",1000);
    default Schedule(12, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(14, 30, UAIState_Sleep(), Location::Bed);
    default Schedule(18, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(22, 0, UAIState_SitAround(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed);
}