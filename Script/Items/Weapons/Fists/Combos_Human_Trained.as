
// ATTACK ANIMATIONS DATA //

class UConfig_Human_Fists_Right_Tr : UConfig_Human_Fists_Right
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Trained/A_Man_Fists_Tr_RH_HitParried_Montage.A_Man_Fists_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Trained/A_Man_Fists_Tr_HitDeflected_R_Montage.A_Man_Fists_Tr_HitDeflected_R_Montage'"; 

    default m_AttackHandle = EAttackHandle::RightHand;
}
class UConfig_Human_Fists_Left_Tr : UConfig_Human_Fists_Left
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Trained/A_Man_Fists_Tr_LH_HitParried_Montage.A_Man_Fists_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Trained/A_Man_Fists_Tr_HitDeflected_L_Montage.A_Man_Fists_Tr_HitDeflected_L_Montage'"; 

    default m_AttackHandle = EAttackHandle::RightHand;
}
class UConfig_Human_Fists_Top_LH_Tr : UConfig_Human_Fists_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Trained/A_Man_Fists_Tr_LH_HitParried_Montage.A_Man_Fists_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Trained/A_Man_Fists_Tr_HitDeflected_T_LH_Montage.A_Man_Fists_Tr_HitDeflected_T_LH_Montage'"; 

    default m_AttackHandle = EAttackHandle::LeftHand;
}
class UConfig_Human_Fists_Top_RH_Tr : UConfig_Human_Fists_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Trained/A_Man_Fists_Tr_RH_HitParried_Montage.A_Man_Fists_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Trained/A_Man_Fists_Tr_HitDeflected_T_RH_Montage.A_Man_Fists_Tr_HitDeflected_T_RH_Montage'"; 

    default m_AttackHandle = EAttackHandle::RightHand;
}
class UConfig_Human_Fists_Bottom_Tr : UConfig_Human_Fists_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Trained/A_Man_Fists_Tr_LH_HitParried_Montage.A_Man_Fists_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Trained/A_Man_Fists_Tr_HitDeflected_B_Montage.A_Man_Fists_Tr_HitDeflected_B_Montage'"; 
    
    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_Fists_Tr_R01 : UConfig_Human_Fists_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_01/A_Man_Fists_Tr_A_R01_Montage.A_Man_Fists_Tr_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_R01_NoCombo : UConfig_Human_Fists_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_01/A_Man_Fists_Tr_A_R01_NoCombo_Montage.A_Man_Fists_Tr_A_R01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_L01 : UConfig_Human_Fists_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_01/A_Man_Fists_Tr_A_L01_Montage.A_Man_Fists_Tr_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_L01_NoCombo : UConfig_Human_Fists_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_01/A_Man_Fists_Tr_A_L01_NoCombo_Montage.A_Man_Fists_Tr_A_L01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_B01 : UConfig_Human_Fists_Bottom_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_01/A_Man_Fists_Tr_A_B01_Montage.A_Man_Fists_Tr_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_T01 : UConfig_Human_Fists_Top_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_01/A_Man_Fists_Tr_A_T01_Montage.A_Man_Fists_Tr_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 5.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_Fists_Tr_R_L02 : UConfig_Human_Fists_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/R_02/A_Man_Fists_Tr_A_R_L02_Montage.A_Man_Fists_Tr_A_R_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_R_B02 : UConfig_Human_Fists_Bottom_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/R_02/A_Man_Fists_Tr_A_R_B02_Montage.A_Man_Fists_Tr_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_R_T02 : UConfig_Human_Fists_Top_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/R_02/A_Man_Fists_Tr_A_R_T02_Montage.A_Man_Fists_Tr_A_R_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 5.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_Fists_Tr_L_R02 : UConfig_Human_Fists_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/L_02/A_Man_Fists_Tr_A_L_R02_Montage.A_Man_Fists_Tr_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_L_B02 : UConfig_Human_Fists_Bottom_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/L_02/A_Man_Fists_Tr_A_L_B02_Montage.A_Man_Fists_Tr_A_L_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_L_T02 : UConfig_Human_Fists_Top_RH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/L_02/A_Man_Fists_Tr_A_L_T02_Montage.A_Man_Fists_Tr_A_L_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 5.0f;

    default m_CanKnockback = true;
}

class UConfig_Human_Fists_Tr_B_R02 : UConfig_Human_Fists_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/B_02/A_Man_Fists_Tr_A_B_R02_Montage.A_Man_Fists_Tr_A_B_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_B_L02 : UConfig_Human_Fists_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/B_02/A_Man_Fists_Tr_A_B_L02_Montage.A_Man_Fists_Tr_A_B_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 4.0f;
}

class UConfig_Human_Fists_Tr_B_T02 : UConfig_Human_Fists_Top_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Trained/A_02/B_02/A_Man_Fists_Tr_A_B_T02_Montage.A_Man_Fists_Tr_A_B_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 5.0f;

    default m_CanKnockback = true;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_Fists_Tr : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_Fists_Tr_R01 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Fists_Tr_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_R_T02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates,  UAttack_Human_Fists_Tr_L01_NoCombo::StaticClass());
}

class UAttack_Human_Fists_Tr_R01_NoCombo : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_R01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_R_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Fists_Tr_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_R_T02::StaticClass());
    //default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates,  UAttack_Human_Fists_Tr_L01_NoCombo::StaticClass());
}

class UAttack_Human_Fists_Tr_L01 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Fists_Tr_L_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_L_T02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates,  UAttack_Human_Fists_Tr_R01_NoCombo::StaticClass());
}

class UAttack_Human_Fists_Tr_L01_NoCombo : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_L01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_L_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Fists_Tr_L_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_L_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Fists_Tr_L_R02::StaticClass());
}

class UAttack_Human_Fists_Tr_B01 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_B01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Fists_Tr_B_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Fists_Tr_B_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_B_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_Fists_Tr_B_T02::StaticClass());
}

class UAttack_Human_Fists_Tr_T01 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_T01::StaticClass();
}

class UAttack_Human_Fists_Tr_R_L02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_R_L02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Fists_Tr_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Fists_Tr_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_L_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_L_T02::StaticClass());
}

class UAttack_Human_Fists_Tr_R_B02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_R_B02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Fists_Tr_B_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Fists_Tr_B_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_B_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_Fists_Tr_B_T02::StaticClass());
}

class UAttack_Human_Fists_Tr_R_T02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_R_T02::StaticClass();
}

class UAttack_Human_Fists_Tr_L_R02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Fists_Tr_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_Fists_Tr_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_R_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_R_T02::StaticClass());
}

class UAttack_Human_Fists_Tr_L_B02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_L_B02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Fists_Tr_B_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_Fists_Tr_B_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_B_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_B_T02::StaticClass());
}

class UAttack_Human_Fists_Tr_L_T02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_L_T02::StaticClass();
}

class UAttack_Human_Fists_Tr_B_R02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_B_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Fists_Tr_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_Fists_Tr_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_R_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_R_T02::StaticClass());
}

class UAttack_Human_Fists_Tr_B_L02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_B_L02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Fists_Tr_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Fists_Tr_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Fists_Tr_L_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Fists_Tr_L_T02::StaticClass());
}

class UAttack_Human_Fists_Tr_B_T02 : UAttack_Human_Fists_Tr
{
    default m_MetaData = UConfig_Human_Fists_Tr_B_T02::StaticClass();
}

// ******************************************** //
