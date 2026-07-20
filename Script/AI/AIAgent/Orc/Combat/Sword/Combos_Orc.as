
// ATTACK ANIMATIONS DATA //

class UConfig_Orc_S1H_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/Parried/A_OrcM_S1H_RH_HitParried_Montage.A_OrcM_S1H_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/Deflected/A_OrcM_S1H_HitDeflected_R_Montage.A_OrcM_S1H_HitDeflected_R_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
    default m_AttackDirection = GameplayTag::Combat_Attack_Right;
}
class UConfig_Orc_S1H_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/Parried/A_OrcM_S1H_LH_HitParried_Montage.A_OrcM_S1H_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/Deflected/A_OrcM_S1H_HitDeflected_L_Montage.A_OrcM_S1H_HitDeflected_L_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
    default m_AttackDirection = GameplayTag::Combat_Attack_Left;
}
class UConfig_Orc_S1H_Top : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/Parried/A_OrcM_S1H_LH_HitParried_Montage.A_OrcM_S1H_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/Deflected/A_OrcM_S1H_HitDeflected_T_Montage.A_OrcM_S1H_HitDeflected_T_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
    default m_AttackDirection = GameplayTag::Combat_Attack_Top;
}
class UConfig_Orc_S1H_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/Parried/A_OrcM_S1H_LH_HitParried_Montage.A_OrcM_S1H_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Hits/Deflected/A_OrcM_S1H_HitDeflected_B_Montage.A_OrcM_S1H_HitDeflected_B_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
    default m_AttackDirection = GameplayTag::Combat_Attack_Bottom;
}

class UConfig_Orc_S1H_R01 : UConfig_Orc_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_01/A_OrcM_S1H_A_R01_Montage.A_OrcM_S1H_A_R01_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_S1H_L01 : UConfig_Orc_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_01/A_OrcM_S1H_A_L01_Montage.A_OrcM_S1H_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_S1H_B01 : UConfig_Orc_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_01/A_OrcM_S1H_A_B01_Montage.A_OrcM_S1H_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_S1H_T01 : UConfig_Orc_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_01/A_OrcM_S1H_A_T01_Montage.A_OrcM_S1H_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_S1H_L_R02 : UConfig_Orc_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_02/L_02/A_OrcM_S1H_A_L_R02_Montage.A_OrcM_S1H_A_L_R02_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_S1H_L_B02 : UConfig_Orc_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_02/L_02/A_OrcM_S1H_A_L_B02_Montage.A_OrcM_S1H_A_L_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_S1H_L_T02 : UConfig_Orc_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_02/L_02/A_OrcM_S1H_A_L_T02_Montage.A_OrcM_S1H_A_L_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_S1H_R_L02 : UConfig_Orc_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_02/R_02/A_OrcM_S1H_A_R_L02_Montage.A_OrcM_S1H_A_R_L02_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_S1H_R_B02 : UConfig_Orc_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_02/R_02/A_OrcM_S1H_A_R_B02_Montage.A_OrcM_S1H_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_S1H_R_T02 : UConfig_Orc_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_02/R_02/A_OrcM_S1H_A_R_T02_Montage.A_OrcM_S1H_A_R_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_S1H_Spc_B_R02 : UConfig_Orc_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/Specials/A_OrcM_S1H_A_Spc_B_R02_Montage.A_OrcM_S1H_A_Spc_B_R02_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    // default m_CanKnockback = true;
}

class UConfig_Orc_S1H_L_R03 : UConfig_Orc_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_03/L_03/A_OrcM_S1H_A_L_R03_Montage.A_OrcM_S1H_A_L_R03_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_S1H_R_L03 : UConfig_Orc_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/A_03/R_03/A_OrcM_S1H_A_R_L03_Montage.A_OrcM_S1H_A_R_L03_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

// ******************************************** //

// COMBOS //

class UAttack_Orc_S1H : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Orc_S1H_R01 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Orc_S1H_R_T02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Orc_S1H_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_S1H_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Orc_S1H_R_L02::StaticClass());
}

class UAttack_Orc_S1H_L01 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Orc_S1H_L_T02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Orc_S1H_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_S1H_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Orc_S1H_L_R02::StaticClass());
}

class UAttack_Orc_S1H_B01 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_B01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_S1H_Spc_B_R02::StaticClass());
}

class UAttack_Orc_S1H_T01 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_T01::StaticClass();
}

class UAttack_Orc_S1H_L_R02 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_L_R02::StaticClass();
    
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Orc_S1H_R_T02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Orc_S1H_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_S1H_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Orc_S1H_R_L03::StaticClass());
}

class UAttack_Orc_S1H_L_B02 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_L_B02::StaticClass();
}

class UAttack_Orc_S1H_L_T02 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_L_T02::StaticClass();
}

class UAttack_Orc_S1H_R_L02 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_R_L02::StaticClass();
    
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Orc_S1H_L_T02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Orc_S1H_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_S1H_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Orc_S1H_L_R03::StaticClass());
}

class UAttack_Orc_S1H_R_B02 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_R_B02::StaticClass();
}

class UAttack_Orc_S1H_R_T02 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_R_T02::StaticClass();
}

class UAttack_Orc_S1H_Spc_B_R02 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_Spc_B_R02::StaticClass();
}

class UAttack_Orc_S1H_L_R03 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_L_R03::StaticClass();
}

class UAttack_Orc_S1H_R_L03 : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_S1H_R_L03::StaticClass();
}



// ******************************************** //

// TEST HIP L

class UConfig_Orc_Test_LH : UConfig_Orc_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Test/OrcM_Test_LH_Montage.OrcM_Test_LH_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UAttack_Orc_Test_LH : UAttack_Orc_S1H
{
    default m_MetaData = UConfig_Orc_Test_LH::StaticClass();
}