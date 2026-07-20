UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger11_547 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger11_547::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger11_547_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_PickOre(), n"IO_OM_PICKORE_05");
}

UCLASS()
class UDailyRoutine_OM_VLK_Digger11_547_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_PickOre(), n"FP_OM_FL_PICKORE_02");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}