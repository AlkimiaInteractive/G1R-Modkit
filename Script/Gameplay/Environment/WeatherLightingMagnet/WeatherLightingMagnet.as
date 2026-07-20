UCLASS()
class AWeatherLightingMagnet_AS : AWeatherLightingMagnet
{
    UPROPERTY(DefaultComponent, Attach=Root)
    UHitBoxCollisionComponent m_CollisionComp;
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");
    default m_CollisionComp.m_WeaponData = ULightingMagnetConfig::StaticClass();

    UPROPERTY(DefaultComponent, Attach=m_CollisionComp)
    UGothicFXComponent m_FXComp;

    UPROPERTY()
    ULightingMagnetConfig m_Def;
    UPROPERTY()
    float m_DamageDuration;
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    TArray<AActor> m_Targets;

    default bNeverApplyTickOptimizations = true;

    UPROPERTY()
    TArray<FGameplayTag> m_Directions;
    default m_Directions.Add(GameplayTag::Combat_Direction_Back);
    default m_Directions.Add(GameplayTag::Combat_Direction_Front);
    default m_Directions.Add(GameplayTag::Combat_Direction_Right);
    default m_Directions.Add(GameplayTag::Combat_Direction_Left);

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_Def = Cast<ULightingMagnetConfig>(GetWeaponDefinitionSubclass().GetDefaultObject());
        if(m_Def == nullptr)
            return;
        m_CollisionComp.SetState(EHitColliderState::None);
        m_CollisionComp.SetBoxExtent(m_Def.m_DamageBoxExtent);
        m_FXComp.SetRelativeLocation(FVector(0, 0, m_Def.m_DamageBoxExtent.Z / 2));
        m_DamageDuration = m_Def.m_DamageDuration;
    }

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        if(!HasAuthority())
            return;

        if(m_CollisionComp.GetState() == EHitColliderState::None)
            return;

        auto owner = GetOwner();
        if(OtherActor == owner)
        {
            return;
        }

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return;

        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        UDataModule_Combat targetDataModuleCombat = DataModule::GetCombatDataModule(OtherActor);
        //@DE - Provide experience to the last attacker. Might a ray falls in a fight
        if(targetDataModuleCombat != nullptr)
        {
            auto LastAttackerCharacter = targetDataModuleCombat.LastAttackerCharacter;
            if(LastAttackerCharacter != nullptr)
                sourceAbComp = GothicGAS::GetAbilitySystemComponent(LastAttackerCharacter); 
        }
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        
        if(targetAbComp == nullptr || m_Targets.Contains(OtherActor))
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

        DoDamage(sourceAbComp, targetAbComp, SweepResult);
        m_Targets.Add(targetAbComp.Avatar);
    }


    FActiveGameplayEffectHandle DoDamage(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, FHitResult SweepResult)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || GetWeaponDefinitionSubclass() == nullptr || m_Targets.Contains(targetAbComp.GetAvatar()))
        {
            return FActiveGameplayEffectHandle();
        }

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Knockback;
        hit_data.WeaponUsed = GetWeaponDefinitionSubclass();
        hit_data.CustomKnockbackData = GetCustomKnockbackData();

        hit_data.SourceDirection = GetRandomDirection();
        
        return GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, SweepResult);
    }

    FGameplayTag GetRandomDirection()
    {
        m_Directions.Shuffle();
        return m_Directions[0];
    }

    UFUNCTION()
    TSubclassOf<UKnockbackData> GetCustomKnockbackData()
    {
        return UKnockbackDataLightingMagnet::StaticClass();
    }


    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(!HasAuthority())
            return;
        
        if(CheckIsOverlappingActor(OtherActor))
            return;
        m_Targets.Remove(OtherActor);     
    }

    UFUNCTION(BlueprintCallable)
    void ActivateDamage()
    {
        DeactivateDamage();
        m_CollisionComp.SetState(EHitColliderState::Damage);    
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnDamageEnd"), m_DamageDuration, false);
    }

    
    UFUNCTION(BlueprintCallable)
    void OnDamageEnd()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        DeactivateDamage();
    }

    UFUNCTION()
    void DeactivateDamage()
    {
        m_CollisionComp.SetState(EHitColliderState::None);
        m_Targets.Empty();    
        OnEndThunderStrikeFX();
    }

    bool CheckIsOverlappingActor(AActor OtherActor)
    {
        if(m_CollisionComp.GetState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }

    UFUNCTION()
    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass()
    {
        return m_CollisionComp.m_WeaponData;
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        DeactivateDamage();
    }

}