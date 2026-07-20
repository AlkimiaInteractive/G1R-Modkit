UCLASS()
class A_FireGolem_EnvironmentAttack_ArenaLavaStream : ACapsuleCollisionShapeVisual
{
    UPROPERTY()
    ULavaStream_FireGolem m_def;

    UPROPERTY(BlueprintReadWrite,EditAnywhere)
    bool m_Activated = false;

    default m_CollisionComp.m_WeaponData = ULavaStream_FireGolem::StaticClass();

    UPROPERTY()
    FGothicFXInstanceHandle m_SFXHandle;

    UFUNCTION(BlueprintCallable, NetMulticast)
    void ResetEffect()
    {
        Initialize();
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void BeginPlay()
    {
        
    }


    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();
        ShowVisuals();
        m_Activated = true;
        m_SFXHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Creature_Golem_Fire_LavaStream_Loop, nullptr);
    }

    bool IsActivated()
    {
        return m_Activated;
    }

    UFUNCTION(BlueprintEvent)
    void ShowVisuals()
    {

    }

    UFUNCTION(BlueprintEvent)
    void HideVisuals()
    {

    }

    bool SetUpCollisionShape() override
    {
        m_def = Cast<ULavaStream_FireGolem>(GetWeaponDefinition());
        if(m_def != nullptr)
        {
            //m_CollisionComp.SetSphereRadius(m_def.m_SphereRadius);
            // m_CollisionComp.SetCapsuleHalfHeight(m_def.m_CapsuleHalfHeight);
            // m_CollisionComp.SetCapsuleRadius(m_def.m_CapsuleRadius);
            SetColliderState(EHitColliderState::Damage);
            return true;
        }
        return false;
    }

    UFUNCTION(BlueprintEvent)
    void DoDestroy()
    {
        
    }

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Dot;
    }

    bool NeedCheckVisibility() override
    {
        return false;
    }

    void DeactivateStream()
    {
        HideVisuals();
        m_Activated = false;
        SetColliderState(EHitColliderState::None);
        GetFXComponent().StopFXInstance(m_SFXHandle, true);;
    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void ResetActor()
    {

    }
}