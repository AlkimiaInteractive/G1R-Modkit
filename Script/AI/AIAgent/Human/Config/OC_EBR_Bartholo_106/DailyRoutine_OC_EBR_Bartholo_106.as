UCLASS()
class UAIAgentConfig_Human_OC_EBR_Bartholo_106 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_EBR_Bartholo_106::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_EBR_Bartholo_106_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_OrebaronsRoom_02);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_BARTHOLO");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_BARTHOLO");
}

UCLASS()
class UDailyRoutine_OC_EBR_Bartholo_106_Start : UDailyRoutine_OC_EBR_Bartholo_106_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_OC_CHAIR_133");
    default Schedule(9, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_25",1000);
    default Schedule(13, 0, UAIState_Eat(), n"IO_OC_CHAIR_52");
    default Schedule(14, 0, UAIState_BartholoPlayLute(), n"FP_OC_PLAYTUNE_03",1000);
    default Schedule(22, 0, UAIState_Eat(), n"IO_OC_CHAIR_52");
    default Schedule(22, 30, UAIState_Guard(), n"FP_OC_STANDAROUND_24",1000);
}

UCLASS()
class UDailyRoutine_OC_EBR_Bartholo_106_Ot : UDailyRoutine_OC_EBR_Bartholo_106_Ownership
{
    default Schedule(22, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_35");
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Outcast_All);
}

UCLASS()
class UDailyRoutine_OC_EBR_Bartholo_106_OMFlood : UDailyRoutine_OC_EBR_Bartholo_106_Ownership
{
    default Schedule(22, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_STORY_BARTHOLO");
}

UCLASS()
class UDailyRoutine_OC_EBR_Bartholo_106_WaitYard : UDailyRoutine_OC_EBR_Bartholo_106_Ownership
{
    default Schedule(22, 0, UAIState_StandAround(), n"FP_OC_STAND_YARD_13");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

class UAIWorldEvent_Explicit_BartholoPlayLute : UAIWorldEventExplicit
{
    default MaxAllowedNonMainParticipants = 4;
    default MainParticipantUniqueNames.Add(n"OC_EBR_Bartholo_106");

    default EventLocations.Add(FInteractionSpotHandle(n"FP_OC_PLAYTUNE_03"));
    default EventLocationRadius = 2000.0f;

    default BlockCharactersWithAnyOfFromJoining.AddTag(GameplayTag::State_Carrying);
    default WaitForMainParticipantsToHaveAnyOf.AddTag(GameplayTag::Action_Ambient_PlayTune);

    UFUNCTION(BlueprintOverride)
    void CharacterJoined(AGothicCharacterState CharacterState)
    {
        auto gomezCharacterState = AGothicCharacterState::FindByUniqueName(n"OC_EBR_Gomez_100");
        if(gomezCharacterState != nullptr)
        {
            gomezCharacterState.AbilitySystemComponent.AddTag(GameplayTag::Action_Ambient_WatchDance);
        }
    }

    UFUNCTION(BlueprintOverride)
    void CharacterLeft(AGothicCharacterState CharacterState)
    {
        auto gomezCharacterState = AGothicCharacterState::FindByUniqueName(n"OC_EBR_Gomez_100");
        if(gomezCharacterState != nullptr)
        {
            if(gomezCharacterState.HasGameplayTag(GameplayTag::Action_Ambient_WatchDance))
            {
                gomezCharacterState.AbilitySystemComponent.RemoveTag(GameplayTag::Action_Ambient_WatchDance);
            }
        }

    }
}

class UAIState_BartholoPlayLute : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayTune));
    default WorldEventToActivate = UAIWorldEvent_Explicit_BartholoPlayLute::StaticClass();

    default OwnedGameplayTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);
}
