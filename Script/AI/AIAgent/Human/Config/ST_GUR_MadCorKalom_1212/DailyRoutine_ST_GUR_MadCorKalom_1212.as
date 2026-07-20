UCLASS()
class UAIAgentConfig_Human_ST_GUR_MadCorKalom_1212: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_GUR_MadCorKalom_1212::StaticClass();
    default m_SpawnSettings.MaxSignificanceRadius = 10000.f;

}


UCLASS()
class UDailyRoutine_ST_GUR_MadCorKalom_1212_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_StandAround(), n"FP_ST_KALOM_CONFRONTATION");

    default RolesWhileAssigned.AddTag(GameplayTag::State_Perceptions_Ignore_NPCs);
}
