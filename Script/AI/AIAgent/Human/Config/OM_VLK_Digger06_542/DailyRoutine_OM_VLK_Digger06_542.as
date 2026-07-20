UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger06_542 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger06_542::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger06_542_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_PickOre(), n"IO_OM_PICKORE_26");
    default Schedule(17, 0, UAIState_PickOre(), n"IO_OM_PICKORE_26");
}