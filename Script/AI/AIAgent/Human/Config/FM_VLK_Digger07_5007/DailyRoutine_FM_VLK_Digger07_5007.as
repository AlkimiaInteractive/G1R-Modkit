UCLASS()
class UAIAgentConfig_Human_FM_VLK_Digger07_5007 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_VLK_Digger07_5007::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_VLK_Digger07_5007_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_PickOre(), n"IO_FM_PICKORE_20");
}
