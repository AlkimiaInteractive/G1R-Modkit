
class UGA_CastSpell_IceBolt : UGA_CastSpell_Repeatable
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_IceBolt::StaticClass();
    FGothicFXInstanceHandle m_HoldSFXHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
    {
        Super::OnActivateCastSpellServer_Scriptable(castMontage);

        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = character.GetFXComponent();
        m_HoldSFXHandle = fxComponent.PlayEffect(GameplayTag::FX_Magic_Spell_IceBolt_HoldLoop, nullptr);
    }

    // UFUNCTION(BlueprintOverride)
    // bool ShouldRestoreCameraBehaviour_Scriptable()
    // {
    //    return true;
    // }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
       Super::OnEndCastSpellServer_Scriptable(WasCancelled);

        if(WasCancelled)
        {
            const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
            character.GetFXComponent().StopFXInstance(m_HoldSFXHandle, false);
        }
    }
}

class UGA_CastSpell_Scroll_IceBolt : UGA_CastSpell_Repeatable
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_IceBolt::StaticClass();

    FGothicFXInstanceHandle m_HoldSFXHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage) override
    {
        Super::OnActivateCastSpellServer_Scriptable(castMontage);
        
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = character.GetFXComponent();
        m_HoldSFXHandle = fxComponent.PlayEffect(GameplayTag::FX_Magic_Spell_IceBolt_HoldLoop, nullptr);
    }

    // UFUNCTION(BlueprintOverride)
    // bool ShouldRestoreCameraBehaviour_Scriptable()
    // {
    //    return true;
    // }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        Super::OnEndCastSpellServer_Scriptable(WasCancelled);

        if(WasCancelled)
        {
            const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
            character.GetFXComponent().StopFXInstance(m_HoldSFXHandle, false);
        }
    }
}