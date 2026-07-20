UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard08_223 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard08_223::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard08_223_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD223");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD223");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard08_223_Start : UDailyRoutine_OC_GRD_Guard08_223_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_98");
    default Schedule(7, 30, UAISTate_Guard_Watch_Patrolling_Route_Guard08(), n"Breadcrumb_OldCamp_Castle_In_Guard223_1");
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_98");
    default Schedule(14, 30, UAISTate_Guard_Watch_Patrolling_Route_Guard08(), n"Breadcrumb_OldCamp_Castle_In_Guard223_1");
    default Schedule(21, 0, UAIState_Eat(), n"IO_OC_CHAIR_98");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard08_223_Ot : UDailyRoutine_OC_GRD_Guard08_223_Ownership
{
    default Schedule(7, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_39");
    default Schedule(17, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_40");
}