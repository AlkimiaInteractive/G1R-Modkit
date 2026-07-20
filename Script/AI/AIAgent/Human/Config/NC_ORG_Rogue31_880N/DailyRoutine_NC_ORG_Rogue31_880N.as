UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue31_880N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue31_880N::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue31_880N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_Rogue31PlayLute(), n"FP_NC_PLAYLUTE",200);
    default Schedule(15, 0, UAIState_Drink(), n"IO_NC_CHAIR_50",200);
    default Schedule(19, 0, UAIState_Rogue31PlayLute(), n"FP_NC_PLAYLUTE",200);
    default Schedule(23, 0, UAIState_Drink(), n"IO_NC_CHAIR_50",200);

}

class UAIWorldEvent_Explicit_Rogue31PlayLute : UAIWorldEventExplicit
{
    default MaxAllowedNonMainParticipants = 2;
    default MainParticipantUniqueNames.Add(n"NC_ORG_Rogue31_880N");

    default EventLocations.Add(FInteractionSpotHandle(n"FP_NC_PLAYLUTE"));
    default EventLocationRadius = 2000.0f;

    default BlockCharactersWithAnyOfFromJoining.AddTag(GameplayTag::State_Carrying);
    default WaitForMainParticipantsToHaveAnyOf.AddTag(GameplayTag::Action_Ambient_PlayTune);

}

class UAIState_Rogue31PlayLute : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayTune));
    default WorldEventToActivate = UAIWorldEvent_Explicit_Rogue31PlayLute::StaticClass();

    default OwnedGameplayTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);
}