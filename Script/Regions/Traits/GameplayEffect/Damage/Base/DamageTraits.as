UCLASS(meta=(DisplayName="Base Damage Region Trait"))
class URegionTrait_DamageBase : URegionTrait_GameplayEffectBase
{
    UPROPERTY(NotVisible)
    TSubclassOf<UWeaponDefinition> m_def;

    bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp,
                        UGothicAbilitySystemComponent targetAbComp, AGothicCharacter character) override
    {
        if(!Super::CanApplyEffect(sourceAbComp, targetAbComp, character))
            return false;
        if((targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) && !CanKillOnDefeatedState()) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return false;
        }

        if(GetWeaponDefinitionSubclass() == nullptr)
        {
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
        
        if(GetAttackType() != GameplayTag::Combat_HitType_Dot)
        {
            hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
            targetAbComp.GetAvatar().GetActorForwardVector(), 
            targetAbComp.GetAvatar().GetActorRightVector(), 
                -sourceAbComp.GetAvatar().GetActorForwardVector());
        }
        //Print("DoDamage");
        return GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), sourceAbComp.GetAvatar(), targetAbComp, hit_data, SweepResult);
    }

    bool CanKillOnDefeatedState()
    {
        return true;
    }

    UFUNCTION()
    FGameplayTag GetAttackType()
    {
        return GameplayTag::Combat_HitType_Standard;
    }

    UFUNCTION()
    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass()
    {
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
}