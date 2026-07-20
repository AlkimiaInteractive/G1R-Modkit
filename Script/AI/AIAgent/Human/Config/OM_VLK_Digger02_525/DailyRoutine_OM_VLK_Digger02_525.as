UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger02_525 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger02_525::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger02_525_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_PickOre(), n"IO_OM_PICKORE_30");
    default Schedule(17, 0, UAIState_PickOre(), n"IO_OM_PICKORE_30");
}