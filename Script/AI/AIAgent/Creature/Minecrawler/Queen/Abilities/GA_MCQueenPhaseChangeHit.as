class UGA_MCQueenPhaseChangeHit : UGameplayAbilityHitPhaseChange
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Attacks/MCQueen_Ph1_to_Ph2_Montage.MCQueen_Ph1_to_Ph2_Montage'";
    //@DE - Not necessary. With State_Dead_Instant works
    //default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Death);
    
    UFUNCTION(BlueprintOverride)
    UAnimMontage GetHitMontage_Scriptable(const UHitData HitData, FGameplayTagContainer MetaData)
    {
        return m_Montage.Get();
    }

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GameplayAbilityActorInfo.AbilitySystemComponent);
        if(abComp.HasGameplayTag(GameplayTag::State_Combat_PhaseChange))
            return false;

        auto mcQueenCharacter = Cast<AMinecrawler_Queen>(GameplayAbilityActorInfo.AvatarActor);
        if(mcQueenCharacter.IsInSecondPhase || mcQueenCharacter.DetachEggSac)
            return false;
        
        auto CurrentValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        auto MaxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");

        bool success = false;
        float MaxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(abComp, MaxValueAttribute, success);
        float CurrentHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(abComp, CurrentValueAttribute, success);
        auto damageLimiterComp = UMCQueenDamageLimiterComponent::Get(GameplayAbilityActorInfo.AvatarActor);
        if(damageLimiterComp == nullptr)
            return false;
        
        auto healthThreshold = damageLimiterComp.m_HealthConfig.m_HealthPercentageThresholds[0];
        if(CurrentHealth <= MaxHealth * healthThreshold)
            return true;
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        if(!HasAuthority())
            return;
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.AddTag(GameplayTag::State_Combat_PhaseChange);
        Cast<AMinecrawler_Queen>(GetAvatarActorFromActorInfo()).DoDetachEggSac();
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_Minecrawler_Queen_HealthMonitor::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);
        DoDestroyCaveWall();
        DoKnockbackHitOnArea();
        
        DoSpawnQueenPhase2();
    }

    void DoSpawnQueenPhase2()
    {
        UWorldPointManager::Get().CallGlobalEvent(n"OnMCQueenCombatPH2Starts");
    }

    void DoDestroyCaveWall()
    {
        TArray<AActor> outActors;
        GetAllActorsOfClass(AMCQueen_DestroyableWall::StaticClass(), outActors);

        for(auto actor : outActors)
        {
            auto destroyableWall = Cast<AMCQueen_DestroyableWall>(actor);
            if(actor != nullptr)
            {
                destroyableWall.DoDestroyWall();
            }
        }
    }

    UFUNCTION(BlueprintOverride)
    void DoPhaseChange_Scriptable()
    {
        auto abcomp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto newLocation = gothicChar.GetActorLocation();
        gothicChar.SetActorLocation(FVector(newLocation.X, newLocation.Y, newLocation.Z-10000));
        gothicChar.SetVisibilityCharacterAndEverythingItCarries(false);
        abcomp.RemoveTag(GameplayTag::State_Combat_PhaseChange);
        abcomp.AddTag(GameplayTag::State_Combat_Ended);
        abcomp.AddTag(GameplayTag::State_Dead_Instant);
        gothicChar.GetCharacterState().NPCState.RemoveFromWorld();
    }

    void DoKnockbackHitOnArea()
    {
        auto characters = GetCharactersInsideExpandedSafeZone();
        for(auto character : characters)
        {
            ApplyKnockback(character);
        }
    }

    void ApplyKnockback(AGothicCharacter character)
    {
        auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        auto targetAbComp = Cast<UGothicAbilitySystemComponent>(character.GetAbilitySystemComponent());

        if(sourceAbComp == nullptr || targetAbComp == nullptr)
        {
            return;
        }

        //@DE - First: set a GE to allow get a knockback (ignore superarmor value)
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(UGE_MCQueenCombat_ForceKnockback::StaticClass(), 1, contextHandle);
        sourceAbComp.ApplyGameplayEffectSpecToTarget(geSpecHandle, targetAbComp);

        FGameplayEventData payload;

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Knockback;
        hit_data.CustomKnockbackData = UKnockbackDataMCQueen::StaticClass();
        
        hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
        targetAbComp.GetAvatar().GetActorForwardVector(), 
        targetAbComp.GetAvatar().GetActorRightVector(), 
            -sourceAbComp.GetAvatar().GetActorForwardVector());
        
        InitializeHitData(payload, hit_data);
        //@DE - Second: force knockback.
        GothicGAS::SendGameplayEvent(character, GameplayTag::Event_Hit_BreakArmorHit, payload);
    }

    TArray<AGothicCharacter> GetCharactersInsideExpandedSafeZone()
    {
        auto Actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), GetAvatarActorFromActorInfo().GetActorLocation(), 1500);
        TArray<AGothicCharacter> GothicCharacters;

        for (auto Actor : Actors)
        {
            auto GothicCharacter = Cast<AGothicCharacter>(Actor);
            if (GothicCharacter == nullptr)
                continue;
            if (GothicCharacter == GetAvatarActorFromActorInfo())
                continue;

            GothicCharacters.Add(GothicCharacter);
        }

        return GothicCharacters;
    }

}

class UKnockbackDataMCQueen : UKnockbackDataGeneric
{
    default m_KnockbackFloorRange = 8.f;
    default m_KnockbackTopRange = 10.f;
    default m_RootMotionMultiplierKnockback = 1.5f;
}

class UGE_MCQueenCombat_ForceKnockback : UScriptGameplayEffect
{
    //Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default DurationMagnitude.ScalableFloatMagnitude.Value = 3; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;


	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);
}

class UGE_Damage_MCQueen_Test : UGE_Damage
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;

    // Attribute to modify
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default modifier.ModifierMagnitude.ScalableFloatMagnitude.Value = -50.0f; // How much damage applies to the attribute
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health"); // attribute class and name
	default Modifiers.Add(modifier);

	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
	default Period.Value = 0.5f; // Applied each seconds
}