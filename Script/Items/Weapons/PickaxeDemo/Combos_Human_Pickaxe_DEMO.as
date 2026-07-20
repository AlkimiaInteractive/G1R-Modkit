// ATTACK ANIMATIONS DATA //

class UConfig_Human_PickAxe_DEMO_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Untrained/A_Man_S1H_Un_RH_HitParried_Montage.A_Man_S1H_Un_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Untrained/A_Man_S1H_Un_HitDeflected_R_Montage.A_Man_S1H_Un_HitDeflected_R_Montage'"; 
}

class UConfig_Human_PickAxe_DEMO_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Untrained/A_Man_S1H_Un_LH_HitParried_Montage.A_Man_S1H_Un_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Untrained/A_Man_S1H_Un_HitDeflected_L_Montage.A_Man_S1H_Un_HitDeflected_L_Montage'"; 
}

class UConfig_Human_PickAxe_DEMO_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Untrained/A_Man_S1H_Un_RH_HitParried_Montage.A_Man_S1H_Un_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Untrained/A_Man_S1H_Un_HitDeflected_B_Montage.A_Man_S1H_Un_HitDeflected_B_Montage'"; 
}

class UConfig_Human_PickAxe_DEMO_Top : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Untrained/A_Man_S1H_Un_RH_HitParried_Montage.A_Man_S1H_Un_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Untrained/A_Man_S1H_Un_HitDeflected_T_Montage.A_Man_S1H_Un_HitDeflected_T_Montage'";
}


// ATTACK ANIMATIONS DATA //

class UConfig_Human_PickAxe_DEMO_Un_R01 : UConfig_Human_PickAxe_DEMO_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_A2H/Pickaxe/Test_PickAxe_DEMO_S1H_Un_A_R01_Montage.Test_PickAxe_DEMO_S1H_Un_A_R01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_PickAxe_DEMO_Un_L01 : UConfig_Human_PickAxe_DEMO_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_A2H/Pickaxe/Test_PickAxe_DEMO_S1H_Un_A_L01_Montage.Test_PickAxe_DEMO_S1H_Un_A_L01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_PickAxe_DEMO_Un_B01 : UConfig_Human_PickAxe_DEMO_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_A2H/Pickaxe/Test_PickAxe_DEMO_M1H_Un_A_B01_Montage.Test_PickAxe_DEMO_M1H_Un_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_PickAxe_DEMO_Un_T01 : UConfig_Human_M1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_A2H/Pickaxe/Test_PickAxe_DEMO_M1H_Un_A_T01_Montage.Test_PickAxe_DEMO_M1H_Un_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_PickAxe_DEMO_Un : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_PickAxe_DEMO_Un_R01 : UAttack_Human_PickAxe_DEMO_Un
{
    default m_MetaData = UConfig_Human_PickAxe_DEMO_Un_R01::StaticClass();
}

class UAttack_Human_PickAxe_DEMO_Un_L01 : UAttack_Human_PickAxe_DEMO_Un
{
    default m_MetaData = UConfig_Human_PickAxe_DEMO_Un_L01::StaticClass();
}

class UAttack_Human_PickAxe_DEMO_Un_B01 : UAttack_Human_PickAxe_DEMO_Un
{
    default m_MetaData = UConfig_Human_PickAxe_DEMO_Un_B01::StaticClass();
}

class UAttack_Human_PickAxe_DEMO_Un_T01 : UAttack_Human_PickAxe_DEMO_Un
{
    default m_MetaData = UConfig_Human_PickAxe_DEMO_Un_T01::StaticClass();
}