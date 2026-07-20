UCLASS()
class UDailyRoutine_Digger : UAIState_DailyRoutine_Human
{
    default ScheduleDuringEvent(UAIWorldEvent_Explicit_BaalParvezPreach::StaticClass(), 11, 0, UAIState_Listen(), n"FP_OC_WE_LISTEN_01");

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_BaalTaranPreach::StaticClass(), 16, 30, UAIState_Listen(), n"FP_OC_WE_LISTEN_06");

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_Digger19PlayLute::StaticClass(), 19, 0, UAIState_WE_LuteEvent(), n"FP_OC_STANDAROUND_49");
}

class UAIWorldEvent_Explicit_Digger19PlayLute : UAIWorldEventExplicit
{
    default MaxAllowedNonMainParticipants = 4;
    default MainParticipantUniqueNames.Add(n"OC_VLK_Digger19_521");

    default EventLocations.Add(FInteractionSpotHandle(n"FP_OC_STANDAROUND_29"));
    default EventLocationRadius = 2000.0f;

    default BlockCharactersWithAnyOfFromJoining.AddTag(GameplayTag::State_Carrying);
    default WaitForMainParticipantsToHaveAnyOf.AddTag(GameplayTag::Action_Ambient_PlayTune);

}

class UAIState_Digger19PlayLute : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayTune));
    default WorldEventToActivate = UAIWorldEvent_Explicit_Digger19PlayLute::StaticClass();

    default OwnedGameplayTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);
}