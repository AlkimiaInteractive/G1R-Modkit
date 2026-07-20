UCLASS()
class UAIAgentConfig_Human_OCR_GRD_Scatty_210 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_Scatty_210;

}

UCLASS()
class UDailyRoutine_OCR_GRD_Scatty_210_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_60);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_78);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_SCATTY");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_SCATTY");
}

UCLASS()
class UDailyRoutine_OCR_GRD_Scatty_210_Start : UDailyRoutine_OCR_GRD_Scatty_210_Ownership
{
    
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(8, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_21_SCATTY",500);
    default Schedule(9, 0, UAIState_LeanBar(), n"FP_OC_STANDAROUND_28",1000);
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_31",500);
    default Schedule(16, 0, UAIState_LeanBar(), n"FP_OC_STANDAROUND_28",400);
    default Schedule(18, 30, UAIState_ArenaGreetings(), n"FP_OC_ARENASPECTATE_11");
    default Schedule(23, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_21_SCATTY",500);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_19",500);
    default ScheduleIfRaining(19, 0, UAIState_ArenaSpectator(), n"FP_OC_ARENASPECTATE_11",3000);
    default ScheduleIfRaining(23, 0, UAIState_RainShelter_Guard(), n"FP_OC_RAINSHELTER_19",500);

    // Placeholder freepoint and AIState
    default ArenaSpectatorSchedule(UAIState_ArenaFight(), n"FP_OC_ARENASPECTATE_11", 200);
}


// This is now aistate_ArenaSpectator but with State_ForcedConversation_Ignore
UCLASS()
class UAIState_ArenaFight : UAIState_RandomInteractions
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);

    // Placeholder
    default bAllowBlockingPathWhileStationary = true;
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ArenaSpectator));
}

UCLASS(Abstract)
class UAIWorldEventTimed_ArenaFight : UAIWorldEventTimeBased
{
    default MaxAllowedNonMainParticipants = 11;
    default MainParticipantUniqueNames.Add(n"OCR_GRD_Scatty_210");
    default CharactersRequiredToBeAlive.Add(n"OCR_GRD_Scatty_210");

    default EventLocations.Add(FInteractionSpotHandle(n"FP_OC_FIGHTTRAINING_04"));
    default EventLocationRadius = 30000.0f;

    default BlockCharactersWithAnyOfFromJoining.AddTag(GameplayTag::State_Carrying);

    default AllowOnWeather.Add(EWeather::Sunny);
    default AllowOnWeather.Add(EWeather::Cloudy);

    default TimeRange.From = FClockTime(19, 00);
    default TimeRange.To = FClockTime(23, 59);

    float MinimumEventDuration = 60.0f;
    FInGameTime StartTime;

    UFUNCTION(BlueprintOverride)
    void EventStarted()
    {
        StartTime = FInGameTime::Now();
    }

    UFUNCTION(BlueprintOverride)
    void EventEnded()
    {
        if (StartTime.AgeInRealtimeSeconds >= MinimumEventDuration || !StartTime.IsValid())
        {
            EndTrainingFight();
            return;
        }

        float TimeUntilEnd = MinimumEventDuration - StartTime.AgeInRealtimeSeconds;

        System::SetTimer(this, n"EndTrainingFight", TimeUntilEnd, false);
    }

    UFUNCTION()
    void EndTrainingFight()
    {
        for (auto Participant : JoinedNPCParticipants)
        {
            Participant.AI.StopTrainingFight();
        }
    }
}

//// KIRGO VS GOR HANIS
class UAIWorldEventTimed_ArenaFight_KirgoVsGorHanis : UAIWorldEventTimed_ArenaFight
{
    default MainParticipantUniqueNames.Add(n"OC_GRD_Kirgo_251");
    default MainParticipantUniqueNames.Add(n"SC_TPL_GorHanis_1422");

    default CharactersRequiredToBeAlive.Add(n"OC_GRD_Kirgo_251");
    default CharactersRequiredToBeAlive.Add(n"SC_TPL_GorHanis_1422");

    default AllowOnWeekday.Add(EWeekDay::Monday);
    default AllowOnWeekday.Add(EWeekDay::Thursday);    
}

//// KIRGO VS KHARIM
class UAIWorldEventTimed_ArenaFight_KirgoVsKharim : UAIWorldEventTimed_ArenaFight
{
    default MainParticipantUniqueNames.Add(n"OC_GRD_Kirgo_251");
    default MainParticipantUniqueNames.Add(n"OC_SLD_Kharim_729");

    default CharactersRequiredToBeAlive.Add(n"OC_GRD_Kirgo_251");
    default CharactersRequiredToBeAlive.Add(n"OC_SLD_Kharim_729");

    default AllowOnWeekday.Add(EWeekDay::Tuesday);
    default AllowOnWeekday.Add(EWeekDay::Friday);
}

//// GOR HANIS VS KHARIM
class UAIWorldEventTimed_ArenaFight_GorHanisVsKharim : UAIWorldEventTimed_ArenaFight
{
    default MainParticipantUniqueNames.Add(n"SC_TPL_GorHanis_1422");
    default MainParticipantUniqueNames.Add(n"OC_SLD_Kharim_729");

    default CharactersRequiredToBeAlive.Add(n"SC_TPL_GorHanis_1422");
    default CharactersRequiredToBeAlive.Add(n"OC_SLD_Kharim_729");

    default AllowOnWeekday.Add(EWeekDay::Wednesday);
    default AllowOnWeekday.Add(EWeekDay::Saturday);
}

/// MUD VS OTHER | every 3 sundays
// UCLASS(Abstract)
// class UAIWorldEventTimed_ArenaFight_MudSpecial : UAIWorldEventTimed_ArenaFight
// {
//     default MainParticipantUniqueNames.Add(n"OC_VLK_Mud_574");
//     default CharactersRequiredToBeAlive.Add(n"OC_VLK_Mud_574");

//     default TimeRange.From = FClockTime(17, 00);
//     default TimeRange.To = FClockTime(20, 00);

//     default AllowOnWeekday.Add(EWeekDay::Sunday);

//     int WeekOffset = 0;

//     UFUNCTION(BlueprintOverride)
//     bool IsApplicableNow() const
//     {
//         // Starts at 0
//         int CurrentWeek = Math::FloorToInt(FInGameTime::Now().Day / 7.0f);

//         // First fight is W2; before that, never applicable
//         if (CurrentWeek < 2)
//             return false;

//         // Is this a fight week at all? Fights occur every 3 weeks starting W2
//         if ((CurrentWeek - 2) % 3 != 0)
//             return false;

//         // Is it this fighter's turn in the rotation?
//         int FighterSlot = (Math::FloorToInt((CurrentWeek - 2) / 3.0f)) % 3;
//         if (FighterSlot != WeekOffset)
//             return false;

//         return true;
//     }
// }

// class UAIWorldEventTimed_ArenaFight_KirgoVsMud : UAIWorldEventTimed_ArenaFight_MudSpecial
// {
//     default MainParticipantUniqueNames.Add(n"OC_GRD_Kirgo_251");
//     default CharactersRequiredToBeAlive.Add(n"OC_GRD_Kirgo_251");

//     default WeekOffset = 0;
// }

// class UAIWorldEventTimed_ArenaFight_GorHanisVsMud : UAIWorldEventTimed_ArenaFight_MudSpecial
// {
//     default MainParticipantUniqueNames.Add(n"SC_TPL_GorHanis_1422");
//     default CharactersRequiredToBeAlive.Add(n"SC_TPL_GorHanis_1422");

//     default WeekOffset = 1;
// }

// class UAIWorldEventTimed_ArenaFight_KharimVsMud : UAIWorldEventTimed_ArenaFight_MudSpecial
// {
//     default MainParticipantUniqueNames.Add(n"OC_SLD_Kharim_729");
//     default CharactersRequiredToBeAlive.Add(n"OC_SLD_Kharim_729");

//     default WeekOffset = 2;
// }

UCLASS()
class UAIState_TrainingFightWith : UGothicCharacterSimulateableAIState
{
    UAIState_TrainingFightWith(TSubclassOf<UAIWorldEventTimeBased> Event, FName OpponentName, FGameplayTag PracticeTag = FGameplayTag::Empty)
    {
        FightEvent = Event;
        PracticeWaitTag = PracticeTag;

        auto Opponent = FCharacterUniqueName(OpponentName);
        OpponentNames.Add(Opponent);
    }

    UAIState_TrainingFightWith(TSubclassOf<UAIWorldEventTimeBased> Event, FName OpponentOneName, FName OpponentTwoName, FGameplayTag PracticeTag = FGameplayTag::Empty)
    {
        FightEvent = Event;
        PracticeWaitTag = PracticeTag;

        auto OpponentOne = FCharacterUniqueName(OpponentOneName);
        OpponentNames.Add(OpponentOne);

        auto OpponentTwo = FCharacterUniqueName(OpponentTwoName);
        OpponentNames.Add(OpponentTwo);
    }

    UPROPERTY()
    TSubclassOf<UAIWorldEventTimeBased> FightEvent;

    UPROPERTY()
    TArray<FCharacterUniqueName> OpponentNames;

    UPROPERTY()
    FGameplayTag PracticeWaitTag;

    UPROPERTY()
    FName PracticeWaitFreepoint;

    UPROPERTY()
    private UAbilityTaskGeneric WaitTask;

    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        for (auto OpponentName : OpponentNames)
        {
            AGothicNPCState OpponentNPCState = OpponentName.NPCState;
            if (OpponentNPCState == nullptr)
                continue;

            OpponentNPCState.OnCharacterDestroyed.AddUFunction(this, n"HandleOtherCharacterDespawned");
        }
    }
    
    UFUNCTION()
    private void HandleOtherCharacterDespawned(AGothicNPCState DespawnedCharacterState)
    {
        RestartState();
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!bShouldExitState)
        {
            AI.GotoPosition(NPCState.PreferredLocation.CenterPoint);

            if (OpponentNames.IsEmpty())
            {
                WaitSeconds(5.0f);
                AI.DismissHere();
                return;
            }

            while (NeedsToWaitForOther() || IsInDailyRoutineSimulation())
            {                
                if (PracticeWaitTag.IsValid() && EventIsStillPending() && !PracticeWaitFreepoint.IsNone())
                {
                    if (IsValid(WaitTask) && !WaitTask.HasBeenActivated())
                    {
                        WaitTask = AI.TryUseFreepointAt(PracticeWaitTag, PracticeWaitFreepoint).RunDetached();
                    }
                }
                else
                {
                    if (IsValid(WaitTask) && !WaitTask.HasBeenActivated())
                    {
                        if (!AI.IsAlreadyAtGoal(NPCState.PreferredLocation.CenterPoint))
                        {
                            AI.GotoPosition(NPCState.PreferredLocation.CenterPoint);
                        }
                        
                        WaitTask = AI.TryUseFreepointAtPreferredLocation(GameplayTag::Action_Ambient_StandAround).RunDetached();
                    }
                }

                WaitOneTick();
            }
            
            FCharacterUniqueName OtherFighter = OpponentNames[0];

            AI.SetTargetEnemy(OtherFighter.SpawnedCharacter,  EGothicFocusPriority::CombatMove, this);
            AI.TurnToCharacter(OtherFighter.SpawnedCharacter, 5.f);

            for (auto MainOpponentName : OpponentNames)
            {
                AI.StartTrainingFight(MainOpponentName.NPCState);
                MainOpponentName.AI.StartTrainingFight(NPCState);

                for (auto SecondaryOpponentName : OpponentNames)
                {
                    if (MainOpponentName.NPCState == SecondaryOpponentName.NPCState)
                        continue;

                    MainOpponentName.AI.StartTrainingFight(SecondaryOpponentName.NPCState);
                    SecondaryOpponentName.AI.StartTrainingFight(MainOpponentName.NPCState);
                }
            }

            // Should not reach here, StartTrainingFight will cancel this AIState.
            WaitSeconds(1.0f);
        }
    }

    UFUNCTION()
    bool EventIsStillPending() const
    {
        auto AIWorldEventSubsystem = UAIWorldEventSubsystem::Get();
        bool bIsEventPending = AIWorldEventSubsystem.IsEventOfClassPending(FightEvent);
        bool bIsEventActive = AIWorldEventSubsystem.IsEventOfClassActive(FightEvent);

        if ( bIsEventPending && !bIsEventActive)
            return true;

        return false;
    }

    UFUNCTION()
    bool NeedsToWaitForOther() const
    {
        if (Self == nullptr) // when we re unspawned, we treat it as if we need to wait
            return true;

        return !AreAllFightersReadyForCombat() || !Self.HasGameplayTag(GameplayTag::Action_Ambient_StandAround) || AI.PreferredLocation.DistanceFromSelf > 100.0f;
    }

    bool AreAllFightersReadyForCombat() const
    {
        for (auto OpponentName : OpponentNames)
        {
            if (!OpponentName.HasSpawnedVisuals())
                return false;

            if (!OpponentName.NPCState.IsAtPreferredLocation())
                return false;

            if (!OpponentName.CharacterState.HasGameplayTag(GameplayTag::Action_Ambient_StandAround))
                return false;
        }

        return true;
    }

    void WaitForOtherToDrawWeapon()
    {
        AI.DrawMeleeWeapon();

        while (!HaveAllFightersDrawnWeapons())
        {
            if (!NPCState.HasGameplayTag(GameplayTag::State_Combat))
            {
                AI.DrawMeleeWeapon();
            }
            
            WaitOneTick();
        }
    }

    bool HaveAllFightersDrawnWeapons()
    {
        for (auto OpponentName : OpponentNames)
        {
            if (!OpponentName.NPCState.HasGameplayTag(GameplayTag::State_Combat))
                return false;
        }

        return true;
    }
}

UCLASS()
class UAIState_TrainingFightWith_OCArena : UAIState_TrainingFightWith
{
    UAIState_TrainingFightWith_OCArena(TSubclassOf<UAIWorldEventTimeBased> Event, FName OpponentName, FGameplayTag PracticeTag = FGameplayTag::Empty)
    {
        FightEvent = Event;
        PracticeWaitTag = PracticeTag;

        auto Opponent = FCharacterUniqueName(OpponentName);
        OpponentNames.Add(Opponent);
    }

    UAIState_TrainingFightWith_OCArena(TSubclassOf<UAIWorldEventTimeBased> Event, FName OpponentOneName, FName OpponentTwoName, FGameplayTag PracticeTag = FGameplayTag::Empty)
    {
        FightEvent = Event;
        PracticeWaitTag = PracticeTag;
        
        auto OpponentOne = FCharacterUniqueName(OpponentOneName);
        OpponentNames.Add(OpponentOne);

        auto OpponentTwo = FCharacterUniqueName(OpponentTwoName);
        OpponentNames.Add(OpponentTwo);
    }

    default PracticeWaitFreepoint = n"FP_OC_FIGHTTRAINING_04";
}

UCLASS()
class UNavigationAreaFilter_OCArenaFight : UNavigationAreaFilter
{
    default ExcludeNavArea(UNavArea_Road);
    default ExcludeNavArea(UNavArea_Default);
    default ExcludeNavArea(UNavArea_RoadRoofed);
    default ExcludeNavArea(UNavArea_DefaultRoofed);
    default ExcludeNavArea(UNavArea_Avoid);
    default ExcludeNavArea(UNavArea_Water);
    default ExcludeNavArea(UNavArea_Water_Deep);
    default ExcludeNavArea(UNavArea_Water_Shallow);

    const float DefaultCost = 4.0f; 
    const float ObstacleEnteringBaseCost = 2000.f;
    
    default SetTravelCostOnNavArea(UNavArea_Obstacle, DefaultCost * 1.5f); 
    default SetEnteringCostOnNavArea(UNavArea_Obstacle, ObstacleEnteringBaseCost * DefaultCost);
    
    default SetTravelCostOnNavArea(UNavArea_OCArena_FightingArea, DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_OCArena_FightingArea, DefaultCost);

    default SetTravelCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 4.f);
    default SetEnteringCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 5.f);
}

UCLASS()
class UNavArea_OCArena_FightingArea : UNavArea_Default
{
    default DefaultCost = 4.f;
    default FixedAreaEnteringCost = 2.f;
    default DrawColor = FColor();
}
