class UGA_HellArms_Damage_Loop : UGA_HellArms_Damage
{
    UPROPERTY()
    AFireDemonHellArmVisual_BarrierArm m_Arm;
    AHellArmsBarrierVisual m_Barrier;

    UPROPERTY()
    bool m_WaitingToSpawnOnBarrier = false;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable()
    {      
        m_Arm = Cast<AFireDemonHellArmVisual_BarrierArm>(GetAvatarActorFromActorInfo());
        CheckEndAbility(m_Arm);

        m_Barrier = m_Arm.m_Barrier;
        CheckEndAbility(m_Barrier);

        Super::OnActivateAbility_Scriptable();
    }

    void DoAttack() override
    {
        CheckEndAbility(m_Arm);
        CheckEndAbility(m_Barrier);

        if(m_Arm.m_FinalizeAttack)
        {
            DoEndAttack();
            return;
        }
        
        if(!m_Barrier.m_CanAttack || m_Arm.m_Target == nullptr)
        {
            m_WaitingToSpawnOnBarrier = true;
            return;
        }
        m_WaitingToSpawnOnBarrier = false;

        m_Arm.SetActorLocation(m_Barrier.GetArmSpawnPosition(m_Arm.m_Target));
        Super::DoAttack();
    }

    UFUNCTION()
    void CheckEndAbility(AActor actor)
    {
        if(actor == nullptr)
        {
            DoEndAttack();
            return;
        }
    }

    void DoEndAttack()
    {
        m_TickEnabled = false;
        DestroyArm();
        DoEndAbility();
    }


    UFUNCTION(BlueprintOverride, meta =(NoSuperCall))
    void OnCompleted_Scriptable()
    {
        RestartAttackLoop();
    }

    UFUNCTION(BlueprintOverride, meta =(NoSuperCall))
    void OnCancelled_Scriptable()
    {
        RestartAttackLoop();
    }

    UFUNCTION(BlueprintOverride, meta =(NoSuperCall)) 
    void OnInterrupted_Scriptable() 
    {
        RestartAttackLoop();
    }

    void RestartAttackLoop()
    {
        m_Arm.RestartAttackLoop();
        DoAttack();
    }

    UFUNCTION(BlueprintOverride)
    void OnUpdateAbility_Scriptable(float DeltaTime)
    {
        if(m_WaitingToSpawnOnBarrier)
        {
            if(m_Arm.m_FinalizeAttack)
            {
                DoEndAttack();
                return;
            }
            if(m_Barrier != nullptr && m_Barrier.m_CanAttack)
            {
                m_Barrier.DoArmAttack(m_Arm, m_Arm.m_Target);
                DoEndAbility();
            }
                
        }
    }
}