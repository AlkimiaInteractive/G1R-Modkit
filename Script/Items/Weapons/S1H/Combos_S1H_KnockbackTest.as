// ATTACK ANIMATIONS DATA //UAttack_Human_S1H_KnockbackTest

class UConfig_Human_S1H_KnockbackTest_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_RH_HitParried_Montage.A_Man_S1H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_R_Montage.A_Man_S1H_Ma_HitDeflected_R_Montage'";
}

class UConfig_Human_S1H_KnockbackTest_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_LH_HitParried_Montage.A_Man_S1H_Ma_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_L_Montage.A_Man_S1H_Ma_HitDeflected_L_Montage'";
}

class UConfig_Human_S1H_KnockbackTest_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_LH_HitParried_Montage.A_Man_S1H_Ma_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_B_LH_Montage.A_Man_S1H_Ma_HitDeflected_B_LH_Montage'"; 
}

class UConfig_Human_S1H_KnockbackTest_Top : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_LH_HitParried_Montage.A_Man_S1H_Ma_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_T_Montage.A_Man_S1H_Ma_HitDeflected_T_Montage'";
}


// ATTACK ANIMATIONS DATA //

class UConfig_Human_S1H_KnockbackTest_R01 : UConfig_Human_S1H_KnockbackTest_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/A_01/A_Man_S1H_Ma_A_R01_Montage.A_Man_S1H_Ma_A_R01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_S1H_KnockbackTest_L01 : UConfig_Human_S1H_KnockbackTest_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/A_01/A_Man_S1H_Ma_A_L01_Montage.A_Man_S1H_Ma_A_L01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_S1H_KnockbackTest_B01 : UConfig_Human_S1H_KnockbackTest_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/A_01/A_Man_S1H_Ma_A_B01_Montage.A_Man_S1H_Ma_A_B01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_S1H_KnockbackTest_T01 : UConfig_Human_S1H_KnockbackTest_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/A_01/A_Man_S1H_Ma_A_T01_Montage.A_Man_S1H_Ma_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_S1H_KnockbackTest : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_S1H_KnockbackTest_R01 : UAttack_Human_S1H_KnockbackTest
{
    default m_MetaData = UConfig_Human_S1H_KnockbackTest_R01::StaticClass();
}

class UAttack_Human_S1H_KnockbackTest_L01 : UAttack_Human_S1H_KnockbackTest
{
    default m_MetaData = UConfig_Human_S1H_KnockbackTest_L01::StaticClass();
}

class UAttack_Human_S1H_KnockbackTest_B01 : UAttack_Human_S1H_KnockbackTest
{
    default m_MetaData = UConfig_Human_S1H_KnockbackTest_B01::StaticClass();
}

class UAttack_Human_S1H_KnockbackTest_T01 : UAttack_Human_S1H_KnockbackTest
{
    default m_MetaData = UConfig_Human_S1H_KnockbackTest_T01::StaticClass();
}


// ATTACK ANIMATIONS DATA //

class UConfig_Human_S1H_RiposteTest_R01 : UConfig_Human_S1H_KnockbackTest_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/Riposte/ParriesToTestRipostes/A_Man_S1H_Ma_Parry_ARight_Montage.A_Man_S1H_Ma_Parry_ARight_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_S1H_RiposteTest_L01 : UConfig_Human_S1H_KnockbackTest_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/Riposte/ParriesToTestRipostes/A_Man_S1H_Ma_Parry_ALeft_Montage.A_Man_S1H_Ma_Parry_ALeft_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_S1H_RiposteTest_B01 : UConfig_Human_S1H_KnockbackTest_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/Riposte/ParriesToTestRipostes/A_Man_S1H_Ma_Parry_ABottom_Montage.A_Man_S1H_Ma_Parry_ABottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_S1H_RiposteTest_T01 : UConfig_Human_S1H_KnockbackTest_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/Riposte/ParriesToTestRipostes/A_Man_S1H_Ma_Parry_ATop_Montage.A_Man_S1H_Ma_Parry_ATop_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_S1H_RiposteTest_Riposte : UConfig_Human_S1H_KnockbackTest_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/Riposte/A_Man_S1H_Ma_A_Riposte_Montage.A_Man_S1H_Ma_A_Riposte_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_S1H_RiposteTest_Riposte_v2 : UConfig_Human_S1H_KnockbackTest_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/Master/Riposte/A_Man_S1H_Ma_A_Riposte_v2_Montage.A_Man_S1H_Ma_A_Riposte_v2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;

    default m_CanKnockback = true;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_S1H_RiposteTest : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_S1H_RiposteTest_R01 : UAttack_Human_S1H_RiposteTest
{
    default m_MetaData = UConfig_Human_S1H_RiposteTest_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_RiposteTest_Riposte_v2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_RiposteTest_Riposte::StaticClass());
}

class UAttack_Human_S1H_RiposteTest_L01 : UAttack_Human_S1H_RiposteTest
{
    default m_MetaData = UConfig_Human_S1H_RiposteTest_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_RiposteTest_Riposte_v2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_RiposteTest_Riposte::StaticClass());
}

class UAttack_Human_S1H_RiposteTest_B01 : UAttack_Human_S1H_RiposteTest
{
    default m_MetaData = UConfig_Human_S1H_RiposteTest_B01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_RiposteTest_Riposte_v2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_RiposteTest_Riposte::StaticClass());
}

class UAttack_Human_S1H_RiposteTest_T01 : UAttack_Human_S1H_RiposteTest
{
    default m_MetaData = UConfig_Human_S1H_RiposteTest_T01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_RiposteTest_Riposte_v2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_RiposteTest_Riposte::StaticClass());
}

class UAttack_Human_S1H_RiposteTest_Riposte : UAttack_Human_S1H_RiposteTest
{
    default m_MetaData = UConfig_Human_S1H_RiposteTest_Riposte::StaticClass();
}

class UAttack_Human_S1H_RiposteTest_Riposte_v2 : UAttack_Human_S1H_RiposteTest
{
    default m_MetaData = UConfig_Human_S1H_RiposteTest_Riposte_v2::StaticClass();
}