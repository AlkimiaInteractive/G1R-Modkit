UCLASS()
class UAIAgentConfig_Human_SC_NOV_Joru_1305 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Joru_1305::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Joru_1305_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_Joru);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_JORU");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_JORU");
}

UCLASS()
class UDailyRoutine_SC_NOV_Joru_1305_Start : UDailyRoutine_SC_NOV_Joru_1305_Ownership
{
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_PREACHING_03");
}

UCLASS()
class UDailyRoutine_SC_NOV_Joru_1305_AfterTalking : UDailyRoutine_SC_NOV_Joru_1305_Ownership
{
    default Schedule(7, 25, UAIState_Eat(), n"IO_SC_CHAIR_6");
    default Schedule(8, 10, UAIState_Preach(), n"FP_SC_PREACHING_03");
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_PREACHING_03");
    default Schedule(13, 56, UAIState_Preach(), n"FP_SC_PREACHING_03");
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_PREACHING_03");
    default Schedule(22, 30, UAIState_Preach(), n"FP_SC_PREACHING_03");
    default Schedule(23, 50, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

class UDailyRoutine_SC_NOV_Joru_1305_CampDivided : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Drained(), n"FP_OG_DRAINED_01");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Joru_1305_Follow : UAIState_DailyRoutine_Human
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHero(150), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_SC_NOV_Joru_1305_Wait : UAIState_DailyRoutine_Human
{
    default Schedule(13, 30, UAIState_StandAround(), n"FP_OG_STANDAROUND_3",750);
}

UCLASS()
class UDailyRoutine_SC_NOV_Joru_1305_Escape : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_RunToStandAround(),n"FP_OG_STANDAROUND_5");
}