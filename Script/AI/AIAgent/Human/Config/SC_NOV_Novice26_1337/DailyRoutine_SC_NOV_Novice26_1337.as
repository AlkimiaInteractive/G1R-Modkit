UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice26_1337 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice26_1337::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_NOV_Novice26_1337_Start : UAIState_DailyRoutine_Human
{
    default Schedule(22, 30, UAIState_Pray(), n"FP_SC_MEDITATE_04");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice26_1337_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SitAround(), n"IO_SC_BENCH_1",2000);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}