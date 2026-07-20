
// ATTACK ANIMATIONS DATA //

class UConfig_Human_Sff2H_Right_Tr : UConfig_Human_Sff2H_Right
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Hits/Parried/Trained/A_Man_Sff2H_Tr_RH_HitParried_Montage.A_Man_Sff2H_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Hits/Deflected/Trained/A_Man_Sff2H_Tr_HitDeflected_R_Montage.A_Man_Sff2H_Tr_HitDeflected_R_Montage'";
}
class UConfig_Human_Sff2H_Left_Tr : UConfig_Human_Sff2H_Left
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Hits/Parried/Trained/A_Man_Sff2H_Tr_LH_HitParried_Montage.A_Man_Sff2H_Tr_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Hits/Deflected/Trained/A_Man_Sff2H_Tr_HitDeflected_L_Montage.A_Man_Sff2H_Tr_HitDeflected_L_Montage'";
}
class UConfig_Human_Sff2H_Top_Tr : UConfig_Human_Sff2H_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Hits/Parried/Trained/A_Man_Sff2H_Tr_RH_HitParried_Montage.A_Man_Sff2H_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Hits/Deflected/Trained/A_Man_Sff2H_Tr_HitDeflected_T_Montage.A_Man_Sff2H_Tr_HitDeflected_T_Montage'";
}
class UConfig_Human_Sff2H_Bottom_Tr : UConfig_Human_Sff2H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Hits/Parried/Trained/A_Man_Sff2H_Tr_RH_HitParried_Montage.A_Man_Sff2H_Tr_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Hits/Deflected/Trained/A_Man_Sff2H_Tr_HitDeflected_B_Montage.A_Man_Sff2H_Tr_HitDeflected_B_Montage'";
}

class UConfig_Human_Sff2H_Tr_R01 : UConfig_Human_Sff2H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_01/A_Man_Sff2H_Tr_A_R01_Montage.A_Man_Sff2H_Tr_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_Sff2H_Tr_R01_NoCombo : UConfig_Human_Sff2H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_01/A_Man_Sff2H_Tr_A_R01_Montage.A_Man_Sff2H_Tr_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_Sff2H_Tr_L01 : UConfig_Human_Sff2H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_01/A_Man_Sff2H_Tr_A_L01_Montage.A_Man_Sff2H_Tr_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_Sff2H_Tr_L01_NoCombo : UConfig_Human_Sff2H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_01/A_Man_Sff2H_Tr_A_L01_Montage.A_Man_Sff2H_Tr_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_Sff2H_Tr_B01 : UConfig_Human_Sff2H_Bottom_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_01/A_Man_Sff2H_Tr_A_B01_Montage.A_Man_Sff2H_Tr_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Sff2H_Tr_B01_NoCombo : UConfig_Human_Sff2H_Bottom_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_01/A_Man_Sff2H_Tr_A_B01_NoCombo_Montage.A_Man_Sff2H_Tr_A_B01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Sff2H_Tr_T01 : UConfig_Human_Sff2H_Top_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_01/A_Man_Sff2H_Tr_A_T01_Montage.A_Man_Sff2H_Tr_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Sff2H_Tr_T01_NoCombo : UConfig_Human_Sff2H_Top_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_01/A_Man_Sff2H_Tr_A_T01_NoCombo_Montage.A_Man_Sff2H_Tr_A_T01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Sff2H_Tr_B_R02 : UConfig_Human_Sff2H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_02/B_02/A_Man_Sff2H_Tr_A_B_R02_Montage.A_Man_Sff2H_Tr_A_B_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_Sff2H_Tr_B_L02 : UConfig_Human_Sff2H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_02/B_02/A_Man_Sff2H_Tr_A_B_L02_Montage.A_Man_Sff2H_Tr_A_B_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_Sff2H_Tr_B_T02 : UConfig_Human_Sff2H_Top_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_02/B_02/A_Man_Sff2H_Tr_A_B_T02_Montage.A_Man_Sff2H_Tr_A_B_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_Sff2H_Tr_T_R02 : UConfig_Human_Sff2H_Right_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_02/T_02/A_Man_Sff2H_Tr_A_T_R02_Montage.A_Man_Sff2H_Tr_A_T_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_Sff2H_Tr_T_L02 : UConfig_Human_Sff2H_Left_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_02/T_02/A_Man_Sff2H_Tr_A_T_L02_Montage.A_Man_Sff2H_Tr_A_T_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_Sff2H_Tr_T_B02 : UConfig_Human_Sff2H_Bottom_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_02/T_02/A_Man_Sff2H_Tr_A_T_B02_Montage.A_Man_Sff2H_Tr_A_T_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_Sff2H_Tr_B_R03 : UConfig_Human_Sff2H_Tr_B_R02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.75f;
}

class UConfig_Human_Sff2H_Tr_B_L03 : UConfig_Human_Sff2H_Tr_B_L02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.75f;
}
class UConfig_Human_Sff2H_Tr_B_T03 : UConfig_Human_Sff2H_Top_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_03/B_03/A_Man_Sff2H_Tr_A_B_T03_Montage.A_Man_Sff2H_Tr_A_B_T03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_Sff2H_Tr_T_R03 : UConfig_Human_Sff2H_Tr_T_R02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.75f;
}

class UConfig_Human_Sff2H_Tr_T_L03 : UConfig_Human_Sff2H_Tr_T_L02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.75f;
}

class UConfig_Human_Sff2H_Tr_T_B03 : UConfig_Human_Sff2H_Bottom_Tr
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Trained/A_03/T_03/A_Man_Sff2H_Tr_A_T_B03_Montage.A_Man_Sff2H_Tr_A_T_B03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    // default m_SuperArmorResistanceMultiplier = 2.0f;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_Sff2H_Tr : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_Sff2H_Tr_R01 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_R01::StaticClass();
}

class UAttack_Human_Sff2H_Tr_L01 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_L01::StaticClass();
}

class UAttack_Human_Sff2H_Tr_B01 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_B01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sff2H_Tr_B_T02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Bottom, EComboTiming::ResetStates,  UAttack_Human_Sff2H_Tr_T01_NoCombo::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sff2H_Tr_B_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sff2H_Tr_B_L02::StaticClass());
}

class UAttack_Human_Sff2H_Tr_B01_NoCombo : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_B01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sff2H_Tr_B_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sff2H_Tr_B_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sff2H_Tr_B_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sff2H_Tr_B_L02::StaticClass());
}

class UAttack_Human_Sff2H_Tr_T01 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_T01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Top, EComboTiming::ResetStates,  UAttack_Human_Sff2H_Tr_B01_NoCombo::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sff2H_Tr_T_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sff2H_Tr_T_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sff2H_Tr_T_L02::StaticClass());
}

class UAttack_Human_Sff2H_Tr_T01_NoCombo : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_T01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sff2H_Tr_T_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sff2H_Tr_T_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sff2H_Tr_T_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sff2H_Tr_T_L02::StaticClass());
}

class UAttack_Human_Sff2H_Tr_B_R02 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_B_R02::StaticClass();
}
class UAttack_Human_Sff2H_Tr_B_L02 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_B_L02::StaticClass();
}

class UAttack_Human_Sff2H_Tr_B_T02 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_B_T02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sff2H_Tr_T_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sff2H_Tr_T_B03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sff2H_Tr_T_R03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sff2H_Tr_T_L03::StaticClass());
}

class UAttack_Human_Sff2H_Tr_T_R02 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_T_R02::StaticClass();
}

class UAttack_Human_Sff2H_Tr_T_L02 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_T_L02::StaticClass();
}

class UAttack_Human_Sff2H_Tr_T_B02 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_T_B02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sff2H_Tr_B_T03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sff2H_Tr_B_T03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sff2H_Tr_B_R03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sff2H_Tr_B_L03::StaticClass());
}

class UAttack_Human_Sff2H_Tr_T_R03 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_T_R03::StaticClass();
}

class UAttack_Human_Sff2H_Tr_T_L03 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_T_L03::StaticClass();
}

class UAttack_Human_Sff2H_Tr_T_B03 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_T_B03::StaticClass();
}

class UAttack_Human_Sff2H_Tr_B_R03 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_B_R03::StaticClass();
}

class UAttack_Human_Sff2H_Tr_B_L03 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_B_L03::StaticClass();
}
class UAttack_Human_Sff2H_Tr_B_T03 : UAttack_Human_Sff2H_Tr
{
    default m_MetaData = UConfig_Human_Sff2H_Tr_B_T03::StaticClass();
}

// ******************************************** //