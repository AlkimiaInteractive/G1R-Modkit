UCLASS()
class UGA_Summon_NotVisible_Delayed : UGA_Summon_NotVisible
{
    UPROPERTY()
    FTimerHandle TaskTimer;
    UPROPERTY()
    float m_MaxDelay = 10.f;

    UPROPERTY()
    USkeletalMeshComponent m_SkeletalMesh;
    UPROPERTY()
    TSubclassOf<ASummonCreatureVisualEffect> m_SpawningVisualActorClass;

    UPROPERTY()
    ASummonCreatureVisualEffect m_SpawningVisualActor;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        InitializeSpawningVisualActor(); 
    }
    

    UFUNCTION(BlueprintOverride)
    void DoSummon_Scriptable()
    {
        //@DE - Timer to avoid wait forever. If the mutables takes more than 10 seconds to load there is an issue.
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnSpawnTimeout"), m_MaxDelay, false);
        m_SkeletalMesh = Cast<USkeletalMeshComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(USkeletalMeshComponent::StaticClass()));
        // m_SkeletalMesh.OnAnimInitialized.AddUFunction(this, n"OnAnimInitialized");
        Summon();
               
    }

    void InitializeSpawningVisualActor()
    {
    }

    void Summon()
    {
        ClearDelegates();
        PlayMontage();
        if(m_SpawningVisualActor != nullptr)
            m_SpawningVisualActor.PlayMontage();
    }

    void ClearDelegates()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        m_SkeletalMesh.OnAnimInitialized.Unbind(this, n"OnAnimInitialized");
    }

    void PlaySpawningVisual()
    {

    }

    UFUNCTION()
    void OnAnimInitialized()
    {
        Summon();
    }

    UFUNCTION()
    void OnSpawnTimeout()
    {
        Summon();
    }
}