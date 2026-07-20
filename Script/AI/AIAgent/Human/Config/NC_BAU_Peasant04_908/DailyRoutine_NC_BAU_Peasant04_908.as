UCLASS()
class UAIAgentConfig_Human_NC_BAU_Peasant04_908 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Peasant04_908::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_BAU_Peasant04_908_Start : UAIState_DailyRoutine_Human
{
    
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Exterior_RiceFields_Huts_01);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_PEASANT908");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_PEASANT908");

    default Schedule(6, 30, UAIState_Eat(), n"IO_NC_CHAIR_BENCH_32");
    default Schedule(7, 15, UAIState_PickRice(), n"FP_NC_PICKRICE_32");
    default Schedule(13, 2, UAIState_Eat(), n"FP_NC_PICKRICE_32");
    default Schedule(13, 32, UAIState_PickRice(), n"FP_NC_PICKRICE_32");
    default Schedule(20, 15, UAIState_Peasant04PlayLute(), n"FP_NC_CAMPFIRE_07");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter(), n"FP_NC_RAINSHELTER_10", 300);
    default ScheduleIfRaining(23, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

class UAIWorldEvent_Explicit_Peasant04PlayLute : UAIWorldEventExplicit
{
    default MaxAllowedNonMainParticipants = 4;
    default MainParticipantUniqueNames.Add(n"NC_BAU_Peasant04_908");

    default EventLocations.Add(FInteractionSpotHandle(n"FP_NC_CAMPFIRE_07"));
    default EventLocationRadius = 2000.0f;

    default BlockCharactersWithAnyOfFromJoining.AddTag(GameplayTag::State_Carrying);
    default WaitForMainParticipantsToHaveAnyOf.AddTag(GameplayTag::Action_Ambient_PlayTune);

}

class UAIState_Peasant04PlayLute : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayTune));
    default WorldEventToActivate = UAIWorldEvent_Explicit_Peasant04PlayLute::StaticClass();

    default OwnedGameplayTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);
}