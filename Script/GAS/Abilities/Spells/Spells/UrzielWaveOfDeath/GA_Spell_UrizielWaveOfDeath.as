class UGA_Spell_UrizielWaveOfDeath : UGameplayAbilitySpellBasic
{
    UPROPERTY()
    AUrizielWaveOfDeathVisual m_projectile;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/UrizielWaveOfDeath/BP_UrizielWaveOfDeathActor.BP_UrizielWaveOfDeathActor_C'";

    UFUNCTION(BlueprintOverride)
    bool IsOverridingGetStateLockMovementOnSpell_Scriptable()
    {
        return IsCancelingAPreviousSpell();
    }

    UFUNCTION(BlueprintOverride)
    bool GetOverrideGetStateLockMovementOnSpell_Scriptable()
    {
        //@DE - Can walk during spell
        return false;
    }

    bool IsCancelingAPreviousSpell() const
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        return abComp.HasGameplayTag(GameplayTag::State_Spell_UrizielWaveOfDeath);
    }

    UFUNCTION(BlueprintOverride)
    void DoSpellBehaviour_Scriptable()
    {
        if(IsCancelingAPreviousSpell())
        {
            RemovePreviousSpellVisual();
            return;
        }
        SpawnSpellServer();
    }

    void RemovePreviousSpellVisual()
    {
        auto currentUrizielActor = GetCurrentUrizielWaveOfDeathActor();
        if(currentUrizielActor != nullptr)
            currentUrizielActor.CastToCancelSpell();
    }

    AUrizielWaveOfDeathVisual GetCurrentUrizielWaveOfDeathActor()
    {
        TArray<AActor> attachedActors;
        GetAvatarActorFromActorInfo().GetAttachedActors(attachedActors, true, true);
        for(auto actor : attachedActors)
        {
            AUrizielWaveOfDeathVisual urizielActor = Cast<AUrizielWaveOfDeathVisual>(actor);
            if(urizielActor != nullptr)
            {
                return urizielActor;
            }
        }
        return nullptr;
    }
   
    UFUNCTION()
    FVector GetSpawnPosition(ACharacter OwnerCharacter)
    {
        return OwnerCharacter.GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        ActorSpawned.AttachToActor(GetAvatarActorFromActorInfo());

        const UUrizielWaveOfDeathSpellConfig conf = Cast<UUrizielWaveOfDeathSpellConfig>(GetSpellConfigurationContainer().GetSpellConfig());
        m_projectile = Cast<AUrizielWaveOfDeathVisual>(ActorSpawned);

        m_projectile.m_CollisionComp.SetState(EHitColliderState::Damage);
        
        //m_projectile.m_TargetRadius = GetSpellAreaRange();
        m_projectile.m_CollisionComp.SphereRadius = GetSpellAreaRange();
        m_projectile.m_CollisionComp.SetHiddenInGame(true);
        m_projectile.m_CollisionComp.SetVisibility(true);

        m_projectile.SetActorLocation(GetSpawnPosition(Cast<ACharacter>(m_projectile.Owner)));

        m_projectile.SpawnVisuals();
    }

}


