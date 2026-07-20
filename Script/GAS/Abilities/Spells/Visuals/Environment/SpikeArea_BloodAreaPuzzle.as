UCLASS()
class USpikeAreaDefinition : UWeaponDefinition
{
	default m_Name = "SpikeAreaDefinition";
    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 20.0f);
    default m_SuperArmorDamageBase = 100000000.0f;
	//default m_HitEffect = UGameplayEffect_KillCharacter::StaticClass();

}

UCLASS()
class ASpikeAreaArea : ASpellVisual
{
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

	UPROPERTY(DefaultComponent, EditAnywhere, Attach =m_RootComp)
	UHitBoxCollisionComponent m_CollisionComp;
    default m_CollisionComp.m_WeaponData = UElectrifiedAreaDefinition::StaticClass();
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY()
    private FTimerHandle TaskTimer;
    UPROPERTY()
    USpikeAreaDefinition m_def;

    UFUNCTION(BlueprintCallable)
    void SetActivateDamage(bool mustActivate)
    {
        if(m_CollisionComp.m_WeaponData == nullptr)
        {
            return;
        }
        m_def = Cast<USpikeAreaDefinition>(m_CollisionComp.m_WeaponData.Get().GetDefaultObject());
        if(m_def == nullptr)
        {
            return;
        }
        if(mustActivate)
        {
            m_CollisionComp.SetState(EHitColliderState::Damage);
            //ActivateOverlapTimer();
        }
        else
        {
            m_CollisionComp.SetState(EHitColliderState::None);
            if(System::IsTimerActiveHandle(TaskTimer))
                System::ClearAndInvalidateTimerHandle(TaskTimer);
        }
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        //UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(this);
        //sourceAbComp.AddLooseGameplayTag(GameplayTag::Filter_Damage_FocusStoneMachine);
        SetCustomCollisionResponse();
        if(m_CollisionComp.m_WeaponData != nullptr)
        {
            m_def = Cast<USpikeAreaDefinition>(m_CollisionComp.m_WeaponData.Get().GetDefaultObject());
            if(m_def != nullptr)
            {
                m_CollisionComp.SetState(EHitColliderState::None);
                m_CollisionComp.SetHiddenInGame(true);
            }
        }
    }

    void SetCustomCollisionResponse()
    {
        m_CollisionComp.m_CustomCollisionResponse.Add(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
    }

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
    }

}