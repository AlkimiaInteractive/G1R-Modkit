UCLASS()
class UGA_Summon_SH_Skeleton : UGA_Summon_NotVisible_Delayed
{
    UPROPERTY()
    float m_MinSummonDelay = 0.2f;
    UPROPERTY()
    float m_MaxSummonDelay = 0.6f;

    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Skeleton_Summon_01_Montage.A_Skeleton_Summon_01_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Skeleton_Summon_02_Montage.A_Skeleton_Summon_02_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Skeleton_Summon_03_Montage.A_Skeleton_Summon_03_Montage'"));

    UPROPERTY()
    TSoftClassPtr<ASummonCreatureVisualEffect> m_SummonCreatureVisualEffectClass = n"Blueprint'/Game/Items/Magic/Summon/StoneHenge/BP_SummonSkeletonsStoneHengeVisualEffect.BP_SummonSkeletonsStoneHengeVisualEffect_C'";

    UClass GetSummonCreatureVisualEffectClass_Scriptable() const
    {
        return m_SummonCreatureVisualEffectClass.Get();
    }

    float GetSummonDelay()
    {
        return Math::RandRange(m_MinSummonDelay, m_MaxSummonDelay);
    }

    void InitializeSpawningVisualActor() override
    {
        Super::InitializeSpawningVisualActor();
        m_SpawningVisualActor = Cast<ASummonCreatureVisualEffect>(SpawnActor(GetSummonCreatureVisualEffectClass_Scriptable(), GetAvatarActorFromActorInfo().GetActorLocation()));
    }

    void Summon() override
    {
        ClearDelegates();
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DoRandomDelayedSpawning"), GetSummonDelay(), false);        
    }

    UFUNCTION()
    void DoRandomDelayedSpawning()
    {
        ClearDelegates();
        auto players = MagicScript::GetAllPlayersNearCurrentLocation(GetWorld(), GetAvatarActorFromActorInfo(), 2500);
        if(!players.IsEmpty())
        {
            FRotator rotation = MagicScript::FindLookAtRotation(GetAvatarActorFromActorInfo().GetActorLocation(), players[0].GetActorLocation());
            GetAvatarActorFromActorInfo().SetActorRotation(rotation);
        }
        PlayMontage();
        if(m_SpawningVisualActor != nullptr)
        {
            FHitResult hit;
            FVector floorLocation;
            MagicScript::FindFloorAtLocation(GetAvatarActorFromActorInfo().GetActorLocation(), hit, nullptr, ECollisionChannel::IKTrace, -200, 100);
            floorLocation = hit.ImpactPoint;
            m_SpawningVisualActor.SpawnVisualAtLocation(floorLocation);
            m_SpawningVisualActor.SetLifeSpan(10.f);
        }
            
    }
}