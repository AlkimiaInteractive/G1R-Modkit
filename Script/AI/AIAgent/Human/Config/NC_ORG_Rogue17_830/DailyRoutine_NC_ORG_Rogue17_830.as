UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue17_830 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue17_830::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue17_830_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(2, 5, UAIState_Sleep(), n"FP_NC_GUARD_18");
    default Schedule(8, 30, UAIState_Drink(), n"FP_NC_GUARD_18");
    default Schedule(9, 5, UAIState_Smoke(), n"FP_NC_GUARD_18");
    default Schedule(12, 56, UAIState_Drink(), n"FP_NC_GUARD_18");
    default Schedule(13, 56, UAIState_Smoke(), n"FP_NC_GUARD_18");
    default Schedule(22, 0, UAIState_Drink(), n"FP_NC_GUARD_18");
    default Schedule(22, 30, UAIState_Smoke(), n"FP_NC_GUARD_18");



}