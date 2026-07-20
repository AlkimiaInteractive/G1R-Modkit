
// ATTACK ANIMATIONS DATA //
class UConfig_Human_T1H_Tr_L01 : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Trained/A_01/A_Man_T1H_Tr_A_L01_Montage.A_Man_T1H_Tr_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Tr_L01_NoCombo : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Trained/A_01/A_Man_T1H_Tr_A_L01_NoCombo_Montage.A_Man_T1H_Tr_A_L01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Tr_R01 : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Trained/A_01/A_Man_T1H_Tr_A_R01_Montage.A_Man_T1H_Tr_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Tr_R01_NoCombo : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Trained/A_01/A_Man_T1H_Tr_A_R01_NoCombo_Montage.A_Man_T1H_Tr_A_R01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Tr_L_R02  : UConfig_Human_T1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Trained/A_02/A_Man_T1H_Tr_A_L_R02_Montage.A_Man_T1H_Tr_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Tr_R_L02  : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Trained/A_02/A_Man_T1H_Tr_A_R_L02_Montage.A_Man_T1H_Tr_A_R_L02_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Tr_T01 : UConfig_Human_T1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Trained/A_01/A_Man_T1H_Tr_A_T01_Montage.A_Man_T1H_Tr_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Tr_B01 : UConfig_Human_T1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Trained/A_01/A_Man_T1H_Tr_A_B01_Montage.A_Man_T1H_Tr_A_B01_Montage'";
 
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_T1H_Tr : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_T1H_Tr_L01 : UAttack_Human_T1H_Tr
{
    default m_MetaData = UConfig_Human_T1H_Tr_L01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates, UAttack_Human_T1H_Tr_R01_NoCombo::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_T1H_Tr_L_R02::StaticClass());
}

class UAttack_Human_T1H_Tr_L01_NoCombo : UAttack_Human_T1H_Tr
{
    default m_MetaData = UConfig_Human_T1H_Tr_L01_NoCombo::StaticClass();

    //default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates, UAttack_Human_T1H_Tr_R01_NoCombo::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_T1H_Tr_L_R02::StaticClass());
}

class UAttack_Human_T1H_Tr_R01 : UAttack_Human_T1H_Tr
{
    default m_MetaData = UConfig_Human_T1H_Tr_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_T1H_Tr_R_L02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates, UAttack_Human_T1H_Tr_L01_NoCombo::StaticClass());
}

class UAttack_Human_T1H_Tr_R01_NoCombo : UAttack_Human_T1H_Tr
{
    default m_MetaData = UConfig_Human_T1H_Tr_R01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_T1H_Tr_R_L02::StaticClass());
    //default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates, UAttack_Human_T1H_Tr_L01_NoCombo::StaticClass());
}

class UAttack_Human_T1H_Tr_L_R02 : UAttack_Human_T1H_Tr
{
    default m_MetaData = UConfig_Human_T1H_Tr_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_T1H_Tr_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_T1H_Tr_R_L02::StaticClass());
}

class UAttack_Human_T1H_Tr_R_L02 : UAttack_Human_T1H_Tr
{
    default m_MetaData = UConfig_Human_T1H_Tr_R_L02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_T1H_Tr_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_T1H_Tr_L_R02::StaticClass());
}

class UAttack_Human_T1H_Tr_T01 : UAttack_Human_T1H_Tr
{
    default m_MetaData = UConfig_Human_T1H_Tr_T01::StaticClass();
}

class UAttack_Human_T1H_Tr_B01 : UAttack_Human_T1H_Tr
{
    default m_MetaData = UConfig_Human_T1H_Tr_B01::StaticClass();
}

// ******************************************** //
