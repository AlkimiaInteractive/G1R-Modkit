UCLASS()
class UAIAgentConfig_Human_OM_VLK_Garp_587 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Garp_587::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Garp_587_Start : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_PickOre(), n"IO_OM_PICKORE_14");
}