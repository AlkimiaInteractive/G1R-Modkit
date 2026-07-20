UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger15_551 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger15_551::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger15_551_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_PickOre(), n"IO_OM_PICKORE_31");
}