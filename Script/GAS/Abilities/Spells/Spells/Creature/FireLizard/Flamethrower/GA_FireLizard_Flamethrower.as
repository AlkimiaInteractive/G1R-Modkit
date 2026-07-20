class UGA_FireLizard_Flamethrower : UGA_AttackConeLoop
{
    default ActivationOwnedTags.AddTag(GameplayTag::State_ForceAiming);
    default ActivationOwnedTags.AddTag(GameplayTag::Character_Allow_LookAtWhileAttacking);
    default ActivationOwnedTags.AddTag(GameplayTag::State_Firing);
    default ActivationOwnedTags.AddTag(GameplayTag::State_AllowRotateNotMoving);

    default m_MovementAction = EMovementAction::LaunchingSpell;
    
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
}