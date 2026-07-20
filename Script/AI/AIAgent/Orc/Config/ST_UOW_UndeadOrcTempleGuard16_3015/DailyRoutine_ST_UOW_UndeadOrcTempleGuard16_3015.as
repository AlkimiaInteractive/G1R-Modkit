UCLASS()
class UAIAgentConfig_Orc_ST_UOW_UndeadOrcTempleGuard16_3015 : UAIAgentConfig_UndeadOrc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_ST_UOW_UndeadOrcTempleGuard16_3015::StaticClass();
}

UCLASS()
class UDailyRoutine_ST_UOW_UndeadOrcTempleGuard16_3015_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_ST_UNDEADGUARD_01");
}
