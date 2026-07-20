
class UGA_Death : UGameplayAbilityDeath
{
    default m_ReviveEffect = UGE_Revive::StaticClass();
    default m_RestoreOxygenEffect = UGE_OxygenRestore::StaticClass();
    default m_DeathGE = UGE_Death::StaticClass();

    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX);

    UFUNCTION(BlueprintOverride)
    void OnActivateAbilityServer_Scriptable()
    {
       m_DeathGEHandle = ApplyGameplayEffectToOwner(m_DeathGE);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbilityServer_Scriptable()
    {
        RemoveGameplayEffectFromOwnerWithHandle(m_DeathGEHandle);
    }
}


class UGA_Death_NoDeathEffect : UGA_Death
{
    UFUNCTION(BlueprintOverride)
    void DoDeathEffect_Scriptable()
    {
        EndAbility();
    }
}

class UGA_Death_Varrag : UGA_Death
{
    default m_DeathGE = UGE_Death_Varrag::StaticClass();
}