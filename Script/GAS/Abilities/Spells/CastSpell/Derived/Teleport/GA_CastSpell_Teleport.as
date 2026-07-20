class UGA_CastSpell_Teleport : UGA_CastSpell_ChargeByDuration
{
    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        const auto character = GetAvatarActorFromActorInfo();
        if(!IsValid(character))
            return false;

        const auto gothicCharacter = Cast<AGothicCharacter>(character);
        if(!IsValid(gothicCharacter))
            return false;

        const auto isTeleportBlocked = gothicCharacter.HasGameplayTag(GameplayTag::State_Spell_Teleport_Blocked);
        return !isTeleportBlocked;    
    }
}