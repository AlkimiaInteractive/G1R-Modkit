UCLASS()
class UAIAgentConfig_Human_ST_NOV_Novice08_1366 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_ST_NOV_Novice08_1366::StaticClass();
}

UCLASS()
class UDailyRoutine_ST_NOV_Novice08_1366_Start : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Pray(), n"FP_ST_Pray");
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Blocked);
}

UCLASS()
class UDailyRoutine_ST_NOV_Novice08_1366_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Pray(), n"FP_ST_Pray");
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Blocked);
}
