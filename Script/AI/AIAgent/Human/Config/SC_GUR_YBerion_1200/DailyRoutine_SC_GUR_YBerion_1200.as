UCLASS()
class UAIAgentConfig_Human_SC_GUR_YBerion_1200: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_GUR_YBerion_1200::StaticClass();
    default m_CharacterDefaultInteraction = UDefaultCharacterInteraction_Human_SC_GUR_YBerion_1200;
}

UCLASS()
class UDefaultCharacterInteraction_Human_SC_GUR_YBerion_1200 : UDefaultCharacterInteraction
{
    default m_PlayerInteractDistanceFar = 550.0f;
    //default m_PlayerSightDistanceFar = 2000.0f;
}


UCLASS()
class UDailyRoutine_SC_GUR_YBerion_1200_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Temple_Room_Yberion);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_YBERION");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_YBERION");
}

UCLASS()
class UDailyRoutine_SC_GUR_YBerion_1200_Start : UDailyRoutine_SC_GUR_YBerion_1200_Ownership
{
    default Schedule(8, 0, UAIState_ReadBook_Lectern(), n"SC_IO_BOOKLACTERN_01",50.0f);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_GUR_YBerion_1200_Rest : UDailyRoutine_SC_GUR_YBerion_1200_Ownership
{
    //default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(6, 0, UAIState_MeditateYberion(), n"FP_SC_YBERION_MEDITATE",400.0f);

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
    
}


UCLASS()
class UDailyRoutine_SC_GUR_YBerion_1200_Callsleeper : UDailyRoutine_SC_GUR_YBerion_1200_Ownership
{
    default Schedule(23, 0, UAIState_Stay(), n"FP_SC_CALL_SLEEPER");
}


UCLASS()
class UDailyRoutine_SC_GUR_YBerion_1200_Drained : UDailyRoutine_SC_GUR_YBerion_1200_Ownership
{
    default Schedule(23, 0, UAIState_Drained(), n"FP_SC_YBERION_MEDITATE");
}


UCLASS()
class UDailyRoutine_SC_GUR_YBerion_1200_Dead : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Drained(), n"FP_SC_YBERION_MEDITATE");
}

UCLASS()
class UDailyRoutine_SC_GUR_YBerion_1200_Discussion : UDailyRoutine_SC_GUR_YBerion_1200_Ownership
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_SC_STAND_YBERION");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

