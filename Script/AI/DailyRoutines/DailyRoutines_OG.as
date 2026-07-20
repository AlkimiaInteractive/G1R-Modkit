
class UAIARM_DailyRoutine_Human : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_DailyRoutine_Human_NonMoving);
    default SubModules.Add(UAIARM_Human_NeutralVoiceReactions);
}

class UAIARM_DailyRoutine_Human_NonMoving : UAIAssessmentResponseModule
{
    default BlockIfHasAnyOwnedTags.AddTag(GameplayTag::State_Movement);
    default Rules.Add(GameplayTag::AIEvent_Weather_Rain_Started)
                 .Then(UAIEventResponse_DailyRoutineInterruptState(UAIState_CheckWeather_RainStarted));
}

UCLASS()
class UAIState_DailyRoutine_Human : UAIState_DailyRoutine
{
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Offering);
    
    default ScheduleTimeOffsetMinutesMin = -10.0f;
    default ScheduleTimeOffsetMinutesMax = 10.0f;

    default WeatherPerceptionDelay = 1.0f;
    default WeatherPerceptionDelayVariance = 4.0f;

    default AssessmentModuleClass = UAIARM_DailyRoutine_Human;

    // Commented out: For testing only
    // default AreaEventReactions.Add(UAIState_ReactToAreaEvent_ListenToMusic::StaticClass());

    /** What to do when we are part of an area event? */
    UPROPERTY(EditDefaultsOnly)
    TArray<TSubclassOf<UAIState_Human_ReactToAreaEvent>> AreaEventReactions;

    UPROPERTY(EditDefaultsOnly, Category = "Blocking Path")
    TOptional<bool> OverrideAllowBlockingPathWhileStationary;

    /** When True stationary NPC can still escalate Wait -> Warning -> Combat. False = anim/interjection only. */
    UPROPERTY(EditDefaultsOnly, Category = "Blocking Path")
    TOptional<bool> OverrideAllowBlockingPathEscalationWhileStationary;

    UPROPERTY(EditDefaultsOnly, Category = "Blocking Path")
    TOptional<float> OverrideBlockingPathPersonalSpaceRadius;

    UFUNCTION(BlueprintOverride)
    void HandleWeatherChange(EWeather PreviousWeather, EWeather NewWeather)
    {
        if (IsInDailyRoutineSimulation())
            return;

        auto AI = Self.GetGothicAI();

        if (AI == nullptr)
            return;
        
        bool bWasRainingBefore = PreviousWeather == EWeather::Rain_Level1 || 
                                 PreviousWeather == EWeather::Rain_Level2 ||
                                 PreviousWeather == EWeather::Rain_Level3;

        bool bIsRainingNow = NewWeather == EWeather::Rain_Level1 || 
                             NewWeather == EWeather::Rain_Level2 ||
                             NewWeather == EWeather::Rain_Level3;

        if (!bWasRainingBefore && Self.IsInRain())
        {
            AI.AssessEvent(GameplayTag::AIEvent_Weather_Rain_Started, FRememberedPerception());
        }
        else if (bWasRainingBefore && !bIsRainingNow)
        {
            AI.AssessEvent(GameplayTag::AIEvent_Weather_Rain_Stopped, FRememberedPerception());
        }
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        auto AI = Self.GetGothicAI();
        float ConfirmationDelay = IsValid(AI) ? AI.SpawnedStorage(UAIValueSet_BlockingPath).BlockConfirmationDelay : 1.25f;

        float EffectiveDelay = ConfirmationDelay;
        if (IsValid(AI))
        {
            auto GraceStorage = AI.SpawnedStorage(UAIValueSet_BlockingPath);
            if (GraceStorage.bPostConversationGraceActive)
            {
                float RemainingGrace = GraceStorage.PostConversationGraceSeconds - GraceStorage.PostConversationGraceStart.AgeInRealtimeSeconds;
                if (RemainingGrace > 0.0f)
                    EffectiveDelay = ConfirmationDelay + RemainingGrace;
            }
        }
        bool bNeedsStationaryBlocking = false;
        if (OverrideAllowBlockingPathWhileStationary.IsSet())
        {
            bNeedsStationaryBlocking = OverrideAllowBlockingPathWhileStationary.Value;
        }
        else if (IsValid(AI))
        {
            auto ScheduledState = Cast<UAIState_RandomInteractions>(AI.ScheduledDailyRoutineAIStateTemplate);
            bNeedsStationaryBlocking = IsValid(ScheduledState) && ScheduledState.bAllowBlockingPathWhileStationary;
        }

        if (bNeedsStationaryBlocking && IsValid(AI))
        {
            auto BlockStorage = AI.SpawnedStorage(UAIValueSet_BlockingPath);
            if (BlockStorage.StationaryForwardDirection.IsNearlyZero())
                BlockStorage.StationaryForwardDirection = Self.GetActorForwardVector();
        }

        Perception.OnPlayerBlockingMyPath(1000.0f).Delay(EffectiveDelay).PerceptionGained
                  .BindUFunction(this, n"HandlePathBlockedByPlayer");
        if (bNeedsStationaryBlocking)
        {
            Perception.OnPlayerInFrontOfMe(1000.0f).Delay(EffectiveDelay).PerceptionGained
                      .BindUFunction(this, n"HandlePathBlockedByPlayer");
        }
        for (auto& AreaEvent : AreaEventReactions)
        {
            UAIState_Human_ReactToAreaEvent AreaEventDefault = Cast<UAIState_Human_ReactToAreaEvent>(AreaEvent.Get().DefaultObject);

            auto& Handler = Perception.OnSensedOtherWithTag(AreaEventDefault.AreaEventTag);

            Handler.Delay(AreaEventDefault.ReactionDelaySecondsMin, AreaEventDefault.ReactionDelaySecondsVariance);
            
            Handler.PerceptionGained.BindUFunction(this, n"HandleAreaEventSensed");
            Handler.PerceptionLost.BindUFunction(this, n"HandleAreaEventNoLongerSensed");
        }
    }


    UFUNCTION()
    private void HandlePathBlockedByPlayer(const FRememberedPerception&in Perception,
                                           const FPerceptionShortTermMemory&in Memory)
    {
        auto AI = Self.GetGothicAI();
        if (AI == nullptr)
            return;

        if (Self.IsInConversation())
            return;

        {
            auto GraceStorage = AI.SpawnedStorage(UAIValueSet_BlockingPath);
            if (GraceStorage.bPostConversationGraceActive)
            {
                GraceStorage.bPostConversationGraceActive = false;
            }
        }

        bool bDoingInteraction = IsValid(AI.CharacterState) && AI.CharacterState.IsDoingAnyInteraction();

        if (!Self.IsPathfollowing() && bDoingInteraction)
        {
            bool bAllowedWhileStanding = false;
            if (OverrideAllowBlockingPathWhileStationary.IsSet())
            {
                bAllowedWhileStanding = OverrideAllowBlockingPathWhileStationary.Value;
            }
            else
            {
                auto ScheduledState = Cast<UAIState_RandomInteractions>(AI.ScheduledDailyRoutineAIStateTemplate);
                bAllowedWhileStanding = IsValid(ScheduledState) && ScheduledState.bAllowBlockingPathWhileStationary;
            }

            if (!bAllowedWhileStanding)
                return;
        }
        else if (!Self.IsPathfollowing() && !bDoingInteraction)
        {
            return;
        }

        auto BlockingPathStorage = AI.SpawnedStorage(UAIValueSet_BlockingPath);
        bool bAlreadyInBlockedPathFlow = AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Wait_BlockedPath) ||
                                         AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Warning_BlockedPath);
        bool bHasValidBlocker = Perception.Origin.Character != nullptr;
        bool bPathBlocked = bHasValidBlocker && Self.IsPathBlockedByGivenCharacter(Perception.Origin.Character, false);
        float DistToOrigin = bHasValidBlocker ? Self.GetDistanceTo(Perception.Origin.Character) : -1.0f;

        // Resolve personal-space radius: DR override > state override > legacy formula.
        // Custom radius only applies while the scheduled interaction is actually running.
        float LegacyPersonalRadius = Self.GetSimpleCollisionRadius() * BlockingPathStorage.BlockPersonalSpaceRadiusMultiplier;
        float PersonalSpaceRadius = LegacyPersonalRadius;
        if (bDoingInteraction)
        {
            if (OverrideBlockingPathPersonalSpaceRadius.IsSet())
            {
                PersonalSpaceRadius = OverrideBlockingPathPersonalSpaceRadius.Value;
            }
            else
            {
                auto ScheduledState = Cast<UAIState_RandomInteractions>(AI.ScheduledDailyRoutineAIStateTemplate);
                if (IsValid(ScheduledState) && ScheduledState.OverrideBlockingPathPersonalSpaceRadius.IsSet())
                    PersonalSpaceRadius = ScheduledState.OverrideBlockingPathPersonalSpaceRadius.Value;
            }
        }

        bool bWithinPersonalSpace = bHasValidBlocker && DistToOrigin <= PersonalSpaceRadius;

        // Stationary practice NPCs: facing + distance check using stored practice direction.
        bool bUsingCustomRadius = (PersonalSpaceRadius != LegacyPersonalRadius);
        bool bActuallyBlockedByPerceivedCharacter;
        if (bUsingCustomRadius && !Self.IsPathfollowing() && bDoingInteraction)
        {
            FVector PracticeDir = BlockingPathStorage.StationaryForwardDirection;
            if (PracticeDir.IsNearlyZero())
                PracticeDir = Self.ActorForwardVector;
            bActuallyBlockedByPerceivedCharacter = bHasValidBlocker
                && Self.IsCharacterDirectionFacingOtherCharacter(Perception.Origin.Character, PracticeDir, -0.866f)
                && bWithinPersonalSpace;
        }
        else
            bActuallyBlockedByPerceivedCharacter = bPathBlocked && bWithinPersonalSpace;

        float SecondsSinceLastAssess = BlockingPathStorage.bHasEmittedBlockingPathAssess ? BlockingPathStorage.LastBlockingPathAssessTime.AgeInRealtimeSeconds : -1.0f;
        bool bCooldownActive = BlockingPathStorage.bHasEmittedBlockingPathAssess && SecondsSinceLastAssess < BlockingPathStorage.BlockReassessCooldownSeconds;
        bool bCanTrackSoftSignal = !bAlreadyInBlockedPathFlow && !bCooldownActive && bHasValidBlocker;

        if (bCanTrackSoftSignal && !bActuallyBlockedByPerceivedCharacter)
            BlockingPathStorage.BlockSoftSignalCount++;
        else if (bActuallyBlockedByPerceivedCharacter || !bCanTrackSoftSignal)
            BlockingPathStorage.BlockSoftSignalCount = 0;

        bool bFallbackForceEmit = bCanTrackSoftSignal && !bActuallyBlockedByPerceivedCharacter &&
                                  BlockingPathStorage.BlockSoftSignalCount >= BlockingPathStorage.BlockSoftSignalThreshold;

        if (bAlreadyInBlockedPathFlow || bCooldownActive || (!bActuallyBlockedByPerceivedCharacter && !bFallbackForceEmit))
        {
            FString SkipReason = "";
            if (bAlreadyInBlockedPathFlow)
                SkipReason += "InFlow;";
            if (bCooldownActive)
                SkipReason += "Cooldown;";
            if (!bActuallyBlockedByPerceivedCharacter && !bFallbackForceEmit)
                SkipReason += "NoHardBlockNoFallback;";
            Log(f"[BlockPath][DR] GateSkip Reason={SkipReason} (InFlow={bAlreadyInBlockedPathFlow} Cooldown={bCooldownActive} ActuallyBlocked={bActuallyBlockedByPerceivedCharacter} PathBlocked={bPathBlocked} WithinPersonalSpace={bWithinPersonalSpace} Dist={DistToOrigin} Radius={PersonalSpaceRadius} CustomRadius={bUsingCustomRadius} FallbackForce={bFallbackForceEmit} SoftSignal={BlockingPathStorage.BlockSoftSignalCount}/{BlockingPathStorage.BlockSoftSignalThreshold} DoingInteraction={bDoingInteraction})");
            return;
        }

        BlockingPathStorage.bHasEmittedBlockingPathAssess = true;
        BlockingPathStorage.LastBlockingPathAssessTime = FInGameTime::Now();
        BlockingPathStorage.BlockSoftSignalCount = 0;
        BlockingPathStorage.bBlockingPathFrustrationIncrementedThisCycle = false;
        BlockingPathStorage.ActiveBlockingPathPersonalSpaceRadiusCm = bUsingCustomRadius ? PersonalSpaceRadius : 0.0f;
        BlockingPathStorage.InitialBlockingFacingDirection = (bUsingCustomRadius && !BlockingPathStorage.StationaryForwardDirection.IsNearlyZero())
            ? BlockingPathStorage.StationaryForwardDirection
            : Self.GetActorForwardVector();

        BlockingPathStorage.bWasPathfollowingAtBlockEmit = Self.IsPathfollowing();

        // Resolve escalation-while-stationary: daily routine override > scheduled state flag. Walking NPCs ignore this gate downstream.
        bool bAllowEscalationStationary = false;
        if (bDoingInteraction)
        {
            if (OverrideAllowBlockingPathEscalationWhileStationary.IsSet())
            {
                bAllowEscalationStationary = OverrideAllowBlockingPathEscalationWhileStationary.Value;
            }
            else
            {
                auto ScheduledStateForEscalation = Cast<UAIState_RandomInteractions>(AI.ScheduledDailyRoutineAIStateTemplate);
                bAllowEscalationStationary = IsValid(ScheduledStateForEscalation) && ScheduledStateForEscalation.bAllowBlockingPathEscalationWhileStationary;
            }
        }
        BlockingPathStorage.bAllowEscalationWhileStationary = bAllowEscalationStationary;

        Log(f"[BlockPath][DR] Emit AIEvent_Seen_CharacterBlockingPath (Blocker={Perception.Origin.Character} PathBlocked={bPathBlocked} Dist={DistToOrigin} Radius={PersonalSpaceRadius} WithinPersonalSpace={bWithinPersonalSpace} CustomRadius={bUsingCustomRadius} SoftSignalReset=0 Pathfollowing={BlockingPathStorage.bWasPathfollowingAtBlockEmit} AllowEscalationStationary={bAllowEscalationStationary} DoingInteraction={bDoingInteraction})");
        AI.AssessEvent(GameplayTag::AIEvent_Seen_CharacterBlockingPath, Perception);
    }

    UFUNCTION()
    private void HandleAreaEventSensed(const FRememberedPerception&in Perception,
                                       const FPerceptionShortTermMemory&in Memory)
    {
        if (InterruptState != nullptr)
            return;
        
        for (auto& AreaEvent : AreaEventReactions)
        {
            UAIState_Human_ReactToAreaEvent AreaEventDefault = Cast<UAIState_Human_ReactToAreaEvent>(AreaEvent.Get().DefaultObject);

            if (Perception.Origin.Tags.HasTag(AreaEventDefault.AreaEventTag))
            {
                DoInterruptStateOfClass(AreaEvent);
                return;
            }
        }
    }

    
    UFUNCTION()
    private void HandleAreaEventNoLongerSensed(const FRememberedPerception&in Perception,
                                               const FPerceptionShortTermMemory&in Memory)
    {       

        UAIState_Human_ReactToAreaEvent ReactionState = Cast<UAIState_Human_ReactToAreaEvent>(InterruptState);

        if (ReactionState == nullptr)
            return;

        for (auto& AreaEvent : AreaEventReactions)
        {
            UAIState_Human_ReactToAreaEvent AreaEventDefault = Cast<UAIState_Human_ReactToAreaEvent>(AreaEvent.Get().DefaultObject);

            if (ReactionState.AreaEventTag.MatchesTag(AreaEventDefault.AreaEventTag))
            {
                ReactionState.OnGracefulExitRequested();
            }
        }
    }

    /** Utility function to fill the schedule with Smith-Tasks for the given timerange. */
    void SmithSchedule(int HourStart, int HourEnd, FName AtWaypoint)
    {
        check(HourStart < HourEnd);

        for (int Hour = HourStart; Hour < HourEnd; Hour++)
        {
            Schedule(Hour, 0, UAIState_Smith_Fire(), AtWaypoint);
            Schedule(Hour, 10, UAIState_Smith_Anvil(), AtWaypoint);
            Schedule(Hour, 20, UAIState_Smith_Fire(), AtWaypoint);
            Schedule(Hour, 30, UAIState_Smith_Anvil(), AtWaypoint);
            Schedule(Hour, 40, UAIState_Smith_Cool(), AtWaypoint);
            Schedule(Hour, 50, UAIState_Smith_Sharp(), AtWaypoint);
            Schedule(Hour, 55, UAIState_SitAround(), AtWaypoint);
        }
    }

    /** Utility function to fill the schedule with Arena Spectator when arena events are active. */
    void ArenaSpectatorSchedule(UCharacterAIState Task, const FName AtWaypoint, float32 WaypointRadius = 1000.0f)
    {
        ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsGorHanis, 0, 0, Task, AtWaypoint, WaypointRadius);
        ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_GorHanisVsKharim, 0, 0, Task, AtWaypoint, WaypointRadius);
        ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsKharim, 0, 0, Task, AtWaypoint, WaypointRadius);

        // ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KirgoVsMud, 0, 0, Task, AtWaypoint, WaypointRadius);
        // ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_GorHanisVsMud, 0, 0, Task, AtWaypoint, WaypointRadius);
        // ScheduleDuringEvent(UAIWorldEventTimed_ArenaFight_KharimVsMud, 0, 0, Task, AtWaypoint, WaypointRadius);
    }
}

class UDailyRoutine_Empty : UAIState_DailyRoutine
{
    
}

class UDailyRoutine_Empty_StayAtSpawn : UAIState_DailyRoutine
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        if (IsInDailyRoutineSimulation())
        {
            CharacterState.SetCharacterLocationAndDirection(
                CharacterState.PreferredLocation.StartingPosition,
                CharacterState.PreferredLocation.StartingRotation.Vector(),
            );
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleAvatarChanged()
    {
        if (IsInDailyRoutineSimulation())
        {
            CharacterState.SetCharacterLocationAndDirection(
                CharacterState.PreferredLocation.StartingPosition,
                CharacterState.PreferredLocation.StartingRotation.Vector(),
            );
        }
    }
}

UCLASS()
class UAIState_DailyRoutine_Creature : UAIState_DailyRoutine
{
    default ScheduleTimeOffsetMinutesMin = -10.0f;
    default ScheduleTimeOffsetMinutesMax = 10.0f;
    default RestoreAttributesAfterTimespan = FInGameTime::FromHours(1);

    default TryReviveAfterTimespan = FInGameTime::FromHours(20);
    default TryReviveIfDeathMemoryHasAnyOf.AddTag(GameplayTag::Memory_Conflict_Killed_PlayerNotInvolved);
}

class UAIARM_DailyRoutine_Orc : UAIAssessmentResponseModule
{
    default SubModules.Add(UAIARM_Orc_NeutralVoiceReactions);
}

UCLASS()
class UAIState_DailyRoutine_Orc : UAIState_DailyRoutine
{
    default ScheduleTimeOffsetMinutesMin = -10.0f;
    default ScheduleTimeOffsetMinutesMax = 10.0f;

    default AssessmentModuleClass = UAIARM_DailyRoutine_Orc;

    UPROPERTY(EditDefaultsOnly, Category = "Blocking Path")
    TOptional<bool> OverrideAllowBlockingPathWhileStationary;

    /** Orc daily-routine mirror of the human override. Currently orcs always escalate, but exposing the override lets content opt out per routine. */
    UPROPERTY(EditDefaultsOnly, Category = "Blocking Path")
    TOptional<bool> OverrideAllowBlockingPathEscalationWhileStationary;
}

UCLASS()
class UDailyRoutine_CS_Escort01_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Position(), n"WP_INTRO06");
}


UCLASS()
class UDailyRoutine_CS_Escort02_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Position(), n"WP_INTRO07");
}


UCLASS()
class UDailyRoutine_CS_Escort03_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Position(), n"WP_INTRO05");
}


UCLASS()
class UDailyRoutine_CS_Escort06_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Position(), n"WP_INTRO_WI01");
}


UCLASS()
class UDailyRoutine_OC_IE_Steve_Announce : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Stay(), n"OCR_AUDIENCE_02");
    default Schedule(20, 0, UAIState_Stay(), n"OCR_AUDIENCE_02");
}


UCLASS()
class UDailyRoutine_OC_IE_Steve_Concert : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Firespit(), n"OCR_AUDIENCE_02");
    default Schedule(20, 0, UAIState_Firespit(), n"OCR_AUDIENCE_02");
}


UCLASS()
class UDailyRoutine_OC_IE_Steve_Off : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Stay(), n"NOWHERE");
    default Schedule(20, 0, UAIState_Stay(), n"NOWHERE");
}


UCLASS()
class UDailyRoutine_Charlotte_Announce : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Stay(), n"OCR_AUDIENCE_03");
    default Schedule(20, 0, UAIState_Stay(), n"OCR_AUDIENCE_03");
}


UCLASS()
class UDailyRoutine_Charlotte_Concert : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Charlotte_Dance(), n"OCR_AUDIENCE_03");
    default Schedule(20, 0, UAIState_Charlotte_Dance(), n"OCR_AUDIENCE_03");
}


UCLASS()
class UDailyRoutine_Charlotte_Off : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Stay(), n"NOWHERE");
    default Schedule(20, 0, UAIState_Stay(), n"NOWHERE");
}


UCLASS()
class UDailyRoutine_OC_IE_Diggerfan_Concert : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_WatchInExtremo(), n"OCR_CROWD_01");
    default Schedule(20, 0, UAIState_WatchInExtremo(), n"OCR_CROWD_01");
}


UCLASS()
class UDailyRoutine_OC_IE_Diggerfan_Off : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Stay(), n"NOWHERE");
    default Schedule(20, 0, UAIState_Stay(), n"NOWHERE");
}


UCLASS()
class UDailyRoutine_Orc_2002_Sklave_Stonemill : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Orc_Stonemill(), n"OM_CAVE1_BELLOWS");
    default Schedule(12, 0, UAIState_Orc_Stonemill(), n"OM_CAVE1_BELLOWS");
}


UCLASS()
class UDailyRoutine_ST_ORC_VarragHashor_Prestart : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Intercept(), n"TPL_058");
    default Schedule(12, 0, UAIState_Intercept(), n"TPL_058");
}


UCLASS()
class UDailyRoutine_ST_ORC_VarragKasorg_Prestart : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Intercept(), n"TPL_096");
    default Schedule(12, 0, UAIState_Intercept(), n"TPL_096");
}


UCLASS()
class UDailyRoutine_ST_ORC_VarragUnhilqt_Prestart : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Intercept(), n"TPL_124");
    default Schedule(12, 0, UAIState_Intercept(), n"TPL_124");
}


UCLASS()
class UDailyRoutine_ST_ORC_VarragRuuushk_Prestart : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Intercept(), n"TPL_193");
    default Schedule(12, 0, UAIState_Intercept(), n"TPL_193");
}


UCLASS()
class UDailyRoutine_ST_ORC_VarragArushat_Prestart : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Intercept(), n"TPL_300");
    default Schedule(12, 0, UAIState_Intercept(), n"TPL_300");
}


UCLASS()
class UAIState_StandAround_Only : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 1.0f, MAX_flt));
}

UCLASS()
class UDailyRoutine_StandAround_Only: UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround_Only(), NAME_None, 100);
}