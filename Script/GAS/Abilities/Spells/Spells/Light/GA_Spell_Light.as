
class UGA_Spell_Light : UGameplayAbilitySpellBasic
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Light/BP_LightSpellVisual.BP_LightSpellVisual_C'";

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FName m_SocketName = n"spine_03";

    UPROPERTY()
    USkeletalMeshComponent m_SkeletalMeshComp;
   
    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        m_SkeletalMeshComp = Cast<USkeletalMeshComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(USkeletalMeshComponent::StaticClass()));
    }

    UFUNCTION(BlueprintOverride)
    void DoSpellBehaviour_Scriptable()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(!abComp.HasGameplayTag(GameplayTag::State_Spell_Light))
        {
            SpawnSpellServer();
            return;
        }
        RemovePreviousSpellVisual();
    }

    void RemovePreviousSpellVisual()
    {
        auto currentLightActor = GetCurrentLightActor();
        if(currentLightActor != nullptr)
            currentLightActor.CastToCancelSpell();
    }

    ALightSpellVisual GetCurrentLightActor()
    {
        TArray<AActor> attachedActors;
        GetAvatarActorFromActorInfo().GetAttachedActors(attachedActors, true, true);
        for(auto actor : attachedActors)
        {
            ALightSpellVisual lightActor = Cast<ALightSpellVisual>(actor);
            if(lightActor != nullptr)
            {
                return lightActor;
            }
        }
        return nullptr;
    }

    // UFUNCTION(BlueprintOverride)
    // void OnEndAbility(bool bWasCancelled)
    // {
    //     ReleaseTarget();
    // }
      
    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        return FRotator::ZeroRotator;
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        return m_SkeletalMeshComp.GetSocketLocation(m_SocketName);
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        ActorSpawned.SetOwner(GetAvatarActorFromActorInfo());        
        ActorSpawned.AttachToActor(GetAvatarActorFromActorInfo());
        //ActorSpawned.AttachToComponent(m_SkeletalMeshComp, m_SocketName, EAttachmentRule::SnapToTarget, EAttachmentRule::SnapToTarget, EAttachmentRule::SnapToTarget, false);

        //Attachment rotation correction
        auto ownerLocation = GetAvatarActorFromActorInfo().GetActorLocation();
        auto ownerForward = GetAvatarActorFromActorInfo().GetActorForwardVector();
        FRotator rotation = MagicScript::FindLookAtRotation(ownerLocation, ownerLocation + ownerForward * 1000);
        ActorSpawned.SetActorRotation(rotation);
        ActorSpawned.SetActorLocation(ownerLocation);
        
        auto lightActor = Cast<ALightSpellVisual>(ActorSpawned);
        if(lightActor != nullptr)
        {
            lightActor.Initialize();
        }
    }
}
