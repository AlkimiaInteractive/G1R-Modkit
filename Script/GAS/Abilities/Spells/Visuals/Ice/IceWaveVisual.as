UCLASS()
class AIceWave : ASphereExplosionSpellVisual
{
    default m_ProjectileDefinition = UIceWaveProjectileDefinition::StaticClass();
    default m_CollisionComp.m_WeaponData = m_ProjectileDefinition;

    default m_ProjectileDebuffTag = GameplayTag::Debuff_Freeze;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AIceSpikePlacementActor m_PlacementActor;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Super::BeginPlay();
        GetFXComponent().PlayEffect(GameplayTag::FX_Magic_Projectile_IceWave_Wave, nullptr);
    }

    UFUNCTION(BlueprintOverride)
	TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_Freeze_5Secs::StaticClass());
        return effects;        
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        if(m_PlacementActor != nullptr)
            m_PlacementActor.DestroyActor();
    }

    bool ShouldOpenInteractableDoor() override
    {
        return true;
    }
}
