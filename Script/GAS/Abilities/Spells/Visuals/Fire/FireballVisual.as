UCLASS(Blueprintable)
class AFireballVisual : ASpellBallVisual_AS
{
    UPROPERTY(DefaultComponent, Attach=HitComp)
    UHitSphereCollisionComponent m_WorldOverlapSphere;

    default m_ProjectileDebuffTag = GameplayTag::Debuff_Burn;

    //@DE - On this projectile m_CollisionComp (hit) is the one that collides enemies and m_WorldOverlapSphere (overlap) collides with the world

    TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap() const override
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_BurnInfinite::StaticClass());
        return effects;
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_CollisionComp.SetState(EHitColliderState::None);
        m_WorldOverlapSphere.SetState(EHitColliderState::None);

        m_CollisionComp.OnComponentBeginOverlap.Clear();
        m_WorldOverlapSphere.OnComponentBeginOverlap.AddUFunction(this, n"OnOverlapBeginServer");
        m_WorldOverlapSphere.SetCollisionProfileName(GetProjectileProfileName(), true);
    }

    void SetCollisionSphereRadius(const USpellProjectileDefinition def) override
    {
        auto fireballDef = Cast<UFireBallProjectileDefinition_Base>(def);
        if(fireballDef == nullptr)
        {
            Super::SetCollisionSphereRadius(def);
            return;
        }
        m_CollisionComp.SetSphereRadius(fireballDef.m_RadiusHitSphere);
    }

    UFUNCTION(BlueprintOverride)
    void OnHitServer_Scriptable(UPrimitiveComponent HitComp, AActor OtherActor,
                                UPrimitiveComponent OtherComp, FVector NormalImpulse,
                                const FHitResult& Hit)
    {
        m_CollisionComp.SetState(EHitColliderState::None);
        m_WorldOverlapSphere.SetState(EHitColliderState::None);
        Super::OnHitServer_Scriptable(HitComp, OtherActor, OtherComp, NormalImpulse, Hit);
    }

    UFUNCTION(BlueprintOverride)
    void Initialize_Scriptable()
    {
        m_CollisionComp.SetState(EHitColliderState::Damage);
        m_WorldOverlapSphere.SetState(EHitColliderState::Damage);
        //m_CollisionComp.SetHiddenInGame(false);
        //m_WorldOverlapSphere.SetHiddenInGame(false);
    }
}