UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue16_829 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue16_829::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue16_829_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);

    default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_19");
    default Schedule(6, 5, UAIState_Guard(), n"FP_NC_GUARD_19");
}