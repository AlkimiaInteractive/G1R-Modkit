UCLASS()
class UAIAgentConfig_Human_OG_TPL_Templar05_1463 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OG_TPL_Templar05_1463::StaticClass();

}

UCLASS()
class UDailyRoutine_OG_TPL_Templar05_1463_Start : UAIState_DailyRoutine_Human
{
	default Schedule(12, 0, UAIState_Guard(), n"FP_OG_TEMPLAR_GUARD");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}