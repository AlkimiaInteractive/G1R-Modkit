class UGA_AttackStomp : UGameplayAbilityAttackMelee
{
    UFUNCTION(BlueprintOverride)
    bool ShouldUpdateTaskUseComponentRotation_Scriptable()
    {
        return true;
    }
}