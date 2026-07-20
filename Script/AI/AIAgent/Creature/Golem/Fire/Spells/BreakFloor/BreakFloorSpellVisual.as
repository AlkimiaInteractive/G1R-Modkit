UCLASS()
class ABreakFloorSpellVisual : AConeCollisionShapeVisual
{
    default bReplicates = true;
    default ReplicateMovement = false; 

    UPROPERTY()
    UBreakFloorDefinition_FireGolem_Cone m_def;

    default m_CollisionComp.m_WeaponData = UBreakFloorDefinition_FireGolem_Cone::StaticClass();

    bool SetUpCollisionShape() override
    {    
        m_def = Cast<UBreakFloorDefinition_FireGolem_Cone>(GetWeaponDefinition());
        if(m_def != nullptr)
        {
            SetLifeSpan(m_def.m_LifeTime);
            m_CollisionComp.SetConeLength(0.f);
            m_CollisionComp.SetHalfAngle(m_def.m_ConeHalfAngleDegrees);
            SetColliderState(EHitColliderState::Damage);
            return true;
        }
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        Super::Tick(DeltaSeconds);
        if(m_def == nullptr)
            return;

        if(m_CollisionComp.m_ConeLength < m_def.m_ConeLengthMeters)
        {
            m_CollisionComp.SetConeLength(m_CollisionComp.m_ConeLength + m_def.m_ConeLengthSpeed * DeltaSeconds);
        }
    }

    bool NeedCheckVisibility() override
    {
        return false;
    }
   
};
