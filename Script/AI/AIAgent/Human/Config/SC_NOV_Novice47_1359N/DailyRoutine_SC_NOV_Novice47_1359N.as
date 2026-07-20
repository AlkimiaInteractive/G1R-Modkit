UCLASS()
class UAIAgentConfig_Human_SC_NOV_Novice47_1359N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Novice47_1359N::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_NOV_Novice47_1359N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_RunToStandAround(),n"SC_YBERION_ASHES2");
}
