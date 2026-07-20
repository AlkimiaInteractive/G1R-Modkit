UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcTempleWarriorM04_2044 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcTempleWarriorM04_2044::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_25");
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_Temple : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE7",100);
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_RunToTemple : UAIState_DailyRoutine_Orc
{
    //default Schedule(7, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE3",100);
    default Schedule(7, 0, UAIState_RunToOrcStandAround(), n"FP_OTOWN_TEMPLE_ENTRANCE3",100);
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_StealthTemple : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE3",100);
}

class UDailyRoutine_OW_OWR_OrcTempleWarriorM04_2044_Trance : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_Pray(), n"FP_OTOWN_TEMPLE_ENTRANCE9");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}