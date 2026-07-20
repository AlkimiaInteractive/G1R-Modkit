UCLASS()
class UAIAgentConfig_Human_OM_STT_Viper_302 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_STT_Viper_302::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_STT_Viper_302_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_BlowFire(), n"IO_OM_BLOWFIRE_01");
    default Schedule(5, 0, UAIState_Rest(), n"IO_OM_CHAIR_06");
    default Schedule(7, 0, UAIState_BlowFire(), n"IO_OM_BLOWFIRE_01");
    default Schedule(12, 0, UAIState_Eat(), n"IO_OM_CHAIR_06");
    default Schedule(14, 0, UAIState_BlowFire(), n"IO_OM_BLOWFIRE_01");
    default Schedule(22, 0, UAIState_Rest(), n"IO_OM_CHAIR_06");
}

UCLASS()
class UDailyRoutine_OM_STT_Viper_302_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Sit(), n"FP_OM_FL_REST_03");
    default Schedule(14, 0, UAIState_Eat(), n"FP_OM_FL_REST_03");
    default Schedule(18, 0, UAIState_Sit(), n"FP_OM_FL_REST_03");
    default Schedule(20, 0, UAIState_Guard(), n"FP_OM_FL_GUARD_05");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OM_STT_Viper_302_AfterCollapsed : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_53");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}