UCLASS()
class UAIAgentConfig_Orc_OW_OWR_Chokta_2407 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_Chokta_2407::StaticClass();
}

UCLASS()
class UDailyRoutine_OW_OWR_Chokta_2407_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Orc_GuardPassage(), n"FP_OA_GUARDPASSAGE_01",400);
}

UCLASS()
class UDailyRoutine_OW_OWR_Chokta_2407_Fight : UAIState_DailyRoutine_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
    
    default Schedule(23, 0, UAIState_Orc_StandAround(), n"FP_OA_STANDAROUND_01",400);
}