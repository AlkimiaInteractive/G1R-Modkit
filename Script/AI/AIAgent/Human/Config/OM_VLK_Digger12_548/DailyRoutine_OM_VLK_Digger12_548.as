UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger12_548 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger12_548::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger12_548_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_PickOre(), n"IO_OM_PICKORE_06");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger12_548_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_Sit(), n"FP_OM_FL_REST_04");
    default Schedule(15, 0, UAIState_Drink(), n"FP_OM_FL_REST_04");
    default Schedule(19, 0, UAIState_Sit(), n"FP_OM_FL_REST_04");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}