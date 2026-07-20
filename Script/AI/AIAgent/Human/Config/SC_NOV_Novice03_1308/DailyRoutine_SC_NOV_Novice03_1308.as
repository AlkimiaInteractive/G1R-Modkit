UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice03_1308 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice03_1308::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice03_1308_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_27);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NOVICE03");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NOVICE03");
}

UCLASS()
class UDailyRoutine_SC_NOV_Novice03_1308_Start : UDailyRoutine_SC_NOV_Novice03_1308_Ownership
{
    default Schedule(0, 5, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 25, UAIState_Eat(), n"FP_SC_HERBALCHEMY_02");
    default Schedule(7, 5, UAIState_HerbAlchemy(), n"IO_SC_SMASHER_02", 200);
    default Schedule(12, 56, UAIState_Eat(), n"FP_SC_HERBALCHEMY_02");
    default Schedule(13, 56, UAIState_HerbAlchemy(), n"IO_SC_SMASHER_02", 200);
    default Schedule(21, 30, UAIState_Eat(), n"FP_SC_HERBALCHEMY_02");
    default Schedule(22, 30, UAIState_HerbAlchemy(), n"IO_SC_SMASHER_02", 200);
}