UCLASS()
class UAIAgentConfig_Human_BC_BAN_Torik_864 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Torik_864::StaticClass();

}

UCLASS()
class UDailyRoutine_BC_BAN_Torik_864_Start : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Trader_CountOre(), n"FP_BC_STANDAROUND_19",200);
    default Schedule(20, 0, UAIState_Trader_CountOre(), n"FP_BC_STANDAROUND_20",500);
}