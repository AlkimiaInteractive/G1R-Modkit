UCLASS()
class UAIAgentConfig_Orc_FM_OSL_Tarrok_2001 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_FM_OSL_Tarrok_2001::StaticClass();
}

UCLASS()
class UDailyRoutine_FM_OSL_Tarrok_2001_Start : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Orc_StandAround(), n"FP_FM_Tarrok",400);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_FM_OSL_Tarrok_2001_Anvil : UAIState_DailyRoutine_Human
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(15);
    default AutoSwitchToRoutine = UDailyRoutine_FM_OSL_Tarrok_2001_Fight;

    default Schedule(0, 0, UAIState_Orc_Workbench(), n"IO_FM_Workbench");

}

UCLASS()
class UDailyRoutine_FM_OSL_Tarrok_2001_Fight : UAIState_DailyRoutine_Human
{
    default Schedule(23, 0, UAIState_Orc_StandAround(), n"FP_FM_Tarrok2",400);
}

UCLASS()
class UAIState_Orc_Workbench : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Crafting_Workbench,InWeight = 0.50f,InDurationSeconds = 13.0f));
}