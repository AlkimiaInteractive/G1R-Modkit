UCLASS()
class ABreathOfDeathSpell : AWindVisual
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UProgressiveBoxCollisionByAngle m_CollisionComp;
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");

    default m_CollisionComp.m_WeaponData = UBreathOfDeathDefinition::StaticClass();

        UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
    FGothicFXInstanceHandle m_SFXHandle;

    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass() override
    {
         if(m_CollisionComp.m_WeaponData != nullptr)
        {
            return m_CollisionComp.m_WeaponData;
        }
        return nullptr;
    }

    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();
        m_SFXHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Magic_Spell_BreathOfDeath_Launch, nullptr);

        if(!HasAuthority())
            return;
        m_CollisionComp.SetState(EHitColliderState::Damage);
    }


    UFUNCTION(BlueprintEvent, NetMulticast)
    void InitializeConfiguration()
    {
        
    }

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Standard;
    }

    void DeactivateCollision() override
    {
        Super::DeactivateCollision();
        m_CollisionComp.SetState(EHitColliderState::None);
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

    void OnEffectAppliedSuccessfully(AActor TargetActor, FActiveGameplayEffectHandle handle) override
    {
        Super::OnEffectAppliedSuccessfully(TargetActor, handle);
        SpawnTargetVisuals(TargetActor);
    }

    UFUNCTION(NetMulticast)
    void SpawnTargetVisuals(AActor TargetActor)
    {
        DoSpawnTargetVisuals(TargetActor);
    }

    UFUNCTION(BlueprintEvent)
    void DoSpawnTargetVisuals(AActor TargetActor)
    {
    }
};