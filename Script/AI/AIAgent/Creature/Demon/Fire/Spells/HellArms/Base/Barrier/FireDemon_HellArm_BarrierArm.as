UCLASS()
class AFireDemonHellArmVisual_BarrierArm : AFireDemonHellArmVisual
{
    default m_DamageAbility = UGA_HellArms_Damage_Loop::StaticClass();

    UPROPERTY()
    AHellArmsBarrierVisual m_Barrier;

    UPROPERTY()
    bool m_FinalizeAttack;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_FinalizeAttack = false;
        m_Activated = false;
    }


    UFUNCTION(BlueprintCallable)
    void FinalizeAttack()
    {
        if(m_Activated)
            m_FinalizeAttack = true;
        else
            DoDestroyActor();
    }
}


