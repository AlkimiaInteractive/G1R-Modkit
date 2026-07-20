
// ATTACK ANIMATIONS DATA //
class UConfig_Human_T1H_Ma_L01 : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/A_01/A_Man_T1H_Ma_A_L01_Montage.A_Man_T1H_Ma_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Ma_L01_NoCombo : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/A_01/A_Man_T1H_Ma_A_L01_NoCombo_Montage.A_Man_T1H_Ma_A_L01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Ma_R01 : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/A_01/A_Man_T1H_Ma_A_R01_Montage.A_Man_T1H_Ma_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Ma_R01_NoCombo : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/A_01/A_Man_T1H_Ma_A_R01_NoCombo_Montage.A_Man_T1H_Ma_A_R01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Ma_L_R02  : UConfig_Human_T1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/A_02/A_Man_T1H_Ma_A_L_R02_Montage.A_Man_T1H_Ma_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Ma_R_L02  : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/A_02/A_Man_T1H_Ma_A_R_L02_Montage.A_Man_T1H_Ma_A_R_L02_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Ma_T01 : UConfig_Human_T1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/A_01/A_Man_T1H_Ma_A_T01_Montage.A_Man_T1H_Ma_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Ma_B01 : UConfig_Human_T1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/A_01/A_Man_T1H_Ma_A_B01_Montage.A_Man_T1H_Ma_A_B01_Montage'";
 
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Ma_Riposte : UAttackRiposteConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 3.0f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 3.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;
    default m_CanKnockback = true;

    // RIPOSTES
    FGameplayTagContainer metadata_riposte_humanoid;
    default metadata_riposte_humanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddRiposte( metadata_riposte_humanoid, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/Riposte/A_Man_T1H_Ma_A_Riposte_Montage.A_Man_T1H_Ma_A_Riposte_Montage'"); 

    FGameplayTagContainer metadata_riposte_orc;
    default metadata_riposte_orc.AddTag(GameplayTag::Character_Size_Orc);
    default AddRiposte( metadata_riposte_orc, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/Riposte/A_Man_T1H_Ma_A_Riposte_Montage.A_Man_T1H_Ma_A_Riposte_Montage'"); 

    FGameplayTagContainer metadata_riposte_small;
    default metadata_riposte_small.AddTag(GameplayTag::Character_Size_Small);
    default AddRiposte( metadata_riposte_small, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/Riposte/A_Man_T1H_Ma_A_Riposte_Montage.A_Man_T1H_Ma_A_Riposte_Montage'"); 

    FGameplayTagContainer metadata_riposte_medium;
    default metadata_riposte_medium.AddTag(GameplayTag::Character_Size_Medium);
    default AddRiposte( metadata_riposte_medium, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/Riposte/A_Man_T1H_Ma_A_Riposte_Montage.A_Man_T1H_Ma_A_Riposte_Montage'"); 

    FGameplayTagContainer metadata_riposte_big;
    default metadata_riposte_big.AddTag(GameplayTag::Character_Size_Big);
    default AddRiposte( metadata_riposte_big, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/Riposte/A_Man_T1H_Ma_A_Riposte_Montage.A_Man_T1H_Ma_A_Riposte_Montage'"); 
    
    FGameplayTagContainer metadata_riposte_flying;
    default metadata_riposte_flying.AddTag(GameplayTag::Character_Size_Flying);
    default AddRiposte( metadata_riposte_flying, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/Riposte/A_Man_T1H_Ma_A_Riposte_Montage.A_Man_T1H_Ma_A_Riposte_Montage'"); 
    
    FGameplayTagContainer metadata_riposte_demon;
    default metadata_riposte_demon.AddTag(GameplayTag::Character_Size_Demon);
    default AddRiposte( metadata_riposte_demon, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Master/Riposte/A_Man_T1H_Ma_A_Riposte_Montage.A_Man_T1H_Ma_A_Riposte_Montage'"); 
    //////////
}

// ******************************************** //

// COMBOS //

class UAttack_Human_T1H_Ma : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_T1H_Ma_L01 : UAttack_Human_T1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_L01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates, UAttack_Human_T1H_Ma_R01_NoCombo::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_T1H_Ma_L_R02::StaticClass());
}

class UAttack_Human_T1H_Ma_L01_NoCombo : UAttack_Human_T1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_L01_NoCombo::StaticClass();

    //default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates, UAttack_Human_T1H_Ma_R01_NoCombo::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_T1H_Ma_L_R02::StaticClass());
}

class UAttack_Human_T1H_Ma_R01 : UAttack_Human_T1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_R01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates, UAttack_Human_T1H_Ma_L01_NoCombo::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_T1H_Ma_R_L02::StaticClass());
}

class UAttack_Human_T1H_Ma_R01_NoCombo : UAttack_Human_T1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_R01_NoCombo::StaticClass();

    //default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates, UAttack_Human_T1H_Ma_L01_NoCombo::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_T1H_Ma_R_L02::StaticClass());
}

class UAttack_Human_T1H_Ma_L_R02 : UAttack_Human_T1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_T1H_Ma_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_T1H_Ma_R_L02::StaticClass());
}

class UAttack_Human_T1H_Ma_R_L02 : UAttack_Human_T1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_R_L02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_T1H_Ma_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_T1H_Ma_L_R02::StaticClass());
}

class UAttack_Human_T1H_Ma_T01 : UAttack_Human_T1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_T01::StaticClass();
}

class UAttack_Human_T1H_Ma_B01 : UAttack_Human_T1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_B01::StaticClass();
}

// ******************************************** //

// RIPOSTE
class UAttack_Human_T1H_Ma_Riposte : UAttack_Human_S1H_Ma
{
    default m_MetaData = UConfig_Human_T1H_Ma_Riposte::StaticClass();
}
//
