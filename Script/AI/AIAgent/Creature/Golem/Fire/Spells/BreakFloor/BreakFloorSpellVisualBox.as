UCLASS()
class ABreakFloorSpellVisualBox : ABoxCollisionShapeVisual
{
    default bReplicates = true;
    default ReplicateMovement = false; 

    UPROPERTY()
    UBreakFloorDefinition_FireGolem_Box m_def;

    UPROPERTY()
    float m_MaxBoxXExtent;

    UPROPERTY()
    float m_XGrownSpeed;

    default m_CollisionComp.m_WeaponData = UBreakFloorDefinition_FireGolem_Box::StaticClass();

    UPROPERTY()
    FGothicFXInstanceHandle m_SFXHandle;

    bool SetUpCollisionShape() override
    {    
        m_def = Cast<UBreakFloorDefinition_FireGolem_Box>(GetWeaponDefinition());
        if(m_def != nullptr)
        {
            SetLifeSpan(m_def.m_LifeTime);
            SetColliderState(EHitColliderState::Damage);
            m_CollisionComp.SetHiddenInGame(true);

            auto boxExtent = m_def.m_BoxExtent;
            m_MaxBoxXExtent = boxExtent.X;
            m_XGrownSpeed = m_def.m_BoxGrowSpeed;

            m_CollisionComp.SetBoxExtent(FVector(0, boxExtent.Y, boxExtent.Z));
            return true;
        }
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();
        m_SFXHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Creature_Golem_Fire_BreakFloor, nullptr);
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        Super::Tick(DeltaSeconds);
        if(m_def == nullptr)
            return;

        auto boxExtent = m_CollisionComp.GetUnscaledBoxExtent();
        if(boxExtent.X <= m_MaxBoxXExtent)
        {
            float upgrade = m_XGrownSpeed * DeltaSeconds;
            m_CollisionComp.SetBoxExtent(FVector(boxExtent.X + upgrade, boxExtent.Y, boxExtent.Z));
            auto localLocation = m_CollisionComp.GetRelativeLocation();
            m_CollisionComp.SetRelativeLocation(FVector(localLocation.X + upgrade, localLocation.Y, localLocation.Z));
            GetFXComponent().MoveFXInstance(m_SFXHandle, m_CollisionComp.GetWorldLocation());
        }
    }

    bool NeedCheckVisibility() override
    {
        return false;
    }
   
};
