//@DE - Class for testing gameplay functionality

UCLASS()
class UGV_SpawnVarragTesting: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		// float numUses = trigger.GetData("VarragHashor");
		// if(numUses > 0.0f)
		// {
		// 	return false;
		// }
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		// TArray<AActor> outActors;
		// GetAllActorsOfClass(AOrc::StaticClass(),outActors);
		// for(auto actor : outActors)
		// {
		// 	Cast<AGothicNPCState>(Cast<AGothicCharacter>(actor).GetCharacterState()).RemoveFromWorld();
		// }
		const auto optionalObject = character.GetOuter();
		UPuzzlesSubsystem::GlobalCloseDoorWorld(character.GetWorld(), n"SleeperVarragHashorChamberDoor");
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnSleeperVarragHashorChamber");
		//UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnSleeperVarragKasorgChamber");
		//UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnSleeperVarragVarragUnhilqtChamber");
		trigger.SaveData("VarragHashor", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		// float numUses = trigger.GetData("VarragHashor");
		// if(numUses > 0.0f)
		// {
		// 	return true;
		// }
		return false;
	}
}


UCLASS()
class UGV_TriggerStoneHenge01EventTesting: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		// float numUses = trigger.GetData("VarragHashor");
		// if(numUses > 0.0f)
		// {
		// 	return false;
		// }
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"StoneHenge01Event");
		//UWorldPointManager::Get().CallGlobalEvent(n"StoneHenge01Event");
		//character.SendGlobalEvent(GameplayTag::Message_BattleBarrier, n"BP_BattleBlockingBarrierManager", n"m_ActivateEvent", 0.0f);

	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		// float numUses = trigger.GetData("VarragHashor");
		// if(numUses > 0.0f)
		// {
		// 	return true;
		// }
		return false;
	}
}



UCLASS()
class UGV_TriggerBattleShieldTestingOpen: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		// float numUses = trigger.GetData("VarragHashor");
		// if(numUses > 0.0f)
		// {
		// 	return false;
		// }
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{

		const auto optionalObject = character.GetOuter();

		
		character.SendGlobalEvent(GameplayTag::Message_BattleBarrier, n"BP_BattleBlockingBarrierManager", n"m_DeactivateEvent", 0.0f);
		
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		// float numUses = trigger.GetData("VarragHashor");
		// if(numUses > 0.0f)
		// {
		// 	return true;
		// }
		return false;
	}
}


class UWP_SH_SKELETON_SPAWN_TESTING_01 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};

class UWP_SH_SKELETON_SPAWN_TESTING_2 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};

class UWP_SH_SKELETON_SPAWN_TESTING_3 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
		//SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};

class UWP_SH_SKELETON_SPAWN_TESTING_4 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};

class UWP_SH_SKELETON_SPAWN_TESTING_5 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};

class UWP_SH_SKELETON_SPAWN_TESTING_6 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};

class UWP_SH_SKELETON_SPAWN_TESTING_7 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};

class UWP_SH_SKELETON_SPAWN_TESTING_8 : UWorldPointScript
{
	UFUNCTION()
	void StoneHenge01Event()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass());
	}
};