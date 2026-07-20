

class UEnvironmentLavaInteractionComponent : UEnvironmentGenericInteractionComponent
{
    UPROPERTY(NotVisible)
    TSubclassOf<UWeaponDefinition> m_def = UEnvironment_LavaDefinition::StaticClass();

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSubclassOf<UWeaponDefinition> m_WeaponDefinitionOverride = nullptr;

    UPROPERTY()
    TArray<TSubclassOf<UCharacterDefinition>> m_IgnoreDamageOnCharacterDefinition;

    //UPROPERTY()
    //TSoftObjectPtr<UNiagaraSystem> m_HumanParticleSystem = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/Footstep/Lava/P_Lava_Jump.P_Lava_Jump'";

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void BeginPlay()
    {
        System::SetTimerDelegate(FTimerDynamicDelegate(this, n"InitializeComponent"), .5f, false);
    }

    bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp,
                        UGothicAbilitySystemComponent targetAbComp, AGothicCharacter character) override
    {
        if(!Super::CanApplyEffect(sourceAbComp, targetAbComp, character))
            return false;
        if((targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) && !CanKillOnDefeatedState()) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return false;
        }

        auto targetCharacterDef = character.CharacterDefinition;

        for(auto characterDef : m_IgnoreDamageOnCharacterDefinition)
        {
            if(targetCharacterDef.IsA(characterDef))
                return false;
        }

        if(targetAbComp.HasGameplayTag(GameplayTag::State_Lava_Invulnerable))
        {
            return false;
        }

        if(GetWeaponDefinitionSubclass() == nullptr)
        {
            return false;
        }

        if(targetAbComp.HasTagExact(GameplayTag::State_Riding))
        {
            if(!targetAbComp.HasTagExact(GameplayTag::State_Unmounting))
                return false;
        }

        return true;
    }

    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget(
                                                            UGothicAbilitySystemComponent sourceAbComp,
                                                            UGothicAbilitySystemComponent targetAbComp) override
    {
        return DoDamage(sourceAbComp, targetAbComp, FHitResult());
    }

    FActiveGameplayEffectHandle DoDamage(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, FHitResult SweepResult)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || GetWeaponDefinitionSubclass() == nullptr || m_TargetsMap.Contains(targetAbComp.GetAvatar()))
        {
            return FActiveGameplayEffectHandle();
        }

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GetAttackType();
        hit_data.WeaponUsed = GetWeaponDefinitionSubclass();
        hit_data.CustomKnockbackData = GetCustomKnockbackData();
        //FGameplayAttribute resistanceAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Armor::StaticClass(), FName("Resistance_Fire"));
        //bool success = false;
        // float32 targetResistance = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(targetAbComp, resistanceAttr, success);
        // if(success && targetResistance > 0)
        // {
        //     targetResistance += 1;
        //     hit_data.MultiplierDamages.Add(GameplayTag::Item_Damage_Elemental_Fire, targetResistance);
        // }
        
        if(GetAttackType() != GameplayTag::Combat_HitType_Dot)
        {
            hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
            targetAbComp.GetAvatar().GetActorForwardVector(), 
            targetAbComp.GetAvatar().GetActorRightVector(), 
                -sourceAbComp.GetAvatar().GetActorForwardVector());
        }
        
        return GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), sourceAbComp.GetAvatar(), targetAbComp, hit_data, SweepResult);
    }

    void DoHandleCharacterEnteringRegion(UGothicAbilitySystemComponent SourceAbComp,
                                         UGothicAbilitySystemComponent TargetAbComp,
                                         const FHitResult&in SweepResult) override
    {
        Super::DoHandleCharacterEnteringRegion(SourceAbComp, TargetAbComp, SweepResult);
        FHitResult hit;
        MagicScript::FindFloorAtLocation(SweepResult.Location, hit, TargetAbComp.Avatar, ECollisionChannel::IKTrace, -200, 50);
        //System::DrawDebugSphere(hit.ImpactPoint, 20.f, 32, FLinearColor::Black, 200.f, 10.f);
        auto explosion = SpawnHumanExplosion(hit.ImpactPoint);
        if(explosion != nullptr)
        {
            explosion.m_FXTag = GameplayTag::FX_Environment_Lava_Hit;
            explosion.Multicast_OnExplode(SweepResult, Math::RandRange(0,2));
        }
        
        //Niagara::SpawnSystemAtLocation(m_HumanParticleSystem.Get(), SweepResult.Location, FRotator::ZeroRotator);
    }

    void DoHandleItemEnteringRegion(AActor OtherActor, const FHitResult&in SweepResult) override
    {
        Super::DoHandleItemEnteringRegion(OtherActor, SweepResult);
        if(OtherActor == nullptr)
            return;

        FVector impactPoint = OtherActor.GetActorLocation();

        FHitResult HitResult = SweepResult;

        //@DE - On drop items, the impact point is FVector::Zero
        if(SweepResult.ImpactPoint == FVector::ZeroVector)
        {
            HitResult.Location = impactPoint;
            HitResult.ImpactPoint = impactPoint;
        }

        //System::DrawDebugSphere(OtherActor.GetActorLocation(), 10.f, 12, FLinearColor::Purple, 10, 10);
        auto explosion = SpawnExplosion(impactPoint);
        if(explosion != nullptr)
        {
            explosion.m_FXTag = GameplayTag::FX_Environment_Lava_Hit;
            explosion.Multicast_OnExplode(HitResult, Math::RandRange(0,2));
        }
        OtherActor.DestroyActor();
        
    }

    bool CanKillOnDefeatedState()
    {
        return true;
    }

    UFUNCTION()
    FGameplayTag GetAttackType()
    {
        return GameplayTag::Combat_HitType_Dot;
    }

    UFUNCTION()
    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass()
    {
        if(m_WeaponDefinitionOverride != nullptr)
            return m_WeaponDefinitionOverride;
        return m_def;
    }

    UFUNCTION()
    TSubclassOf<UKnockbackData> GetCustomKnockbackData()
    {
        return nullptr;
    }

    UFUNCTION()
    UWeaponDefinition GetWeaponDefinition()
    {
        return Cast<UWeaponDefinition>(GetWeaponDefinitionSubclass().Get().GetDefaultObject());
    }

    UFUNCTION(BlueprintCallable)
    AExplosionVisual SpawnExplosion(FVector Location)
    {
        auto def = GetWeaponDefinition();
        if(def != nullptr)
        {
            UClass asset = Cast<UClass>(Cast<UEnvironment_LavaDefinitionBase>(def).m_ExplosionPath.ToSoftObjectPath().TryLoad());
        
            if(asset != nullptr)
            {
                AActor actor_default = Cast<AActor>(asset.GetDefaultObject());
                return Cast<AExplosionVisual>(SpawnActor(actor_default.Class, Location/*, GetActorRotation()*/));
            }
        }
        return nullptr;
    }

    UFUNCTION(BlueprintCallable)
    AExplosionVisual SpawnHumanExplosion(FVector Location)
    {
        auto def = GetWeaponDefinition();
        if(def != nullptr)
        {
            UClass asset = Cast<UClass>(Cast<UEnvironment_LavaDefinitionBase>(def).m_HumanExplosionPath.ToSoftObjectPath().TryLoad());
        
            if(asset != nullptr)
            {
                AActor actor_default = Cast<AActor>(asset.GetDefaultObject());
                return Cast<AExplosionVisual>(SpawnActor(actor_default.Class, Location/*, GetActorRotation()*/));
            }
        }
        return nullptr;
    }

}