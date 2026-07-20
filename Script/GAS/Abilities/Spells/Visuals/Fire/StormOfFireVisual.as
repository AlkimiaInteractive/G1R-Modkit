
UCLASS()
class AStormOfFire : AStormOfFireVisual
{
    default bNeverApplyTickOptimizations = true;

    UPROPERTY()
    FGameplayTag m_OnApplyEnvironmentDebuff = GameplayTag::Event_Debuff_Environment;
    UPROPERTY()
    FGameplayTag m_ProjectileDebuffTag = GameplayTag::Debuff_Burn;
    
    FGothicFXInstanceHandle m_SFXStormHandle;

    default m_MinHitCooldownMilliseconds = 750.f;

    UFUNCTION(BlueprintOverride)
    void Initialize_Scriptable(TSubclassOf<UWeaponDefinition> WeaponDefinition)
    {
        check(WeaponDefinition != nullptr);
        
        m_CollisionComp.m_WeaponData = WeaponDefinition;

        const auto stormOfFireDefinition = Cast<UStormOfFireDefinition>(WeaponDefinition.Get().GetDefaultObject());

        SetLifeSpan(stormOfFireDefinition.m_LifeTime);
        m_CollisionComp.SetCapsuleRadius(stormOfFireDefinition.m_StormRadius);
        m_CollisionComp.SetCapsuleHalfHeight(stormOfFireDefinition.m_StormHeight * 0.5f);
             
        m_CollisionComp.SetRelativeLocation(FVector(0.0f, 0.0f, stormOfFireDefinition.m_StormHeight * 0.5f - stormOfFireDefinition.m_MovementCapsuleHeight * 0.5f ));

        m_SphereComponent.SetSphereRadius(stormOfFireDefinition.m_MovementCapsuleRadius);
        
        //m_CollisionComp.SetCollisionProfileName(FName("HitProfile"), true);
    }

    UFUNCTION(BlueprintOverride)
    bool CanApplyDamage_Scriptable(const UAbilitySystemComponent Source,
                                   const UAbilitySystemComponent Target) const
    {
        //@DE - Wait until design decides if can damage allies and summoned creatures.
        // const auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(Source);
	    // const auto targetAbComp = Cast<UGothicAbilitySystemComponent>(Target);
        //@DE - Avoid damage allies or players.
        // AGothicCharacter target = Cast<AGothicCharacter>(targetAbComp.GetAvatar());
        // AGothicCharacter source = Cast<AGothicCharacter>(sourceAbComp.GetAvatar());
        // auto AIController = Cast<AGothicAIController>(target.Controller);

        // if(AIController == nullptr)
        //     return false;
        // if(target.IsFriendlyTowards(source))
        //     return false;

        return true;
    }

    UFUNCTION(BlueprintCallable)
    void DoExplosion()
    {
        auto explosionVisual = SpawnExplosion();
        if(explosionVisual != nullptr)
        {
            explosionVisual.SetOwner(GetOwner());
            auto damageExplosion = Cast<ACapsuleProjectileDamageExplosionVisual>(explosionVisual);
            if(damageExplosion != nullptr)
            {
                damageExplosion.m_WeaponDefClass = GetWeaponDefinition();
                damageExplosion.SetRadius(m_CollisionComp.GetUnscaledCapsuleRadius());
                damageExplosion.SetCapsuleHalfHeight(m_CollisionComp.GetUnscaledCapsuleHalfHeight());
            }
            //Log("[AProjectileVisual_AS::Explode} spell level " + m_SpellLevel);
            explosionVisual.Multicast_OnExplode(FHitResult(), 1);
        }
    }


    UFUNCTION()
    AExplosionVisual SpawnExplosion()
    {
        auto def = GetWeaponDefinition();
        if(def != nullptr)
        {
            const UStormOfFireDefinition storm_def = Cast<UStormOfFireDefinition>(def.Get().GetDefaultObject());
            UClass asset = Cast<UClass>(storm_def.m_ExplosionPath.ToSoftObjectPath().TryLoad());
        
            if(asset != nullptr)
            {
                //System::DrawDebugSphere(GetActorLocation(), 10.f, 32, FLinearColor::Red, 20.f, 10.f);
                AActor actor_default = Cast<AActor>(asset.GetDefaultObject());
                FVector spawnLocation = GetActorLocation();
                spawnLocation.Z = spawnLocation.Z + storm_def.m_StormHeight * 0.5;
                return Cast<AExplosionVisual>(SpawnObject(actor_default.Class, spawnLocation, GetActorRotation()));
            }
        }
        return nullptr;
    }

    TSubclassOf<UWeaponDefinition> GetWeaponDefinition()
    {
        return m_CollisionComp.m_WeaponData;
    }

    UFUNCTION(BlueprintOverride)
	TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_BurnInfinite::StaticClass());
        return effects;        
    }

    UFUNCTION(BlueprintOverride)
    void FireProjectile_Scriptable()
    {
        m_SFXStormHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Magic_Projectile_StormOfFire_Storm_Start, nullptr);
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        GetFXComponent().StopFXInstance(m_SFXStormHandle, false);
    }

    //@DE - They need know each application of the interactable debuff effect. I send the event due the GE is not applied if it already applied
    UFUNCTION(BlueprintOverride)
    void NotifyEnvironmentDebuffToInteractableGasObjectActor_Scriptable(UAbilitySystemComponent InteractiveActorAbilitySystemComponent)
    {
        InteractiveActorAbilitySystemComponent.SendGameplayEvent(m_OnApplyEnvironmentDebuff, GetPayloadEnvironmentDebuff());
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldNotifyEnvironmentDebuff_Scriptable(AActor OtherActor)
    {
        auto environmentSpellComp = UEnvironmentInteractableSpellComponent::Get(OtherActor);
        if(environmentSpellComp != nullptr)
        {
            return true;
        }
        return false;
    }

    FGameplayEventData GetPayloadEnvironmentDebuff()
    {
        FGameplayEventData payload = FGameplayEventData();
        payload.EventTag = m_ProjectileDebuffTag;
        payload.Instigator = this;
        return payload;
    }
};