UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM21_2088 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM21_2088::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM21_2088_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 0, UAIState_Orc_PracticeAxe(), n"FP_OTOWN_PRACTICESWORD_01");
    default Schedule(20, 0, UAIState_Orc_EatOnGround(), n"FP_OTOWN_CAMPFIRE_07", 500);
    default Schedule(22, 00, UAIState_Orc_SmashFood(), n"IO_OTOWN_SMASH_08");
    default Schedule(0, 10, UAIState_Sleep(), n"FP_OTOWN_SLEEP_21");
}