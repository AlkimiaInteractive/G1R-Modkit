
// ATTACK ANIMATIONS DATA //

class UConfig_Human_M1H_Right_Tr : UConfig_Human_M1H_Right
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Parried/Trained/A_Man_M1H_Tr_RH_HitParried_Montage.A_Man_M1H_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Deflected/Trained/A_Man_M1H_Tr_HitDeflected_R_Montage.A_Man_M1H_Tr_HitDeflected_R_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
}
class UConfig_Human_M1H_Left_Tr : UConfig_Human_M1H_Left
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Parried/Trained/A_Man_M1H_Tr_LH_HitParried_Montage.A_Man_M1H_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Deflected/Trained/A_Man_M1H_Tr_HitDeflected_L_Montage.A_Man_M1H_Tr_HitDeflected_L_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
}
class UConfig_Human_M1H_Top_LH_Tr : UConfig_Human_M1H_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Parried/Trained/A_Man_M1H_Tr_LH_HitParried_Montage.A_Man_M1H_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Deflected/Trained/A_Man_M1H_Tr_HitDeflected_T_LH_Montage.A_Man_M1H_Tr_HitDeflected_T_LH_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
}
class UConfig_Human_M1H_Top_RH_Tr : UConfig_Human_M1H_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Parried/Trained/A_Man_M1H_Tr_RH_HitParried_Montage.A_Man_M1H_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Deflected/Trained/A_Man_M1H_Tr_HitDeflected_T_RH_Montage.A_Man_M1H_Tr_HitDeflected_T_RH_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
}
class UConfig_Human_M1H_Bottom_LH_Tr : UConfig_Human_M1H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Parried/Trained/A_Man_M1H_Tr_LH_HitParried_Montage.A_Man_M1H_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Deflected/Trained/A_Man_M1H_Tr_HitDeflected_B_LH_Montage.A_Man_M1H_Tr_HitDeflected_B_LH_Montage'"; 

    default m_AttackHandle = EAttackHandle::RightHand;
}
class UConfig_Human_M1H_Bottom_RH_Tr : UConfig_Human_M1H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Parried/Trained/A_Man_M1H_Tr_RH_HitParried_Montage.A_Man_M1H_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Hits/Deflected/Trained/A_Man_M1H_Tr_HitDeflected_B_RH_Montage.A_Man_M1H_Tr_HitDeflected_B_RH_Montage'"; 

    default m_AttackHandle = EAttackHandle::RightHand;
}


class UConfig_Human_M1H_Tr_R01 : UConfig_Human_M1H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_01/A_Man_M1H_Tr_A_R01_Montage.A_Man_M1H_Tr_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M1H_Tr_R01_NoCombo : UConfig_Human_M1H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_01/A_Man_M1H_Tr_A_R01_NoCombo_Montage.A_Man_M1H_Tr_A_R01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M1H_Tr_L01 : UConfig_Human_M1H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_01/A_Man_M1H_Tr_A_L01_Montage.A_Man_M1H_Tr_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M1H_Tr_L01_NoCombo : UConfig_Human_M1H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_01/A_Man_M1H_Tr_A_L01_NoCombo_Montage.A_Man_M1H_Tr_A_L01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M1H_Tr_B01 : UConfig_Human_M1H_Bottom_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_01/A_Man_M1H_Tr_A_B01_Montage.A_Man_M1H_Tr_A_B01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;

    //default m_CanKnockback = true;
}

class UConfig_Human_M1H_Tr_T01 : UConfig_Human_M1H_Top_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_01/A_Man_M1H_Tr_A_T01_Montage.A_Man_M1H_Tr_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_M1H_Tr_R_L02 : UConfig_Human_M1H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_02/R_02/A_Man_M1H_Tr_A_R_L02_Montage.A_Man_M1H_Tr_A_R_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_M1H_Tr_R_B02 : UConfig_Human_M1H_Bottom_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_02/R_02/A_Man_M1H_Tr_A_R_B02_Montage.A_Man_M1H_Tr_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    //default m_CanKnockback = true;
}

class UConfig_Human_M1H_Tr_R_T02 : UConfig_Human_M1H_Top_LH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_02/R_02/A_Man_M1H_Tr_A_R_T02_Montage.A_Man_M1H_Tr_A_R_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_M1H_Tr_L_R02 : UConfig_Human_M1H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_02/L_02/A_Man_M1H_Tr_A_L_R02_Montage.A_Man_M1H_Tr_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_M1H_Tr_L_B02 : UConfig_Human_M1H_Bottom_RH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_02/L_02/A_Man_M1H_Tr_A_L_B02_Montage.A_Man_M1H_Tr_A_L_B02_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    //default m_CanKnockback = true;
}

class UConfig_Human_M1H_Tr_L_T02 : UConfig_Human_M1H_Top_RH_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_02/L_02/A_Man_M1H_Tr_A_L_T02_Montage.A_Man_M1H_Tr_A_L_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}
class UConfig_Human_M1H_Tr_R_L03 : UConfig_Human_M1H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_03/R_03/A_Man_M1H_Tr_A_R_L03_Montage.A_Man_M1H_Tr_A_R_L03_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_M1H_Tr_R_B03 : UConfig_Human_M1H_Tr_R_B02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.75f;

    //default m_CanKnockback = true;
}

class UConfig_Human_M1H_Tr_R_T03 : UConfig_Human_M1H_Tr_R_T02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.75f;

    default m_CanKnockback = true;
}

class UConfig_Human_M1H_Tr_L_R03 : UConfig_Human_M1H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Trained/A_03/L_03/A_Man_M1H_Tr_A_L_R03_Montage.A_Man_M1H_Tr_A_L_R03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_M1H_Tr_L_B03 : UConfig_Human_M1H_Tr_L_B02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.75f;

    //default m_CanKnockback = true;
}

class UConfig_Human_M1H_Tr_L_T03 : UConfig_Human_M1H_Tr_L_T02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.75f;

    default m_CanKnockback = true;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_M1H_Tr : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_M1H_Tr_R01 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_R01::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M1H_Tr_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_M1H_Tr_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M1H_Tr_R_T02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates,  UAttack_Human_M1H_Tr_L01_NoCombo::StaticClass());
}

class UAttack_Human_M1H_Tr_R01_NoCombo : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_R01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M1H_Tr_R_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_M1H_Tr_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M1H_Tr_R_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_M1H_Tr_R_L02::StaticClass());
}

class UAttack_Human_M1H_Tr_L01 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_L01::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M1H_Tr_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_M1H_Tr_L_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M1H_Tr_L_T02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates,  UAttack_Human_M1H_Tr_R01_NoCombo::StaticClass());
}

class UAttack_Human_M1H_Tr_L01_NoCombo : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_L01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M1H_Tr_L_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_M1H_Tr_L_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M1H_Tr_L_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_M1H_Tr_L_R02::StaticClass());
}

class UAttack_Human_M1H_Tr_B01 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_B01::StaticClass();
}

class UAttack_Human_M1H_Tr_T01 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_T01::StaticClass();
}

class UAttack_Human_M1H_Tr_R_L02 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_R_L02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_M1H_Tr_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_M1H_Tr_L_R03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M1H_Tr_L_B03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M1H_Tr_L_T03::StaticClass());
}

class UAttack_Human_M1H_Tr_R_B02 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_R_B02::StaticClass();
}
class UAttack_Human_M1H_Tr_R_T02 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_R_T02::StaticClass();
}

class UAttack_Human_M1H_Tr_L_R02 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_M1H_Tr_R_L03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_M1H_Tr_R_L03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M1H_Tr_R_B03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M1H_Tr_R_T03::StaticClass());
}

class UAttack_Human_M1H_Tr_L_B02 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_L_B02::StaticClass();
}

class UAttack_Human_M1H_Tr_L_T02 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_L_T02::StaticClass();
}
class UAttack_Human_M1H_Tr_R_L03 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_R_L03::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M1H_Tr_L_B02::StaticClass());
}

class UAttack_Human_M1H_Tr_R_B03 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_R_B03::StaticClass();
}

class UAttack_Human_M1H_Tr_R_T03 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_R_T03::StaticClass();
}

class UAttack_Human_M1H_Tr_L_R03 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_L_R03::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M1H_Tr_R_B02::StaticClass());
}

class UAttack_Human_M1H_Tr_L_B03 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_L_B03::StaticClass();
}

class UAttack_Human_M1H_Tr_L_T03 : UAttack_Human_M1H_Tr
{
    default m_MetaData = UConfig_Human_M1H_Tr_L_T03::StaticClass();
}

// ******************************************** //
