UCLASS()
class UAIAgentConfig_Human_SC_VLK_Melvin_582: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_VLK_Melvin_582::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_VLK_Melvin_582_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Melvin);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_MELVIN_CM");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_MELVIN_CM");
}

UCLASS()
class UDailyRoutine_SC_VLK_Melvin_582_Start : UDailyRoutine_SC_VLK_Melvin_582_Ownership
{
    default Schedule(7, 25, UAIState_Listen(), n"FP_SC_MEDITATE_15");
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_MEDITATE_15");
    default Schedule(13, 56, UAIState_Listen(), n"FP_SC_MEDITATE_15");
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_MEDITATE_15");
    default Schedule(22, 30, UAIState_Listen(), n"FP_SC_MEDITATE_15");
    default Schedule(23, 50, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_SC_VLK_Melvin_582_WaitDusty : UDailyRoutine_SC_VLK_Melvin_582_Ownership
{
    default Schedule(8, 0, UAIState_Smoke(), n"FP_SC_SMOKE_22");
}

UCLASS()
class UDailyRoutine_SC_VLK_Melvin_582_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Drained(), n"FP_OG_DRAINED_04");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_VLK_Melvin_582_Confrontation : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_StandAround(), n"FP_ST_MELVIN_CONFRONTATION");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}