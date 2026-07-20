UCLASS()
class UAIAgentConfig_Human_FM_VLK_Digger05_5005 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_FM_VLK_Digger05_5005::StaticClass();

}



UCLASS()
class UDailyRoutine_FM_VLK_Digger05_5005_Start : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_PickOre(), n"IO_FM_PICKORE_18");
}
