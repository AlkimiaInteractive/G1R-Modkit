UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue37_886N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue37_886N::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue37_886N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Lurk(), n"FP_OW_CONVOY_11");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue37_886N_AfterConvoy : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OW_CONVOY_26");
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue37_886N_Shipment  : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"EZ_BANDIT_ATTACK7");
}