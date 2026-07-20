class UGA_Falling : UGameplayAbilityFalling
{
    TSubclassOf<UWeaponDefinition> m_WeaponData = UWorldFallImpactWeapon::StaticClass();
    TSubclassOf<UGothicBaseConfig> m_FallingConfigClass = UFallingCharacterDefaultConfig::StaticClass();
    UFallingCharacterDefaultConfig m_FallingConfig;
    UPROPERTY()
    FGameplayTag m_DamageTag = GameplayTag::Item_Damage_Impact_Falling;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        
    }

    UFallingCharacterDefaultConfig GetConfig()
    {
        if(m_FallingConfig == nullptr)
            m_FallingConfig = Cast<UFallingCharacterDefaultConfig>(m_FallingConfigClass.GetDefaultObject());
        return m_FallingConfig;
    }

    UFUNCTION(BlueprintOverride)
    float GetMinFallDistance_Scriptable()
    {
        return GetConfig().m_MinFallingRollHeight;
    }

    UFUNCTION(BlueprintOverride)
    float GetFallingCancelAbilitiesDistance_Scriptable()
    {
        return GetConfig().m_MinFallingCancelAbilitiesDistanceHeight;
    }

    UFUNCTION()
    float GetHealthPercentagePerMeter()
    {
        return GetConfig().m_HealthPercentagePerMeter;
    }


    UFUNCTION(BlueprintOverride)
    void ApplyDamageTo_Scriptable(float FallDistance)
    {
        UGothicAbilitySystemComponent abTarget = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());

        if(abTarget != nullptr)
        {
            float32 multiplier = GetFallDistanceDamageMultipier(FallDistance);

            //reduce damage by 50% if character has acrobatics
            if(abTarget.HasGameplayTag(GameplayTag::Skill_Acrobatics_Trained))
                multiplier *= 0.5f;

            multiplier = Math::RoundToInt(multiplier);
            
            if(m_EnableDamageLimiter) 
                multiplier = GetMaxLimitedDamage(multiplier, m_DamageTag);
                
            FHitResult hit;
            FGameplayEffectContext_HitResponse hit_data;
            hit_data.Impact = GameplayTag::Combat_HitType_Dot;
            TSubclassOf<UWeaponDefinition> WeaponData = m_WeaponData;
            hit_data.WeaponUsed = WeaponData;
            hit_data.MultiplierDamages.Add(m_DamageTag, multiplier);
            hit_data.SourceDirection = GameplayTag::Combat_Direction_Undirectional;

            UGothicAbilitySystemComponent abSource = abTarget;
            UDataModule_Combat targetDataModuleCombat = DataModule::GetCombatDataModule(abTarget.Avatar);
            //@DE - Provide experience to the last attacker. Might a falls in a fight
            if(targetDataModuleCombat != nullptr)
            {
                auto LastAttackerCharacter = targetDataModuleCombat.LastAttackerCharacter;
                if(LastAttackerCharacter != nullptr)
                    abSource = GothicGAS::GetAbilitySystemComponent(LastAttackerCharacter); 
            }

            GothicGAS::ApplyDamageTo(abSource, abSource.GetAvatar(), nullptr, abTarget, hit_data, hit);




            // auto abComp = Cast<UGothicAbilitySystemComponent>(m_VisualCharacter.GetAbilitySystemComponent());
            // FGameplayEffectContextHandle context = abComp.MakeEffectContext();
            // FGameplayEffectSpecHandle effect = abComp.MakeOutgoingSpec(UGE_State_Projectile::StaticClass(), 1.0f, context);
            // //@DE - Example setByCallerManitude.
            // //effect.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Experience, float(amount));
            // m_ProjectileEffectHandle = abComp.ApplyGameplayEffectSpecToSelf(effect);
        }
    }

    

    float32 GetMaxLimitedDamage(float32 DamageMultiplier, FGameplayTag DamageTag)
    {
        auto weapon = Cast<UWorldFallImpactWeapon>(m_WeaponData.GetDefaultObject());
        if(!weapon.m_DamageBase.Contains(DamageTag))
            return 0.f;

        auto damageValue = weapon.m_DamageBase[DamageTag];
        auto currentHealth = GetGothicCharacter().GetHealthAttribute();

        if(Math::IsNearlyEqual(currentHealth, 1))
            return 0.f;

        if(currentHealth - (damageValue * DamageMultiplier) > 1.f)
            return DamageMultiplier;
        
        return (currentHealth - 1) / damageValue;
    }

    float32 GetFallDistanceDamageMultipier(float FallDistance)
    {
        auto fallingDifferenceOnMeters = (FallDistance - GetMinFallDistance_Scriptable()) / 100.f;
        auto roundFallingDifference = Math::RoundToInt(fallingDifferenceOnMeters);
        auto maxHealth = GetGothicCharacter().GetMaxHealthAttribute();
        auto percentagePerMeter = ( maxHealth * GetHealthPercentagePerMeter()) / 100.f;
        auto multiplier = float32(roundFallingDifference  * percentagePerMeter);
        auto difficultyMultiplier = 1.0f;

        UDifficultyManager diffManager = UDifficultyManager::Get();
        if (diffManager != nullptr)
        {
            UScriptProgressionDifficultySettings progressionSettings = Cast<UScriptProgressionDifficultySettings>(diffManager.GetProgressionDifficultySettings());
            if (progressionSettings != nullptr)
            {
                difficultyMultiplier = progressionSettings.GetFallDamageMultiplier();
            }
        }

        FString text = FString("Damage multiplier - ");
        text.Append(FString::ApplyFormat(multiplier, FString()));
        text.Append(FString(" - FallDistance - "));
        text.Append(FString::ApplyFormat(FallDistance, FString()));
        text.Append(FString(" - fallingDifferenceOnMeters - "));
        text.Append(FString::ApplyFormat(fallingDifferenceOnMeters, FString()));
        text.Append(FString(" - Round fallingDifferenceOnMeters - "));
        text.Append(FString::ApplyFormat(roundFallingDifference, FString()));
        text.Append(FString(" - maxHealth - "));
        text.Append(FString::ApplyFormat(maxHealth, FString()));
        text.Append(FString(" - percentagePerMeter - "));
        text.Append(FString::ApplyFormat(percentagePerMeter, FString()));
        text.Append(FString(" - difficultyMultiplier - "));
        text.Append(FString::ApplyFormat(difficultyMultiplier, FString()));
        //Print(text, 15.f, FLinearColor::Green);
        return multiplier * difficultyMultiplier;
    }

    AGothicCharacter GetGothicCharacter()
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        //@DE - If the character is riding, we get the rider resistance.
        if (gothicChar.HasGameplayTag(GameplayTag::State_Mounted))
        {
            if (gothicChar.GetMountComponent() != nullptr)
            {
                gothicChar = gothicChar.GetMountComponent().GetRiderCharacter();
            }
        }
        
        return gothicChar;
    }
}