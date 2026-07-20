UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard30_281N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard30_281N::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Guard30_281N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"WatchingPoint5",300);
    default Schedule(6, 0, UAIState_Eat(), n"WatchingPoint5",300);
    default Schedule(6, 30, UAIState_Guard(), n"WatchingPoint5",300);
    default Schedule(23, 30, UAIState_Eat(), n"WatchingPoint5",300);
}

// UCLASS()
// class UDailyRoutine_OC_GRD_Guard_Guard30_281N_Fmtaken : UAIState_DailyRoutine_Human
// {
//     default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_28");
//     default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
// }