// Execution test to use in attacks slots to make it easier to test

class UAttack_TestExecution : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

// GOOD ONE START ----
class UConfig_TestExecution_Step2_Time : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_Step2_Time_Montage.Execution_Step2_Time_Montage'";   
}

class UAttack_TestExecution_Step2_Time : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Step2_Time::StaticClass();
}
// GOOD ONE END ----

class UConfig_TestExecution_Hit01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/Developers/SPantoja/Executions/KO_poses_Tests/Hit_KO_F_In_01_Montage.Hit_KO_F_In_01_Montage'";   
}

class UAttack_TestExecution_Hit01 : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Hit01::StaticClass();
}

class UConfig_TestExecution_Hit02 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/Developers/SPantoja/Executions/KO_poses_Tests/Hit_KO_F_In_02_Montage.Hit_KO_F_In_02_Montage'";      
}

class UAttack_TestExecution_Hit02 : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Hit02::StaticClass();
}

class UConfig_TestExecution_Hit03 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/Developers/SPantoja/Executions/KO_poses_Tests/Hit_KO_F_In_03_Montage.Hit_KO_F_In_03_Montage'";      
}

class UAttack_TestExecution_Hit03 : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Hit03::StaticClass();
}

// --------

class UConfig_TestExecution_NoStep : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_NoStep_Montage.Execution_NoStep_Montage'";   
}

class UAttack_TestExecution_NoStep : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_NoStep::StaticClass();
}

class UConfig_TestExecution_Step2 : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_Step2_Montage.Execution_Step2_Montage'";   
}

class UAttack_TestExecution_Step2 : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Step2::StaticClass();
}

class UConfig_TestExecution_Step : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_Step_Montage.Execution_Step_Montage'";   
}

class UAttack_TestExecution_Step : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Step::StaticClass();
}

class UConfig_TestExecution_NoStep_Slower : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_NoStep_Slower_Montage.Execution_NoStep_Slower_Montage'";   
}

class UAttack_TestExecution_NoStep_Slower : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_NoStep_Slower::StaticClass();
}

class UConfig_TestExecution_Step_Faster : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_Step_Faster_Montage.Execution_Step_Faster_Montage'";   
}

class UAttack_TestExecution_Step_Faster : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Step_Faster::StaticClass();
}

class UConfig_TestExecution_Step_Dyn : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_Step_Dyn_Montage.Execution_Step_Dyn_Montage'";   
}

class UAttack_TestExecution_Step_Dyn : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Step_Dyn::StaticClass();
}

class UConfig_TestExecution_Step_Dyn_B01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_Step_Dyn_B01_Montage.Execution_Step_Dyn_B01_Montage'";   
}

class UAttack_TestExecution_Step_Dyn_B01 : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Step_Dyn_B01::StaticClass();
}

class UConfig_TestExecution_Step_Dyn_B01_2 : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_Step_Dyn_B01_2_Montage.Execution_Step_Dyn_B01_2_Montage'";   
}

class UAttack_TestExecution_Step_Dyn_B01_2 : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Step_Dyn_B01_2::StaticClass();
}

class UConfig_TestExecution_Step_Dyn_B01_Fists : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/Developers/SPantoja/Executions/Execution_Step_Dyn_B01_Fists_Montage.Execution_Step_Dyn_B01_Fists_Montage'";   
}

class UAttack_TestExecution_Step_Dyn_B01_Fists : UAttack_TestExecution
{
    default m_MetaData = UConfig_TestExecution_Step_Dyn_B01_Fists::StaticClass();
}