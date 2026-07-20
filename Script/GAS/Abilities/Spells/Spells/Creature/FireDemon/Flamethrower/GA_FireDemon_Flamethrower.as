class UGA_FireDemon_Flamethrower : UGA_AttackConeLoop
{
    default ActivationRequiredTags.RemoveTag(GameplayTag::State_Grounded);
    default ActivationRequiredTags.AddTag(GameplayTag::State_Flying);

    default ActivationOwnedTags.AddTag(GameplayTag::Character_Allow_LookAtWhileAttacking);
    
    UFUNCTION(BlueprintOverride)
    bool NeedCalculateSourceDirection_Scriptable()
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    FGameplayTag GetCombatHitType_Scriptable()
    {
        return GameplayTag::Combat_HitType_Additive;
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldCheckMovementMode_Scriptable() const
    {
        return false;
    }

}