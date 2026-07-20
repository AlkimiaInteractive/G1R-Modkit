UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard19_239 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard19_239::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard19_239_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD239");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD239");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard19_239_Start : UDailyRoutine_OC_GRD_Guard19_239_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_33");
    default Schedule(8, 0, UAISTate_Guard_Watch_Patrolling_Route_Guard19(), n"BreadcrumbActor_OC_Castle_Cell_Guard239_1");
    default Schedule(21, 30, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_33");
    default Schedule(23, 30, UAIState_StandAround(), n"IO_OC_CHAIR_BENCH_33",1000);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard19_239_Ot : UDailyRoutine_OC_GRD_Guard19_239_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_41");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard19_239_AfterConcert : UDailyRoutine_OC_GRD_Guard19_239_Ownership
{
    // default Schedule(12, 30, UAIState_PlayTune(), n"FP_PLAYINSTRUMENT_GUARD");
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_41");
}