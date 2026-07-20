class UInvulnerableVisualComponent : UCreatureGenericMagicComponent
{
    UPROPERTY()
    AInvulnerableVisual m_InvulnerableVisual;

    UPROPERTY(EditAnywhere)
	TSoftClassPtr<AActor> m_InvulnerableVisualActorPath = nullptr;
    
    UFUNCTION()
    TSubclassOf<AActor> GetActorClassServer_Scriptable(TSoftClassPtr<AActor> Asset) const
    {
        return Asset.Get();
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(!m_InvulnerableVisualActorPath.IsValid())
            MagicScript::GetPreloaded(m_InvulnerableVisualActorPath);
    }


    void CreateInvulnerableVisual(AActor OwnerActor)
    {
        DestroyInvulnerableVisual();
        m_InvulnerableVisual = Cast<AInvulnerableVisual>(SpawnActor(GetActorClassServer_Scriptable(m_InvulnerableVisualActorPath), OwnerActor.GetActorLocation(), OwnerActor.GetActorRotation()));
        m_InvulnerableVisual.SetOwner(OwnerActor);
        m_InvulnerableVisual.AttachToActor(OwnerActor);
        m_InvulnerableVisual.SetUpCollisions();
    }

    void DestroyInvulnerableVisual()
    {
        if(m_InvulnerableVisual != nullptr)
            m_InvulnerableVisual.DestroyActor();
    }

    void ActivateInvulnerableVisual()
    {
        m_InvulnerableVisual.ActivateVisuals();
    }

    void DeactivateInvulnerableVisual()
    {
        m_InvulnerableVisual.DeactivateVisuals();
    }

    //@DE - Custom activation and explosion visual for teleports while the loop visual is active
    void SpawnExplosionVisual()
    {
        m_InvulnerableVisual.SpawnExplosionVisual();
    }
    //@DE - Custom activation and explosion visual for teleports while the loop visual is active
    void SpawnShieldVisual()
    {
        m_InvulnerableVisual.SpawnShieldVisual();
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        DestroyInvulnerableVisual();
    }
}
