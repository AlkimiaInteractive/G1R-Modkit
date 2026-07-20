//*************************************//
//           GENERIC CLASSES           //
//*************************************//

//EXAMPLE
UCLASS()
class UGV_FocusStone: UGothicTriggerVolumeDefinition
{
	default m_OnlyPlayer = false;
	default m_MustTick = true;
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("_numUses");
		if(numUses > 0.0f)
		{
			return false;
		}
		bool isDoorOpen = AG1RGameState::IsDoorOpenWorld(character.GetWorld(), n"OG_MainTomb_Gate");
		return isDoorOpen;
	}

	UFUNCTION(BlueprintOverride)
	void Tick(AGothicCharacter character, AGothicTriggerVolume trigger, float deltaTime)
	{
		bool isPlayer = trigger.IsPlayer(character);
		bool isLukorInside = trigger.HasCharacter(n"OG_GUR_BAALLUKOR_1211");
		if(isPlayer && isLukorInside)
		{
			character.CharacterState.BlockTeleport();
			character.SendGlobalEvent(GameplayTag::Message_Door, n"OG_MainTomb_Gate", n"m_CurrentSection", 0.0f);
			trigger.SaveData("_numUses", 1.0f);
		}
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("_numUses");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//*************************************//
//           COMBAT ROOM              //
//*************************************//
UCLASS()
class UGV_CombatRoom: UGothicTriggerVolumeDefinition
{

	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("_numUses");
		if(numUses > 0.0f)
		{
			return false;
		}
		bool isDoorOpen = AG1RGameState::IsDoorOpenWorld(character.GetWorld(), n"OG_CombatRoom");
		return isDoorOpen;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		character.SendGlobalEvent(GameplayTag::Message_Door, n"OG_CombatRoom", n"m_CurrentSection", 0.0f);
		//TODO david:Spawn enemies
		//TODO david:To open the door call
		// UPuzzlesSubsystem::GlobalCloseDoor( n"OG_CombatRoom");
		trigger.SaveData("_numUses", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("_numUses");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//*************************************//
//           TELEPORT CLASSES           //
//*************************************//

//FIRST DREAM START
UCLASS()
class UFirstDream_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamTower";
	default m_RequiredData.Add(n"DreamState",0);
	default m_SetOnFinishData.Add(n"DreamState",1);
	default m_TagsToAdd.AddTag(GameplayTag::State_NormalSaveBlocked);
	default m_TagsToAdd.AddTag(GameplayTag::Cancel_NeedHourlyEffect);
	default m_MustSave = true;
}

UCLASS()
class UGV_FirstDream: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetDataGlobalData("DreamState");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		character.CharacterState.BlockFinalCombatTags();
		FGameplayEventData payload;
            payload.Target = character;
            payload.Instigator = trigger;
			payload.EventTag = GameplayTag::Action_Teleport;
            payload.OptionalObject = UFirstDream_TeleportConfig::StaticClass();

		
        GothicGAS::SendGameplayEvent(character, payload.EventTag, payload);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetDataGlobalData("DreamState");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//THIRD DREAM COMPLETE
UCLASS()
class UThirdDreamComplete_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamCorKalom_Mid2";
	default m_MontageName = n"ThirdDreamComplete";
	default m_TagsToRemove.AddTag(GameplayTag::State_NormalSaveBlocked);
	default m_MustSave = true;
}

UCLASS()
class UGV_ThirdDreamComplete: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetDataGlobalData("ThirdDreamComplete");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		FGameplayEventData payload;
            payload.Target = character;
            payload.Instigator = trigger;
			payload.EventTag = GameplayTag::Action_Teleport;
            payload.OptionalObject = UThirdDreamComplete_TeleportConfig::StaticClass();

		
        GothicGAS::SendGameplayEvent(character, payload.EventTag, payload);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetDataGlobalData("ThirdDreamComplete");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//*************************************//
//           BLOOD SPIKE PUZZLE           //
//*************************************//

UCLASS()
class ASpike_SkeletalMeshActor: ASkeletalMeshActor
{
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Spike")
	FName FirstStageName = n"Blood_Spike_Button_01_Stage";
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Spike")
	FName FirstButtonName = n"Blood_Spike_Button_01";
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Spike")
	FName SecondButtonName = n"Blood_Spike_Door_02";
	UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Spike")
	float WaitTime = 5.0f;
};

UCLASS()
class UBlood_Spike_Button_01: UStonehenge_Door_Button_Base
{
	default m_OptionalObject = UBlood_Spike_Button_01_ExtraData::StaticClass();
};

UCLASS()
class UBlood_Spike_Button_01_ExtraData: UStonehenge_Door_Button_Base_ExtraData
{
	default m_SaveData = false;
	default m_SendTrigger = n"Blood_Spike_Button_01";
	default m_DefaultStep = -1;
};

UCLASS()
class UBlood_Spike_Button_02: UStonehenge_Door_Button_Base
{
	default m_OptionalObject = UBlood_Spike_Button_02_ExtraData::StaticClass();
};

UCLASS()
class UBlood_Spike_Button_02_ExtraData: UStonehenge_Door_Button_Base_ExtraData
{
	default m_SaveData = false;
	default m_SendTrigger = n"Blood_Spike_Door_02";
	default m_DefaultStep = -1;
};

UCLASS()
class UBlood_Spike_Door_02: UStonehenge_Door_Base
{
	default m_OptionalObject = UBlood_Spike_Door_02_ExtraData::StaticClass();
};

UCLASS()
class UBlood_Spike_Door_02_ExtraData: UStonehenge_Door_Base_ExtraData
{
	default m_ConnectedTrigger = n"Blood_Spike_Door_02";
};


UCLASS()
class UBlood_Spike_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMove;
};

UCLASS()
class UBlood_Spike: UDefaultInteractive
{
	default m_UniqueName = n"Stone_Adanos";
	default m_OptionalObject = UBlood_Spike_ExtraData::StaticClass();
};

UCLASS()
class USpikeFinishLever: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"SpikeFinishLever";
};

UCLASS()
class UBloodPuzzleFinishLever_ExtraData: UDoorInteractiveExtraData
{
	default m_NumSteps = 4;
	default m_DefaultStep = -10;
};

UCLASS()
class UBloodPuzzleFinishLever: UDefaultInteractive
{
	default m_OptionalObject = UBloodPuzzleFinishLever_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Lever_BloodPuzzle;
	default m_UniqueName = n"BloodPuzzleFinishLever";	
};

UCLASS()
class ABlood_Puzzle_Pool_As : AActor
{
	UFUNCTION()
    void CallSpawnEnemy()
    {
		//UWorldPointManager::Get().CallGlobalEvent(n"OnSleeperBloodPuzzleCompleted");
		#ifdef WITH_STORY_G1R
        UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(UFireDemonBloodDoorCinematic);
        #endif 
	}
}

UCLASS()
class AGV_SpikePuzzle: ASpikePuzzle
{
	UPROPERTY()
    TSoftObjectPtr<UNiagaraSystem> ParticleSystem = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Combat/SpikesDamage/P_SpikesDamageBlood.P_SpikesDamageBlood'";

	default m_DamageTimeInterval = 3.0f;
	default m_DisabledTimer = 30.0f;
	default m_FirstStageName = n"Blood_Spike_Button_01_Stage";
	default m_FirstButtonName = n"Blood_Spike_Button_01";
	default m_SecondButtonName = n"Blood_Spike_Door_02";
	default m_FinalLeverName = n"SpikeFinishLever";
	default m_ButtonResetName = n"Blood_Spike_Button_Reset_01";
	
	UFUNCTION(BlueprintOverride)
	void DoDamage(AGothicCharacter TargetCharacter)
	{
        if (TargetCharacter == nullptr)
        {
            return;
        }

        UAbilitySystemComponent asc = TargetCharacter.CharacterState.AbilitySystemComponent;
        USkeletalMeshComponent targetMesh = TargetCharacter.Mesh;

        if (asc != nullptr)
        {
            asc.ApplyGameplayEffectSpecToSelf(asc.GE_Kill());
        }

        UNiagaraComponent spawnedSystem = Niagara::SpawnSystemAttached(
			ParticleSystem.Get(),                    // System Template
			targetMesh,                          // Attach to Component
			NAME_None,                           // Attach Point Name
			FVector::ZeroVector,                 // Location
			FRotator::ZeroRotator,               // Rotation
			EAttachLocation::KeepRelativeOffset, // Location Type
			true                                 // Auto Destroy
		);

		if (spawnedSystem != nullptr)
		{
			spawnedSystem.SetVariableObject(n"Mesh", targetMesh);
		}

		//auto system2 = Niagara::SpawnSystemAtLocation(ParticleSystem.Get(), TargetCharacter.GetActorLocation());
		//system2.SetVariableObject(n"Mesh", targetMesh);
	}
}

//*************************************//
//           VarragHashor           //
//*************************************//

UCLASS()
class USleeperVarragHashorChamberDoor_ExtraData: UGenericTriggeredDoor_ExtraData
{
	default m_ConnectedTrigger = n"SleeperVarragHashorChamberDoor"; 
	default m_DefaultStep = 1;
	default m_SaveData = true;
};

UCLASS()
class USleeperVarragHashorChamberDoor: UGenericTriggeredDoor
{
	default m_OptionalObject = USleeperVarragHashorChamberDoor_ExtraData::StaticClass();
	default m_UniqueName = n"SleeperVarragHashorChamberDoor";
};

UCLASS()
class UGV_VarragHashor: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("VarragHashor");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//const auto optionalObject = character.GetOuter();
		UPuzzlesSubsystem::GlobalCloseDoorWorld(character.GetWorld(), n"SleeperVarragHashorChamberDoor");
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnSleeperVarragHashorChamber");
		trigger.SaveData("VarragHashor", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("VarragHashor");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//*************************************//
//           VarragUnhilqt           //
//*************************************//
UCLASS()
class USleeperVarragUnhilqtChamberDoor_ExtraData: UGenericTriggeredDoor_ExtraData
{
	default m_ConnectedTrigger = n"SleeperVarragUnhilqtChamberDoor"; 
	default m_DefaultStep = 1;
	default m_SaveData = true;
};

UCLASS()
class USleeperVarragUnhilqtChamberDoor: UGenericTriggeredDoor
{
	default m_OptionalObject = USleeperVarragUnhilqtChamberDoor_ExtraData::StaticClass();
	default m_UniqueName = n"SleeperVarragUnhilqtChamberDoor";
};

UCLASS()
class USleeperVarragUnhilqtChamberDoorB_ExtraData: UGenericTriggeredDoor_ExtraData
{
	default m_ConnectedTrigger = n"SleeperVarragUnhilqtChamberDoor"; 
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class USleeperVarragUnhilqtChamberDoorB: UGenericTriggeredDoor
{
	default m_OptionalObject = USleeperVarragUnhilqtChamberDoorB_ExtraData::StaticClass();
	default m_UniqueName = n"SleeperVarragUnhilqtChamberDoor";
};

UCLASS()
class UGV_VarragUnhilqt: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("VarragUnhilqt");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//const auto optionalObject = character.GetOuter();
		UPuzzlesSubsystem::GlobalCloseDoorWorld(character.GetWorld(), n"SleeperVarragUnhilqtChamberDoor");
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnSleeperVarragVarragUnhilqtChamber");
		trigger.SaveData("VarragUnhilqt", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("VarragUnhilqt");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//*************************************//
//           Ruusk 01           //
//*************************************//

UCLASS()
class UGV_VRuusk_01: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("VRuusk_01");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		UPuzzlesSubsystem::GlobalCloseDoorWorld(character.GetWorld(), n"VRuusk_01_Door");
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnDemonFire_Sleeper_Ruushk_01_Activate");
		trigger.SaveData("VRuusk_01", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("VRuusk_01");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

UCLASS()
class UGV_VRuusk_02: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("VRuusk_02");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		UPuzzlesSubsystem::GlobalCloseDoorWorld(character.GetWorld(), n"VRuusk_02_Door");
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnDemonFire_Sleeper_Ruushk_02_Activate");
		trigger.SaveData("VRuusk_02", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("VRuusk_02");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

UCLASS()
class UGV_VRuusk_03: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("VRuusk_03");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		UPuzzlesSubsystem::GlobalCloseDoorWorld(character.GetWorld(), n"VRuusk_03_Door");
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnDemonFire_Sleeper_Ruushk_03_Activate");
		trigger.SaveData("VRuusk_03", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("VRuusk_03");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

UCLASS()
class UGV_VarragRuuushk: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("VarragRuuushk");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//const auto optionalObject = character.GetOuter();
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnSleeperVarragRuuushkChamber");
		trigger.SaveData("VarragRuuushk", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("VarragRuuushk");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//*************************************//
//           VarragArushat           //
//*************************************//

UCLASS()
class UGV_VarragArushat: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("VarragArushat");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//const auto optionalObject = character.GetOuter();
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnSleeperVarragArushatChamber");
		trigger.SaveData("VarragArushat", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("VarragArushat");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//*************************************//
//           Demon lord           //
//*************************************//

UCLASS()
class UGV_Sunken_DemonLord: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("Sunken_DemonLord");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		UPuzzlesSubsystem::GlobalCloseDoorWorld(character.GetWorld(), n"Demon_Lord_Door");
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OnDemon_Lord_Activate");
		trigger.SaveData("Sunken_DemonLord", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("Sunken_DemonLord");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}

//*************************************//
//           SecretDoor Button           //
//*************************************//

UCLASS()
class USecretDoor_Button_Door_ExtraData: UGenericTriggeredDoor_ExtraData
{
	default m_ConnectedTrigger = n"SecretDoor_Button_Door"; 
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class USecretDoor_Button_Door: UGenericTriggeredDoor
{
	default m_OptionalObject = USecretDoor_Button_Door_ExtraData::StaticClass();
	default m_UniqueName = n"SecretDoor_Button_Door";
};

UCLASS()
class UGV_SecretDoor_Button: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("SecretDoor_Button");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		UPuzzlesSubsystem::GlobalOpenDoorWorld(character.GetWorld(), n"SecretDoor_Button_Door");
		trigger.SaveData("SecretDoor_Button", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("SecretDoor_Button");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}


UCLASS(meta=(DisplayName="Activate Barrier Trait"))
class URegionTrait_ActivateBarrier : UStoryActionRegionTrait
{
  	default bEnableTriggerLimit = true;
    default NumTimesToTrigger = 1;
	default bHandleNonPlayerCharacters = false;
	default bHandlePlayerCharacters = true;
	default bRequireLocalPlayer = true;
	UPROPERTY(Category=BarrierParameters)
	FName DoorName;

    UPROPERTY()
    bool m_ShouldHandleCharacter = true;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
		//UPuzzlesSubsystem::GlobalCloseDoorWorld(CharacterState.GetWorld(), DoorName);
        if(CharacterState.IsPlayerControlled() && CharacterState.IsPlayerCharacter())
		{
			UPuzzlesSubsystem::GlobalCloseDoorWorld(CharacterState.GetWorld(), DoorName);
		}            
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldHandleCharacter(const AGothicCharacterState CharacterState) const
    {
        return m_ShouldHandleCharacter;
    }
}

UCLASS(meta=(DisplayName="First Sleep Enter Harpy Area"))
class URegionTrait_FirstSleepEnterHarpyArea : UStoryActionRegionTrait
{
  	default bEnableTriggerLimit = true;
    default NumTimesToTrigger = 1;
	UPROPERTY(Category=EnterHarpyAreaParameters)
	FName DataLayerName;
	UPROPERTY(Category=EnterHarpyAreaParameters)
	AActor ActorToEnable;

	default bHandleNonPlayerCharacters = false;
	default bHandlePlayerCharacters = true;
	default bRequireLocalPlayer = true;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
		#ifdef WITH_STORY_G1R
		G1R::UStoryG1R::Get().DeactivateStoryDataLayer("SleeperArenaHarpy_Hallway");
		#endif
    	ActorToEnable.SetActorEnableCollision(true);   
    }
}

UCLASS()
class UGV_OldMIne_Dream_MCQueen_Battle: UGothicTriggerVolumeDefinition
{
	UFUNCTION(BlueprintOverride)
	bool CanTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		//return false;
		if(character.GetLocalRole() != ENetRole::ROLE_Authority)
		{
			return false;
		}
		float numUses = trigger.GetData("OldMIne_Dream_MCQueen_Battle_Save");
		if(numUses > 0.0f)
		{
			return false;
		}
		return true;
	}

	UFUNCTION(BlueprintOverride)
	void ExecuteTrigger(AGothicCharacter character, AGothicTriggerVolume trigger)
	{
		UPuzzlesSubsystem::GlobalCloseDoorWorld(character.GetWorld(), n"OldMIne_Dream_MCQueen_Battle_01_Door");
		UPuzzlesSubsystem::CallGlobalEvent(character.GetWorld(), n"OldMIne_Dream_MCQueen_Battle_Activate");
		trigger.SaveData("OldMIne_Dream_MCQueen_Battle_Save", 1.0f);
	}

	UFUNCTION(BlueprintOverride)
	bool MustDisableTrigger(AGothicTriggerVolume trigger)
	{
		float numUses = trigger.GetData("OldMIne_Dream_MCQueen_Battle_Save");
		if(numUses > 0.0f)
		{
			return true;
		}
		return false;
	}
}