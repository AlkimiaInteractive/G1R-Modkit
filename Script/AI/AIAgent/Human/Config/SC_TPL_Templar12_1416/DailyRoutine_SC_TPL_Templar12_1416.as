UCLASS()
class UAIAgentConfig_Human_SC_TPL_Templar12_1416 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_TPL_Templar12_1416::StaticClass();

}



UCLASS()
class UDailyRoutine_SC_TPL_Templar12_1416_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_GateWatchman);
    
    default Schedule(7, 0, UAIState_Eat(), n"FP_SC_GUARD_12");
    default Schedule(7, 30, UAIState_Guard(), n"FP_SC_GUARD_12");
    default Schedule(22, 30, UAIState_Eat(), n"FP_SC_GUARD_12");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_SC_GUARD_12");
}