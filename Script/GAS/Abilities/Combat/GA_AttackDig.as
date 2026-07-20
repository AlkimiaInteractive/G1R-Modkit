
class UGA_AttackDig : UGameplayAbilityAttackDig
{
    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool ShouldUpdateTaskUseComponentRotation_Scriptable()
    {
        return true;
    }
}