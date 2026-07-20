UCLASS()
class UAIAgentConfig_Human_SC_WSC_Natalia_1207: UAIAgentConfig_Human_Woman
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_WSC_Natalia_1207::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_WSC_Natalia_1207_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Temple_Room_Natalia);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_NATALIA");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_NATALIA");
}

UCLASS()
class UDailyRoutine_SC_WSC_Natalia_1207_Start : UDailyRoutine_SC_WSC_Natalia_1207_Ownership
{
    default Schedule(0, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_Eat_Seated(), n"IO_SC_CHAIR_3");
    default Schedule(7, 0, UAIState_LightOffCandles(), n"IO_SC_CHAIR_4");
    default Schedule(11, 0, UAIState_BrushHair(), n"IO_SC_CHAIR_3");
    default Schedule(14, 0, UAIState_CleanFloor(), n"FP_SC_CLEANFLOOR_1",3000);
    default Schedule(17, 0, UAIState_LightOnCandles(), n"IO_SC_CHAIR_4");
    default Schedule(20, 0, UAIState_Smoke_Ground(), n"IO_SC_TEMPLE_SMOKEPIPE");
}

UCLASS()
class UDailyRoutine_SC_WSC_Natalia_1207_Meditation : UDailyRoutine_SC_WSC_Natalia_1207_Ownership
{
    default Schedule(6, 0, UAIState_LightOffCandles(), n"IO_SC_CHAIR_4");
    default Schedule(7, 0, UAIState_SitPool(), n"FP_SC_SITPOOL");
    default Schedule(18, 0, UAIState_LightOnCandles(), n"IO_SC_CHAIR_4");
    default Schedule(19, 0, UAIState_SitPool(), n"FP_SC_SITPOOL");
}

UCLASS()
class UDailyRoutine_SC_WSC_Natalia_1207_Rest : UDailyRoutine_SC_WSC_Natalia_1207_Ownership
{
    default Schedule(0, 45, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_Eat_Seated(), n"IO_SC_CHAIR_3");
    default Schedule(7, 0, UAIState_LightOffCandles(), n"IO_SC_CHAIR_4");
    default Schedule(11, 0, UAIState_BrushHair(), n"IO_SC_CHAIR_3");
    default Schedule(14, 0, UAIState_CleanFloor(), n"FP_SC_CLEANFLOOR_1",3000);
    default Schedule(17, 0, UAIState_LightOnCandles(), n"IO_SC_CHAIR_4");
    default Schedule(20, 0, UAIState_Smoke_Ground(), n"IO_SC_TEMPLE_SMOKEPIPE");
}

UCLASS()
class UDailyRoutine_SC_WSC_Natalia_1207_Invocation : UDailyRoutine_SC_WSC_Natalia_1207_Ownership
{
    default Schedule(17, 0, UAIState_Smoke_Ground(), n"Interactive_WaterPipe1076196");

}
