
class UGE_Ex_Damage_FocusStonePuzzle : UGE_Ex_Damage
{
    //@DE - Always do damage.
    bool GetIsGodModeForPlayer(const UCombatConfig& combatConfig,
                               UGothicAbilitySystemComponent targetAbComp, bool bIsImmortal) const override
    {
        return false;
    }

    //@DE - Custom calculation class for electrified zone puzzle (Focus Stone Puzzle)
    //Even the effect its infinite. The duration of the effect application is defined by the environment animation. (it fixed to 9.084000 secs (Magic Number && Hardcoded = :D))
    float GetCalculatedDamage(UGothicAbilitySystemComponent SourceAbComp, UGothicAbilitySystemComponent TargetAbComp, TMapIterator<FGameplayTag, float32> Entry,
                              FGameplayEffectSpec Spec, UWeaponDefinition WeaponUsed) const override
    {
        auto weaponDefinitionByPercentage = Cast<UWeaponDefinitionFocusStonePuzzle>(WeaponUsed);
        if(weaponDefinitionByPercentage == nullptr)
            return Entry.Value;
        
        bool success = false;
     
        FGameplayAttribute maxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
        float maxTargetHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(TargetAbComp, maxValueAttribute, success);
        float period = Spec.Def.Period.Value;
        float percentage = Entry.Value;
        if( period > 0)
        {
            percentage = Entry.Value / (weaponDefinitionByPercentage.m_TimeToApplyDamage / period);
        }

        return Math::CeilToFloat(maxTargetHealth * (percentage / 100));
       
        

    }

}
