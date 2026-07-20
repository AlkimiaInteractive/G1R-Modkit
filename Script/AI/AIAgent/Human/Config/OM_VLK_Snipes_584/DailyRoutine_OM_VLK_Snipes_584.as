UCLASS()
class UAIAgentConfig_Human_OM_VLK_Snipes_584 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Snipes_584::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Snipes_584_Start : UAIState_DailyRoutine_Human
{
    //default Schedule(0, 0, UAIState_StandAround(), n"FP_OM_SIT_01");
    default Schedule(12, 0, UAIState_SitAround(), n"FP_OM_SIT_01");
}


UCLASS()
class UDailyRoutine_OM_VLK_Snipes_584_Watch : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_Guard(), n"FP_OM_GUARD_04");
}

