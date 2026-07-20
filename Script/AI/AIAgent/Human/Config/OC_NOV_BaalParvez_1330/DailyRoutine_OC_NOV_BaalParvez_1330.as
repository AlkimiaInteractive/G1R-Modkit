UCLASS()
class UAIAgentConfig_Human_OC_NOV_BaalParvez_1330 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_NOV_BaalParvez_1330::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_NOV_BaalParvez_1330_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_39);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_BAALPARVEZ");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_BAALPARVEZ");
}

UCLASS()
class UDailyRoutine_OC_NOV_BaalParvez_1330_Swamp_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_BaalTondral);
    default KnownPlaces.Add(Location::Bed, n"IO_SC_BED_BAALTONDRAL");
    default KnownPlaces.Add(Location::Home, n"IO_SC_BED_BAALTONDRAL");
}

UCLASS()
class UDailyRoutine_OC_NOV_BaalParvez_1330_Start : UDailyRoutine_OC_NOV_BaalParvez_1330_Ownership
{
    default Schedule(7, 45, UAIState_StandAround(), n"FP_OC_STANDAROUND_49",2000);
    default Schedule(11, 00, UAIState_Start_BaalParvezPreach(), n"FP_OC_WE_PREACH_01",100);
    default Schedule(14, 45, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_30",200);
    default Schedule(15, 45, UAIState_StandAround(), n"FP_OC_STANDAROUND_49",2000);
    default Schedule(22, 35, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(7, 45, UAIState_StandAround(), n"FP_OC_STANDAROUND_49",2000);
    default ScheduleIfRaining(14, 45, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_30",100);
    default ScheduleIfRaining(15, 45, UAIState_StandAround(), n"FP_OC_STANDAROUND_49",2000);
    default ScheduleIfRaining(22, 35, UAIState_Sleep(), Location::Bed);
}


UCLASS()
class UDailyRoutine_OC_NOV_BaalParvez_1330_AfterCollapse : UDailyRoutine_OC_NOV_BaalParvez_1330_Swamp_Ownership
{
    default Schedule(6, 0, UAIState_Eat(), n"IO_SC_BENCH_1", 200);
    default Schedule(7, 30, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default Schedule(12, 56, UAIState_Meditate(), n"FP_SC_PREACHING_04");
    default Schedule(13, 56, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default Schedule(21, 30, UAIState_Meditate(), n"FP_SC_PREACHING_04");
    default Schedule(22, 30, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default Schedule(23, 0, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_02",600);
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(7, 0, UAIState_RainShelter(), n"FP_SC_RAINSHELTER_01");
    default ScheduleIfRaining(7, 30, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(12, 56, UAIState_Meditate(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(13, 56, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(21, 30, UAIState_Meditate(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(22, 30, UAIState_Preach(), n"FP_SC_PREACHING_04");
    default ScheduleIfRaining(23, 0, UAIState_Smoke_Ground(), n"IO_SC_WATERPIPE_02",600);
    default ScheduleIfRaining(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

class UAIState_Start_BaalParvezPreach : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Preach));
    default WorldEventToActivate = UAIWorldEvent_Explicit_BaalParvezPreach::StaticClass();

    default OwnedGameplayTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);
}

class UAIWorldEvent_Explicit_BaalParvezPreach : UAIWorldEventExplicit
{
    default MaxAllowedNonMainParticipants = 3;
    default MainParticipantUniqueNames.Add(n"OC_NOV_BaalParvez_1330");

    default EventLocations.Add(FInteractionSpotHandle(n"FP_OC_WE_PREACH_01"));
    default EventLocationRadius = 3000.0f;

    default BlockCharactersWithAnyOfFromJoining.AddTag(GameplayTag::State_Carrying);
    default WaitForMainParticipantsToHaveAnyOf.AddTag(GameplayTag::Action_Ambient_Preach);
}

UCLASS()
class UDailyRoutine_OC_NOV_BaalParvez_1330_Guide : UDailyRoutine_OC_NOV_BaalParvez_1330_Ownership
{
    default OwnedGameplayTags.AddTag(GameplayTag::Character_Personality_Brave);
    
    default Schedule(7, 45, UAIState_OC_NOV_BaalParvez_1330_Guide(), Location::Anywhere);
    default Schedule(20,00, UAIState_OC_NOV_BaalParvez_1330_Guide_Night(), Location::Anywhere);
}

UCLASS()
class UAIState_OC_NOV_BaalParvez_1330_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 20.f;
    default WaitAtPlaceAction = UAIState_StandAround::StaticClass();
    default bReturnToPathStart = true;
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_start", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_6", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_7", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_8", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_9", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_10", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_11", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_12", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_13", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_14", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_15", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_SwampCamp_end", EWalkSpeed::Running));
}

UCLASS()
class UAIState_OC_NOV_BaalParvez_1330_Guide_Night : UAIState_OC_NOV_BaalParvez_1330_Guide
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;
}

