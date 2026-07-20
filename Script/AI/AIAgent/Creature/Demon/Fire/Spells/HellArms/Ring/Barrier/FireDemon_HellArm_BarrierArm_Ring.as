UCLASS()
class AFireDemonHellArmVisual_BarrierArm_Ring : AFireDemonHellArmVisual_BarrierArm
{

    void RestartAttackLoop() override
    {
        Super::RestartAttackLoop();
        m_Target = nullptr;
    }
}