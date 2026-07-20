event void FOnCreatureSpawned(AGothicCharacter Character);
event void FOnCreatureCharacterStateSpawned(AGothicCharacterState CharacterState, ACreatureSummonVisual SpawnerVisual);
UCLASS()
class ACreatureSummonVisual : AGothicGASActor
{
    UPROPERTY()
    FOnCreatureSpawned OnCreatureSpawned;
    UPROPERTY()
    FOnCreatureCharacterStateSpawned OnCreatureCharacterStateSpawned;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

    default bReplicates = true;

    UPROPERTY()
    TSubclassOf<USpellConfig> m_ConfigClass;

    UPROPERTY(VisibleAnywhere, NotEditable)
    FName m_SaveGameKey = NAME_None;

    UPROPERTY(Replicated, ReplicatedUsing = OnRep_ReplicatedActive)
    bool m_Active = false;

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_DefaultSpawnDirection;

    default m_DefaultSpawnDirection.SetRelativeLocation(FVector(180, 0, 180));

    default m_SaveGameKey = n"";

    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    AGothicNPCState m_CharacterState;
    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    AGothicCharacter m_Character;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_GE_NoPersistent = UGE_CharacterNoPersistent::StaticClass();

    UPROPERTY()
    bool m_Activated = false;


    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        if(m_TextRender != nullptr)
        {
            m_TextRender.SetRelativeLocation(FVector(0,0,100));       
            m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
            m_TextRender.SetTextRenderColor(FColor::Green);
            m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
            m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
            m_TextRender.SetHiddenInGame(true);
        }
        if(m_ArrowComponent != nullptr)
        {
            m_ArrowComponent.SetWorldRotation(FRotator(90, 0, 0));
            m_ArrowComponent.SetHiddenInGame(true);
        }      
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        FHitResult hit;
        MagicScript::FindFloorAtLocation(GetActorLocation(), hit, this, ECollisionChannel::ECC_Visibility, m_MinFloorHeight, m_MaxFloorHeight);
        SetActorLocation(hit.ImpactPoint);

         if(m_SaveGameKey.IsNone())
            return;
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                m_Active = true;
                SetFinalPose();
            }
        }
    }

    UFUNCTION()
    void OnRep_ReplicatedActive()
    {
        if(m_Active)
            DoFinalPose();
    }

    UFUNCTION(NetMulticast)
    void SetFinalPose()
    {
        DoFinalPose();
    }

    UFUNCTION(BlueprintEvent)
    void DoFinalPose()
    {
    }

    UFUNCTION()
    void DoActivate()
    {
        if(!HasAuthority())
            return;
        if(m_Activated)
            return;
        
        auto spawnConfig = Cast<UGenericSummonCreature>(m_ConfigClass.Get().GetDefaultObject());
        auto characterConfig = spawnConfig.m_CharacterToSpawn;
        m_CharacterState = MagicScript::SpawnAIAgentDefinition(spawnConfig.m_SummonedEffect, characterConfig.m_SpawnAIAgentDefinition, GetActorLocation(), FRotator::ZeroRotator, characterConfig.m_DailyRoutine, GetOwner());
        if(m_CharacterState != nullptr)
        {
            if(OnCreatureCharacterStateSpawned.IsBound())
                OnCreatureCharacterStateSpawned.Broadcast(m_CharacterState, this);
            m_Activated = true;
            m_CharacterState.OnCharacterSpawned.AddUFunction(this, n"OnCharacterSpawned");
        }
            

    }

    UFUNCTION()
    void OnCharacterSpawned(AGothicNPCState CharacterState, AGothicCharacter Character)
    {
        m_CharacterState.OnCharacterSpawned.Unbind(this, n"OnCharacterSpawned");
        m_Character = Character;
        ApplyNoPersistentGE();
        SetCharacterRotation();
        DoActivateVisuals();
        OnCharacterSpawnedCompleted();   
    }

    void ApplyNoPersistentGE()
    {
        auto abComp = m_CharacterState.AbilitySystemComponent;
        FGameplayEffectContextHandle contextHandle = abComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = abComp.MakeOutgoingSpec(m_GE_NoPersistent, 1, contextHandle);
        abComp.ApplyGameplayEffectSpecToSelf(geSpecHandle);
    }

    void SetCharacterRotation()
    {
        FVector location = GetSpawnLocation();
        auto rotation = MagicScript::FindLookAtRotation(m_Character.GetActorLocation(), location);
        m_Character.SetActorRotation(rotation);
    }

    FVector GetSpawnLocation()
    {
        return FindClosestPlayer();
    }

    FVector FindClosestPlayer()
    {
        float closestDistance = MAX_flt;
        FVector closestLocation = m_DefaultSpawnDirection.GetWorldLocation();
        auto players = MagicScript::GetAllPlayers(m_Character);
        for(auto player : players)
        {
            auto currentDist = player.GetActorLocation().Distance(GetActorLocation());
            if( currentDist < closestDistance)
            {
                closestDistance = currentDist;
                closestLocation = player.GetActorLocation();
            }
        }

        return closestLocation;
    }

    UFUNCTION(BlueprintEvent)
    void OnCharacterSpawnedCompleted()
    {
    }

    UFUNCTION(BlueprintCallable, BlueprintEvent, NetMulticast)
    void DoActivateVisuals()
    {
    }

    void DoRestart()
    {
        if(!HasAuthority())
            return;
        if(!m_Activated)
            return;
        m_Activated = false;
        Restart();
    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void Restart()
    {

    }

    UFUNCTION(BlueprintCallable)
    void SaveState(int Value)
    {
        if(m_SaveGameKey.IsNone())
            return;
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, Value);
    }


}