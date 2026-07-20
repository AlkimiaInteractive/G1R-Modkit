class UGA_FireDemon_HellArmsArea_Base : UGA_Demon_Area_Base
{
    default ActivationRequiredTags.RemoveTag(GameplayTag::State_Grounded);
    default ActivationRequiredTags.AddTag(GameplayTag::State_Flying);

    UPROPERTY()
    float m_ArmSpawnDistance = 400.f;

    UPROPERTY()
    float m_MinArmSpawnDistance = 50.f;
    UPROPERTY()
    float m_MaxArmSpawnDistance = 200.f;

  
    UFUNCTION(BlueprintOverride)
    void OnActorSpawned_Scriptable(AActor SpawnedActor)
    {
        Super::OnActorSpawned_Scriptable(SpawnedActor);
        auto hellArmArea = Cast<AFireDemonHellArmsAreaVisual_Base>(SpawnedActor);
        hellArmArea.InitializeArea(m_Target);
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldCheckMovementMode_Scriptable() const
    {
        return false;
    }


     
}

