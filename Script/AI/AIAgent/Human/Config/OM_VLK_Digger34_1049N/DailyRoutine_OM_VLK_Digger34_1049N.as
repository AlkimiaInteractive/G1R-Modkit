UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger34_1049N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger34_1049N::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger34_1049N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_GrindingMill_Bucket(), n"IO_OM_TOSSORE_01");
    
}