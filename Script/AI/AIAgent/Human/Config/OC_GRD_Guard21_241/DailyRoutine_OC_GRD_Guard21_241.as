UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard21_241 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard21_241::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard21_241_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD241");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD241");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard21_241_Start : UDailyRoutine_OC_GRD_Guard21_241_Ownership
{
    UPROPERTY()
    FGameplayTag Path;

    UDailyRoutine_OC_GRD_Guard21_241_Start(FGameplayTag InPath)
    {
        Path = InPath;
    }

    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard21(), n"BreadcrumbActor_OC_GuardPalisade_Arena_Guard241_1");
    default Schedule(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70",1000);
    default Schedule(23, 46, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Guard(),n"FP_OC_RAINSHELTER_96");
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_70");
    default ScheduleIfRaining(21, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_70",1000);
    default ScheduleIfRaining(23, 46, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard21_241_Omfull : UAIState_DailyRoutine_Human
{
    default Schedule(3, 0, UAIState_GuardPatrol(), n"OCR_MAINGATE_SQUARE");
    default Schedule(4, 0, UAIState_GuardPatrol(), n"OCR_TO_HUT_72");
    default Schedule(5, 0, UAIState_GuardPatrol(), n"OCR_NORTHGATE_RAMP_ATOP");
    default Schedule(6, 0, UAIState_Sleep(), n"OCC_MERCS_UPPER_RIGHT_ROOM_FRONT");
    default Schedule(14, 0, UAIState_SitAround(), n"OCC_MERCS_RIGHT_ROOM_BACK");
}


UCLASS()
class UDailyRoutine_OC_GRD_Guard21_241_Fmtaken : UAIState_DailyRoutine_Human
{

}


UCLASS()
class UDailyRoutine_OC_GRD_Guard21_241_Orcassault : UAIState_DailyRoutine_Human
{

}
