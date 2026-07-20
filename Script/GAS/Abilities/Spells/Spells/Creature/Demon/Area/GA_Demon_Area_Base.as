class UGA_Demon_Area_Base : UGA_AttackSpawnActor
{
    UPROPERTY()
    TArray<UAbilitySystemComponent> m_Targets;
    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
    
    UPROPERTY()
    TSubclassOf<USpellConfig> m_SpellDefinition = UHellArmsSpellConfig::StaticClass();

    UPROPERTY()
    AGothicCharacter m_Target;
    UPROPERTY()
    AAIAgentCharacterDemonBase m_Instigator;

    UPROPERTY()
    TSubclassOf<ADemonAreaVisual> m_Area = AFireDemonHellArmsAreaVisual_Base::StaticClass();


    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        auto instigator = Cast<AAIAgentCharacterDemonBase>(GameplayAbilityActorInfo.GetAvatarActor());
        ADemonAreaVisual area = m_Area.GetDefaultObject();
        auto DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(GetAvatarActorFromActorInfo());
        if(instigator != nullptr && area != nullptr && DemonAreaRegisterComponent != nullptr)
            return DemonAreaRegisterComponent.CanSpawnArea(area.m_AreaType);
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_Instigator = Cast<AAIAgentCharacterDemonBase>(GameplayAbilityActorInfo.GetAvatarActor());
        m_Target = Cast<AGothicCharacter>(m_Instigator.GetTargetedActor());
        if(m_Target == nullptr)
            EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    bool CanSpawnActor_Scriptable() const
    {        
        ADemonAreaVisual area = m_Area.GetDefaultObject();
        auto DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(GetAvatarActorFromActorInfo());
        if(m_Instigator != nullptr && area != nullptr && DemonAreaRegisterComponent != nullptr)
            return DemonAreaRegisterComponent.CanSpawnArea(area.m_AreaType);
        return false;
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPosition_Scriptable()
    {
        if(m_Target == nullptr)
            return FVector::DownVector * 1000;

        FHitResult hit;
		MagicScript::FindFloorAtLocation(m_Target.GetActorLocation(), hit, nullptr, ECollisionChannel::IKTrace);
        return hit.ImpactPoint;
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotation_Scriptable()
    {
        if(m_Target == nullptr)
            return FRotator::ZeroRotator;
        return m_Target.GetActorRotation();
    }

  
    UFUNCTION(BlueprintOverride)
    void OnActorSpawned_Scriptable(AActor SpawnedActor)
    {
        if(m_Target == nullptr)
        {
            SpawnedActor.DestroyActor();
            return;
        }
    }


    UFUNCTION(BlueprintOverride)
    void OnEndAbility(bool bWasCancelled)
    {
    }

     
}

