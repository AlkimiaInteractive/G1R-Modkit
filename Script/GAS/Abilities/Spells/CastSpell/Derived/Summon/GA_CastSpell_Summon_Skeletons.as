class UGA_CastSpell_Summon_Skeletons : UGA_CastSpell_SummonBase
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Summon_Skeletons::StaticClass();

    
    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        if(WasCancelled)
        {
            const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
            auto fxComponent = character.GetFXComponent();

            fxComponent.StopFXInstancesWithTag(GameplayTag::FX_Magic_Spell_Summon_Skeletons_Cast_Charge, false);
        }
    }
}