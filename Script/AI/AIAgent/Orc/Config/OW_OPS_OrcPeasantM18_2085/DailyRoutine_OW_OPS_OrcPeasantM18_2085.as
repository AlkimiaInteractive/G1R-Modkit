UCLASS()
class UAIAgentConfig_Orc_OW_OPS_OrcPeasantM18_2085 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_OrcPeasantM18_2085::StaticClass();
}

class UDailyRoutine_OW_OPS_OrcPeasantM18_2085_Start : UAIState_DailyRoutine_Creature
{
    default Schedule(8, 30, UAIState_StandAround(), n"FP_OTOWN_STAND_13");
    default Schedule(13, 45, UAIState_Orc_Eat(), n"FP_OTOWN_STAND_13", 300); 
    default Schedule(17, 20, UAIState_Orc_EatOnGround(), n"FP_OTOWN_GROUND_07", 300);
    default Schedule(23, 10, UAIState_Sleep(), n"FP_OTOWN_SLEEP_18");
}