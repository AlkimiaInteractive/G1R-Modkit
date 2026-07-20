UCLASS()
class UHarpyKilled_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamCorKalom_Mid";
    default m_MontageName = n"FirstDreamComplete";
    default m_TagsToRemove.AddTag(GameplayTag::State_NormalSaveBlocked);
    default m_MustSave = true;
}

UCLASS()
class UOrcKilled_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamCorKalom_Mid2";
    default m_MontageName = n"SecondDreamComplete";
    default m_TagsToRemove.AddTag(GameplayTag::State_NormalSaveBlocked);
    default m_MustSave = true;
}

UCLASS()
class UDiegoKilled_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamGorn";
    default m_MontageName = n"SecondDreamComplete";
    default m_TagsToAdd.AddTag(GameplayTag::State_NormalSaveBlocked);
    default m_MustSave = true;
}

UCLASS()
class UGornKilled_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamMilten";
    default m_MontageName = n"SecondDreamComplete";
    default m_TagsToAdd.AddTag(GameplayTag::State_NormalSaveBlocked);
    default m_MustSave = true;
}

UCLASS()
class UMiltenKilled_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamLester";
    default m_MontageName = n"SecondDreamComplete";
    default m_TagsToAdd.AddTag(GameplayTag::State_NormalSaveBlocked);
    default m_MustSave = true;
}

UCLASS()
class ULesterKilled_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamXardas";
    default m_MontageName = n"SecondDreamComplete";
    default m_TagsToAdd.AddTag(GameplayTag::State_NormalSaveBlocked);
    default m_MustSave = true;
}

UCLASS()
class UXardasKilled_TeleportConfig: UTeleportExtraData
{
	default m_TeleportMapFreePointName = n"QuickTeleport_SleeperDreamCorKalom_End";
    default m_MontageName = n"SecondDreamComplete";
    //default m_TagsToRemove.AddTag(GameplayTag::State_NormalSaveBlocked);
    default m_MustSave = true;
}

UCLASS()
class UVarragKasor_PuzzleCountExtraData: UPuzzleCountExtraData
{
    default m_PuzzleCount.Add(n"Varrag_Platform_03",0);
	default m_PuzzleCount.Add(n"Varrag_Platform_Winch_02_A",0);
	default m_PuzzleCount.Add(n"Varrag_Platform_Winch_02_B",0);
    default m_PuzzleCount.Add(n"Varrag_Platform_Winch_02_C",2);
    default m_FunctionToCall = n"OnVarragKasorPuzzleCount";
}

UCLASS()
class UPuzzleConfig : UPuzzlesSubsystem
{
    default AddPuzzleEntry(n"Golem_Ice", n"Golem_Ice_Ice_Door",n"Golem_Ice_Ice_Door", 1);
    default AddPuzzleEntry(n"CorKalomDemon", n"CorKalomDemon",n"CorKalomDemon", 1);
    default AddPuzzleEntry(n"ST_UOS_VarragKasorg", n"SleeperVarragKasorgChamberDoor",n"SleeperVarragKasorgChamberDoor", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"ST_UOS_VarragHashor", n"SleeperVarragHashorChamberDoor",n"SleeperVarragHashorChamberDoor", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"ST_UOS_VarragUnhilqt", n"SleeperVarragUnhilqtChamberDoor",n"SleeperVarragUnhilqtChamberDoor", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"SH_Skeleton", n"Stonehenge_Entrance_Door",n"Stonehenge_Entrance_Door", 4, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"Demon_Sleeper_Ruushk_01", n"VRuusk_01_Door",n"VRuusk_01_Door", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"Demon_Sleeper_Ruushk_02", n"VRuusk_02_Door",n"VRuusk_02_Door", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"Demon_Sleeper_Ruushk_03", n"VRuusk_03_Door",n"VRuusk_03_Door", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"ST_UOS_VarragArushat", n"ST_ST_UOS_VarragArushatDoor",n"ST_ST_UOS_VarragArushatDoor", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"ST_UOS_VarragRuuushk", n"ST_ST_UOS_VarragRuuushk_Door",n"ST_ST_UOS_VarragRuuushk_Door", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"ST_UOS_VarragRuuushk", n"ST_UOS_VarragRuuushk_Door",n"ST_UOS_VarragRuuushk_Door", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"DemonLord", n"Demon_Lord_Door",n"Demon_Lord_Door", 1, EPuzzleEvent::OpenDoor);
    default AddPuzzleEntry(n"Minecrawler_Queen_Ph2_Sleeper", n"OldMIne_Dream_MCQueen_Battle_01_Door",n"OldMIne_Dream_MCQueen_Battle_01_Door", 1, EPuzzleEvent::OpenDoor);
    //
    //Dreams
    default AddPuzzleEntryData(n"Harpy_Sleeper", 6, EPuzzleEvent::Teleport, UHarpyKilled_TeleportConfig);
    default AddPuzzleEntryData(n"Orc_Sleeper", 9, EPuzzleEvent::Teleport, UOrcKilled_TeleportConfig);
    default AddPuzzleEntryData(n"OC_STT_Diego_Sleeper", 1, EPuzzleEvent::Teleport, UDiegoKilled_TeleportConfig);
    default AddPuzzleEntryData(n"NC_SLD_Gorn_699_Sleeper", 1, EPuzzleEvent::Teleport, UGornKilled_TeleportConfig);
    default AddPuzzleEntryData(n"OC_KDF_Milten_Sleeper", 1, EPuzzleEvent::Teleport, UMiltenKilled_TeleportConfig);
    default AddPuzzleEntryData(n"SC_NOV_Lester_Sleeper", 1, EPuzzleEvent::Teleport, ULesterKilled_TeleportConfig);
    default AddPuzzleEntryData(n"XT_DMB_Xardas_404_Sleeper", 1, EPuzzleEvent::Teleport, UXardasKilled_TeleportConfig); 
    //End Dreams


    default AddPuzzleCount( UVarragKasor_PuzzleCountExtraData);

    UFUNCTION()
    void OnVarragKasorPuzzleCount()
    {
        UWorldPointManager::Get().CallGlobalEvent(n"OnSleeperVarragKasorgChamber");
        UPuzzlesSubsystem::GlobalCloseDoor(n"SleeperVarragKasorgChamberDoor");
    }

    UFUNCTION(BlueprintOverride)
    void DoorTriggers(FGameplayTag channel, const FGothicBasicVerbMessage payload)
    {
        if (!payload.m_ConnectedTrigger.IsEqual(n"OG_MainTomb_Gate"))
            return;
        if (!payload.m_IsPlayer)
            return;


        auto ownerCharacterState = AGothicCharacterState::FindByGlobalId(payload.m_UserCharacter);
        if(IsValid(ownerCharacterState))
        {
            ownerCharacterState.UnblockTeleport();
        }
    }
}

    UENUM()
    enum EPuzzleState
    {
        NotStarted,
        Waiting,
        Active,
        Solved
    };

class APuzzleStoneTorch_Manager : AActor
{
    // Set the actor's replicates property to default to true,
    // so its declared replicated properties work.
    default bReplicates = true;

    UPROPERTY(EditInstanceOnly)
    TArray<AInteractiveGasObjectActor> Torches;

    EPuzzleState PuzzleState = EPuzzleState::NotStarted;
    bool bIsInitialized = false;

    UFUNCTION()
    void OnRep_ReplicatedState()
    {
        InitPuzzleState(PuzzleState);
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        bIsInitialized = false;
        if(!HasAuthority())
        {
            SetActorTickEnabled(false);
            return;
        }
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (!bIsInitialized)
        {
            bIsInitialized = true;
            LoadPuzzleState();
            return;
        }

        switch (PuzzleState)
        {
            case EPuzzleState::NotStarted:
            case EPuzzleState::Waiting:
                CheckConversationWithDiegoAtStoneHenge();
                break;
            case EPuzzleState::Active:
                CheckTorchesLit();
                break;
            case EPuzzleState::Solved:
                ChangeDiegoDailyRotuineAfterFightAtStoneHenge();
                break;
        }
    }

    UFUNCTION()
    void LoadPuzzleState()
    {
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, n"StoneDoorPuzzle_Fire_On", savedState);
        if(savedState<0.9f)//0.0f
        {
            PuzzleState = EPuzzleState::Waiting;
        }
        else if(savedState<1.9f)//1.0f
        {
            PuzzleState = EPuzzleState::Active;
        }
        else//2.0f
        {
            PuzzleState = EPuzzleState::Solved;
        }
        InitPuzzleState(PuzzleState);
    }

    UFUNCTION()
    void SavePuzzleState()
    {
        float32 stateToSave = 0.0f;
        switch (PuzzleState)
        {
            case EPuzzleState::NotStarted:
            case EPuzzleState::Waiting:
                stateToSave = 0.0f;
                break;
            case EPuzzleState::Active:
                stateToSave = 1.0f;
                break;
            case EPuzzleState::Solved:
                stateToSave = 2.0f;
                break;
        }
        AG1RGameState::SaveWorldFloatData(World, n"StoneDoorPuzzle_Fire_On", stateToSave);
    }

    UFUNCTION()
    void CheckConversationWithDiegoAtStoneHenge()
    {
#ifdef WITH_STORY_G1R
        if (G1R::UStoryG1R::Get().ConversationWithDiegoAtStoneHenge == 1)
        {
            PuzzleState = EPuzzleState::Active;
            SavePuzzleState();
            InitPuzzleState(PuzzleState);
        }
#endif /* #if WITH_STORY_G1R */
    }

    UFUNCTION()
    void ChangeDiegoDailyRotuineAfterFightAtStoneHenge()
    {
        auto Diego = FCharacterUniqueName(n"OC_STT_Diego").NPCState;
        if (IsValid(Diego) && Diego.HasAssignedDailyRoutine(UDailyRoutine_OC_STT_Diego_ShGate::StaticClass()))
        {
            Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_ShGateWait::StaticClass());
        }
    }

    UFUNCTION()
    void CheckTorchesLit()
    {
        int NumOnFire = 0;
        for (auto Torch : Torches)
        {
            auto FireComponent = Torch.GetFireComponent();
            if (FireComponent.IsFireOn())
            {
                NumOnFire++;
            }
        }

        if (NumOnFire >= Torches.Num())
        {
            //G1R::UStoryG1R::Get().StoneHengeSkeletonsDead = 1;
            PuzzleState = EPuzzleState::Solved;
            SavePuzzleState();
            InitPuzzleState(PuzzleState);
            UWorldPointManager::Get().CallGlobalEvent(n"StoneHenge01Event");
            UWorldPointManager::Get().CallGlobalEvent(n"StoneHenge02Event");
        }
    }

    UFUNCTION()
    void InitPuzzleState(EPuzzleState newState)
    {
        switch (newState)
        {
            case EPuzzleState::NotStarted:
            case EPuzzleState::Waiting:
                for (auto Torch : Torches)
                {
                    if(IsValid(Torch))
                    Torch.CanSetOnFire(false);
                }
                break;
            case EPuzzleState::Active:
                for (auto Torch : Torches)
                {
                    if(IsValid(Torch))
                    Torch.CanSetOnFire(true);
                }
                break;
            case EPuzzleState::Solved:
                for (auto Torch : Torches)
                {
                    if(IsValid(Torch))
                    {
                        Torch.CanSetOnFire(true);
                        Torch.SetLit(true);
                    }
                }
                break;
        }
    }
}