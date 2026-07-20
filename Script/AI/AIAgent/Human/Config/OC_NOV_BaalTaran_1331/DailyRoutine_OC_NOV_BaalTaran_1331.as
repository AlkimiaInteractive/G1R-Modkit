UCLASS()
class UAIAgentConfig_Human_OC_NOV_BaalTaran_1331 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_NOV_BaalTaran_1331::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_NOV_BaalTaran_Swamp_1331_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_BaalNamib);
}


UCLASS()
class UDailyRoutine_OC_NOV_BaalTaran_1331_Start : UAIState_DailyRoutine_Human
{

    default Schedule(0, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_09",500);
    default Schedule(5, 0, UAIState_StandAround(), n"FP_OC_CAMPFIRE_09",2000);
    default Schedule(16, 30, UAIState_Start_BaalTaranPreach(), n"FP_OC_WE_PREACH_02",100);
    default Schedule(19, 0, UAIState_Campfire(), n"FP_OC_CAMPFIRE_09",2000);
    default ScheduleIfRaining(10, 0, UAIState_RainShelter_Digger(), n"FP_OC_RAINSHELTER_147",100);
}

UCLASS()
class UDailyRoutine_OC_NOV_BaalTaran_1331_AfterCollapse : UDailyRoutine_OC_NOV_BaalTaran_Swamp_1331_Ownership
{

    default Schedule(10, 0, UAIState_StandAround(), n"FP_SC_SMALLTALK_30",2000);
    default Schedule(23, 0, UAIState_Sleep(), n"IO_SC_BED_BAALNAMIB",2000);

    default ScheduleIfRaining(10, 0, UAIState_RainShelter_Digger(), n"FP_SC_RAINSHELTER_09",100);
    default Schedule(23, 0, UAIState_Sleep(), n"IO_SC_BED_BAALNAMIB",2000);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

class UAIWorldEvent_Explicit_BaalTaranPreach : UAIWorldEventExplicit
{
    default MaxAllowedNonMainParticipants = 4;
    default MainParticipantUniqueNames.Add(n"OC_NOV_BaalTaran_1331");

    default EventLocations.Add(FInteractionSpotHandle(n"FP_OC_WE_PREACH_02"));
    default EventLocationRadius = 2500.0f;

    default BlockCharactersWithAnyOfFromJoining.AddTag(GameplayTag::State_Carrying);
    default WaitForMainParticipantsToHaveAnyOf.AddTag(GameplayTag::Action_Ambient_Preach);
}

class UAIState_Start_BaalTaranPreach : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Preach));
    default WorldEventToActivate = UAIWorldEvent_Explicit_BaalTaranPreach::StaticClass();

    default OwnedGameplayTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);
}