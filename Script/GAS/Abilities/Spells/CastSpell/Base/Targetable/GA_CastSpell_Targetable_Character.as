class UGA_CastSpell_Targetable_Character : UGA_CastSpell_Targetable_Mandatory
{
    default m_CollisionChannel = ECollisionChannel::ECC_Visibility; //Channel for target (Character) detection. Used for get the target

    default m_ExecutionValidator = UCastSpellExecutionValidatorTargetableCharacter::StaticClass();

    UFUNCTION(BlueprintOverride)
    void OnTargetValidated_Scriptable(AActor Actor)
    {
        Super::OnTargetValidated_Scriptable(Actor);
        ActivateTarget(Actor);
    }

    UFUNCTION(BlueprintOverride)
    FGameplayEventData GetTargetEventData_Scriptable(AActor Actor)
    {
        if(Actor == nullptr)
            EndAbility();
        return MagicScript::GetTargetEventData(Actor);
    }
}