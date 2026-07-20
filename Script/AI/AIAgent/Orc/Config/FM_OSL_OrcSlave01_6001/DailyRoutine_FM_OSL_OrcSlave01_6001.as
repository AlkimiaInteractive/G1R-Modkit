UCLASS()
class UAIAgentConfig_Orc_FM_OSL_OrcSlave01_6001 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_FM_OSL_OrcSlave01_6001::StaticClass();
}

UCLASS()
class UDailyRoutine_FM_OSL_OrcSlave01_6001_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Orc_SitOnFloor(), n"FP_ORC_SIT_A_OM_01");
}

UCLASS()
class UDailyRoutine_FM_OSL_OrcSlave01_6001_Stomper : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Orc_GrindingMachine(), n"IO_OM_ORC_GRINDINGMACHINE_01");
    default Schedule(22, 0, UAIState_Orc_GrindOre(), n"IO_OM_GRINDMILL_01");
}