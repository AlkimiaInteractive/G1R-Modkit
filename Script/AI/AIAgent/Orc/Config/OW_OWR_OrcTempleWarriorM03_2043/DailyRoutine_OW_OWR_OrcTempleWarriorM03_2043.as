UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcTempleWarriorM03_2043 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcTempleWarriorM03_2043::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_24");
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_Temple : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE5",100);
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_RunToTemple : UAIState_DailyRoutine_Orc
{
    //default Schedule(7, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE4",100);
    default Schedule(7, 0, UAIState_RunToOrcStandAround(), n"FP_OTOWN_TEMPLE_ENTRANCE4",100);
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_StealthTemple : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE4",100);
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM03_2043_Trance : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_Pray(), n"FP_OTOWN_TEMPLE_ENTRANCE10");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}