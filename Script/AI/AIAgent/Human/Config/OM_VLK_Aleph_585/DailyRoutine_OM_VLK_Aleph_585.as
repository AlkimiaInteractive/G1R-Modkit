UCLASS()
class UAIAgentConfig_Human_OM_VLK_Aleph_585 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Aleph_585::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Aleph_585_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_SitAround(), n"IO_OM_CHAIR_BOX_01");
}

UCLASS()
class UDailyRoutine_OM_VLK_Aleph_585_Busy : UAIState_DailyRoutine_Human
{
    default Schedule(4, 0, UAIState_PickOre(), n"IO_OM_PICKORE_04");
}