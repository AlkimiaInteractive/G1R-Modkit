UCLASS()
class ADeathToTheUndeadVisual : ACollisionShapeVisual
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_CollisionComp;
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");

    default m_CollisionComp.m_WeaponData = UDeathToTheUndeadDefinition::StaticClass();

   UPROPERTY(BlueprintReadWrite)
    TSubclassOf<USpellConfig> m_SpellConfigClass = UDeathToTheUndeadSpellConfig::StaticClass();

    UPROPERTY()
    float m_Speed;

    UPROPERTY()
    float m_TargetRadius;

    UPROPERTY()
    float m_CurrentRadius;

    UFUNCTION(BlueprintOverride)
    void Initialize() 
    {
        Super::Initialize();
        UDeathToTheUndeadDefinition def = Cast<UDeathToTheUndeadDefinition>(GetWeaponDefinitionSubclass().Get().GetDefaultObject());
            if(def != nullptr)
            {
                SetLifeSpan(def.m_LifeTime);
            }
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        Super::BeginPlay();
        SetColliderState(EHitColliderState::Damage);
        m_Speed = CalculateSpeed();
        m_TargetRadius = GetSpellConfig().m_AreaRange;
    }

    float CalculateSpeed()
    {
        auto spellConfig = GetSpellConfig();
        return spellConfig.m_AreaRange / spellConfig.m_Duration;
    }

    UFUNCTION(BlueprintCallable)
    UDeathToTheUndeadSpellConfig GetSpellConfig()
    {
        return Cast<UDeathToTheUndeadSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
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
                DestroyActor();
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

    UShapeComponent GetCollisionComponent() override
    {
        return m_CollisionComp;
    }

    void SetColliderState(EHitColliderState State) override
    {
        m_CollisionComp.SetState(State);
    }

    void AddCustomCollisionResponse(ECollisionChannel CollisionChannel,
                                    ECollisionResponse CollisionResponse) override
    {
         m_CollisionComp.AddCustomCollisionResponse(CollisionChannel, CollisionResponse);      
    }

    void DoOnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                          UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep,
                          FHitResult SweepResult) override
    {
        auto character = Cast<AGothicCharacter>(OtherActor);
        if(character != nullptr && character.IsUndead())
            Super::DoOnBeginOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult);
        
    }

    bool CheckIsOverlappingActor(AActor OtherActor) override
    {
        if(m_CollisionComp.GetState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }
    bool ShouldOpenInteractableDoor() override
    {
        return true;
    }
};
