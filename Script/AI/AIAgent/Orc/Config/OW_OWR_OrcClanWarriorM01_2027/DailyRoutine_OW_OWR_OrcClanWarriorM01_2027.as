UCLASS()
class UAIAgentConfig_Orc_OW_OWR_OrcClanWarriorM01_2027 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_OrcClanWarriorM01_2027::StaticClass();
}

class UDailyRoutine_OW_OWR_OrcClanWarriorM01_2027_AfterFight : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_06");
}

class UDailyRoutine_OW_OWR_OrcClanWarriorM01_2027_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_31");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}