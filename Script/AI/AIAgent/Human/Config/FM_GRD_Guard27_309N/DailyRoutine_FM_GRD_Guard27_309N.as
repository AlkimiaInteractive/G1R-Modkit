UCLASS()
class UAIAgentConfig_Human_FM_GRD_Guard27_309N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_GRD_Guard27_309N::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_GRD_Guard27_309N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Smoke(), n"FP_OM_GUARD_42");
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OM_GUARD_44");
    default Schedule(14, 0, UAIState_Smoke(), n"FP_OM_GUARD_42");
    default Schedule(20, 0, UAIState_LeanWall(), n"FP_OM_GUARD_43");
}
