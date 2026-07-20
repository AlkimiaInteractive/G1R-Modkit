
UCLASS()
class UUrizielWaveOfDeathItemDefinition : UItemDefinition
{
    default m_ItemGeneric = n"Blueprint'/Game/Items/Magic/UrizielWaveOfDeath/BP_UrizielWaveOfDeathActor.BP_UrizielWaveOfDeathActor_C'";
};

UCLASS()
class AUrizielWaveOfDeathVisual : ACollisionShapeVisual
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_CollisionComp;
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY()
    FGameplayTag m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_UrizielWaveOfDeath_Start;

    default m_CollisionComp.m_WeaponData = UUrizielWaveOfDeathVisualDefinition::StaticClass();

    UPROPERTY(BlueprintReadWrite)
    TSubclassOf<USpellConfig> m_SpellConfigClass = UUrizielWaveOfDeathSpellConfig::StaticClass();
    UPROPERTY()
    private FTimerHandle m_TaskTimer;
    
    UPROPERTY()
    TArray<AActor> m_TargetInAreaNotReachable;

    default bReplicates = true;
    float m_LastTimeSpan = 0.0f;
    float m_AreaSpell = 0.0f;
    float m_AccumulatedTime = 0.0f;

    default m_ItemDefinition = UUrizielWaveOfDeathItemDefinition::StaticClass();

    const FName WAVE_URIZIEL_LIFE_AREA_DATA = n"WAVE_URIZIEL_LIFE_AREA_DATA";
    const FName WAVE_URIZIEL_OWNER_DATA = n"WAVE_URIZIEL_OWNER_DATA";

    UPROPERTY()
    bool m_ClearedBehaviour = false;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_UrizielWaveOfDeathGE = UGE_Spell_UrizielWaveOfDeath::StaticClass();

    UPROPERTY()
    FGothicFXInstanceHandle m_SFXHandle;
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    UDelegateHandleContainer m_OnOwnerTransformedHandle;

    UFUNCTION(BlueprintOverride)
    void Initialize() 
    {
        Super::Initialize();
        m_ClearedBehaviour = false;
        UUrizielWaveOfDeathSpellConfig config = GetSpellConfig();
        if(config != nullptr)
        {
            auto lifeSpan = config.m_Duration;
            if(ComesFromLoadingData())
            {
                lifeSpan = m_LastTimeSpan;
                m_CollisionComp.SphereRadius = m_AreaSpell;
            }
            else
                ApplyGEToOwner();
            //@DE - Avoid timer at 0, it will be never executed
            if(Math::IsNearlyZero(lifeSpan))
                lifeSpan = 0.5;

            m_AccumulatedTime = lifeSpan;

            //@DE - Set timer to control the visual life because if destroy it directly the sound stops abruptly
            TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DoDestroy"), lifeSpan, false);            
            SetColliderState(EHitColliderState::Damage);
            ActivateOverlapTimer();
            m_CollisionComp.SetVisibility(true);
            //m_CollisionComp.SetHiddenInGame(false, true);
            SetActorTickEnabled(true);
            m_SFXHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Magic_UrizielWaveOfDeath_Loop, nullptr);

            UGothicCharacterStateSubsystem::Get().OnPlayerGoToSleep.AddUFunction(this, n"OnPlayerGoToSleep");
        }
    }

    UFUNCTION()
    void DoDestroy()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        UGothicCharacterStateSubsystem::Get().OnPlayerGoToSleep.Unbind(this, n"OnPlayerGoToSleep");
        MagicScript::DetachFromEvent(GetOwner(), m_OnOwnerTransformedHandle);
        SetColliderState(EHitColliderState::None);
        SetActorTickEnabled(false);
        GetFXComponent().StopFXInstance(m_SFXHandle, true);
        m_SFXHandle = FGothicFXInstanceHandle();
        ClearSpellBehaviour();
        SetLifeSpan(5.f);
    }

    UFUNCTION()
    void OnPlayerGoToSleep()
    {
        PlayCancelSpellVisual();
        DoDestroy();
    }


    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        Super::Tick(DeltaSeconds);
        auto fxComp = GetFXComponent();
        if(fxComp.IsHandleValid(m_SFXHandle))
            fxComp.MoveFXInstance(m_SFXHandle, GetActorLocation());

        m_AccumulatedTime = Math::Max(0, m_AccumulatedTime - DeltaSeconds);
    }

    UFUNCTION(BlueprintCallable, NetMulticast)
    void CastToCancelSpell()
    {
        PlayCancelSpellVisual();
        DoDestroy();
    }

    UFUNCTION(BlueprintEvent)
    void PlayCancelSpellVisual()
    {
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Super::BeginPlay();
        m_OnOwnerTransformedHandle = MagicScript::AttachToEventTag(GetOwner(), GameplayTag::Event_Spell_Transform_Begin, this, n"OnTransformSpellBegin");
    }

    
    UFUNCTION()
    void OnTransformSpellBegin(FGameplayEventData GameplayEventData)
    {
        PlayCancelSpellVisual();
        DoDestroy();
    }
    

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        Super::EndPlay(EndPlayReason);
        ClearSpellBehaviour();
    }

    void ClearSpellBehaviour()
    {
        if(m_ClearedBehaviour)
            return;
        m_ClearedBehaviour = true;

        DetachFromActor(EDetachmentRule::KeepWorld, EDetachmentRule::KeepWorld, EDetachmentRule::KeepWorld);

        System::ClearAndInvalidateTimerHandle(m_TaskTimer);
        m_CollisionComp.OnComponentBeginOverlap.Unbind(this, n"OnBeginOverlap");
        for(auto target : m_TargetsMap)
        {
            UGothicAbilitySystemComponent targetGothicAbComp = Cast<UGothicAbilitySystemComponent>(GothicGAS::GetAbilitySystemComponent(target.Key));
            if(targetGothicAbComp != nullptr)
               RemoveEffectToTarget(targetGothicAbComp, target.Value);
        }

        m_TargetInAreaNotReachable.Empty();
        RemoveGEToOwner();
    }

    void ApplyGEToOwner()
    {
        auto abComp = GothicGAS::GetAbilitySystemComponent(Owner);
        if(abComp != nullptr)
        {
            FGameplayEffectContextHandle context = abComp.MakeEffectContext();
            context.AddInstigator(GetOwner()/*Cast<AGothicCharacter>(GetOwner()).GetCharacterState()*/, GetOwner());
            FGameplayEffectSpecHandle specStackHandle = abComp.MakeOutgoingSpec(m_UrizielWaveOfDeathGE, 1.0f, context);  
            abComp.ApplyGameplayEffectSpecToTarget(specStackHandle, abComp);
        }
        
    }

    void RemoveGEToOwner()
    {
        auto abComp = GothicGAS::GetAbilitySystemComponent(Owner);
        if(abComp != nullptr)
        {
            abComp.RemoveActiveGameplayEffectBySourceEffect(m_UrizielWaveOfDeathGE, nullptr);
        }
    }

    void ActivateOverlapTimer()
    {
        m_TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OverlapCheck"), .5f, true);
    }

    UFUNCTION(BlueprintOverride)
    void OnFillSaveData_Scriptable(FReplicatedStringMap& data)
    {
        const auto owner = GetOwner();
        const auto character = Cast<AGothicCharacter>(owner);
        if(IsValid(character))
        {
            AddDataInto(data, WAVE_URIZIEL_OWNER_DATA, character.GetCharacterState().GetCharacterGlobalId().ToString());
        }
        FVector lifeArea(m_AccumulatedTime, m_CollisionComp.SphereRadius, 0.0f);
        AddDataInto(data, WAVE_URIZIEL_LIFE_AREA_DATA, lifeArea.ToString());    
    }

    UFUNCTION(BlueprintOverride)
    void OnRecoveredSavedData_Scriptable(const FReplicatedStringMap& data)
    {
        if(ContainsData(data, WAVE_URIZIEL_LIFE_AREA_DATA))
        {
            const auto lifeSAreatring = GetDataFrom(data, WAVE_URIZIEL_LIFE_AREA_DATA);
            FVector newLifeAreaVector;
            newLifeAreaVector.InitFromString(lifeSAreatring);
            m_LastTimeSpan = newLifeAreaVector.X;
            m_AreaSpell = newLifeAreaVector.Y;
        }

        if(ContainsData(data, WAVE_URIZIEL_OWNER_DATA))
        {
            const auto ownerGlobalId = GetDataFrom(data, WAVE_URIZIEL_OWNER_DATA);
            const auto ownerCharacterState = AGothicCharacterState::FindByGlobalId(FName(ownerGlobalId));
            if(IsValid(ownerCharacterState))
            {
                SetOwner(ownerCharacterState.GetCharacter());
                AttachToActor(GetOwner());
            }
        }
        Initialize();
        SpawnVisuals();
    }

    UFUNCTION()
    void OverlapCheck()
    {
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto overlapActor : overlappingActors)
        {
            if(overlapActor == GetOwner())
                continue;
            AGothicCharacter targetCharacter = Cast<AGothicCharacter>(overlapActor);
            if(targetCharacter == nullptr)
                continue;
            if(CanReachTarget(this, overlapActor, GetActorLocation(), nullptr))
            {
                if(!m_TargetsMap.Contains(overlapActor))
                {
                    //UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
                    //UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(overlapActor);
                    FHitResult SweepResult;
                    if(m_TargetInAreaNotReachable.Contains(overlapActor))
                    {
                        m_TargetInAreaNotReachable.Remove(overlapActor);
                    }
                    DoOnBeginOverlap(nullptr, overlapActor, nullptr, 0, false, SweepResult);

                    
                }
            }
            else
            {
                if(m_TargetsMap.Contains(overlapActor))
                {
                    if(!m_TargetInAreaNotReachable.Contains(overlapActor))
                    {
                        m_TargetInAreaNotReachable.Add(overlapActor);
                    }
                    
                    RemoveDamage(overlapActor);
                }
            }
        }
    }

    void OnTargetNotVisible(AActor OtherActor) override
    {
        Super::OnTargetNotVisible(OtherActor);
        RemoveDamage(OtherActor);
    }

    void DoOnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor,
                        UPrimitiveComponent OtherComp, int32 OtherBodyIndex) override
    {
        Super::DoOnEndOverlap(OverlappedComp, OtherActor, OtherComp, OtherBodyIndex);
        RemoveDamage(OtherActor);
        if(m_TargetInAreaNotReachable.Contains(OtherActor))
            m_TargetInAreaNotReachable.Remove(OtherActor);
    }

    void RemoveDamage(AActor OtherActor)
    {
        if(!m_TargetsMap.Contains(OtherActor))
            return;

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        if(RemoveEffectToTarget(targetAbComp, m_TargetsMap[OtherActor]))
            m_TargetsMap.Remove(targetAbComp.GetAvatar());

        
    }

    bool RemoveEffectToTarget(UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle Handle)
    {
        if(TargetAbComp != nullptr && m_TargetsMap.Contains(TargetAbComp.GetAvatar()))
        {
            return TargetAbComp.RemoveActiveGameplayEffect(Handle);
        }
        return false;
    }

    bool CanKillOnDefeatedState() override
    {
        return true;
    }
    
    bool NeedCheckVisibility() override
    {
        return true;
    }

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Dot;
    }

    UFUNCTION(BlueprintCallable)
    UUrizielWaveOfDeathSpellConfig GetSpellConfig()
    {
        return Cast<UUrizielWaveOfDeathSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
    }

    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass() override
    {
         if(m_CollisionComp.m_WeaponData != nullptr)
        {
            return m_CollisionComp.m_WeaponData;
        }
        return nullptr;
    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void SpawnVisuals()
    {
        
    }

    UShapeComponent GetCollisionComponent() override
    {
       return m_CollisionComp; 
    }

    void SetColliderState(EHitColliderState State) override
    {
        m_CollisionComp.SetState(State);
    }

    void AddCustomCollisionResponse(ECollisionChannel CollisionChannel,
                                    ECollisionResponse CollisionResponse) override
    {
         m_CollisionComp.AddCustomCollisionResponse(CollisionChannel, CollisionResponse);      
    }

    void OnEffectAppliedSuccessfully(AActor TargetActor, FActiveGameplayEffectHandle handle) override
    {
        Super::OnEffectAppliedSuccessfully(TargetActor, handle);
        if(MagicScript::IsValidGameplayEffectHandle(handle))
        {
            ReportPerceptionEvent(m_PerceptionStartTag, GetOwner(), Cast<AGothicCharacter>(TargetActor));
        }
    }

    void ReportPerceptionEvent(FGameplayTag PerceptionTag, AActor InstigatorActor, AGothicCharacter TargetActor)
    {
        if (TargetActor == nullptr)
            return;

        TargetActor.Perception.ReportPerceptionEvent(
            PerceptionTag,
            TargetActor.ActorLocation,
            SensedCharacter = TargetActor,
            TargetActor = TargetActor,
            InstigatorActor = InstigatorActor,
            AffectedActor = TargetActor
        );
    }

    bool CheckIsOverlappingActor(AActor OtherActor) override
    {
        if(m_CollisionComp.GetState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }

    bool ShouldOpenInteractableDoor() override
    {
        return true;
    }
};


