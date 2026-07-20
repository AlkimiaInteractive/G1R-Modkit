UCLASS()
class UAIAgentConfig_Orc_OW_OPS_Muk_2404 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_Muk_2404::StaticClass();
}

class UDailyRoutine_OW_OPS_Muk_2404_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(17, 0, UAIState_StandAround(), n"FP_OTOWN_STAND_48");
}

class UDailyRoutine_OW_OPS_Muk_2404_Alone : UAIState_DailyRoutine_Creature
{
    default Schedule(17, 0, UAIState_StandAround(), n"FP_OTOWN_STAND_48");
    default Schedule(0, 0, UAIState_Sleep(), n"IO_OTOWN_BED_MUK");
}

class UDailyRoutine_OW_OPS_Muk_2404_OpenGate : UAIState_DailyRoutine_Creature
{
    default Schedule(17, 0, UAIState_OW_OPS_Muk_2404_OpenOrcSecretDoor(), n"FP_OTOWN_STAND_49");
}

UCLASS()
class UAIState_OW_OPS_Muk_2404_OpenOrcSecretDoor : UAIState_OpenDoorOrGate
{
    default RoutineAfterOpening = UDailyRoutine_OW_OPS_Muk_2404_Alone;
    default DoorConfigName = n"Orc_Secret_Door";
    default OpenTag = GameplayTag::Action_Door_OrcSecretDoor;
    default WaitTimeBeforeSwitchingRoutine = 3.f; 
}