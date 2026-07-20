UCLASS()
class AMiltenSleeper_Brazier : AGothicGASActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY()
    TSubclassOf<UGothicBaseConfig> m_BrazierDefClass = UMiltenSleeper_Brazier_Definition::StaticClass();
    
    UPROPERTY()
    bool m_Enabled = false;

    default bReplicates = true;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHurtBoxCollisionComponent m_HurtBoxCollision;
    default m_HurtBoxCollision.OnComponentBeginOverlap.AddUFunction(this, n"OnDamageBeginOverlap");
    default m_HurtBoxCollision.OnComponentHit.AddUFunction(this, n"OnDamageHit");

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitBoxCollisionComponent m_HitBoxCollision;
    default m_HitBoxCollision.SetState(EHitColliderState::None);
    default m_HitBoxCollision.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_HitBoxCollision.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");
    default m_HitBoxCollision.m_WeaponData = UMiltenSleeperBrazierLitWeaponDefinition::StaticClass();

    UPROPERTY()
    TMap<AActor, FActiveGameplayEffectHandle> m_TargetsMap;

    UFUNCTION(NetMulticast)
    void RegisterBrazier(AActor NewOwner)
    {
        SetOwner(NewOwner);
        if(HasAuthority())
            m_Enabled = true;
    }

    //Damage capsule overlap event
    UFUNCTION()
    void OnDamageBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        CheckValidCollision(OtherActor);
    }

        //Damage capsule hit event
    UFUNCTION(BlueprintCallable)
    void OnDamageHit(UPrimitiveComponent HitComp, AActor OtherActor, UPrimitiveComponent OtherComp,
                     FVector NormalImpulse, const FHitResult&in Hit)
    {
        CheckValidCollision(OtherActor);
    }

    void CheckValidCollision(AActor OtherActor)
    {
        if(!m_Enabled)
            return;
        UMiltenSleeper_ProjectileComponent ActivationComp = UMiltenSleeper_ProjectileComponent::Get(OtherActor);
        if(ActivationComp == nullptr)
            return;

        //Print("Projectile");
        ActivateBrazier();
    }

    void ActivateBrazier()
    {
        m_HurtBoxCollision.OnComponentBeginOverlap.Unbind(this, n"OnDamageBeginOverlap");
        m_HurtBoxCollision.OnComponentHit.Unbind(this, n"OnDamageHit");
        m_HurtBoxCollision.SetActive(false);
        ActivateBrazierVisuals();
        ActivateBrazierDamage();
    }

    void ActivateBrazierDamage()
    {
        m_HitBoxCollision.SetState(EHitColliderState::Damage);
    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void ActivateBrazierVisuals()
    {

    }

    UFUNCTION()
    void DoDamage()
    {
        if(!HasAuthority())
            return;
        auto gothicChar = Cast<AGothicCharacter>(GetOwner());
        if(gothicChar == nullptr)
            return;
        auto abComp = gothicChar.GetAbilitySystemComponent();
        auto config = Cast<UMiltenSleeper_Brazier_Definition>(m_BrazierDefClass.GetDefaultObject());
        //abComp.ApplyGameplayEffectToSelf(config.m_DamageGameplayEffect, 0, abComp.MakeEffectContext());


        FGameplayEffectContextHandle context = abComp.MakeEffectContext();
        FGameplayEffectSpecHandle effect = abComp.MakeOutgoingSpec(config.m_DamageGameplayEffect, 1.0f, context);
        auto maxHealth = gothicChar.GetMaxHealthAttribute();
        auto percentage = maxHealth * 0.34f;
        percentage = Math::CeilToFloat(percentage);
        //@DE - Ensure he dies.
        if(gothicChar.GetHealthAttribute() <= percentage)
        {
            percentage = maxHealth;
        }
        effect.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Heal, float(-percentage));
        abComp.ApplyGameplayEffectSpecToSelf(effect);
    }

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        if(!HasAuthority())
            return;
        if(m_HitBoxCollision.GetState() == EHitColliderState::None)
            return;
        
        auto owner = GetOwner();
        if(OtherActor == owner)
        {
            //m_CollisionComp.OnActorDetected.Broadcast(OtherActor);
            return;
        }
        // FString a = FString(OtherActor.GetName());
        // a.Append(FString(" - "));
        // a.Append(OtherComp.GetName());
        // Print(a, 15.f, FLinearColor::Red);
        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return;

        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        
        if(targetAbComp == nullptr || m_TargetsMap.Contains(OtherActor))
        {
            return;
        }

        if((targetAbComp.HasGameplayTag(GameplayTag::State_Defeated)) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return;
        }


        if(sourceAbComp == nullptr || targetAbComp == nullptr || GetWeaponDefinitionSubclass() == nullptr)
        {
            return;
        }

        FActiveGameplayEffectHandle handle = ApplyGameplayEffectToTarget(sourceAbComp, targetAbComp, SweepResult);
        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
            OnEffectAppliedSuccessfully(OtherActor, handle);
    }

    UFUNCTION()
    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, const FHitResult&in SweepResult)
    {
        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Additive;
        hit_data.WeaponUsed = GetWeaponDefinitionSubclass();
        
        //Print("DoDamage");
        return GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, SweepResult);
    }

    void OnEffectAppliedSuccessfully(AActor TargetActor, FActiveGameplayEffectHandle handle)
    {
        m_TargetsMap.Add(TargetActor, handle);
    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(!HasAuthority())
            return;
        if(CheckIsOverlappingActor(OtherActor))
            return;
        RemoveDamage(OtherActor);
    
    }

    bool CheckIsOverlappingActor(AActor OtherActor)
    {
        if(m_HitBoxCollision.GetState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        m_HitBoxCollision.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }

    void RemoveDamage(AActor OtherActor)
    {
        if(!m_TargetsMap.Contains(OtherActor))
            return;

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        if(RemoveEffectToTarget(targetAbComp, m_TargetsMap[OtherActor]))
            m_TargetsMap.Remove(targetAbComp.GetAvatar());
    }

    bool RemoveEffectToTarget(UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle Handle)
    {
        if(TargetAbComp != nullptr && m_TargetsMap.Contains(TargetAbComp.GetAvatar()))
        {
            return TargetAbComp.RemoveActiveGameplayEffect(Handle);
        }
        return false;
    }
  

    UFUNCTION()
    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass()
    {
        return m_HitBoxCollision.m_WeaponData;
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        m_HitBoxCollision.SetState(EHitColliderState::None);
        for(auto target : m_TargetsMap)
        {
            RemoveDamage(target.Key);
        }
    }
}

UCLASS()
class UMiltenSleeperBrazierLitWeaponDefinition : USpellProjectileDefinition
{
	default m_Name = "MiltenSleeperBrazierLitWeaponDefinition";

	default m_HitEffect = UGE_LitBrazierDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
}

class UGE_LitBrazierDamage : UGE_Damage_Fire_Infinite
{
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::NoGeneratePerceptionEventHit);
    default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
}

class UGE_Burn_Infinite : UGE_Burn
{
	default DurationMagnitude.ScalableFloatMagnitude.Value = 0; // Duration in seconds of the effect
}

class UGE_Burn_Infinite_MiltenSleeper_Brazier : UGE_Burn_Infinite
{
	default AdditionalEffects.OnApplicationGameplayEffects.Empty();
	default AdditionalEffects.OnCompleteAlways.Empty();
}