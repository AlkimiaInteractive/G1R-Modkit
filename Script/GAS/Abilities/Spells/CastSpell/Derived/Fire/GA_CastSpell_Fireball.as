class UGA_CastSpell_FireBall : UGA_CastSpell_Rechargeable
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_FireBall::StaticClass();

    FGothicFXInstanceHandle m_HoldSFXHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
    {
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = character.GetFXComponent();
        m_HoldSFXHandle = fxComponent.PlayEffect(GameplayTag::FX_Magic_Spell_FireBall_HoldLoop, nullptr);    
    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        if(WasCancelled)
        {
            const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
            character.GetFXComponent().StopFXInstancesWithTag(GameplayTag::FX_Magic_Spell_FireBall_HoldLoop, false); 
        }
    }
}

class UGA_CastSpell_Scroll_FireBall : UGA_CastSpell_Rechargeable
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_FireBall::StaticClass();

    FGothicFXInstanceHandle m_HoldSFXHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
    {
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = character.GetFXComponent();
        m_HoldSFXHandle = fxComponent.PlayEffect(GameplayTag::FX_Magic_Spell_FireBall_HoldLoop, nullptr);    
    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        if(WasCancelled)
        {
            const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
            character.GetFXComponent().StopFXInstancesWithTag(GameplayTag::FX_Magic_Spell_FireBall_HoldLoop, false); 
        }
    }
}