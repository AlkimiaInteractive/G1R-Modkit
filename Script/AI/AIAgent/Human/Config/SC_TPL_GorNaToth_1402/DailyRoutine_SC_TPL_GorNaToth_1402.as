UCLASS()
class UAIAgentConfig_Human_SC_TPL_GorNaToth_1402: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_GorNaToth_1402::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_GorNaToth_1402_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_GorNaToth);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_GORNATOTH_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_GORNATOTH_CM");

    default Schedule(0, 10, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(5, 45, UAIState_Eat(), n"IO_SC_CHAIR_21");
    default Schedule(6, 0, UAIState_Teach_Train(), n"FP_SC_GUARD_18");
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_GUARD_18");
    default Schedule(13, 56, UAIState_Teach_Train(), n"FP_SC_GUARD_18");
}
