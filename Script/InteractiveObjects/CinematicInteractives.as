UCLASS()
class ABarrierCinematic : AInteractiveObjectActor
{
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ConditionsCheck"), 5.0f, true);
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }

    UFUNCTION()
    void ConditionsCheck()
    {
        bool isActive = false;
        auto character = FindCharacter(n"OW_OWR_ToChurnagg_2403").NPCState;
        if(character != nullptr && character.IsDead()) 
        {
            isActive = true;
        }
        #ifdef WITH_STORY_G1R
        if(G1R::Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && G1R::Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE != nullptr 
        && G1R::Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded() && G1R::Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE.HasSucceeded())
        {
            isActive = true;
        }
        #endif /** Keep this at the bottom of the file */
        SetIsBeingUsed( isActive );
    }
//
    UFUNCTION(BlueprintOverride)
    void PlayAction(AGothicCharacterState CharacterState)
    {
        #ifdef WITH_STORY_G1R
        //UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(USleeperTempleOpeningCinematic::StaticClass());
        UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(USleeperTempleOpeningCinematic);
        #endif /** Keep this at the bottom of the file */
    }  
}

UCLASS()
class UBarrierCinematic_Preset: UDefaultInteractive
{
	default m_UniqueName = n"Stone_Preset";
	default m_DefaultInteraction = GameplayTag::Action_CallInteractFunction;
    default m_RequiredIdObject.Add(UItAt_Amulet_Ulu_Talisman::StaticClass());
};

UCLASS()
class AOldMineExplosionCinematicActor : AInteractiveObjectActor
{
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ConditionsCheck"), 0.5f, true);
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }

    UFUNCTION()
    void ConditionsCheck()
    {
        bool isActive = false;
        #ifdef WITH_STORY_G1R
        if(G1R::Quest::OldMine_BLOWTHEENTRANCE != nullptr 
        && G1R::Quest::OldMine_BLOWTHEENTRANCE.IsRunning())
        {
            isActive = true;
        }
        #endif /** Keep this at the bottom of the file */
        SetIsBeingUsed( isActive ); 
    }
//
    UFUNCTION(BlueprintOverride)
    void PlayAction(AGothicCharacterState CharacterState)
    {
        SetIsBeingUsed(false);
        #ifdef WITH_STORY_G1R
        UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(UOldMineExplosionCinematic);
        #endif /** Keep this at the bottom of the file */
    }  
}

UCLASS()
class UOldMineExplosionCinematic_Preset: UDefaultInteractive
{
	default m_UniqueName = n"Stone_Preset";
	default m_DefaultInteraction = GameplayTag::Action_CallInteractFunction;
    //default m_RequiredIdObject = UItAt_Amulet_Ulu_Talisman::StaticClass();
};

//--------------------------------- Sleeper Kalom Sleeper ---------------------------------//
UCLASS()
class AHeartsStationActor : AInteractiveObjectActor
{
    FName m_SaveGameKey = n"DreamState";
    UFUNCTION(BlueprintOverride)
    void PlayAction(AGothicCharacterState CharacterState)
    {
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        auto animInstance = Cast<UDoorAnimInstance>(GetAnimInstance());
        //if (bLoaded && savedState >= 6)
        if(animInstance.m_State == 5)
        {
            int hasItemCount = 0;
            const UDataModule_Container target_dataModule_container = DataModule::GetContainerDataModule(CharacterState.Character);
            if(target_dataModule_container.HasItemOnAnyInventory(UItAr_Rune_UrizielWaveOfDeath::StaticClass()))
            {
                 #ifdef WITH_STORY_G1R
                UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(UExtroMagicCinematic);
                #endif /** Keep this at the bottom of the file */
            }
            else
            {
                #ifdef WITH_STORY_G1R
                UGothicCinematicManagerSubsystemScript::Get().ForceStartCinematic(UExtroCinematic);
                #endif /** Keep this at the bottom of the file */
            }
           
        }
        
    } 
}