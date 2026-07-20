event void FFireGolemArenaFloorSinkingDestroyedEvent();

UCLASS()
class A_FireGolem_EnvironmentAttack_FloorSinking : ACapsuleCollisionShapeVisual
{
    FFireGolemArenaFloorSinkingDestroyedEvent OnFireGolemArenaFloorSinkingDestroyedEvent;

    UPROPERTY()
    UFloorSinking_FireGolem m_def;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_Duration;

    default m_CollisionComp.m_WeaponData = UFloorSinking_FireGolem::StaticClass();

    UPROPERTY(EditAnywhere)
    float m_FloorMinHeight;
    UPROPERTY(EditAnywhere)
    float m_FloorMaxHeight;
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintCallable)
    void ResetEffect()
    {
        Initialize();
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void BeginPlay()
    {
        
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        Super::EndPlay(EndPlayReason);
        if(OnFireGolemArenaFloorSinkingDestroyedEvent.IsBound())
            OnFireGolemArenaFloorSinkingDestroyedEvent.Broadcast();
    }


    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();
        ShowVisuals();

        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DoDestroy"), m_Duration, false);
        PlaySFX();
    }

    void PlaySFX()
    {
        GetFXComponent().PlayEffect(GameplayTag::FX_Creature_Golem_Fire_LavaPuddle, nullptr);
    }

    UFUNCTION(BlueprintEvent)
    void ShowVisuals()
    {

    }

    bool SetUpCollisionShape() override
    {
        m_def = Cast<UFloorSinking_FireGolem>(GetWeaponDefinition());
        if(m_def != nullptr)
        {
            //m_CollisionComp.SetSphereRadius(m_def.m_SphereRadius);
            m_FloorMinHeight = m_def.m_MinFloorHeight;
            m_FloorMaxHeight = m_def.m_MaxFloorHeight;
            SetActorLocation(FindFloorLocation(GetActorLocation()));

            m_CollisionComp.SetCapsuleHalfHeight(m_def.m_CapsuleHalfHeight);
            m_CollisionComp.SetCapsuleRadius(m_def.m_CapsuleRadius);
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

    FVector FindFloorLocation(FVector Location, ECollisionChannel CollisionChannel, float FloorMinHeight, float FloorMaxHeight)
    {
        FHitResult hit;
        MagicScript::FindFloorAtLocation(Location, hit, this, CollisionChannel, FloorMinHeight, FloorMaxHeight);
        return hit.ImpactPoint;
    }

    FVector FindFloorLocation(FVector Location)
    {
        return FindFloorLocation(Location, ECollisionChannel::IKTrace, m_FloorMinHeight, m_FloorMaxHeight);
    }

    bool NeedCheckVisibility() override
    {
        return false;
    }

}