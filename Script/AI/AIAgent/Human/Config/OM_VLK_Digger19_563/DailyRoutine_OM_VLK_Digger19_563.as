UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger19_563 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger19_563::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger19_563_Start : UAIState_DailyRoutine_Human
{
    default Schedule(17, 0, UAIState_PickOre(), n"IO_OM_PICKORE_12");
}