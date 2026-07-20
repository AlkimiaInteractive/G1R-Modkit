UCLASS()
class AYberionAshes_AS : AInteractiveObjectActor
{
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        ConditionsCheck();
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
        int ashesNum = 0;
        #ifdef WITH_STORY_G1R
            ashesNum = G1R::UStoryG1R::Get().Yberion_Ashes;
        #endif 
        if(ashesNum >= 1)
        {
            SetIsBeingUsed( false );
            return;
        }


        #ifdef WITH_STORY_G1R

        if(G1R::Quest::SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER  != nullptr &&
            G1R::Quest::SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER.IsRunning())
        {
            SetIsBeingUsed( true );
            return;
        }
        #endif /** Keep this at the bottom of the file */
        SetIsBeingUsed( false );
    }

    UFUNCTION(BlueprintOverride)
    void PlayAction(AGothicCharacterState CharacterState)
    {
        UDataModule_Container target_dataModule_container = DataModule::GetContainerDataModule(CharacterState.Character);
        target_dataModule_container.ConsumeItemOfType(UItMs_Ashes::StaticClass(), 1);
        #ifdef WITH_STORY_G1R
            G1R::UStoryG1R::Get().Yberion_Ashes = 1;
            UWorldPointManager::Get().CallGlobalEvent(n"OnYberionAshes");
        #endif 
    }

    UFUNCTION(BlueprintOverride)
    void PlayActionConsume(AGothicCharacterState CharacterState)
    {
        #ifdef WITH_STORY_G1R
            G1R::UStoryG1R::Get().ActivateStoryDataLayer("MainQuest_YBerionAshes_Swamp");
        #endif 
    }
}

UCLASS()
class AYberionAshes_Second_AS : AYberionAshes_AS
{

    UFUNCTION(BlueprintOverride, meta =(NoSuperCall))
    void PlayAction(AGothicCharacterState CharacterState)
    {
        UDataModule_Container target_dataModule_container = DataModule::GetContainerDataModule(CharacterState.Character);
        target_dataModule_container.ConsumeItemOfType(UItMs_Ashes::StaticClass(), 1);
        #ifdef WITH_STORY_G1R
            G1R::UStoryG1R::Get().Yberion_Ashes = 2;
        #endif 
    }
    
    UFUNCTION(BlueprintOverride, meta =(NoSuperCall))
    void PlayActionConsume(AGothicCharacterState CharacterState)
    {
        #ifdef WITH_STORY_G1R
            G1R::UStoryG1R::Get().ActivateStoryDataLayer("MainQuest_YBerionAshes_Cemetery");
        #endif 
    }
}

UCLASS()
class UYberionAshes_Preset: UDefaultInteractive
{
	default m_UniqueName = n"YberionAshes_Preset";
	default m_DefaultInteraction = GameplayTag::Action_CallInteractFunction_YberionAshes;
    default m_RequiredIdObject.Add(UItMs_Ashes::StaticClass());
    //default m_ActiveUntilEvent = n"YberionAshesUsed";
    default m_MustMove = true;    
};

UCLASS()
class ADoorLockWatcher_AS : AInteractiveObjectActor
{
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        ConditionsCheck();
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ConditionsCheck"), 2.0f, true);
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
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, n"DoorLockWatcher_GirlInBath", savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                SetIsBeingUsed( true );
                return;
            }
        }        
        SetIsBeingUsed( false );
    }
}

UCLASS()
class UDoorLockWatcher_Preset: UDefaultInteractive
{
	default m_UniqueName = n"DoorLockWatcher_Preset";
	default m_DefaultInteraction = GameplayTag::Action_CallInteractFunction;
    //default m_ActiveUntilEvent = n"YberionAshesUsed";
    default m_MustMove = true;
    default m_CameraTarget = EInteractiveCameraTarget::Teleport;
};

UCLASS()
class AOrcSpores_AS : AInteractiveObjectActor
{
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ConditionsCheck"), 1.0f, true);
        ConditionsCheck();
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
        if(G1R::UStoryG1R::Get().UrNazkrog_Spores == 1)
        {
            SetIsBeingUsed( isActive );
            return;
        }
        if (G1R::Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && G1R::Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning())
        {
            isActive = true;
        }
        #endif /** Keep this at the bottom of the file */
        SetIsBeingUsed( isActive );
    }

    UFUNCTION(BlueprintOverride)
    void PlayAction(AGothicCharacterState CharacterState)
    {
        #ifdef WITH_STORY_G1R
            G1R::UStoryG1R::Get().UrNazkrog_Spores = 1;
            SetIsBeingUsed( false );
        #endif
    }
}

UCLASS()
class UOrcSpores_Preset: UDefaultInteractive
{
	default m_UniqueName = n"OrcSpores_Preset";
	default m_DefaultInteraction = GameplayTag::Action_CallInteractFunction_OrcSpores;
    default m_RequiredIdObject.Add(UItFo_Plants_OrcSpore::StaticClass());
    default m_ActiveUntilEvent = n"OrcSporesUsed";
    default m_MustMove = true;
};

UCLASS()
class UDestroyFinalBarrier_Preset: UDefaultInteractive
{
	default m_UniqueName = n"DestroyFinalBarrier_Preset";
	default m_DefaultInteraction = GameplayTag::Action_Lever_DestroyFinalBarrier;
    default m_RequiredIdObject.Add(UItAr_Rune_UrizielWaveOfDeath::StaticClass());
    default m_RequiredIdObject.Add(UItMw_2H_Sword_Uriziel_03::StaticClass());
    default m_ActiveUntilEvent = n"DestroyFinalBarrier_Used";
};

UCLASS()
class AKalomDeath_AS : AInteractiveObjectActor
{

    UFUNCTION(BlueprintOverride)
    void PlayAction(AGothicCharacterState CharacterState)
    {

    }
}

UCLASS()
class AKalomDeathSecond_AS : AActor
{

   UFUNCTION(BlueprintCallable, Category = "Animation")
    UAnimInstance GetActorAnimInstance()
    {
        // 1. Search the actor for ANY Skeletal Mesh Component
        UActorComponent FoundComp = GetComponentByClass(USkeletalMeshComponent::StaticClass());
        
        // 2. Cast the generic component to a Skeletal Mesh Component
        USkeletalMeshComponent FoundMesh = Cast<USkeletalMeshComponent>(FoundComp);
        
        // 3. If we found one, return its Anim Instance
        if (FoundMesh != nullptr)
        {
            return FoundMesh.GetAnimInstance();
        }
        
        // Return null if no skeletal mesh was found
        return nullptr;
    }
}

UCLASS()
class UAKalomDeath_Preset: UDefaultInteractive
{
	default m_UniqueName = n"AKalomDeath";
	default m_DefaultInteraction = GameplayTag::Action_CallInteractFunction_AKalomDeath;
    //default m_ActiveUntilEvent = n"AKalomDeathUsed";
    default m_MustMove = true;
    default m_ExtraTags.Add(n"UsesAnimBlueprint");
};

UCLASS()
class ABloodPuzzleFinal_AS : AInteractiveObjectActor
{

    UFUNCTION(BlueprintOverride)
    void PlayAction(AGothicCharacterState CharacterState)
    {
        #ifdef WITH_STORY_G1R
            //G1R::UStoryG1R::Get().UrNazkrog_Spores = 1;
        #endif
    }
}

/*UCLASS()
class UBloodPuzzleFinal_Preset: UDefaultInteractive
{
	default m_UniqueName = n"BloodPuzzleFinal_Preset";
	default m_DefaultInteraction = GameplayTag::Action_CallInteractFunction_OrcSpores;
    //default m_RequiredIdObject.Add(UItFo_Plants_OrcSpore::StaticClass());
    //default m_ActiveUntilEvent = n"OrcSporesUsed";
    default m_MustMove = false;
};*/

UCLASS()
class UBloodPuzzleFinal_Preset: UDefaultInteractive
{
	default m_UniqueName = n"BloodPuzzleFinishLever";
	default m_DefaultInteraction = GameplayTag::Action_Lever_DestroyFinalBarrier;
    default m_MinimalAction = true;
    //default m_RequiredIdObject.Add(UItAr_Rune_UrizielWaveOfDeath::StaticClass());
    //default m_RequiredIdObject.Add(UItMw_2H_Sword_Uriziel_03::StaticClass());
    //default m_ActiveUntilEvent = n"DestroyFinalBarrier_Used";
};