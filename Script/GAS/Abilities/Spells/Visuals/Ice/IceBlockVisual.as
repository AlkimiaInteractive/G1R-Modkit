UCLASS()
class AIceBlock : AGothicGASActor
{
    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_ProjectileDefinition = UIceBlockProjectileDefinition::StaticClass();

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UProgressiveBoxCollisionByAngle m_CollisionComp;
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.m_WeaponData = m_ProjectileDefinition;

    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY()
    TArray<UAbilitySystemComponent> m_Targets;

    default bNeverApplyTickOptimizations = true;

    UPROPERTY()
    FGameplayTag m_OnApplyEnvironmentDebuff = GameplayTag::Event_Debuff_Environment;
    UPROPERTY()
    FGameplayTag m_ProjectileDebuffTag = GameplayTag::Debuff_Freeze;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AIceSpikePlacementActor m_PlacementActor;
    
    UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
    FGothicFXInstanceHandle m_SFXHandle;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_SFXHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Magic_Projectile_IceBlock_Block, nullptr);
    }

    UFUNCTION()
    void EnableCollision()
    {
        m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        m_CollisionComp.SetState(EHitColliderState::Damage);
    }

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        
        auto owner = GetOwner();
        if(OtherActor == owner)
        {
            //m_CollisionComp.OnActorDetected.Broadcast(OtherActor);
            return;
        }

        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        
        if(targetAbComp == nullptr || m_Targets.Contains(targetAbComp))
        {
            return;
        }

        if(/*targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) ||*/ targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return;
        }

        if(!MagicScript::IsTargetVisible(owner, OtherActor, GetActorLocation(), OtherComp))
        {
            return;
        }
        
        auto interactiveActor = Cast<AInteractiveGasObjectActor>(OtherActor);
        if(interactiveActor != nullptr)
        {
            auto interactiveActorAbilitySystemComponent = interactiveActor.GetAbilitySystemComponent();
            if(interactiveActorAbilitySystemComponent != nullptr)
            {
                GothicGAS::ApplyDebuffGameplayEffects(interactiveActorAbilitySystemComponent, GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable());
                NotifyEnvironmentDebuffToInteractableGasObjectActor(interactiveActorAbilitySystemComponent);
                m_Targets.Add(interactiveActorAbilitySystemComponent);
                interactiveActor.OnImpact();
            }
            return;
        }
        else
        {
            auto environmentSpellComp = UEnvironmentInteractableSpellComponent::Get(OtherActor);
            if(environmentSpellComp != nullptr)
            {
                NotifyEnvironmentDebuffToInteractableGasObjectActor(environmentSpellComp.m_AbComp);
                m_Targets.Add(environmentSpellComp.m_AbComp);
                return;
            }
        }

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return;

        //Super::OnBeginOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult);
        
        if(ApplyGameplayEffectToTarget(sourceAbComp, targetAbComp, SweepResult))
            m_Targets.Add(targetAbComp);
    }

    UFUNCTION(BlueprintOverride)
	TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_Freeze_5Secs::StaticClass());
        return effects;        
    }

    UFUNCTION(BlueprintCallable)
    void DeactivateCollision()
    {
        m_CollisionComp.SetState(EHitColliderState::None);
        m_CollisionComp.OnComponentBeginOverlap.Unbind(this, n"OnBeginOverlap");
    }

    UFUNCTION()
    bool ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, const FHitResult&in SweepResult)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || m_CollisionComp.m_WeaponData == nullptr || m_Targets.Contains(targetAbComp))
        {
            return false;
        }
        

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Standard;
        hit_data.WeaponUsed = m_CollisionComp.m_WeaponData;
        hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
                    targetAbComp.GetAvatar().GetActorForwardVector(), 
                    targetAbComp.GetAvatar().GetActorRightVector(), 
                    -sourceAbComp.GetAvatar().GetActorForwardVector());
        FActiveGameplayEffectHandle handle = GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, SweepResult);
        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
            return true;
        return false;
       
    }

    //@DE - They need know each application of the interactable debuff effect. I send the event due the GE is not applied if it already applied
    void NotifyEnvironmentDebuffToInteractableGasObjectActor(UAbilitySystemComponent InteractiveActorAbilitySystemComponent)
    {
        InteractiveActorAbilitySystemComponent.SendGameplayEvent(m_OnApplyEnvironmentDebuff, GetPayloadEnvironmentDebuff());
    }

    FGameplayEventData GetPayloadEnvironmentDebuff()
    {
        FGameplayEventData payload = FGameplayEventData();
        payload.EventTag = m_ProjectileDebuffTag;
            payload.Instigator = this;
        return payload;
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        if(m_PlacementActor!=nullptr)
            m_PlacementActor.DestroyActor();
    }

    UFUNCTION()
    void InitializeNiagaraArray()
    {
        // m_NiagaraArray.Add(m_NiagaraComp000);
        // m_NiagaraArray.Add(m_NiagaraComp001);
        // m_NiagaraArray.Add(m_NiagaraComp002);
        // m_NiagaraArray.Add(m_NiagaraComp003);
        // m_NiagaraArray.Add(m_NiagaraComp004);
        // m_NiagaraArray.Add(m_NiagaraComp005);
        // m_NiagaraArray.Add(m_NiagaraComp006);
        // m_NiagaraArray.Add(m_NiagaraComp007);
        // m_NiagaraArray.Add(m_NiagaraComp008);
        // m_NiagaraArray.Add(m_NiagaraComp009);
        // m_NiagaraArray.Add(m_NiagaraComp010);
        // m_NiagaraArray.Add(m_NiagaraComp011);
        // m_NiagaraArray.Add(m_NiagaraComp012);
        // m_NiagaraArray.Add(m_NiagaraComp013);
        // m_NiagaraArray.Add(m_NiagaraComp014);
        // m_NiagaraArray.Add(m_NiagaraComp015);
        // m_NiagaraArray.Add(m_NiagaraComp016);
        // m_NiagaraArray.Add(m_NiagaraComp017);
        // m_NiagaraArray.Add(m_NiagaraComp018);
        // m_NiagaraArray.Add(m_NiagaraComp019);
        // m_NiagaraArray.Add(m_NiagaraComp020);
        // m_NiagaraArray.Add(m_NiagaraComp021);
        // m_NiagaraArray.Add(m_NiagaraComp022);
        // m_NiagaraArray.Add(m_NiagaraComp023);
        // m_NiagaraArray.Add(m_NiagaraComp024);
        // m_NiagaraArray.Add(m_NiagaraComp025);
        // m_NiagaraArray.Add(m_NiagaraComp026);
        // m_NiagaraArray.Add(m_NiagaraComp027);
        // m_NiagaraArray.Add(m_NiagaraComp028);
        // m_NiagaraArray.Add(m_NiagaraComp029);
        // m_NiagaraArray.Add(m_NiagaraComp030);
        // m_NiagaraArray.Add(m_NiagaraComp031);
        // m_NiagaraArray.Add(m_NiagaraComp032);
        // m_NiagaraArray.Add(m_NiagaraComp033);
        // m_NiagaraArray.Add(m_NiagaraComp034);
        // m_NiagaraArray.Add(m_NiagaraComp035);
        // m_NiagaraArray.Add(m_NiagaraComp036);
        // m_NiagaraArray.Add(m_NiagaraComp037);
        // m_NiagaraArray.Add(m_NiagaraComp038);
        // m_NiagaraArray.Add(m_NiagaraComp039);
        // m_NiagaraArray.Add(m_NiagaraComp040);
        // m_NiagaraArray.Add(m_NiagaraComp041);
        // m_NiagaraArray.Add(m_NiagaraComp042);
        // m_NiagaraArray.Add(m_NiagaraComp043);
        // m_NiagaraArray.Add(m_NiagaraComp044);
        // m_NiagaraArray.Add(m_NiagaraComp045);
        // m_NiagaraArray.Add(m_NiagaraComp046);
        // m_NiagaraArray.Add(m_NiagaraComp047);
        // m_NiagaraArray.Add(m_NiagaraComp048);
        // m_NiagaraArray.Add(m_NiagaraComp049);
        // m_NiagaraArray.Add(m_NiagaraComp050);
        // m_NiagaraArray.Add(m_NiagaraComp051);
        // m_NiagaraArray.Add(m_NiagaraComp052);
        // m_NiagaraArray.Add(m_NiagaraComp053);
        // m_NiagaraArray.Add(m_NiagaraComp054);
        // m_NiagaraArray.Add(m_NiagaraComp055);
        // m_NiagaraArray.Add(m_NiagaraComp056);
        // m_NiagaraArray.Add(m_NiagaraComp057);
        // m_NiagaraArray.Add(m_NiagaraComp058);
        // m_NiagaraArray.Add(m_NiagaraComp059);
        // m_NiagaraArray.Add(m_NiagaraComp060);
        // m_NiagaraArray.Add(m_NiagaraComp061);
        // m_NiagaraArray.Add(m_NiagaraComp062);
        // m_NiagaraArray.Add(m_NiagaraComp063);
        // m_NiagaraArray.Add(m_NiagaraComp064);
        // m_NiagaraArray.Add(m_NiagaraComp065);
        // m_NiagaraArray.Add(m_NiagaraComp066);
        // m_NiagaraArray.Add(m_NiagaraComp067);
        // m_NiagaraArray.Add(m_NiagaraComp068);
        // m_NiagaraArray.Add(m_NiagaraComp069);
        // m_NiagaraArray.Add(m_NiagaraComp070);
        // m_NiagaraArray.Add(m_NiagaraComp071);
        // m_NiagaraArray.Add(m_NiagaraComp072);
        // m_NiagaraArray.Add(m_NiagaraComp073);
        // m_NiagaraArray.Add(m_NiagaraComp074);
        // m_NiagaraArray.Add(m_NiagaraComp075);
        // m_NiagaraArray.Add(m_NiagaraComp076);
        // m_NiagaraArray.Add(m_NiagaraComp077);
        // m_NiagaraArray.Add(m_NiagaraComp078);
        // m_NiagaraArray.Add(m_NiagaraComp079);
        // m_NiagaraArray.Add(m_NiagaraComp080);
        // m_NiagaraArray.Add(m_NiagaraComp081);
        // m_NiagaraArray.Add(m_NiagaraComp082);
        // m_NiagaraArray.Add(m_NiagaraComp083);
        // m_NiagaraArray.Add(m_NiagaraComp084);
        // m_NiagaraArray.Add(m_NiagaraComp085);
        // m_NiagaraArray.Add(m_NiagaraComp086);
        // m_NiagaraArray.Add(m_NiagaraComp087);
        // m_NiagaraArray.Add(m_NiagaraComp088);
        // m_NiagaraArray.Add(m_NiagaraComp089);
        // m_NiagaraArray.Add(m_NiagaraComp090);
        // m_NiagaraArray.Add(m_NiagaraComp091);
        // m_NiagaraArray.Add(m_NiagaraComp092);
        // m_NiagaraArray.Add(m_NiagaraComp093);
        // m_NiagaraArray.Add(m_NiagaraComp094);
        // m_NiagaraArray.Add(m_NiagaraComp095);
        // m_NiagaraArray.Add(m_NiagaraComp096);
        // m_NiagaraArray.Add(m_NiagaraComp097);
        // m_NiagaraArray.Add(m_NiagaraComp098);
        // m_NiagaraArray.Add(m_NiagaraComp099);
        // m_NiagaraArray.Add(m_NiagaraComp100);
    }

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    TArray<UNiagaraComponent> m_NiagaraArray;




    // UPROPERTY(DefaultComponent, Attach=m_RootComp)
	// USceneComponent m_NiagaraRoot;

    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp000;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp001;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp002;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp003;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp004;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp005;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp006;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp007;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp008;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp009;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp010;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp011;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp012;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp013;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp014;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp015;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp016;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp017;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp018;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp019;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp020;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp021;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp022;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp023;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp024;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp025;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp026;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp027;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp028;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp029;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp030;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp031;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp032;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp033;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp034;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp035;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp036;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp037;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp038;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp039;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp040;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp041;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp042;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp043;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp044;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp045;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp046;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp047;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp048;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp049;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp050;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp051;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp052;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp053;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp054;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp055;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp056;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp057;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp058;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp059;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp060;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp061;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp062;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp063;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp064;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp065;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp066;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp067;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp068;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp069;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp070;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp071;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp072;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp073;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp074;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp075;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp076;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp077;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp078;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp079;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp080;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp081;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp082;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp083;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp084;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp085;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp086;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp087;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp088;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp089;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp090;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp091;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp092;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp093;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp094;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp095;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp096;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp097;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp098;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp099;
    // UPROPERTY(DefaultComponent, Attach=m_NiagaraRoot)
    // UNiagaraComponent m_NiagaraComp100;

}

