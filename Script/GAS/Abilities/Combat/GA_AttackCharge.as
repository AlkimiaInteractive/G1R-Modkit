
class UGA_AttackCharge : UGameplayAbilityAttackCharge
{
    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool ShouldUpdateTaskUseComponentRotation_Scriptable()
    {
        return true;
    }
}

class UGA_AttackUnstoppableCharge : UGameplayAbilityAttackUnstoppableCharge
{
    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool ShouldUpdateTaskUseComponentRotation_Scriptable()
    {
        return true;
    }
}