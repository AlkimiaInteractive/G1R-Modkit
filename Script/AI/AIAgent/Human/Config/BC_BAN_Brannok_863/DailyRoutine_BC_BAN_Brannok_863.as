UCLASS()
class UAIAgentConfig_Human_BC_BAN_Brannok_863 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Brannok_863::StaticClass();

}

UCLASS()
class UDailyRoutine_BC_BAN_Brannok_863_Start : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Guard(), n"FP_BC_GUARD_CAVE");
}