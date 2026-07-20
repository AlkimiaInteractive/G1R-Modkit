// IMPLEMENTATIONS THAT CAN BE USED IN DAILYROUTINES

/** Interaction for closing a gate with a winch, which works both for simulated and spawned NPCs */
UCLASS()
class UAIState_EnsureGateIsClosed : UAIState_EnsureGateState
{
	UAIState_EnsureGateIsClosed(FName WinchSpotName)
	{
		WinchSpot = FInteractionSpotHandle(WinchSpotName);
	}

	default ActionTag = GameplayTag::Action_Close_Gate; 
	default SpawnedInteractionTask = UAIState_CloseGate_Spawned;
}

/** Interaction for opening a gate with a winch, which works both for simulated and spawned NPCs */
UCLASS()
class UAIState_EnsureGateIsOpened : UAIState_EnsureGateState
{
	UAIState_EnsureGateIsOpened(FName WinchSpotName)
	{
		WinchSpot = FInteractionSpotHandle(WinchSpotName);
	}

	default ActionTag = GameplayTag::Action_Open_Gate; 
	default SpawnedInteractionTask = UAIState_OpenGate_Spawned;
}

UCLASS()
class UAIState_EnsureInnerCastleGateIsOpened : UAIState_EnsureGateIsOpened
{
    UAIState_EnsureInnerCastleGateIsOpened(FName WinchSpotName)
	{
		WinchSpot = FInteractionSpotHandle(WinchSpotName);
	}

	default SpawnedInteractionTask = UAIState_OpenGate_InnerCastle_Spawned;
}

UCLASS()
class UAIState_OpenGate_InnerCastle_Spawned : UAIState_OpenGate_Spawned
{
	default AdditionalLocationAndRadius.Add(n"FP_OC_GUARDPASSAGE_18", 1000.0f);
}


// BASE IMPLEMENTATION OF UAIState_EnsureGateState

UCLASS(Abstract)
class UAIState_EnsureGateState : UGothicCharacterSimulateableAIState
{
	/** ActionTag that defines if this task is for closing or opening */
    UPROPERTY()
	protected FGameplayTag ActionTag;
    
    UPROPERTY()
	FInteractionSpotHandle WinchSpot;
        
    UPROPERTY()
    TSubclassOf<UAIState_RandomInteractions> SpawnedInteractionTask;

    UPROPERTY()
	private FInteractionSpotClaimToken ClaimedSpotForSimulation;

	void InitTask()
	{
		if (AvatarCharacterState == nullptr)
		{
			EndTaskAsFailure();
			return;
		}

		if (!IsValid(AI))
		{
			EndTaskAsFailure();
			return;
		}

		if (!WinchSpot.IsSet())
		{
			PrintError(f"{this.GetName()}: 'WinchSpot' is unset! Pass it in the constructor of this task inside the dailyroutine of {AvatarCharacterState.GetName()}", 10.f);
            WaitSeconds(10.f);

			EndTaskAsFailure();
			return;
		}

		AvatarCharacterState.PreferredLocation.PreferInteractionSpot(WinchSpot, 600.f);
	}

    UFUNCTION(BlueprintOverride)
	void DoTask()
	{
		InitTask();

		while (!bShouldExitState)
		{
            if (GetWinchIO() == nullptr)
            {
				ReportTimeSkipWhateverIsLeft();	
                WaitSeconds(5.f);
				continue;	
            }

			if (IsGateInExpectedState())
			{
				ReportTimeSkipWhateverIsLeft();	
				WaitSeconds(10.f);
				continue;	
			}

			if (IsInDailyRoutineSimulation())
			{
				InteractWithWinch_Simulated();
			}
			else
			{
				InteractWithWinch_Spawned();
			}

			WaitSeconds(1.f);
		}
	}

	UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
		if (ClaimedSpotForSimulation.IsValid())
		{
			ClaimedSpotForSimulation.Unclaim();
		}
	}

    void InteractWithWinch_Spawned() 
    {
        DoSubstate(SpawnedInteractionTask);
    }

	void InteractWithWinch_Simulated() 
	{
		if (AvatarCharacterState == nullptr)
			return;

        AI.GotoFreepoint(WinchSpot);

		ClaimedSpotForSimulation = WinchSpot.Claim(AvatarCharacterState, ActionTag);

		if (!ClaimedSpotForSimulation.IsValid())
		{
            WaitSeconds(10.f);
			EndTaskAsFailure();
			return;
		}

		SimulateInteractWithSpawnedWinch();

		ClaimedSpotForSimulation.Unclaim();
	}

	void SimulateInteractWithSpawnedWinch()
	{
		AInteractiveObjectActor WinchIO = GetWinchIO();

		if (!IsValid(WinchIO))
			return;

		UInteractiveObjectDefinition TriggerIODefinition = WinchIO.InteractiveObjectDefinition;
		if (!IsValid(TriggerIODefinition))
			return;

		UTriggerExtraData TriggerExtraData = Cast<UTriggerExtraData>(TriggerIODefinition.m_OptionalObject.DefaultObject);
		if (!IsValid(TriggerExtraData))
			return;

		UInteractiveSubsystem InteractiveSubsystem = UInteractiveSubsystem::Get();
		if (!IsValid(InteractiveSubsystem))
			return;

		int32 CurrWinchSectionIdx = TriggerExtraData.m_DefaultStep;
		InteractiveSubsystem.GetDataInt(WinchIO, GameplayTag::SaveData_Interactive_Trigger_State, CurrWinchSectionIdx);

		FName Username = FName(WinchIO.Name);
		FName UniqueName = TriggerIODefinition.m_UniqueName;

		if (ShouldOpen())
		{
			for (int32 i = CurrWinchSectionIdx + 1; i < TriggerExtraData.m_NumSteps; i++)
			{
				ReportTimeSkipWhateverIsLeft(); // important for WaitSeconds to work with unspawned NPCs that timeskip that waittime!
				AvatarCharacterState.SendGlobalEvent(GameplayTag::Message_Door, UniqueName, n"m_CurrentSection", i, false, Username);
				WaitSeconds(4.f);
				SetSavedWinchSectionIdx(i);
			}
		}
		else
		{
			for (int32 i = CurrWinchSectionIdx - 1; i >= 0; i--)
			{
				ReportTimeSkipWhateverIsLeft();  // important for WaitSeconds to work with unspawned NPCs that timeskip that waittime!
				AvatarCharacterState.SendGlobalEvent(GameplayTag::Message_Door, UniqueName, n"m_CurrentSection", i, false, Username);
				WaitSeconds(4.f);
				SetSavedWinchSectionIdx(i);
			}
		}
	}
  
    AInteractiveObjectActor GetWinchIO() const
    {
        if (!ensure(WinchSpot.IsSet()))
            return nullptr;

        return Cast<AInteractiveObjectActor>(WinchSpot.ActorToInteractWith);
    }

	UTriggerExtraData GetWinchTriggerExtraData() const
	{
		AInteractiveObjectActor WinchIO = GetWinchIO();
		if (WinchIO == nullptr)
			return nullptr;
		
		UInteractiveObjectDefinition TriggerIODefinition = WinchIO.InteractiveObjectDefinition;
		if (TriggerIODefinition == nullptr)
			return nullptr;
		
		return Cast<UTriggerExtraData>(TriggerIODefinition.m_OptionalObject.DefaultObject);
	}

	bool ShouldOpen() const
	{
		return ActionTag == GameplayTag::Action_Open_Gate && ActionTag != GameplayTag::Action_Close_Gate;
	}

	bool IsGateInExpectedState() const
	{
        UTriggerExtraData TriggerExtraData = GetWinchTriggerExtraData();
		if (!IsValid(TriggerExtraData))
			return false;

		int32 TargetIdx = ShouldOpen() ? TriggerExtraData.m_NumSteps - 1 : 0; 

		return TargetIdx == GetSavedWinchSectionIdx();
	}

	int32 GetSavedWinchSectionIdx() const
	{
		UTriggerExtraData TriggerExtraData = GetWinchTriggerExtraData();
		if (TriggerExtraData == nullptr)
			return -1;

		int32 CurrWinchStateIdx = TriggerExtraData.m_DefaultStep;

		AInteractiveObjectActor WinchIO = GetWinchIO();
		if (WinchIO == nullptr)
			return CurrWinchStateIdx;

		UInteractiveSubsystem InteractiveSubsystem = UInteractiveSubsystem::Get();
		if (InteractiveSubsystem == nullptr)
			return CurrWinchStateIdx;

		InteractiveSubsystem.GetDataInt(WinchIO, GameplayTag::SaveData_Interactive_Trigger_State, CurrWinchStateIdx);
		
		return CurrWinchStateIdx;
	}

	void SetSavedWinchSectionIdx(int32 CurrWinchStateIdx) const
	{
		UTriggerExtraData TriggerExtraData = GetWinchTriggerExtraData();
		if (TriggerExtraData == nullptr)
			return;

		AInteractiveObjectActor WinchIO = GetWinchIO();
		if (WinchIO == nullptr)
			return;

		UInteractiveSubsystem InteractiveSubsystem = UInteractiveSubsystem::Get();
		if (InteractiveSubsystem == nullptr)
			return;

		InteractiveSubsystem.SetDataInt(WinchIO, GameplayTag::SaveData_Interactive_Trigger_State, CurrWinchStateIdx);
	}
}

/** Interaction for closing a gate, which only works on spawned characters */
UCLASS()
class UAIState_CloseGate_Spawned : UAIState_RandomInteractions
{
	default Interactions.Add(FInteraction(GameplayTag::Action_Close_Gate, InMayUseCustomAbility = true));
	default Interactions.Last().Priority = 1;

	default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage, InDurationSeconds = 5.0f, InDurationVariance = 1.0f));
	default Interactions.Last().Priority = 0;
}

/** Interaction for opening a gate, which only works on spawned characters */
UCLASS()
class UAIState_OpenGate_Spawned : UAIState_RandomInteractions
{
	default Interactions.Add(FInteraction(GameplayTag::Action_Open_Gate, InMayUseCustomAbility = true));
	default Interactions.Last().Priority = 1;

	default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardPassage, InDurationSeconds = 5.0f, InDurationVariance = 1.0f));
	default Interactions.Last().Priority = 0;
}