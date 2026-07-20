UCLASS()
class UAIAgentConfig_Human_OC_EBR_Gomez_100 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_EBR_Gomez_100::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_Owmership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_GomezRoom);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_Virtual_GomezChest);

    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GOMEZ_CM");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GOMEZ_CM");
}


UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_Start : UDailyRoutine_OC_EBR_Gomez_100_Owmership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(9, 0, UAIState_SitThrone(), n"IO_OC_THRONE_GOMEZ",200);

    // default ScheduleDuringEvent(UAIWorldEvent_Explicit_BartholoPlayLute::StaticClass(), 0, 0, UAIState_SitThroneCheer(), n"IO_OC_THRONE_GOMEZ",400);
}

UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_Ot : UDailyRoutine_OC_EBR_Gomez_100_Owmership
{
    default RolesWhileAssigned.AddTag(GameplayTag::State_Killable);
    default Schedule(9, 0, UAIState_SitThrone(), n"IO_OC_THRONE_GOMEZ",200);
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Outcast_All);
    default RolesWhileAssigned.AddTag(GameplayTag::State_Perceptions_Ignore_NPCs); 
}

UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_InExtremoReady : UDailyRoutine_OC_EBR_Gomez_100_Owmership
{
    default Schedule(9, 0, UAIState_Stand(), n"FP_OC_INEXTREMO_GOMEZ_INTRO",200);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_InExtremoOut : UDailyRoutine_OC_EBR_Gomez_100_Owmership
{
    default Schedule(9, 0, UAIState_OC_EBR_Gomez_100_Guide(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_InExtremoOut_Stand : UDailyRoutine_OC_EBR_Gomez_100_Owmership
{
    default Schedule(9, 0, UAIState_Gomez_InExtremoOut_StartConcert(), n"FP_OC_INEXTREMO_GOMEZ_OUT",200);
}

UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_Prestart : UDailyRoutine_OC_EBR_Gomez_100_Owmership
{
    default Schedule(8, 0, UAIState_Ebr_HangAround(), n"OCC_BARONS_GREATHALL_THRONE");
}

UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_Teleport : UDailyRoutine_OC_EBR_Gomez_100_Owmership
{
    default Schedule(6, 0, UAIState_Teleport_Gomez(UItAr_Rune_TeleportToSunkenTower), n"WP_SNT_TELEPORT", 200);
}

class UAIState_Teleport_Gomez : UGothicCharacterSimulateableAIState
{
    UPROPERTY()
    TSubclassOf<USpellContainer> Rune;

    UAIState_Teleport_Gomez(TSubclassOf<USpellContainer> InRune)
    {
        Rune = InRune;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if(IsInDailyRoutineSimulation())
        {
            CharacterState.TeleportToSpot(n"WP_SNT_TELEPORT");
        }
        else
        {
            AI.GotoWaypoint(n"Waypoint_Gomez_TP");
            AI.DrawMagicSpell(Rune);
            AI.CastSpell();
            
            AI.ExchangeDailyRoutine(UDailyRoutine_OC_EBR_Gomez_100_Sunken::StaticClass());
        }
        AI.ExchangeDailyRoutine(UDailyRoutine_OC_EBR_Gomez_100_Sunken::StaticClass());
    }
}

UCLASS()
class UDailyRoutine_OC_EBR_Gomez_100_Sunken : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Sit(), n"FP_ST_SIT_GOMEZ_01", 100);
    default Schedule(11, 0, UAIState_ReadBook_Seated(), n"FP_ST_SIT_GOMEZ_01", 100);
    default Schedule(14, 0, UAIState_CheckGoods(), n"FP_ST_CHECKGOODS_GOMEZ_01", 100);
    default Schedule(16, 30, UAIState_Smoke(), n"FP_ST_GOMEZ_SMOKE_01", 100);
    default Schedule(18, 45, UAIState_CheckGoods(), n"FP_ST_CHECKGOODS_GOMEZ_01", 100);
    default Schedule(21, 0, UAIState_ReadBook_Seated(), n"FP_ST_SIT_GOMEZ_01", 100);
    default Schedule(23, 40, UAIState_Sleep_Table(), n"FP_ST_SIT_GOMEZ_01", 100);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}



class UAIState_Gomez_InExtremoOut_StartConcert : UGothicCharacterSimulateableAIState
{
    UPROPERTY()
    FName m_MessagePayloadKey = n"OnGomezInExtremoSpeechEnd";

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.Character.SendGlobalEvent(GameplayTag::Message_Door, m_MessagePayloadKey, n"m_CurrentSection", 1.0f);
        AI.ExchangeDailyRoutine(UDailyRoutine_OC_EBR_Gomez_100_Start::StaticClass());
    }
}

UCLASS()
class UAIState_OC_EBR_Gomez_100_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default CloseDistance = 4.f;
    default WaitDistance = 5.f;
    default AbandonDistance = 5.f;
    default WaitAtPlaceDurationSeconds = 0.1f;
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_OC_EBR_Gomez_100_InExtremoOut_Stand::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default InterstationReachedDistance = 1.0f;
    default TerminusReachDistance = 1.0f;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_out_scenario_start",EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_out_scenario_01",EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_out_scenario_02",EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_out_scenario_03",EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_out_scenario_end",EWalkSpeed::Walking));
    
}

    