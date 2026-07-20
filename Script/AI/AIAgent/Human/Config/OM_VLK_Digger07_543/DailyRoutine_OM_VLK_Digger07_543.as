UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger07_543 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger07_543::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger07_543_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_PickOre(), n"IO_OM_PICKORE_24");
    default Schedule(17, 0, UAIState_PickOre(), n"IO_OM_PICKORE_24");
}