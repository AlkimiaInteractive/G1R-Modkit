UCLASS()
class UAIAgentConfig_Human_SC_TPL_GorNaDun_1411 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_GorNaDun_1411::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_TPL_GorNaDun_1411_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_10);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_TEMPLAR07");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_TEMPLAR07");
}


UCLASS()
class UDailyRoutine_SC_TPL_GorNaDun_1411_Start : UDailyRoutine_SC_TPL_GorNaDun_1411_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(4, 0, UAIState_Eat(), n"IO_SC_BENCH_12");
    default Schedule(6, 0, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_04");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_PRACTICESWORD_04");
    default Schedule(13, 56, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_04");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_PRACTICESWORD_04");
    default Schedule(22, 30, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_04");
}

UCLASS()
class UDailyRoutine_SC_TPL_GorNaDun_1411_Fight : UDailyRoutine_SC_TPL_GorNaDun_1411_Ownership
{
    default Schedule(6, 0, UAIState_Guard(), n"FP_SC_FIGHT",300);
}