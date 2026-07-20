UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcWarriorM13_2026 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcWarriorM13_2026::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcWarriorM13_2026_AfterFight : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_05");
}

class UDailyRoutine_OW_OWR_OrcWarriorM13_2026_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_32");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}