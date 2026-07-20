UCLASS()
class UAIAgentConfig_Orc_OW_OWR_Krashok_2405 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_Krashok_2405::StaticClass();
}


UCLASS()
class UDailyRoutine_OW_OWR_Krashok_2405_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_33",400);
}