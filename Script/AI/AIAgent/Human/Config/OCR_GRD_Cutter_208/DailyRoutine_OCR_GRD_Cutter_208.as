UCLASS()
class UAIAgentConfig_Human_OCR_GRD_Cutter_208 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_Cutter_208::StaticClass();

}

UCLASS()
class UDailyRoutine_OCR_GRD_Cutter_208_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_CUTTER");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_CUTTER");
}

UCLASS()
class UDailyRoutine_OCR_GRD_Cutter_208_Start : UDailyRoutine_OCR_GRD_Cutter_208_Ownership
{
    default Schedule(8, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(9, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_27");
    default Schedule(13, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_27");
    default Schedule(20, 00, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(21, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_27");
    default Schedule(23, 45, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(8, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(9, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_62");
    default ScheduleIfRaining(13, 30, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(14, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_62");
    default ScheduleIfRaining(20, 00, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(21, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_62");
    default ScheduleIfRaining(23, 45, UAIState_Sleep(), Location::Bed);
}

UCLASS()
class UDailyRoutine_OCR_GRD_Cutter_208_Ot : UDailyRoutine_OCR_GRD_Cutter_208_Ownership
{
    default Schedule(7, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_44");
}
