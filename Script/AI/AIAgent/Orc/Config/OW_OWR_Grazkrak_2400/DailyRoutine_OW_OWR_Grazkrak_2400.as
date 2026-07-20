UCLASS()
class UAIAgentConfig_Orc_OW_OWR_Grazkrak_2400 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_Grazkrak_2400::StaticClass();
}

UCLASS()
class UDailyRoutine_OW_OWR_Grazkrak_2400_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_ARENA",400);
}