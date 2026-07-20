
UCLASS()
class ULightItemDefinition : UItemDefinition
{
    default m_ItemGeneric = n"Blueprint'/Game/Items/Magic/Light/BP_LightSpellVisual.BP_LightSpellVisual_C'";
};

UCLASS(Blueprintable)
class ALightSpellVisual : ASpellVisualSaveable
{
    default bNeverApplyTickOptimizations = true;
    
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    default bReplicates = true;

    UPROPERTY(BlueprintReadWrite)
    float m_RotationVelocity;
    UPROPERTY(BlueprintReadWrite)
    float m_HeightOffset;

    UPROPERTY(BlueprintReadWrite)
    TSubclassOf<USpellConfig> m_SpellConfigClass = ULightSpellConfig::StaticClass();

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_LightGE = UGE_Spell_Light::StaticClass();

    UPROPERTY()
    UDelegateHandleContainer m_DelegateHandleContainer;

    default m_ItemDefinition = ULightItemDefinition::StaticClass();
    UPROPERTY()
    float m_LastTimeSpan = 0;

    float m_AccumulatedTime = 0.0f;

    UPROPERTY()
    bool m_ClearedBehaviour = false;

    UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
    FGothicFXInstanceHandle m_SFXHandle;
    UPROPERTY()
    private FTimerHandle TaskTimer;
    

    const FName LIGHT_LIFE_DATA = n"LIGHT_LIFE_DATA";
    const FName LIGHT_OWNER_DATA = n"LIGHT_OWNER_DATA";

    UPROPERTY()
    UDelegateHandleContainer m_AttachToActorHandle;
     UPROPERTY()
    UDelegateHandleContainer m_DettachFromActorHandle;

    UPROPERTY()
    AGothicCharacter m_CurrentTargetActor;

    ALightSpellVisual()
    {
        ActorTickEnabled = true;
        ReplicateMovement = true;
    }

    UFUNCTION(BlueprintCallable)
    ULightSpellConfig GetSpellConfig()
    {
        return Cast<ULightSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_CurrentTargetActor = Cast<AGothicCharacter>(GetOwner());
        m_AttachToActorHandle = MagicScript::AttachToEventTag(GetOwner(), GameplayTag::Event_Spell_Light_AttachToActor, this, n"OnAttachToActor");
        m_DettachFromActorHandle = MagicScript::AttachToEventTag(GetOwner(), GameplayTag::Event_Spell_Light_DettachFromActor, this, n"OnDettachFromActor");
    }

    void Initialize()
    {
        m_ClearedBehaviour = false; 
        SetUpConfig();
        ApplyGEToOwner();
        ActivateVisuals();
    
        SubscribeToConversationTag();
        m_SFXHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Magic_Spell_Light_Moving, nullptr);
        UGothicCharacterStateSubsystem::Get().OnPlayerGoToSleep.AddUFunction(this, n"OnPlayerGoToSleep");
    }

    UFUNCTION()
    void OnAttachToActor(FGameplayEventData GameplayEventData)
    {
        auto newTarget = Cast<AGothicCharacter>(GameplayEventData.Target);
        if(newTarget == nullptr)
            return;
        UpdateCurrentActorMesh(newTarget);
        m_CurrentTargetActor = newTarget;
        AttachToActor(m_CurrentTargetActor);
    }

    UFUNCTION(BlueprintEvent)
    void UpdateCurrentActorMesh(AGothicCharacter NewTarget)
    {

    }

    UFUNCTION()
    void OnDettachFromActor(FGameplayEventData GameplayEventData)
    {
        DetachFromActor(EDetachmentRule::KeepWorld, EDetachmentRule::KeepWorld, EDetachmentRule::KeepWorld);
        m_CurrentTargetActor = nullptr;
    }

    void SetUpConfig()
    {
        ULightSpellConfig spellConfig = GetSpellConfig();
        
        auto lifeSpan = spellConfig.m_LifeSpan;
        if(ComesFromLoadingData())
            lifeSpan = m_LastTimeSpan;
        
         //@DE - Avoid timer at 0, it will be never executed
            if(Math::IsNearlyZero(lifeSpan))
                lifeSpan = 0.5;
        
        m_AccumulatedTime = lifeSpan;

        //@DE - Set timer to control the visual life because if destroy it directly the sound stops abruptly
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DoDestroy"), lifeSpan, false);           
        
        m_RotationVelocity = spellConfig.m_RotationVelocity;
        m_HeightOffset = spellConfig.m_HeightOffset;
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        m_AccumulatedTime = Math::Max(0, m_AccumulatedTime - DeltaSeconds);
    }

    UFUNCTION()
    void DoDestroy()
    {
        UGothicCharacterStateSubsystem::Get().OnPlayerGoToSleep.Unbind(this, n"OnPlayerGoToSleep");
        MagicScript::DetachFromEvent(GetOwner(), m_AttachToActorHandle);
        MagicScript::DetachFromEvent(GetOwner(), m_DettachFromActorHandle);
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        ClearSpellBehaviour();
        SetLifeSpan(5.f);
    }


    UFUNCTION(BlueprintCallable, NetMulticast)
    void CastToCancelSpell()
    {
        ClearSpellBehaviour();
        PlayCancelSpellVisual();
    }

    void ClearSpellBehaviour()
    {
        if(m_ClearedBehaviour)
            return;
        m_ClearedBehaviour = true;
        DetachFromActor(EDetachmentRule::KeepWorld, EDetachmentRule::KeepWorld, EDetachmentRule::KeepWorld);
        DoDissolveVFX();
        //GetOwner().DetachFromActor();
        UnSubscribeFromConversationTag();
        GetFXComponent().StopFXInstancesWithTag(GameplayTag::FX_Magic_Spell_Light_Moving, false);
        RemoveGEToOwner();
    }

    UFUNCTION(BlueprintEvent)
    void PlayCancelSpellVisual()
    {
    }

    UFUNCTION(BlueprintEvent, BlueprintCallable)
    void DoDissolveVFX()
    {
    }

    // UFUNCTION(BlueprintOverride)
    // void EndPlay(EEndPlayReason EndPlayReason)
    // {
    //     ClearSpellBehaviour();
    // }
    
    UFUNCTION()
    void OnPlayerGoToSleep()
    {
        DoDestroy();
    }

    UFUNCTION(BlueprintOverride)
    void OnFillSaveData_Scriptable(FReplicatedStringMap& data)
    {
        const auto owner = GetOwner();
        const auto character = Cast<AGothicCharacter>(owner);
        if(IsValid(character))
        {
            AddDataInto(data, LIGHT_OWNER_DATA, character.GetCharacterState().GetCharacterGlobalId().ToString());
        }
        FVector life(m_AccumulatedTime, 0.0f, 0.0f);
        AddDataInto(data, LIGHT_LIFE_DATA, life.ToString());     
    }

    UFUNCTION(BlueprintOverride)
    void OnRecoveredSavedData_Scriptable(const FReplicatedStringMap& data)
    {
        if(ContainsData(data, LIGHT_LIFE_DATA))
        {
            const auto lifeString = GetDataFrom(data, LIGHT_LIFE_DATA);
            FVector newLifeVector;
            newLifeVector.InitFromString(lifeString);
            m_LastTimeSpan = newLifeVector.X;
        }

        if(ContainsData(data, LIGHT_OWNER_DATA))
        {
            const auto ownerGlobalId = GetDataFrom(data, LIGHT_OWNER_DATA);
            const auto ownerCharacterState = AGothicCharacterState::FindByGlobalId(FName(ownerGlobalId));
            if(IsValid(ownerCharacterState))
            {
                SetOwner(ownerCharacterState.GetCharacter());
                AttachToActor(ownerCharacterState.GetCharacter());
            }
        }

        Initialize();
    }

    void ApplyGEToOwner()
    {
        auto abComp = GothicGAS::GetAbilitySystemComponent(Owner);
        if(abComp != nullptr)
        {
            FGameplayEffectContextHandle context = abComp.MakeEffectContext();
            context.AddInstigator(GetOwner()/*Cast<AGothicCharacter>(GetOwner()).GetCharacterState()*/, GetOwner());
            FGameplayEffectSpecHandle specStackHandle = abComp.MakeOutgoingSpec(m_LightGE, 1.0f, context);  
            abComp.ApplyGameplayEffectSpecToTarget(specStackHandle, abComp);
        }        
    }

    void UnSubscribeFromConversationTag()
    {
        auto abComp = GothicGAS::GetAbilitySystemComponent(Owner);
        if(abComp == nullptr)
            return;

        MagicScript::UnregisterGameplayTagEvent(abComp, m_DelegateHandleContainer);
    }

    void SubscribeToConversationTag()
    {
        auto abComp = GothicGAS::GetAbilitySystemComponent(Owner);
        if(abComp == nullptr)
            return;

        m_DelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(
            abComp, 
            GameplayTag::State_Conversation, 
            EGameplayTagEventType::NewOrRemoved, 
            this, 
            n"ConversationStateChanged");
    }

    UFUNCTION()
    void ConversationStateChanged(const FGameplayTag CallbackTag, int32 NewCount)
    {
        //During conversation time, the light is not counting its life and can't be destroyed.
        
        if(NewCount > 0)
        {
            System::PauseTimerHandle(TaskTimer);
            m_LastTimeSpan = m_AccumulatedTime;
            //Print("Entering into Conversation");
        }
        else
        {
            //Print("Leaving Conversation");
            m_AccumulatedTime = m_LastTimeSpan;
            System::UnPauseTimerHandle(TaskTimer);
        }
    }

    void RemoveGEToOwner()
    {
        auto abComp = GothicGAS::GetAbilitySystemComponent(Owner);
        if(abComp != nullptr)
        {
            abComp.RemoveActiveGameplayEffectBySourceEffect(m_LightGE, nullptr);
        }
    }

    UFUNCTION(BlueprintEvent, BlueprintCallable)
    void ActivateVisuals()
    {

    }
}