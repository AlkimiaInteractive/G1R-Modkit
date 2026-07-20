
// ATTACK ANIMATIONS DATA //

class UConfig_Human_M2H_Right_Ma : UConfig_Human_M2H_Right
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Master/A_Man_M2H_Ma_RH_HitParried_Montage.A_Man_M2H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Master/A_Man_M2H_Ma_HitDeflected_R_Montage.A_Man_M2H_Ma_HitDeflected_R_Montage'";
}
class UConfig_Human_M2H_Left_Ma : UConfig_Human_M2H_Left
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Master/A_Man_M2H_Ma_LH_HitParried_Montage.A_Man_M2H_Ma_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Master/A_Man_M2H_Ma_HitDeflected_L_Montage.A_Man_M2H_Ma_HitDeflected_L_Montage'";
}
class UConfig_Human_M2H_Top_RH_Ma : UConfig_Human_M2H_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Master/A_Man_M2H_Ma_RH_HitParried_Montage.A_Man_M2H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Master/A_Man_M2H_Ma_HitDeflected_T_RH_Montage.A_Man_M2H_Ma_HitDeflected_T_RH_Montage'";
}
class UConfig_Human_M2H_Bottom_LH_Ma : UConfig_Human_M2H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Master/A_Man_M2H_Ma_LH_HitParried_Montage.A_Man_M2H_Ma_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Master/A_Man_M2H_Ma_HitDeflected_B_LH_Montage.A_Man_M2H_Ma_HitDeflected_B_LH_Montage'";
}
class UConfig_Human_M2H_Bottom_RH_Ma : UConfig_Human_M2H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Master/A_Man_M2H_Ma_RH_HitParried_Montage.A_Man_M2H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Master/A_Man_M2H_Ma_HitDeflected_B_RH_Montage.A_Man_M2H_Ma_HitDeflected_B_RH_Montage'";
}

class UConfig_Human_M2H_Ma_R01 : UConfig_Human_M2H_Right_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_01/A_Man_M2H_Ma_A_R01_Montage.A_Man_M2H_Ma_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M2H_Ma_R01_NoCombo : UConfig_Human_M2H_Right_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_01/A_Man_M2H_Ma_A_R01_NoCombo_Montage.A_Man_M2H_Ma_A_R01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M2H_Ma_L01 : UConfig_Human_M2H_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_01/A_Man_M2H_Ma_A_L01_Montage.A_Man_M2H_Ma_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M2H_Ma_L01_NoCombo : UConfig_Human_M2H_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_01/A_Man_M2H_Ma_A_L01_NoCombo_Montage.A_Man_M2H_Ma_A_L01_NoCombo_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M2H_Ma_B01 : UConfig_Human_M2H_Bottom_LH_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_01/A_Man_M2H_Ma_A_B01_Montage.A_Man_M2H_Ma_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_T01 : UConfig_Human_M2H_Top_RH_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_01/A_Man_M2H_Ma_A_T01_Montage.A_Man_M2H_Ma_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_R_L02 : UConfig_Human_M2H_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_02/R_02/A_Man_M2H_Ma_A_R_L02_Montage.A_Man_M2H_Ma_A_R_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_M2H_Ma_R_B02 : UConfig_Human_M2H_Bottom_LH_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_02/R_02/A_Man_M2H_Ma_A_R_B02_Montage.A_Man_M2H_Ma_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_R_T02 : UConfig_Human_M2H_Top_RH_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_02/R_02/A_Man_M2H_Ma_A_R_T02_Montage.A_Man_M2H_Ma_A_R_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_L_R02 : UConfig_Human_M2H_Right_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_02/L_02/A_Man_M2H_Ma_A_L_R02_Montage.A_Man_M2H_Ma_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_M2H_Ma_L_B02 : UConfig_Human_M2H_Bottom_RH_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_02/L_02/A_Man_M2H_Ma_A_L_B02_Montage.A_Man_M2H_Ma_A_L_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_L_T02 : UConfig_Human_M2H_Top_RH_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_02/L_02/A_Man_M2H_Ma_A_L_T02_Montage.A_Man_M2H_Ma_A_L_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_R_L03 : UConfig_Human_M2H_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_03/R_03/A_Man_M2H_Ma_A_R_L03_Montage.A_Man_M2H_Ma_A_R_L03_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

}

class UConfig_Human_M2H_Ma_R_B03 : UConfig_Human_M2H_Ma_R_B02
{        
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
    default m_SuperArmorDamageMultiplier = 1.75f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_R_T03 : UConfig_Human_M2H_Ma_R_T02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
    default m_SuperArmorDamageMultiplier = 1.75f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_L_R03 : UConfig_Human_M2H_Right_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/A_03/L_03/A_Man_M2H_Ma_A_L_R03_Montage.A_Man_M2H_Ma_A_L_R03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_M2H_Ma_L_B03 : UConfig_Human_M2H_Ma_L_B02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
    default m_SuperArmorDamageMultiplier = 1.75f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_L_T03 : UConfig_Human_M2H_Ma_L_T02
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.75f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
    default m_SuperArmorDamageMultiplier = 1.75f;

    default m_CanKnockback = true;
}

class UConfig_Human_M2H_Ma_Riposte : UAttackRiposteConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 2.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 2.0f);
	default m_SuperArmorDamageMultiplier = 100.0f;
    default m_CanKnockback = true;

    // RIPOSTES
    FGameplayTagContainer metadata_riposte_humanoid;
    default metadata_riposte_humanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddRiposte( metadata_riposte_humanoid, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/Riposte/A_Man_M2H_Ma_A_Riposte_Montage.A_Man_M2H_Ma_A_Riposte_Montage'"); 

    FGameplayTagContainer metadata_riposte_orc;
    default metadata_riposte_orc.AddTag(GameplayTag::Character_Size_Orc);
    default AddRiposte( metadata_riposte_orc, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/Riposte/A_Man_M2H_Ma_A_Riposte_Montage.A_Man_M2H_Ma_A_Riposte_Montage'"); 

    FGameplayTagContainer metadata_riposte_small;
    default metadata_riposte_small.AddTag(GameplayTag::Character_Size_Small);
    default AddRiposte( metadata_riposte_small, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/Riposte/A_Man_M2H_Ma_A_Riposte_Montage.A_Man_M2H_Ma_A_Riposte_Montage'"); 

    FGameplayTagContainer metadata_riposte_medium;
    default metadata_riposte_medium.AddTag(GameplayTag::Character_Size_Medium);
    default AddRiposte( metadata_riposte_medium, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/Riposte/A_Man_M2H_Ma_A_Riposte_Montage.A_Man_M2H_Ma_A_Riposte_Montage'"); 

    FGameplayTagContainer metadata_riposte_big;
    default metadata_riposte_big.AddTag(GameplayTag::Character_Size_Big);
    default AddRiposte( metadata_riposte_big, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/Riposte/A_Man_M2H_Ma_A_Riposte_Montage.A_Man_M2H_Ma_A_Riposte_Montage'"); 
    
    FGameplayTagContainer metadata_riposte_flying;
    default metadata_riposte_flying.AddTag(GameplayTag::Character_Size_Flying);
    default AddRiposte( metadata_riposte_flying, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/Riposte/A_Man_M2H_Ma_A_Riposte_Montage.A_Man_M2H_Ma_A_Riposte_Montage'"); 
    
    FGameplayTagContainer metadata_riposte_demon;
    default metadata_riposte_demon.AddTag(GameplayTag::Character_Size_Demon);
    default AddRiposte( metadata_riposte_demon, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Master/Riposte/A_Man_M2H_Ma_A_Riposte_Montage.A_Man_M2H_Ma_A_Riposte_Montage'"); 
    //////////
}

// ******************************************** //

// COMBOS //

class UAttack_Human_M2H_Ma : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_M2H_Ma_R01 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M2H_Ma_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_M2H_Ma_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M2H_Ma_R_T02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates,  UAttack_Human_M2H_Ma_L01_NoCombo::StaticClass());
}

class UAttack_Human_M2H_Ma_R01_NoCombo : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_R01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M2H_Ma_R_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_M2H_Ma_R_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M2H_Ma_R_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_M2H_Ma_R_L02::StaticClass());
}

class UAttack_Human_M2H_Ma_L01 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M2H_Ma_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_M2H_Ma_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M2H_Ma_L_T02::StaticClass());
    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates,  UAttack_Human_M2H_Ma_R01_NoCombo::StaticClass());
}

class UAttack_Human_M2H_Ma_L01_NoCombo : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_L01_NoCombo::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M2H_Ma_L_B02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_M2H_Ma_L_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M2H_Ma_L_T02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_M2H_Ma_L_R02::StaticClass());
}

class UAttack_Human_M2H_Ma_B01 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_B01::StaticClass();
}

class UAttack_Human_M2H_Ma_T01 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_T01::StaticClass();
}

class UAttack_Human_M2H_Ma_R_L02 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_R_L02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_M2H_Ma_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_M2H_Ma_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M2H_Ma_L_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M2H_Ma_L_T03::StaticClass());
}

class UAttack_Human_M2H_Ma_R_B02 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_R_B02::StaticClass();
}
class UAttack_Human_M2H_Ma_R_T02 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_R_T02::StaticClass();
}

class UAttack_Human_M2H_Ma_L_R02 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_M2H_Ma_R_L03::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_M2H_Ma_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M2H_Ma_R_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_M2H_Ma_R_T03::StaticClass());
}

class UAttack_Human_M2H_Ma_L_B02 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_L_B02::StaticClass();
}

class UAttack_Human_M2H_Ma_L_T02 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_L_T02::StaticClass();
}

class UAttack_Human_M2H_Ma_R_L03 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_R_L03::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M2H_Ma_L_B02::StaticClass());
}

class UAttack_Human_M2H_Ma_R_B03 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_R_B03::StaticClass();
}

class UAttack_Human_M2H_Ma_R_T03 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_R_T03::StaticClass();
}

class UAttack_Human_M2H_Ma_L_R03 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_L_R03::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M2H_Ma_R_B02::StaticClass());
}

class UAttack_Human_M2H_Ma_L_B03 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_L_B03::StaticClass();
}

class UAttack_Human_M2H_Ma_L_T03 : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_L_T03::StaticClass();
}

// ******************************************** //

// RIPOSTE
class UAttack_Human_M2H_Ma_Riposte : UAttack_Human_M2H_Ma
{
    default m_MetaData = UConfig_Human_M2H_Ma_Riposte::StaticClass();
}
//
