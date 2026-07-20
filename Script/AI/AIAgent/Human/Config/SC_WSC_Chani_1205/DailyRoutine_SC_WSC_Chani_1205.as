UCLASS()
class UAIAgentConfig_Human_SC_WSC_Chani_1205: UAIAgentConfig_Human_Woman
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_WSC_Chani_1205::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_WSC_Chani_1205_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Temple_Room_Chani);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_CHANI");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_CHANI");
}

UCLASS()
class UDailyRoutine_SC_WSC_Chani_1205_Start : UDailyRoutine_SC_WSC_Chani_1205_Ownership
{
    default Schedule(0, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(5, 30, UAIState_Eat(), n"IO_SC_CHAIR_4");
    default Schedule(6, 10, UAIState_Sweep(), n"FP_SC_TEMPLE_SWEEP_1",3000);
    default Schedule(9, 30, UAIState_CleanFloor(), n"FP_SC_CLEANFLOOR_2",3000);
    default Schedule(14, 0, UAIState_CookCauldron(), n"IO_SC_TEMPLE_CAULDRON");
    default Schedule(17, 0, UAIState_Eat_Seated(), n"IO_SC_CHAIR_4");
    default Schedule(18, 0, UAIState_Sweep(), n"FP_SC_TEMPLE_SWEEP_1",3000);
    default Schedule(21, 0, UAIState_BrushHair(), n"IO_SC_CHAIR_4");
}

UCLASS()
class UDailyRoutine_SC_WSC_Chani_1205_Meditation : UDailyRoutine_SC_WSC_Chani_1205_Ownership
{
    default Schedule(6, 0, UAIState_Fan(), n"IO_SC_TEMPLE_FAN");
}

UCLASS()
class UDailyRoutine_SC_WSC_Chani_1205_Rest : UDailyRoutine_SC_WSC_Chani_1205_Ownership
{
    default Schedule(0, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(5, 30, UAIState_Eat(), n"IO_SC_CHAIR_4");
    default Schedule(6, 10, UAIState_Sweep(), n"FP_SC_TEMPLE_SWEEP_1",3000);
    default Schedule(9, 30, UAIState_CleanFloor(), n"FP_SC_CLEANFLOOR_2",3000);
    default Schedule(14, 0, UAIState_CookCauldron(), n"IO_SC_TEMPLE_CAULDRON");
    default Schedule(17, 0, UAIState_Eat_Seated(), n"IO_SC_CHAIR_4");
    default Schedule(18, 0, UAIState_Sweep(), n"FP_SC_TEMPLE_SWEEP_1",3000);
    default Schedule(21, 0, UAIState_BrushHair(), n"IO_SC_CHAIR_4");
}

UCLASS()
class UDailyRoutine_SC_WSC_Chani_1205_Invocation : UDailyRoutine_SC_WSC_Chani_1205_Ownership
{
    default Schedule(14, 0, UAIState_CookCauldron(), n"IO_SC_TEMPLE_CAULDRON");
}