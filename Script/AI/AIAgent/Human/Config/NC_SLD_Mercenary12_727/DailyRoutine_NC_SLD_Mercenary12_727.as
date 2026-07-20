UCLASS()
class UAIAgentConfig_Human_NC_SLD_Mercenary12_727 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Mercenary12_727::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_SLD_Mercenary12_727_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_02");
    default Schedule(8, 0, UAIState_Eat(), n"FP_NC_GUARD_02");
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_02");
    default Schedule(22, 0, UAIState_Eat(), n"FP_NC_GUARD_02");
}
