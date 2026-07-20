
class UGA_TargetEnemy :  UGameplayAbilityTargetCombat
{
    default m_EffectToApply = UGE_TargetEnemy::StaticClass();

    UPROPERTY()
    FGameplayTag m_CastingTag = FGameplayTag(GameplayTag::State_Casting);      
    UPROPERTY()
    FGameplayTag m_LaunchingSpellTag = FGameplayTag(GameplayTag::State_LaunchingSpell);
    UPROPERTY()
    FGameplayTag m_StateDoingMagicTag = GameplayTag::State_DoingMagic;

    //Avoid activate targeting once the spell is being casted
    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        return true;
    }

    //Cant remove the targeting with player input while the spell is working
    UFUNCTION(BlueprintOverride)
    bool CanInputTargetRelease_Scriptable()
    {
        auto Character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(Character == nullptr)
            return true;
        auto abComp = Character.GetGothicAbilitySystemComponent();  
        if(abComp == nullptr)
            return true;

        bool isCastingSpell = abComp.HasGameplayTag(m_CastingTag);
        bool isLaunchingSpell = abComp.HasGameplayTag(m_LaunchingSpellTag);
        bool isStateDoingMagic = abComp.HasGameplayTag(m_StateDoingMagicTag);
        return !isCastingSpell && !isLaunchingSpell && !isStateDoingMagic;
    }
}

