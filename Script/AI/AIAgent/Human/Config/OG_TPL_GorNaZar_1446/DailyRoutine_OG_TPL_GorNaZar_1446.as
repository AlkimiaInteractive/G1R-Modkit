UCLASS()
class UAIAgentConfig_Human_OG_TPL_GorNaZar_1446 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OG_TPL_GorNaZar_1446::StaticClass();

}



UCLASS()
class UDailyRoutine_OG_TPL_GorNaZar_1446_Start : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_SharpWeapon(), n"IO_SC_BENCH_24", 100);
    default Schedule(1, 0, UAIState_Smoke_Seated(), n"IO_SC_BENCH_24", 100);
    default Schedule(2, 0, UAIState_SharpWeapon(), n"IO_SC_BENCH_24", 100);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OG_TPL_GorNaZar_1446_SharpWeapon : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_SharpWeapon(), n"IO_SC_BENCH_24", 100);
    default Schedule(1, 0, UAIState_Smoke_Seated(), n"IO_SC_BENCH_24", 100);
    default Schedule(2, 0, UAIState_SharpWeapon(), n"IO_SC_BENCH_24", 100);
}