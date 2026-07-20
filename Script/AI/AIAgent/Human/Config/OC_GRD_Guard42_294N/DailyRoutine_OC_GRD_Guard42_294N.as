UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard42_294N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard42_294N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard42_294N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_RunToGuard(),n"FP_OC_GUARDPASSAGE_49");
}