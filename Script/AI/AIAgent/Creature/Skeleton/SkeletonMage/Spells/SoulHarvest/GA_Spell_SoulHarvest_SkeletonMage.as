class UGA_Spell_SoulHarvest_SkeletonMage : UGA_Spell_SpawnRepeatingProjectile
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();

    int m_Index = 1;
    int m_NumSections = 0;
    bool m_DoOnce = true;

    default m_SpawnCollisionHandlingOverride = ESpawnActorCollisionHandlingMethod::AlwaysSpawn;
    UPROPERTY()
    USkeletonMageSummonManagerComponent m_SummonManagerComponent;

    UPROPERTY()
    USoulHarvestSpawnPlaceHelper m_SoulHarvestSpawnPlaceHelper;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/SkeletonMage/SoulHarvest/BP_SoulHarvest_Projectile_Character_Visual.BP_SoulHarvest_Projectile_Character_Visual_C'";

    UPROPERTY()
    TSubclassOf<USpellProjectileConfig> m_SpellConfigClass = UProjectileSpellConfig_SoulHarvest_SkeletonMage::StaticClass();

    UProjectileSpellConfig_SoulHarvest_SkeletonMage m_SpellConfig;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int m_ProjectileGroundOffset;

    UPROPERTY()
    UDelegateHandleContainer m_EndRequestHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        m_SummonManagerComponent = USkeletonMageSummonManagerComponent::GetOrCreate(GetAvatarActorFromActorInfo());
        if(m_SummonManagerComponent == nullptr)
        {
            DoEndSpellAction();
            return;
        }

        m_Index = 1;
        m_NumSections = GetNumSectionsLaunchSpellMontage();
        m_DoOnce = true;

        if(!m_SpawnActorPath.IsValid())
            MagicScript::GetPreloaded(m_SpawnActorPath);

        m_SoulHarvestSpawnPlaceHelper = Cast<USoulHarvestSpawnPlaceHelper>(NewObject(this, USoulHarvestSpawnPlaceHelper::StaticClass()));
        m_SoulHarvestSpawnPlaceHelper.m_Owner = GetAvatarActorFromActorInfo();

        m_SpellConfig = Cast<UProjectileSpellConfig_SoulHarvest_SkeletonMage>(m_SpellConfigClass.Get().DefaultObject);

        m_EndRequestHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Spell_SoulHarvest_End, this, n"OnEndRequest");

        SetupConfig();
    }

    UFUNCTION()
    void OnEndRequest()
    {
        DoEndSpellAction();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_EndRequestHandle); 
    }


    void SetupConfig()
    {
        m_ProjectileGroundOffset = m_SpellConfig.m_ProjectileGroundOffset;
        m_SoulHarvestSpawnPlaceHelper.m_MinSummonDistance = m_SpellConfig.m_MinSummonDistance;
        m_SoulHarvestSpawnPlaceHelper.m_MaxSummonDistance = m_SpellConfig.m_MaxSummonDistance;
        m_SoulHarvestSpawnPlaceHelper.m_AngleInterval = m_SpellConfig.m_AngleInterval;
        m_SoulHarvestSpawnPlaceHelper.m_DistanceInterval = m_SpellConfig.m_DistanceInterval;
        m_SoulHarvestSpawnPlaceHelper.m_SpawnAttemptRadius = m_SpellConfig.m_SpawnAttemptRadius;
        m_SoulHarvestSpawnPlaceHelper.m_CreatureSpawnAttempts = m_SpellConfig.m_CreatureSpawnAttempts;
        m_SoulHarvestSpawnPlaceHelper.m_ActorsToIgnore.Add(GetAvatarActorFromActorInfo());

        m_SoulHarvestSpawnPlaceHelper.m_Odd = false;
        m_SoulHarvestSpawnPlaceHelper.m_CurrentAngle = 0;
        m_SoulHarvestSpawnPlaceHelper.m_CurrentDistance = m_SoulHarvestSpawnPlaceHelper.m_MinSummonDistance;
    }

    
   
    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void OnPlayLaunchSpellServer_Scriptable()
    {
        //Super::OnPlayLaunchSpellServer_Scriptable();
        //Print(FString("OnPlayLaunchSpellServer_Scriptable"));

        if(m_NumSections == 0 || m_Index > m_NumSections)
        {
            DoEndSpellAction();
            return;
        }

        if(m_Index > m_NumSections)
        {
            //@DE - Wait to end notify
            return;
        }

        m_Index++;
        if(m_DoOnce)
        {
            m_DoOnce = false;
            PlayLaunchSpellMontage_Scriptable(NAME_None, false);
        }
       
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        auto projectileVisual = Cast<ASoulHarvestCharacter_Visual>(actorToSpawnClass.Get().DefaultObject);
        FVector desired_pos;
        if(m_SoulHarvestSpawnPlaceHelper.TryToGetValidSpawnPlace(GetAvatarActorFromActorInfo(), desired_pos, projectileVisual))
        {
            //System::DrawDebugSphere(desired_pos, 100.f, 12, FLinearColor::Red, 10, 10);
            desired_pos.Z += m_ProjectileGroundOffset;
            return desired_pos;
        }
        
        desired_pos = owner.GetActorLocation();    
        desired_pos.Z += m_ProjectileGroundOffset;
        return desired_pos;
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        return GetAvatarActorFromActorInfo().GetActorRotation();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor actorSpawned)
    {
        //Print(FString("OnActorSpawnedServer_Scriptable"), 5.f, FLinearColor::Purple);

        auto soulHarvestVisual = Cast<ASoulHarvestCharacter_Visual>(actorSpawned);
        soulHarvestVisual.SetActorRotation(GetAvatarActorFromActorInfo().GetActorRotation());
        m_SummonManagerComponent.RegisterHarvestSoul(soulHarvestVisual);
        auto projectileDirection = actorSpawned.GetActorForwardVector();

        projectileDirection.Normalize();
        //System::DrawDebugLine(soulHarvestVisual.GetActorLocation(), soulHarvestVisual.GetActorLocation() + projectileDirection * 5000, FLinearColor::Gray, 10.f, 10.f);

        soulHarvestVisual.SetOwner(GetActorInfo().GetAvatarActor());
        soulHarvestVisual.OnProjectileFired();
    }

    UFUNCTION(BlueprintOverride)
    bool IsAccesible_Scriptable(AGothicCharacter Character, FVector LocationToSpawn,
                                USpellProjectileDefinition ProjectileDefinition,
                                FVector& TargetLocation, FHitResult& outHitResult)
    {
        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldForceIgnoreInput_Scriptable()
    {
        return true;
    }

}