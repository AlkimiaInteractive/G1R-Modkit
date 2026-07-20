UCLASS()
class UDailyRoutines_Peasants : UAIState_DailyRoutine_Human
{
    default ScheduleDuringEvent(UAIWorldEvent_Explicit_Peasant04PlayLute::StaticClass(), 0, 0, UAIState_WE_LuteEvent(), n"FP_NC_CAMPFIRE_07");
}

class UAIState_QueueWashThenPickRice : UAIState_RandomInteractions
{
        default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_WashSelf, InDurationSeconds = 15.0));
        default Interactions.Last().Priority = 2;
        default Interactions.Last().RequireTimeSinceAction.Add(GameplayTag::Action_Ambient_WashSelf, FInGameTime::FromHours(20));
        
        default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, InDurationSeconds = 5.0));
        default Interactions.Last().Priority = 1;
        default Interactions.Last().RequireTimeSinceAction.Add(GameplayTag::Action_Ambient_WashSelf, FInGameTime::FromHours(10));

        default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PickRice));

        default AdditionalLocationAndRadius.Add(n"FP_NC_WASHSELF_03", 800.0f);
}