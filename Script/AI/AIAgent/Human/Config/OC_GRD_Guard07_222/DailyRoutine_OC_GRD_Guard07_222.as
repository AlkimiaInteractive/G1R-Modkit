UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard07_222 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard07_222::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard07_222_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD222");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD222");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard07_222_Start : UDailyRoutine_OC_GRD_Guard07_222_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_11",400);
    default Schedule(7, 30, UAISTate_Guard_Watch_Patrolling_Route_Guard07(), n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_1");
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_11",400);
    default Schedule(14, 30, UAISTate_Guard_Watch_Patrolling_Route_Guard07(), n"Breadcrumb_OldCamp_Castle_Quarter_Guard222_1");
    default Schedule(21, 0, UAIState_Eat(), n"IO_OC_CHAIR_11",400);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard07_222_Ot : UDailyRoutine_OC_GRD_Guard07_222_Ownership
{
    default Schedule(0, 30, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_45");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard07_222_FMTaken : UDailyRoutine_OC_GRD_Guard07_222_Ownership
{
    default Schedule(0, 0, UAIState_EnsureGateIsClosed(n"Interactive_Winch458439"), n"Interactive_Winch458439");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}