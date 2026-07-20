UCLASS()
class UAIAgentConfig_Human_OC_WOC_Seraphia_110 : UAIAgentConfig_Human_Woman
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_WOC_Seraphia_110::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_WOC_Seraphia_110_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GOMEZ_CM_DOUBLE");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GOMEZ_CM_DOUBLE");
}

UCLASS()
class UDailyRoutine_OC_WOC_Seraphia_110_Start : UDailyRoutine_OC_WOC_Seraphia_110_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);
    default Schedule(9, 0, UAIState_Fan(), n"IO_OC_FAN_01",300);
    default Schedule(12, 30, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);
    default Schedule(13, 30, UAIState_Fan(), n"IO_OC_FAN_01",300);
    default Schedule(21, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_BartholoPlayLute::StaticClass(), 0, 0, UAIState_WomanDance(), n"FP_OC_DANCE",400);

}

UCLASS()
class UDailyRoutine_OC_WOC_Seraphia_110_Saved : UDailyRoutine_OC_WOC_Seraphia_110_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_OC_CHAIR_52");
}

UCLASS()
class UDailyRoutine_OC_WOC_Seraphia_110_InExtremo : UDailyRoutine_OC_WOC_Seraphia_110_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);
    default Schedule(12, 30, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);
    default Schedule(21, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);
}

UCLASS()
class UDailyRoutine_OC_WOC_Seraphia_110_Finale: UDailyRoutine_OC_WOC_Seraphia_110_Ownership
{
    default Schedule(9, 0, UAIState_Stay(), n"FP_OC_SPEAK_GOMEZ_ROOM2",200);
}

class UAIWorldEvent_Explicit_SeraphiaDance : UAIWorldEventExplicit
{
    default MaxAllowedNonMainParticipants = 1;
    default MainParticipantUniqueNames.Add(n"OC_WOC_Seraphia_110");

    default EventLocations.Add(FInteractionSpotHandle(n"FP_OC_DANCE"));
    default EventLocationRadius = 2000.0f;

    default BlockCharactersWithAnyOfFromJoining.AddTag(GameplayTag::State_Carrying);
    default WaitForMainParticipantsToHaveAnyOf.AddTag(GameplayTag::Action_Ambient_WomanDance);
  
}

class UAIState_SeraphiaDance : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_WomanDance));
    default WorldEventToActivate = UAIWorldEvent_Explicit_SeraphiaDance::StaticClass();

    default OwnedGameplayTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);
}

UCLASS()
class UDailyRoutine_OC_WOC_Seraphia_110_NoGomez : UDailyRoutine_OC_WOC_Seraphia_110_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);
    default Schedule(12, 30, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);
    default Schedule(21, 0, UAIState_CleanFloor(), n"FP_OC_SWEEP_01",300);

    default ScheduleDuringEvent(UAIWorldEvent_Explicit_BartholoPlayLute::StaticClass(), 0, 0, UAIState_SeraphiaDance(), n"FP_OC_DANCE",400);

}