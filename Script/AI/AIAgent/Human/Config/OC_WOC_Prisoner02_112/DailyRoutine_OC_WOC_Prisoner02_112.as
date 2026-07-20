UCLASS()
class UAIAgentConfig_Human_OC_WOC_Prisoner02_112 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_WOC_Prisoner02_112::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_WOC_Prisoner02_112_Start : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::State_Imprisoned);

    default Schedule(6, 0, UAIState_Sit(), n"IO_CHAIR_OC_SITAROUND_SLAVE_01",200.0f);
    default Schedule(18, 0, UAIState_Sit(), n"FP_OC_SITAROUND_SLAVE_01",200.0f);

    default ScheduleIfRaining(6, 0, UAIState_Sit(), n"IO_CHAIR_OC_SITAROUND_SLAVE_01",200.0f);
    default ScheduleIfRaining(18, 0, UAIState_Sit(), n"FP_OC_SITAROUND_SLAVE_01",200.0f);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}