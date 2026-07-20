class UGA_Spell_MagicBeam: UGameplayAbilitySpellBasic
{

    UPROPERTY()
    AMagicBeamVisual m_MagicBeam;

    UPROPERTY()
    FVector m_MagicBeamUpSocketLocation;
    UPROPERTY()
    FVector m_MagicBeamBottomBaseLocation;
    UPROPERTY()
    FVector m_SpawnDirection;

    UPROPERTY()
    FName m_UpperSocket = n"MagicBeamUp";

    UPROPERTY()
    FName m_BottomSocket = n"MagicBeamBottom";

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/SkeletonMage/MagicBeam/BP_MagicBeamVisual_Actor.BP_MagicBeamVisual_Actor_C'";

    UPROPERTY()
    UDelegateHandleContainer m_EndRequestHandle;

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        auto spawnActor = Cast<AMagicBeamVisual>(actorToSpawnClass.Get().GetDefaultObject());
        auto config = Cast<UMagicBeamDefinition_SkeletonMage>(spawnActor.m_CollisionComp.m_WeaponData.Get().GetDefaultObject());
        //m_BottomLocation = GetSocketLocation(owner, n"Bottom");

        // auto TargetCharacter = Cast<AGothicCharacter>(owner.GetTargetedActor());
        // if (TargetCharacter == nullptr)
        //     return socketLocation + owner.GetActorForwardVector() * config.m_CapsuleHalfHeight;
        // FVector direction = TargetCharacter.GetActorLocation() - socketLocation;
        // direction.Normalize();
        // return socketLocation + direction * config.m_CapsuleHalfHeight;

        //m_WeaponBaseLocation= GetSocketLocation(owner, n"WeaponBase");
        //FVector m_SpawnDirection =  m_BottomLocation - m_WeaponBaseLocation;
        //m_SpawnDirection.Normalize();
        return m_MagicBeamUpSocketLocation + m_SpawnDirection * config.m_CapsuleHalfHeight;
        
    }

    FVector GetSocketLocation(AGothicCharacter OwnerCharacter, FName SocketName) const
    {
        auto itemInHand = Cast<AMeleeWeaponVisual>(OwnerCharacter.GetCarryComponent().GetItemVisual());
        auto staticMeshComp = Cast<UStaticMeshComponent>(itemInHand.GetComponentByClass(UStaticMeshComponent::StaticClass()));
        return staticMeshComp.GetSocketLocation(SocketName);
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        // auto TargetCharacter = Cast<AGothicCharacter>(owner.GetTargetedActor());
        // if (TargetCharacter == nullptr)
        //     return GetAvatarActorFromActorInfo().GetActorRotation();
        // FVector socketLocation = GetSocketLocation(owner, n"Bottom");
        // return MagicScript::FindLookAtRotation(socketLocation, TargetCharacter.GetActorLocation());
        return MagicScript::FindLookAtRotation(m_MagicBeamBottomBaseLocation, m_MagicBeamUpSocketLocation);
        
    }
   
    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        m_MagicBeam = Cast<AMagicBeamVisual>(ActorSpawned);
        m_MagicBeam.m_CollisionBasePivot.SetWorldLocation(m_MagicBeamUpSocketLocation);
        // if(ActorSpawned != nullptr)
        // {
        //     ActorSpawned.SetActorLocation(AvatarActorFromActorInfo.GetActorLocation());     
        // }
        AGothicCharacter character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto itemInHand = Cast<AMeleeWeaponVisual>(character.GetCarryComponent().GetItemVisual());
        m_MagicBeam.AttachToActor(itemInHand, m_UpperSocket, EAttachmentRule::KeepWorld);
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        m_EndRequestHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Spell_MagicBeam_End, this, n"OnEndRequest");
        
        AGothicCharacter character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        m_MagicBeamUpSocketLocation = GetSocketLocation(character, m_UpperSocket);
        m_MagicBeamBottomBaseLocation= GetSocketLocation(character, m_BottomSocket);
        m_SpawnDirection =  m_MagicBeamUpSocketLocation - m_MagicBeamBottomBaseLocation;
        m_SpawnDirection.Normalize();
    }

    UFUNCTION()
    void OnEndRequest()
    {
        if(m_MagicBeam != nullptr)
            m_MagicBeam.DestroyActor();
        DoEndSpellAction();
    }

    UFUNCTION(BlueprintOverride)
    void DoOnActivateAbilitySyncEnd_Scriptable()
    {
        PlayLaunchSpellMontage(NAME_None, false);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_EndRequestHandle);
    }

}
