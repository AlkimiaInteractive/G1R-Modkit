UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger22_571 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger22_571::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger22_571_Start : UAIState_DailyRoutine_Human
{
    default Schedule(17, 0, UAIState_PickOre(), n"IO_OM_PICKORE_19");
}