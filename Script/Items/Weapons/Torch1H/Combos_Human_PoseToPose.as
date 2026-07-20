
// ATTACK ANIMATIONS DATA //

class UConfig_Human_Torch_Right_PTP : UConfig_Human_M1H_Right
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_RH_HitParried_Montage.A_Man_S1H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_R_Montage.A_Man_S1H_Ma_HitDeflected_R_Montage'";
}
class UConfig_Human_Torch_Left_PTP : UConfig_Human_M1H_Left
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_LH_HitParried_Montage.A_Man_S1H_Ma_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_L_Montage.A_Man_S1H_Ma_HitDeflected_L_Montage'";
}
class UConfig_Human_Torch_Top_PTP : UConfig_Human_M1H_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_RH_HitParried_Montage.A_Man_S1H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_T_Montage.A_Man_S1H_Ma_HitDeflected_T_Montage'";
}
class UConfig_Human_Torch_Bottom_PTP : UConfig_Human_M1H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_RH_HitParried_Montage.A_Man_S1H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_B_LH_Montage.A_Man_S1H_Ma_HitDeflected_B_LH_Montage'"; 
}

// Side Loop Slow---------
class UConfig_Human_Torch_PTP_L01 : UConfig_Human_Torch_Left_PTP
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Horizontals/A_Man_TestT1H_A_L01_Montage.A_Man_TestT1H_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 5.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_Torch_PTP_L_R02  : UConfig_Human_Torch_Right_PTP
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Horizontals/A_Man_TestT1H_A_L_R02_Montage.A_Man_TestT1H_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 5.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_Torch_PTP_R_L02  : UConfig_Human_Torch_Left_PTP
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Horizontals/A_Man_TestT1H_A_R_L02_Montage.A_Man_TestT1H_A_R_L02_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 5.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_Torch_PTP_T01 : UConfig_Human_Torch_Top_PTP
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Tops/A_Man_TestT1H_T01_multiStab_Montage.A_Man_TestT1H_T01_multiStab_Montage'";
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Bottoms/A_Man_TestT1H_B01_v2_Montage.A_Man_TestT1H_B01_v2_Montage'";
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Horizontals/A_Man_TestT1H_A_L01_v2_Montage.A_Man_TestT1H_A_L01_v2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 10.0f);
	default m_SuperArmorDamageMultiplier = 0.0f;
}

class UConfig_Human_Torch_PTP_B01 : UConfig_Human_Torch_Bottom_PTP
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Bottoms/A_Man_TestT1H_B01_Montage.A_Man_TestT1H_B01_Montage'";
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Horizontals/A_Man_TestT1H_A_L01_v2_Montage.A_Man_TestT1H_A_L01_v2_Montage'";
    
    // Damage on 18 instead of 22
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Horizontals/A_Man_TestT1H_A_L01_v2_Montage1.A_Man_TestT1H_A_L01_v2_Montage1'";
    // Damage on 18 instead of 22
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PoseToPose/Horizontals/A_Man_TestT1H_A_L01_v2_Montage2.A_Man_TestT1H_A_L01_v2_Montage2'";


    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 5.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

//Combos--------------

class UAttack_Human_Torch_PTP : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_Torch_PTP_L01 : UAttack_Human_Torch_PTP
{
    default m_MetaData = UConfig_Human_Torch_PTP_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_PTP_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_PTP_L_R02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_PTP_L_R02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_PTP_L_R02::StaticClass());
}

class UAttack_Human_Torch_PTP_L_R02 : UAttack_Human_Torch_PTP
{
    default m_MetaData = UConfig_Human_Torch_PTP_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Torch_PTP_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_PTP_R_L02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_PTP_R_L02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_PTP_R_L02::StaticClass());
}

class UAttack_Human_Torch_PTP_R_L02 : UAttack_Human_Torch_PTP
{
    default m_MetaData = UConfig_Human_Torch_PTP_R_L02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_PTP_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_PTP_L_R02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_PTP_L_R02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_PTP_L_R02::StaticClass());
}

class UAttack_Human_Torch_PTP_T01 : UAttack_Human_Torch_PTP
{
    default m_MetaData = UConfig_Human_Torch_PTP_T01::StaticClass();
}

class UAttack_Human_Torch_PTP_B01 : UAttack_Human_Torch_PTP
{
    default m_MetaData = UConfig_Human_Torch_PTP_B01::StaticClass();
}

