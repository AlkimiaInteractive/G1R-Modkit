UCLASS()
class UAIAgentConfig_Human_OC_WOC_Prisoner01_111 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_WOC_Prisoner01_111::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_WOC_Prisoner01_111_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::State_Imprisoned);

    default Schedule(6, 0, UAIState_Sit(), n"FP_OC_SITAROUND_SLAVE_03",200.0f);

    default ScheduleIfRaining(6, 0, UAIState_Sit(), n"FP_OC_SITAROUND_SLAVE_03",200.0f);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}