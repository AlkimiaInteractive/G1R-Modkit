UCLASS()
class UAIAgentConfig_Orc_OW_OWR_ToChurnagg_2403 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OWR_ToChurnagg_2403::StaticClass();
}

UCLASS()
class UDailyRoutine_OW_OWR_ToChurnagg_2403_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(23, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_THRONE_GUARD",400);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

class UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        NPCState.ForcedSignificanceOverride = 1.0f;

        while (IsInDailyRoutineSimulation())
        {
            NPCState.DailyRoutineSimulation.RequestUpdate();
            WaitOneTick();
        }

        AI.GotoPreferredLocation();

        while (!bShouldExitState)
        {
            AI.StandAround();
            WaitOneTick();
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        if (IsValid(NPCState))
        {
            NPCState.ForcedSignificanceOverride = -1.0f;
        }
    }
}

UCLASS()
class UDailyRoutine_OW_OWR_ToChurnagg_2403_Temple : UAIState_DailyRoutine_Orc
{
    default Schedule(23, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE6",100);
}

class UDailyRoutine_OW_OWR_ToChurnagg_2403_RunToTemple : UAIState_DailyRoutine_Orc
{
    //default Schedule(7, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE2",100);
    default Schedule(7, 0, UAIState_RunToOrcStandAround(), n"FP_OTOWN_TEMPLE_ENTRANCE2",100);
}

class UDailyRoutine_OW_OWR_ToChurnagg_2403_StealthTemple : UAIState_DailyRoutine_Orc
{
    default Schedule(7, 0, UAIState_Orc_EntranceIntelligence_SpawnAndWalkToSpot(), n"FP_OTOWN_TEMPLE_ENTRANCE2",100);
}

UCLASS()
class UDailyRoutine_OW_OWR_ToChurnagg_2403_UluMulu : UAIState_DailyRoutine_Orc
{
    default Schedule(23, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_GUARD_3",400);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OW_OWR_ToChurnagg_2403_Trance : UAIState_DailyRoutine_Orc
{
    default Schedule(23, 0, UAIState_Orc_GuardPassage(), n"FP_OTOWN_TEMPLE_ENTRANCE8",400);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}