UCLASS()
class UAIAgentConfig_Orc_OW_OWR_Umosh_2406 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_Umosh_2406::StaticClass();
}


UCLASS()
class UDailyRoutine_OW_OWR_Umosh_2406_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_ArenaSpectator(), n"FP_OTOWN_STAND_53",400);
}

UCLASS()
class UDailyRoutine_OW_OWR_Umosh_2406_Burial : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_26",400);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}