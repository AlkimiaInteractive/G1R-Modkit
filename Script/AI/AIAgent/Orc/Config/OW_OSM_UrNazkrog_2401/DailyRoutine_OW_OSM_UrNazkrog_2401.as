UCLASS()
class UAIAgentConfig_Orc_OW_OSM_UrNazkrog_2401 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OSM_UrNazkrog_2401::StaticClass();
}

class UDailyRoutine_OW_OSM_UrNazkrog_2401_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(8, 0, UAIState_Orc_PotionAlchemy_Female(), n"IO_OTOWN_ALCHEMY");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

class UDailyRoutine_OW_OSM_UrNazkrog_2401_Follow: UAIState_DailyRoutine_Orc
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(8, 0, UAIState_OW_OSM_UrNazkrog_2401_FollowHeroWhenFarAwayThenChangeRoutine(), Location::Anywhere);
}

class UDailyRoutine_OW_OSM_UrNazkrog_2401_Temple: UAIState_DailyRoutine_Orc
{
    default Schedule(8, 0, UAIState_Orc_StandAroundInConversation(), n"FP_OTOWN_TEMPLE_ENTRANCE",100);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

class UDailyRoutine_OW_OSM_UrNazkrog_2401_UluMulu: UAIState_DailyRoutine_Orc
{
    default Schedule(8, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_2");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

class UDailyRoutine_OW_OSM_UrNazkrog_2401_Trance: UAIState_DailyRoutine_Orc
{
    default Schedule(8, 0, UAIState_Orc_StandAroundInConversation(), n"FP_OTOWN_TEMPLE_ENTRANCE11",100);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UAIState_OW_OSM_UrNazkrog_2401_FollowHeroWhenFarAwayThenChangeRoutine : UAIState_FollowWhenCloseThenDoRoutine
{
    default FollowCharacterUniqueName = n"Hero";
    default RoutineToDoAfterLosingTarget = UDailyRoutine_OW_OSM_UrNazkrog_2401_Temple;
    default DistanceUntilStop = 5000.f;
    default FollowDistance = 150.0f;
    default SprintWhenFurtherAwayThan = 750.f;
    default bCopyWalkSpeed = true;
}