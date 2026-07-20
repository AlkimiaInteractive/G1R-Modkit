class UGA_FireGolem_SpecialState_Heated : UGameplayAbilityCreatureSpecialState
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Fire/Heated/BP_FireGolem_HeatedStateActor.BP_FireGolem_HeatedStateActor_C'";

    //default AbilityTags.AddTag(GameplayTag)

    default m_StateGameplayTag = GameplayTag::State_Knockback;
    UPROPERTY()
    AHeatedSpecialStateVisual m_HeatedVisualActor;

    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_WeaponData = UHeatedState_FireGolem::StaticClass();
   

    UGA_FireGolem_SpecialState_Heated()
    {
        //@DE - Due AS fields Initialization. Its necessary set the tag explicitally instead m_StateGameplayTag
        TriggerBeginOn(GameplayTag::State_Knockback);
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        if(!m_SpawnActorPath.IsValid())
            MagicScript::GetPreloaded(m_SpawnActorPath);
        m_HeatedVisualActor = GetHeatedVisualActor();
        if(m_HeatedVisualActor == nullptr)
        {
            DoSpawnStateActorServer();
            return;
        }

        m_HeatedVisualActor.ResetEffect();
    }

    UFUNCTION(BlueprintOverride)
    void OnStateRemoved_Scriptable()
    {
        if(m_HeatedVisualActor == nullptr)
            return;
        
        m_HeatedVisualActor.DoDestroy();
        m_HeatedVisualActor = nullptr;
    }

    AHeatedSpecialStateVisual GetHeatedVisualActor()
    {
        auto avatar = GetAvatarActorFromActorInfo();
        TArray<AActor> OutActors;
        avatar.GetAttachedActors(OutActors);

        for(AActor attachedActor : OutActors)
        {
            auto attachedVisual = Cast<AHeatedSpecialStateVisual>(attachedActor);
            if(attachedActor != nullptr)
                return attachedVisual;
        }
        return nullptr;
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        return GetAvatarActorFromActorInfo().GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        return GetAvatarActorFromActorInfo().GetActorRotation();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        m_HeatedVisualActor = Cast<AHeatedSpecialStateVisual>(ActorSpawned);
        if(m_HeatedVisualActor == nullptr)
            return;

        m_HeatedVisualActor.SetOwner(GetAvatarActorFromActorInfo());
        m_HeatedVisualActor.AttachToActor(GetAvatarActorFromActorInfo(), NAME_None, EAttachmentRule::SnapToTarget, EAttachmentRule::SnapToTarget, EAttachmentRule::SnapToTarget, false);
        m_HeatedVisualActor.m_CollisionComp.m_WeaponData = m_WeaponData;
        m_HeatedVisualActor.Initialize();
    }

    //need owner, config, accumulated time, gameplay effect reference, 
}