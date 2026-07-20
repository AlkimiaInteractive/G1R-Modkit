UCLASS()
class AStormFist : AWindVisual
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_CollisionComp;
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");

    default m_CollisionComp.m_WeaponData = UStormFistDefinition::StaticClass();

    UPROPERTY(BlueprintReadWrite)
    TSubclassOf<USpellConfig> m_SpellConfigClass = UStormFistSpellConfig::StaticClass();

    UPROPERTY()
    float m_Speed;

    UPROPERTY()
    float m_TargetRadius;

    UPROPERTY()
    float m_CurrentRadius;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Super::BeginPlay();
        SetColliderState(EHitColliderState::Damage);
        m_TargetRadius = GetSpellConfig().m_AreaRange;
        m_Speed = CalculateSpeed();
    }

    float CalculateSpeed()
    {
        auto spellConfig = GetSpellConfig();
        return spellConfig.m_AreaRange / spellConfig.m_Duration;
    }

    UFUNCTION(BlueprintCallable)
    UStormFistSpellConfig GetSpellConfig()
    {
        return Cast<UStormFistSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        Super::Tick(DeltaSeconds);
        m_CurrentRadius = m_CurrentRadius+ m_Speed*DeltaSeconds;
        
        if(m_CollisionComp.SphereRadius < m_TargetRadius)
        {
            m_CollisionComp.SetSphereRadius(m_CurrentRadius);
        }
        else
        {
            SetColliderState(EHitColliderState::None);
            SetActorTickEnabled(false);

            if(!IsActorBeingDestroyed())
                SetLifeSpan(5.f);
        }

    
    }

    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass() override
    {
         if(m_CollisionComp.m_WeaponData != nullptr)
        {
            return m_CollisionComp.m_WeaponData;
        }
        return nullptr;
    }

    void SetColliderState(EHitColliderState State) override
    {
        m_CollisionComp.SetState(State);
    }

    UShapeComponent GetCollisionComponent() override
    {
        return m_CollisionComp;
    }

    void AddCustomCollisionResponse(ECollisionChannel CollisionChannel,
                                    ECollisionResponse CollisionResponse) override
    {
         m_CollisionComp.AddCustomCollisionResponse(CollisionChannel, CollisionResponse);      
    }
};


