
// ATTACK ANIMATIONS DATA //

class UConfig_Human_A2H_Right_Tr : UConfig_Human_A2H_Right
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Parried/Trained/A_Man_A2H_Tr_RH_HitParried_Montage.A_Man_A2H_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Deflected/Trained/A_Man_A2H_Tr_HitDeflected_R_Montage.A_Man_A2H_Tr_HitDeflected_R_Montage'"; 
}
class UConfig_Human_A2H_Left_Tr : UConfig_Human_A2H_Left
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Parried/Trained/A_Man_A2H_Tr_LH_HitParried_Montage.A_Man_A2H_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Deflected/Trained/A_Man_A2H_Tr_HitDeflected_L_Montage.A_Man_A2H_Tr_HitDeflected_L_Montage'"; 
}
class UConfig_Human_A2H_Top_LH_Tr : UConfig_Human_A2H_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Parried/Trained/A_Man_A2H_Tr_LH_HitParried_Montage.A_Man_A2H_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Deflected/Trained/A_Man_A2H_Tr_HitDeflected_T_LH_Montage.A_Man_A2H_Tr_HitDeflected_T_LH_Montage'";
}
class UConfig_Human_A2H_Bottom_RH_Tr : UConfig_Human_A2H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Parried/Trained/A_Man_A2H_Tr_RH_HitParried_Montage.A_Man_A2H_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Deflected/Trained/A_Man_A2H_Tr_HitDeflected_B_LH_Montage.A_Man_A2H_Tr_HitDeflected_B_LH_Montage'"; 
}
class UConfig_Human_A2H_Bottom_LH_Tr : UConfig_Human_A2H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Parried/Trained/A_Man_A2H_Tr_LH_HitParried_Montage.A_Man_A2H_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Hits/Deflected/Trained/A_Man_A2H_Tr_HitDeflected_B_LH_Montage.A_Man_A2H_Tr_HitDeflected_B_LH_Montage'"; 
}

class UConfig_Human_A2H_Tr_R01 : UConfig_Human_A2H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_01/A_Man_A2H_Tr_A_R01_Montage.A_Man_A2H_Tr_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.8f;
}

class UConfig_Human_A2H_Tr_R01_NoCombo : UConfig_Human_A2H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_01/A_Man_A2H_Tr_A_R01_NoCombo_Montage.A_Man_A2H_Tr_A_R01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.8f;
}

class UConfig_Human_A2H_Tr_L01 : UConfig_Human_A2H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_01/A_Man_A2H_Tr_A_L01_Montage.A_Man_A2H_Tr_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.8f;
}

class UConfig_Human_A2H_Tr_L01_NoCombo : UConfig_Human_A2H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_01/A_Man_A2H_Tr_A_L01_NoCombo_Montage.A_Man_A2H_Tr_A_L01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.8f;
}

class UConfig_Human_A2H_Tr_B01 : UConfig_Human_A2H_Bottom_RH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_01/A_Man_A2H_Tr_A_B01_Montage.A_Man_A2H_Tr_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_A2H_Tr_T01 : UConfig_Human_A2H_Top_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_01/A_Man_A2H_Tr_A_T01_Montage.A_Man_A2H_Tr_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_A2H_Tr_R_L02 : UConfig_Human_A2H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_02/R_02/A_Man_A2H_Tr_A_R_L02_Montage.A_Man_A2H_Tr_A_R_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.05f;
}

class UConfig_Human_A2H_Tr_R_L02b : UConfig_Human_A2H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_02/R_02/A_Man_A2H_Tr_A_R_L02_Montage.A_Man_A2H_Tr_A_R_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.05f;
}

class UConfig_Human_A2H_Tr_R_B02 : UConfig_Human_A2H_Bottom_RH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_02/R_02/A_Man_A2H_Tr_A_R_B02_Montage.A_Man_A2H_Tr_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_A2H_Tr_R_T02 : UConfig_Human_A2H_Top_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_02/R_02/A_Man_A2H_Tr_A_R_T02_Montage.A_Man_A2H_Tr_A_R_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_A2H_Tr_L_R02 : UConfig_Human_A2H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_02/L_02/A_Man_A2H_Tr_A_L_R02_Montage.A_Man_A2H_Tr_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.05f;
}

class UConfig_Human_A2H_Tr_L_R02b : UConfig_Human_A2H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_02/L_02/A_Man_A2H_Tr_A_L_R02_Montage.A_Man_A2H_Tr_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.05f;
}

class UConfig_Human_A2H_Tr_L_B02 : UConfig_Human_A2H_Bottom_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_02/L_02/A_Man_A2H_Tr_A_L_B02_Montage.A_Man_A2H_Tr_A_L_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_A2H_Tr_L_T02 : UConfig_Human_A2H_Top_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Attacks/Trained/A_02/L_02/A_Man_A2H_Tr_A_L_T02_Montage.A_Man_A2H_Tr_A_L_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_A2H_Tr : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_A2H_Tr_R01 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_R01::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_A2H_Tr_R_T02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_A2H_Tr_R_B02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates,  UAttack_Human_A2H_Tr_L01_NoCombo::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_A2H_Tr_R_L02::StaticClass());
}

class UAttack_Human_A2H_Tr_R01_NoCombo : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_R01_NoCombo::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_A2H_Tr_R_T02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_A2H_Tr_R_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_A2H_Tr_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_A2H_Tr_R_L02::StaticClass());
}

class UAttack_Human_A2H_Tr_L01 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_L01::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_A2H_Tr_L_T02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_A2H_Tr_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_A2H_Tr_L_R02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates,  UAttack_Human_A2H_Tr_R01_NoCombo::StaticClass());
}

class UAttack_Human_A2H_Tr_L01_NoCombo : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_L01_NoCombo::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_A2H_Tr_L_T02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_A2H_Tr_L_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_A2H_Tr_L_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_A2H_Tr_L_R02::StaticClass());
}

class UAttack_Human_A2H_Tr_B01 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_B01::StaticClass();
}

class UAttack_Human_A2H_Tr_T01 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_T01::StaticClass();
}

class UAttack_Human_A2H_Tr_R_L02 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_R_L02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_A2H_Tr_L_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_A2H_Tr_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_A2H_Tr_L_R02b::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_A2H_Tr_L_R02b::StaticClass());
}

class UAttack_Human_A2H_Tr_R_L02b : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_R_L02b::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_A2H_Tr_L_T02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_A2H_Tr_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_A2H_Tr_L_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_A2H_Tr_L_R02::StaticClass());
}

class UAttack_Human_A2H_Tr_R_B02 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_R_B02::StaticClass();
}

class UAttack_Human_A2H_Tr_R_T02 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_R_T02::StaticClass();
}

class UAttack_Human_A2H_Tr_L_R02 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_L_R02::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_A2H_Tr_R_T02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_A2H_Tr_R_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_A2H_Tr_R_L02b::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_A2H_Tr_R_L02b::StaticClass());
}

class UAttack_Human_A2H_Tr_L_R02b : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_L_R02b::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_A2H_Tr_R_T02::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_A2H_Tr_R_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_A2H_Tr_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_A2H_Tr_R_L02::StaticClass());
}

class UAttack_Human_A2H_Tr_L_B02 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_L_B02::StaticClass();
}

class UAttack_Human_A2H_Tr_L_T02 : UAttack_Human_A2H_Tr
{
    default m_MetaData = UConfig_Human_A2H_Tr_L_T02::StaticClass();
}

// ******************************************** //
