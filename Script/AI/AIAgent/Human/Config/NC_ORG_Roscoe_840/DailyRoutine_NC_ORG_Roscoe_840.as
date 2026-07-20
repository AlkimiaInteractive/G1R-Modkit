UCLASS()
class UAIAgentConfig_Human_NC_ORG_Roscoe_840 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Roscoe_840::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Roscoe_840_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_36",300);
    default Schedule(8, 0, UAIState_Stand(), n"FP_NC_GUARD_36",300);
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_36",300);
    default Schedule(23, 30, UAIState_CountOre(), n"FP_NC_GUARD_36",300);
}

UCLASS()
class UDailyRoutine_NC_ORG_Roscoe_840_Collapse : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_45",150);
    default Schedule(8, 0, UAIState_CountOre(), n"FP_NC_GUARD_45",150);
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_45",150);
    default Schedule(23, 30, UAIState_CountOre(), n"FP_NC_GUARD_45",150);
}