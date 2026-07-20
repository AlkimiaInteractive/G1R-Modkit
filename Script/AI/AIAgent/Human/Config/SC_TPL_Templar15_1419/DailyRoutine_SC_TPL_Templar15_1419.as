UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar15_1419 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar15_1419::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_TPL_Templar15_1419_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_14);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_TEMPLAR15_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_TEMPLAR15_CM");
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar15_1419_Start : UDailyRoutine_SC_TPL_Templar15_1419_Ownership
{
    default Schedule(5, 15, UAIState_Eat(), n"IO_SC_BENCH_5");
    default Schedule(6, 50, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_03");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_PRACTICESWORD_03");
    default Schedule(13, 56, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_03");
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_PRACTICESWORD_03");
    default Schedule(22, 30, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_03");
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(5, 15, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_04");
    default ScheduleIfRaining(6, 50, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_03");
    default ScheduleIfRaining(12, 56, UAIState_Eat(), n"FP_SC_PRACTICESWORD_03");
    default ScheduleIfRaining(13, 56, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_03");
    default ScheduleIfRaining(21, 30, UAIState_Eat(), n"FP_SC_PRACTICESWORD_03");
    default ScheduleIfRaining(22, 30, UAIState_PracticeSword_2H(), n"FP_SC_PRACTICESWORD_03");
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_TPL_Templar15_1419_ExpectFight : UDailyRoutine_SC_TPL_Templar15_1419_Ownership
{
    default Schedule(6, 0, UAIState_Guard(), n"FP_SC_EXPECTFIGHT2",300);
}