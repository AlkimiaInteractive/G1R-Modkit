UCLASS()
class AFistOfWind : AWindVisual
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UProgressiveBoxCollisionByAngle m_CollisionComp;
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");

    default m_CollisionComp.m_WeaponData = UWindFistDefinition::StaticClass();

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    TSubclassOf<UKnockbackData> m_CustomKnockbackData = nullptr;

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
    void BeginPlay()
    {
        Super::BeginPlay();

        m_CollisionComp.SetState(EHitColliderState::Damage);
        m_SFXHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Magic_Spell_FistOfWind_Launch, nullptr);
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

    TSubclassOf<UKnockbackData> GetCustomKnockbackData() override
    {
        return m_CustomKnockbackData;
    }
};