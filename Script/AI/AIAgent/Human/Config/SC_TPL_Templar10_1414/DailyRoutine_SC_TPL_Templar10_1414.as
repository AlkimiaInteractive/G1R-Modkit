UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar10_1414 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar10_1414::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_TPL_Templar10_1414_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_TEMPLAR10");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_TEMPLAR10");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar10_1414_Start : UDailyRoutine_SC_TPL_Templar10_1414_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(4, 0, UAIState_Eat(), n"IO_SC_BENCH_25");
    default Schedule(6, 0, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_01");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_PRACTICESWORD_01");
    default Schedule(13, 56, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_01");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_PRACTICESWORD_01");
    default Schedule(22, 30, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_01");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar10_1414_ExpectFight : UDailyRoutine_SC_TPL_Templar10_1414_Ownership
{
    default Schedule(6, 0, UAIState_Guard(), n"FP_SC_EXPECTFIGHT3",300);
}