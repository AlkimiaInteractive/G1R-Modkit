UCLASS()
class AMinionSpot_XardasSleeper : AXardasSleeperTeleportSpotVisual//AGothicGASActor
{

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_RootSpawn;

    UPROPERTY(DefaultComponent, Attach=m_RootSpawn)
    UXardas_Sleeper_Minion_BillboardComponent m_SpawnLocationCenter; 
    UPROPERTY(DefaultComponent, Attach=m_RootSpawn)
    UXardas_Sleeper_Minion_BillboardComponent m_SpawnLocationLeft; 
    UPROPERTY(DefaultComponent, Attach=m_RootSpawn)
    UXardas_Sleeper_Minion_BillboardComponent m_SpawnLocationRight;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UBillboardComponent m_TeleportLocation;

    UPROPERTY(DefaultComponent, Attach=m_TeleportLocation)
    USceneComponent m_TraceTargetOrigin;

    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_MinionClass = USpawnAIAgentDefinition_Skeleton_Xardas_Sleeper::StaticClass();

    UPROPERTY()
    TMap<AGothicNPCState, UXardas_Sleeper_Minion_BillboardComponent> m_Minions;

    // UPROPERTY()
    // TMap<UBillboardComponent, AXardas_Sleeper_Env_RubyVisual> m_RubyVisuals;

    UPROPERTY()
    TArray<AGothicCharacter> m_MinionsDead;
    
    UPROPERTY()
    bool m_SpotCompleted = false;
    UPROPERTY()
    bool m_SpotActive = false;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_MinionStunnedGE = UGE_XardasSleeper_MinionStunned::StaticClass();
    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_MinionStunnedRemovalGE = UGE_XardasSleeper_MinionStunned_Removal::StaticClass();

    default m_SpotConfigClass = UXardasSleeperTeleportMinionSpotConfig::StaticClass();

    default m_TraceTargetOrigin.SetRelativeLocation(FVector(0,0,150));

    UPROPERTY()
    private FTimerHandle TaskTimer;

    // UPROPERTY()
    // TSubclassOf<UScriptGameplayEffect> m_TeleportCooldown = UGE_XardasSleeper_TeleportCooldown::StaticClass();


    UPROPERTY()
    TSubclassOf<AActor> m_TraceActorClass = ATraceTarget_XardasSleeper::StaticClass();
    UPROPERTY()
    ATraceTarget_XardasSleeper m_TarceTarget;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpot_XardasSleeper m_OppositeSpot1;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpot_XardasSleeper m_OppositeSpot2;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpot_XardasSleeper m_OppositeSpotActivated;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AMinionSpotManager m_MinionSpotManager;

    UPROPERTY()
    bool m_ActivatedByOpposite = false;

    default m_DoingTeleportTag = GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpot;

    UPROPERTY()
    TMap<AGothicCharacterState, UDelegateHandleContainer> m_SpawnedCreatureDieHandles;



    FVector GetTeleportLocation() override
    {
        return m_TeleportLocation.GetWorldLocation();
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void BeginPlay()
    {
        //@DE - Initialized by AMinionSpotManager
       //InitializeMinionSpot();
       
    }

    void InitializeMinionSpot(FMinionSpotSpawningConfigData SpawningConfig)
    {
        m_ActivatedByOpposite = false;    
        if(!HasAuthority())
            return;
        SpawnEnvironmentVisuals();
        CheckErrors();
        SpawnMinion(m_SpawnLocationCenter, SpawningConfig.m_CenterMinionClass);
        SpawnMinion(m_SpawnLocationLeft, SpawningConfig.m_LeftMinionClass);
        SpawnMinion(m_SpawnLocationRight, SpawningConfig.m_RightMinionClass);
        SpawnTraceTarget();

        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }

    
    // void ACTIVATE_ONLYFORTESTING()
    // {
    //     InitializeMinionSpot();
    // }

    // UFUNCTION(BlueprintCallable)
    // void RESET_ONLYFORTESTING()
    // {
    //     for(auto minion : m_Minions)
    //     {
    //         minion.Key.Kill(true);
    //     }

    //     ACTIVATE_ONLYFORTESTING();
    // }

    UFUNCTION(BlueprintEvent)
    void SpawnEnvironmentVisuals()
    {

    }

    void CheckErrors()
    {
        if(m_OppositeSpot1 == nullptr)
        {
            FString text = FString("m_OppositeSpot1 is EMPTY on: ");
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
        }
        if(m_OppositeSpot2 == nullptr)
        {
            FString text = FString("m_OppositeSpot2 is EMPTY on: ");
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
        }

        if(m_MinionSpotManager == nullptr)
        {
            FString text = FString("m_MinionSpotManager is EMPTY on: ");
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
        }

        m_SpawnLocationCenter.CheckErrors();
        m_SpawnLocationLeft.CheckErrors();
        m_SpawnLocationRight.CheckErrors();


    }

    void SpawnTraceTarget()
    {
        m_TarceTarget = Cast<ATraceTarget_XardasSleeper>(SpawnActor(m_TraceActorClass, m_TraceTargetOrigin.GetWorldLocation(), m_TraceTargetOrigin.GetWorldRotation()));
        m_TarceTarget.SetOwner(this);
    }

    void SpawnMinion(UXardas_Sleeper_Minion_BillboardComponent SpawnLocation, TSubclassOf<USpawnAIAgentDefinition> MinionClass)
    {
        auto CharacterState = MagicScript::SpawnAIAgentDefinition(m_MinionStunnedGE, MinionClass, SpawnLocation.GetWorldLocation(), SpawnLocation.GetWorldRotation(), nullptr, this);
        if(CharacterState != nullptr)
        {
            m_MinionSpotManager.AddSpawnedMinion(CharacterState);
            m_Minions.Add(CharacterState, SpawnLocation);
            CharacterState.OnCharacterSpawned.AddUFunction(this, n"OnCharacterSpawned");
        }
    }

    UFUNCTION()
    void OnCharacterSpawned(AGothicNPCState CharacterState, AGothicCharacter Character)
    {
        auto summonedComp = UXardasSleeperSkeletonsSummonedComponent::Get(Character);
        auto isChained = Character.GetAbilitySystemComponent().GetGameplayEffectCount(m_MinionStunnedGE, nullptr);
        //@DE - When the player goes away the skeletons are unspawned so if the player comes back we have to restore the skeletons that are not activated yet.
        if(isChained > 0)
        {
            summonedComp.Initialize(m_Minions[CharacterState], this);
            auto spawnedCreatureDie = MagicScript::AttachToEventTag(Character, GameplayTag::Event_Die_Me_After, this, n"OnMinionDeath");
            if(m_SpawnedCreatureDieHandles.Contains(CharacterState))
            {
                MagicScript::DetachFromEvent(Character, m_SpawnedCreatureDieHandles[CharacterState]);
                m_SpawnedCreatureDieHandles.Remove(CharacterState);
            }
            m_SpawnedCreatureDieHandles.FindOrAdd(CharacterState, spawnedCreatureDie);            
        }
        else
        {
            ActivateMinion(Character);
        }

    }

    UFUNCTION()
    void OnMinionDeath(FGameplayEventData GameplayEventData)
    {
        auto character = Cast<AGothicCharacter>(GameplayEventData.Target);
        m_MinionsDead.Add(character);
        if(m_SpawnedCreatureDieHandles.Contains(character.CharacterState))
        {
            MagicScript::DetachFromEvent(character, m_SpawnedCreatureDieHandles[character.CharacterState]);
            m_SpawnedCreatureDieHandles.Remove(character.CharacterState);
        }
        if(System::IsTimerActiveHandle(TaskTimer))
        {
            //If the death timer is active, we reset the timer on each death.
            ActivateMinionDeathCheckTimer();
        }
        CheckSpotCompleted();
    }

    void CheckSpotCompleted()
    {
        if(m_SpotActive && m_MinionsDead.Num() == m_Minions.Num())
        {
            OnSpotCompleted();
        }
    }

    void OnSpotCompleted()
    {
        //Print("OnMinionSpotCompleted");
        m_SpotActive = false;
        m_SpotCompleted = true;

        if(m_OppositeSpotActivated != nullptr)
        {
            if(!m_OppositeSpotActivated.m_SpotCompleted)
                return;
        }

        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        
        FGameplayEventData Payload;
        m_XardasChar.GetAbilitySystemComponent().SendGameplayEvent(GameplayTag::Event_XardasSleeper_OnMinionSpotCompleted, Payload);
    }

    void SetupSpot(UCreatureTeleportComponent TeleportComponent) override
    {
        Super::SetupSpot(TeleportComponent);
        m_TarceTarget.Initialize(m_XardasChar);
    }

    void ActivateSpot() override
    {
        GiveSummonAbility();
        m_SpotActive = true;
    }

    UFUNCTION(BlueprintCallable)
    void DoSummon()
    {
        //HideVisuals();
        ActivateMinions();
    }

    void OnSummonCompleted()
    {
        if(!m_ActivatedByOpposite)
        {
            if(ShouldActivateOppositeSpot())
            {
                TryActivateOppositeSpot();
                return;
            }
        }
        
        RemoveDoingTeleportTag();
        AllowTeleportWithoutCheck(false);
        EnableDoubleSpotActivation();  

        ActivateMinionDeathCheckTimer();
    }

    void ActivateMinionDeathCheckTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DoActivateMinionDeathCheckTimer"), 1.f, true);
    }

    UFUNCTION()
    void DoActivateMinionDeathCheckTimer()
    {
        //if(m_SpotActive && m_MinionsDead.Num() == m_Minions.Num())
        for(auto minion : m_Minions)
        {
            if(!minion.Key.IsDead())
                return;
        }
        if(m_OppositeSpotActivated == nullptr)
        {
            //At this point all minions are dead but the check is still active. Something is wrong so force call OnSpotCompleted();
            OnSpotCompleted();
            return;
        }
            

        for(auto minion : m_OppositeSpotActivated.m_Minions)
        {
            if(!minion.Key.IsDead())
                return;
        }

        //At this point all minions are dead but the check is still active. Something is wrong so force call OnSpotCompleted();
        OnSpotCompleted();

    }

    void DoTeleport(AXardasSleeperTeleportSpotVisual TeleportSpot)
    {
        FGameplayEventData Payload;
        Payload.Target = TeleportSpot;
        Payload.OptionalObject = m_XardasTeleportComp;
        m_XardasChar.GetAbilitySystemComponent().SendGameplayEvent(GameplayTag::Ability_Action_Teleport_XardasSleeper, Payload);
    }

    void GiveSummonAbility()
    {
        FGameplayEventData gameplay_event;
		gameplay_event.Target = this;

        FGameplayAbilitySpec ability_spec = FGameplayAbilitySpec(UGA_Summon_XardasSleeper::StaticClass());
        MagicScript::GivePlayRemove(m_XardasChar.GetAbilitySystemComponent(), ability_spec, gameplay_event);
    }

    bool ShouldActivateOppositeSpot()
    {
        UGothicAbilitySystemComponent abComp = GetAbilitySystemComponent();
        return abComp.HasGameplayTag(GameplayTag::State_XardasSleeper_CanActivateDoubleMinionSpot);
    }

    void TryActivateOppositeSpot()
    {
       //If the selected spot has both opposite available, we want to activate the opposite that have the initial one as opposite
        if(AreBothOppositeAvailable())
        {
            if(m_OppositeSpot1.HasAsOpposite(m_XardasTeleportComp.m_InitialMinionSpot))
                if(ActivateOppositeSpot(m_OppositeSpot1))
                    return;
                if(ActivateOppositeSpot(m_OppositeSpot2))
                    return;
        }

        if(ActivateOppositeSpot(m_OppositeSpot1))
            return;
        if(ActivateOppositeSpot(m_OppositeSpot2))
            return;
        //@DE - If both spots are active, we get a random one.
        auto spot = Cast<AMinionSpot_XardasSleeper>(m_XardasTeleportComp.GetActiveRandomMinionSpot());
        ActivateOppositeSpot(spot);
    }


    bool HasAsOpposite(AMinionSpot_XardasSleeper Spot)
    {
        return m_OppositeSpot1 == Spot || m_OppositeSpot2 == Spot;
    }

    bool AreBothOppositeAvailable()
    {
        return !m_OppositeSpot1.m_SpotActive && !m_OppositeSpot2.m_SpotActive;
    }

    bool ActivateOppositeSpot(AMinionSpot_XardasSleeper OppositeSpot)
    {
        if(OppositeSpot == nullptr || OppositeSpot.m_SpotActive || OppositeSpot.m_SpotCompleted)
            return false;
        m_OppositeSpotActivated = OppositeSpot;
        m_OppositeSpotActivated.m_OppositeSpotActivated = this;
        m_OppositeSpotActivated.m_ActivatedByOpposite = true;
        AllowTeleportWithoutCheck(true);
        DoTeleport(m_OppositeSpotActivated);
        return true;
        
    }

    void AllowTeleportWithoutCheck(bool AllowTeleport)
    {
        UGothicAbilitySystemComponent abComp = GetAbilitySystemComponent();
        if(AllowTeleport)
            abComp.AddTag(GameplayTag::State_XardasSleeper_CanTeleportWithoutCheck);
        else
            abComp.RemoveTag(GameplayTag::State_XardasSleeper_CanTeleportWithoutCheck);
    }

    void ActivateMinions()
    {
        for(auto minionTuple : m_Minions)
        {
            auto minion = minionTuple.Key.Character;

            //auto abComp = minion.AbilitySystemComponent;

            // abComp.ApplyGameplayEffectToSelf(m_MinionStunnedRemovalGE, 0, abComp.MakeEffectContext());
            // Cast<ASkeleton_XardasSleeper>(minion.Character).SetChained(false);
            // auto players = MagicScript::GetAllPlayersNearCurrentLocation(minion.GetWorld(), minion.GetCharacter(), 25000);
            // if(players.IsEmpty())
            //     return;
            // players.Shuffle();
            // minion.AI.StartAttackingImmediately(players[0]);

            auto summonedComp = UXardasSleeperSkeletonsSummonedComponent::Get(minion);
            summonedComp.DoSummon();
        }
    }

    void ActivateMinion(AActor Actor)
    {
        auto gothicChar = Cast<AGothicCharacter>(Actor);
        if(gothicChar == nullptr)
            return;

        auto abComp = gothicChar.AbilitySystemComponent;
        abComp.ApplyGameplayEffectToSelf(m_MinionStunnedRemovalGE, 0, abComp.MakeEffectContext());

        Cast<ASkeleton_XardasSleeper>(gothicChar).SetChained(false);      

    }

    void OnActivateVisuals(UXardas_Sleeper_Minion_BillboardComponent SpawnSpotBillboard)
    {  
        SpawnSpotBillboard.ActivateVisuals();
    }

    UFUNCTION(BlueprintEvent)
    void HideVisuals()
    {

    }

    void OnTeleportCompleted() override
    {
        if(IsTeleportedForVisibilitiy())
            return;
        Super::OnTeleportCompleted();
        ActivateSpot();
    }

    bool IsTeleportedForVisibilitiy()
    {
        UGothicAbilitySystemComponent abComp = GetAbilitySystemComponent();
        if(abComp.HasGameplayTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpotVisibility))
        {
            abComp.RemoveTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpotVisibility);
            RemoveDoingTeleportTag();
            return true;
        }
        return false;
    }

    void EnableDoubleSpotActivation()
    {
        UGothicAbilitySystemComponent abComp = GetAbilitySystemComponent();
        if(!abComp.HasGameplayTag(GameplayTag::State_XardasSleeper_CanActivateDoubleMinionSpot))
            abComp.AddTag(GameplayTag::State_XardasSleeper_CanActivateDoubleMinionSpot);
    }

    UGothicAbilitySystemComponent GetAbilitySystemComponent()
    {
        return Cast<UGothicAbilitySystemComponent>(m_XardasChar.GetAbilitySystemComponent());
    }

    bool IsTargetVisible() override
    {
        return m_TarceTarget.IsTargetVisible();
    }

    bool ShouldRotateCharacter() override
    {
        return true;
    }

    FRotator GetSpotRotation() override
    {
        return m_TeleportLocation.GetWorldRotation();
    }

}



