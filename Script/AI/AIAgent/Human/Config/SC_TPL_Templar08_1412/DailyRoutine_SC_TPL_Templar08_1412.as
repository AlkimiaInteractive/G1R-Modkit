UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar08_1412 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar08_1412::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_TPL_Templar08_1412_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_11);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_TEMPLAR08");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_TEMPLAR08");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar08_1412_Start : UDailyRoutine_SC_TPL_Templar08_1412_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(4, 1, UAIState_Eat(), n"IO_SC_BENCH_11");
    default Schedule(6, 0, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_02");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_PRACTICESWORD_02");
    default Schedule(13, 56, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_02");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_PRACTICESWORD_02");
    default Schedule(22, 30, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_02");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar08_1412_ExpectFight : UDailyRoutine_SC_TPL_Templar08_1412_Ownership
{
    default Schedule(6, 0, UAIState_Guard(), n"FP_SC_EXPECTFIGHT",300);
}