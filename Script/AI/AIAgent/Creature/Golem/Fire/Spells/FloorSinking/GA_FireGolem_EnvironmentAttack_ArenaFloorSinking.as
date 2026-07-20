class UGA_FireGolem_EnvironmentAttack_ArenaFloorSinking : UGameplayAbilityCreatureEnvironmentAttack
{
    UPROPERTY()
    TArray<A_FireGolem_EnvironmentAttack_ArenaLavaStream> m_ArenaLavaStreams;

    UPROPERTY()
    TSubclassOf<UGothicBaseConfig> m_ArenaDefClass = UArenaFloorSinkingDefinition_FireGolem::StaticClass();

    UPROPERTY()
    UArenaFloorSinkingDefinition_FireGolem m_ArenaDef;

    A_FireGolem_EnvironmentAttack_PlayerArenaDetector m_ArenaPlayerDetector;

    UPROPERTY()
    TMap<AActor, AFireGolemArena_PlayerLocationChecker> m_TargetsMap;

    UPROPERTY()
    UDelegateHandleContainer m_DelegateHandleContainer;

    
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_ArenaDef = Cast<UArenaFloorSinkingDefinition_FireGolem>(m_ArenaDefClass.Get().DefaultObject);

        if(m_ArenaDef == nullptr)
        {
            EndAbility();
            return;
        }

        if(Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).IsDead())
        {
            EndAbility();
            return; 
        }

        FindAreaActor();
    }

    UFUNCTION()
    void FindAreaActor()
    {
        auto avatarActor = GetAvatarActorFromActorInfo();
        //UNearbyActorsSubsystem::Get().TrackActorsOfClass(A_FireGolem_EnvironmentAttack_PlayerArenaDetector::StaticClass());
        //auto actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(A_FireGolem_EnvironmentAttack_PlayerArenaDetector::StaticClass(), avatarActor.GetActorLocation(), m_ArenaDef.m_SearchRadius);
        TArray<AActor> outActors;
        GetAllActorsOfClass(A_FireGolem_EnvironmentAttack_PlayerArenaDetector::StaticClass(), outActors);
        if(outActors.Num() == 0)
        {
            ActivateDetectionTimer();
            return;
        }

        m_ArenaPlayerDetector = Cast<A_FireGolem_EnvironmentAttack_PlayerArenaDetector>(outActors[0]);
        if(m_ArenaPlayerDetector == nullptr)
        {
            ActivateDetectionTimer();
            return;
        }

        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        
        RegisterArea();

    }

    void ActivateDetectionTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"FindAreaActor"), .5f, true);
    }

    void RegisterArea()
    {
        m_ArenaPlayerDetector.SetOwner(GetAvatarActorFromActorInfo());
        m_ArenaPlayerDetector.Initialize();

        m_ArenaPlayerDetector.OnPlayerBeginOverlapFireGolemArenaEvent.AddUFunction(this, n"OnPlayerBeginOverlapFireGolemArena");
        m_ArenaPlayerDetector.OnPlayerEndOverlapFireGolemArenaEvent.AddUFunction(this, n"OnPlayerEndOverlapFireGolemArena");

        m_DelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::State_Dead, EGameplayTagEventType::NewOrRemoved, this, n"OnAvatarDead");
    }

    UFUNCTION()
    void OnAvatarDead(const FGameplayTag CallbackTag, int32 NewCount)
    {
        if(NewCount > 0)
        {
            MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_DelegateHandleContainer);
            EndAbility();
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        if(m_ArenaPlayerDetector != nullptr)
        {
            m_ArenaPlayerDetector.Deinitialize();
            m_ArenaPlayerDetector.OnPlayerBeginOverlapFireGolemArenaEvent.Unbind(this, n"OnPlayerBeginOverlapFireGolemArena");
            m_ArenaPlayerDetector.OnPlayerEndOverlapFireGolemArenaEvent.Unbind(this, n"OnPlayerEndOverlapFireGolemArena");

            for(auto target : m_TargetsMap)
            {
                m_TargetsMap[target.Key].DestroyActor();
            }
            m_TargetsMap.Empty();
        }     
    }


    UFUNCTION()
    void OnPlayerBeginOverlapFireGolemArena(AActor Actor)
    {
        auto player = Cast<AGothicPlayerCharacter>(Actor);
        if(player == nullptr)
            return;
        if(!m_TargetsMap.Contains(Actor))
        {
            auto playerLocationChecker = Cast<AFireGolemArena_PlayerLocationChecker>(SpawnActor(AFireGolemArena_PlayerLocationChecker::StaticClass()));
            playerLocationChecker.SetOwner(GetAvatarActorFromActorInfo());
            playerLocationChecker.m_PlayerToTrack = player;
            playerLocationChecker.m_MaxPlayerNotMoveTime = m_ArenaDef.m_MaxPlayerNotMoveTime;
            playerLocationChecker.m_Duration = m_ArenaDef.m_Duration;
            m_TargetsMap.Add(Actor, playerLocationChecker);
        }

    }

    UFUNCTION()
    void OnPlayerEndOverlapFireGolemArena(AActor Actor)
    {
        if(m_TargetsMap.Contains(Actor))
        {
            m_TargetsMap[Actor].DestroyActor();
            m_TargetsMap.Remove(Actor);
        }
    }
}

UCLASS()
class AFireGolemArena_PlayerLocationChecker : AActor
{

    UPROPERTY()
    AGothicPlayerCharacter m_PlayerToTrack;
    UPROPERTY()
    A_FireGolem_EnvironmentAttack_FloorSinking m_ActiveFloorSinking;

    UPROPERTY()
    float m_MaxPlayerNotMoveTime;

    UPROPERTY()
    float m_Duration;

    UPROPERTY()
    private FTimerHandle TaskTimer;

    default ActorTickEnabled = true;
    default bReplicates = true;

    UAbilitySystemComponent m_PlayerAbComp;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Fire/FloorSinking/BP_FireGolem_ArenaAttack_FloorSinking.BP_FireGolem_ArenaAttack_FloorSinking_C'";

    UFUNCTION()
    TSubclassOf<AActor> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(!HasAuthority())
        {
            SetActorTickEnabled(false);
            return;
        }
        if(!m_SpawnActorPath.IsValid())
            MagicScript::GetPreloaded(m_SpawnActorPath);
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        if(!HasAuthority())           
            return;
        DeactivateLocationTrackTimer();
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(m_PlayerToTrack == nullptr)
            return;

        if(m_PlayerToTrack.IsMoving())
        {
            DeactivateLocationTrackTimer();
        }  
        else
        {
            if(!HasActiveFloorSinking())
                ActivateLocationTimer();
        }
            
    }

    bool HasActiveFloorSinking()
    {
        return m_ActiveFloorSinking != nullptr;
    }

    void ActivateLocationTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            return;
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"CreateFloorSinkActor"), m_MaxPlayerNotMoveTime, false);

    }  

    void DeactivateLocationTrackTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
        {
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        }
            
    }


    UFUNCTION()
    void CreateFloorSinkActor()
    {
        if(IsValid(GetSpawnActorClassServer_Scriptable()))
        {
            m_ActiveFloorSinking = Cast<A_FireGolem_EnvironmentAttack_FloorSinking>(SpawnActor(GetSpawnActorClassServer_Scriptable(), m_PlayerToTrack.GetActorLocation()));

            if(System::IsTimerActiveHandle(TaskTimer))
                System::ClearAndInvalidateTimerHandle(TaskTimer);

            m_ActiveFloorSinking.SetOwner(Owner);
            m_ActiveFloorSinking.OnFireGolemArenaFloorSinkingDestroyedEvent.AddUFunction(this, n"OnFireGolemArenaFloorSinkingDestroyedEvent");
            m_ActiveFloorSinking.m_Duration = m_Duration;
            m_ActiveFloorSinking.Initialize();
        }
    }

    UFUNCTION()
    void OnFireGolemArenaFloorSinkingDestroyedEvent()
    {
        m_ActiveFloorSinking = nullptr;
    }
} 