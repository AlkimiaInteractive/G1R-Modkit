UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM22_2089 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM22_2089::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM22_2089_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 20, UAIState_Orc_PracticeAxe(), n"FP_OTOWN_PRACTICESWORD_02");
    default Schedule(20, 10, UAIState_Orc_EatOnGround(), n"FP_OTOWN_GROUND_04", 500);
    default Schedule(22, 30, UAIState_Orc_SmashFood(), n"IO_OTOWN_SMASH_09");
    default Schedule(0, 20, UAIState_Sleep(), n"FP_OTOWN_SLEEP_22");
}