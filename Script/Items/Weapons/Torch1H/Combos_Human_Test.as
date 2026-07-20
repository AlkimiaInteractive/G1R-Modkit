
// ATTACK ANIMATIONS DATA //

class UConfig_Human_Torch_Right_Ma : UConfig_Human_M1H_Right
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_RH_HitParried_Montage.A_Man_S1H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_R_Montage.A_Man_S1H_Ma_HitDeflected_R_Montage'";
}
class UConfig_Human_Torch_Left_Ma : UConfig_Human_M1H_Left
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_LH_HitParried_Montage.A_Man_S1H_Ma_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_L_Montage.A_Man_S1H_Ma_HitDeflected_L_Montage'";
}
class UConfig_Human_Torch_Top_Ma : UConfig_Human_M1H_Top
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_RH_HitParried_Montage.A_Man_S1H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_T_Montage.A_Man_S1H_Ma_HitDeflected_T_Montage'";
}
class UConfig_Human_Torch_Bottom_Ma : UConfig_Human_M1H_Bottom
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/Master/A_Man_S1H_Ma_RH_HitParried_Montage.A_Man_S1H_Ma_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Deflected/Master/A_Man_S1H_Ma_HitDeflected_B_LH_Montage.A_Man_S1H_Ma_HitDeflected_B_LH_Montage'"; 
}

// Side Loop 17f---------
class UConfig_Human_Torch_Ma_L01_17 : UConfig_Human_Torch_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/L17/A_Man_TestT1H_A_17_L01_Montage.A_Man_TestT1H_A_17_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Torch_Ma_L_R02_17  : UConfig_Human_Torch_Right_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/L17/A_Man_TestT1H_A_17_L_R02_Montage.A_Man_TestT1H_A_17_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_Torch_Ma_R_L03_17  : UConfig_Human_Torch_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/L17/A_Man_TestT1H_A_17_R_L02_Montage.A_Man_TestT1H_A_17_R_L02_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}
// Side Loop 17 End---------

// Side Loop 23f---------
class UConfig_Human_Torch_Ma_L01_23 : UConfig_Human_Torch_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/L23/A_Man_TestT1H_A_23_L01_Montage.A_Man_TestT1H_A_23_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Torch_Ma_L_R02_23  : UConfig_Human_Torch_Right_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/L23/A_Man_TestT1H_A_23_L_R02_Montage.A_Man_TestT1H_A_23_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_Torch_Ma_R_L03_23  : UConfig_Human_Torch_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/L23/A_Man_TestT1H_A_23_R_L02_Montage.A_Man_TestT1H_A_23_R_L02_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}
// Side Loop 23 End---------

// Side Loop Slow---------
class UConfig_Human_Torch_Ma_L01_Slow : UConfig_Human_Torch_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/LSlow/A_Man_TestT1H_A_Slow_L01_Montage.A_Man_TestT1H_A_Slow_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Torch_Ma_L_R02_Slow  : UConfig_Human_Torch_Right_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/LSlow/A_Man_TestT1H_A_Slow_L_R02_Montage.A_Man_TestT1H_A_Slow_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_Torch_Ma_R_L03_Slow  : UConfig_Human_Torch_Left_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/LSlow/A_Man_TestT1H_A_Slow_R_L02_Montage.A_Man_TestT1H_A_Slow_R_L02_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}
// Side Loop Slow End---------

// Top Slow2---------
class UConfig_Human_Torch_Ma_T01_Slow2 : UConfig_Human_Torch_Top_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/TSlow2/A_Man_TestT1H_A_Slow2_T01_Montage.A_Man_TestT1H_A_Slow2_T01_Montage'";
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/TSlow2/A_Man_TestT1H_A_Slow2_MultStabs_T01_Montage.A_Man_TestT1H_A_Slow2_MultStabs_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_Torch_Ma_T_T02_Slow2 : UConfig_Human_Torch_Top_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/TSlow2/A_Man_TestT1H_A_Slow2_T_T02_Montage.A_Man_TestT1H_A_Slow2_T_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_Torch_Ma_T_T02_2_Slow2 : UConfig_Human_Torch_Top_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/TSlow2/A_Man_TestT1H_A_Slow2_T_T02_Montage2.A_Man_TestT1H_A_Slow2_T_T02_Montage2'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}
// Top Slow2 End---------

// Bot Slow---------
class UConfig_Human_Torch_Ma_B01_Slow : UConfig_Human_Torch_Bottom_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/BSlow/A_Man_TestT1H_A_Slow_B01_Montage.A_Man_TestT1H_A_Slow_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.3f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
// Bot Slow End---------

// Bot Slow2---------
class UConfig_Human_Torch_Ma_B01_Slow2 : UConfig_Human_Torch_Bottom_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/BSlow/A_Man_TestT1H_A_Slow2_B01_Montage.A_Man_TestT1H_A_Slow2_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.3f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
// Bot Slow2 End---------

// Bot Slow3---------
class UConfig_Human_Torch_Ma_B01_Slow3 : UConfig_Human_Torch_Bottom_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/BSlow/A_Man_TestT1H_A_Slow3_B01_Montage.A_Man_TestT1H_A_Slow3_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.3f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
// Bot Slow3 End---------

// Bot Other---------
class UConfig_Human_Torch_Ma_B01_Other : UConfig_Human_Torch_Bottom_Ma
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/M1H_Anims/BOther/A_Man_TestT1H_A_Other_B01_Montage.A_Man_TestT1H_A_Other_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.3f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
// Bot Other End---------

class UConfig_Human_Torch_Placeholder : UConfig_Human_Torch_Top_Ma
{
    default m_AttackMontage = n"/AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_T1H/PH_Throw/PH_Torch_Shelve_Throw_Montage.PH_Torch_Shelve_Throw_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Torch_Ma_Riposte : UAttackRiposteConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 3.0f);
	default m_SuperArmorDamageMultiplier = 0.0f;

    // RIPOSTES
    FGameplayTagContainer metadata_riposte_humanoid;
    default metadata_riposte_humanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddRiposte( metadata_riposte_humanoid, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Master/Riposte/A_Man_M1H_A_Riposte_Humanoids.A_Man_M1H_A_Riposte_Humanoids'"); 

    FGameplayTagContainer metadata_riposte_orc;
    default metadata_riposte_orc.AddTag(GameplayTag::Character_Size_Orc);
    default AddRiposte( metadata_riposte_orc, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Master/Riposte/A_Man_M1H_A_Riposte_Humanoids.A_Man_M1H_A_Riposte_Humanoids'"); 

    FGameplayTagContainer metadata_riposte_small;
    default metadata_riposte_small.AddTag(GameplayTag::Character_Size_Small);
    default AddRiposte( metadata_riposte_small, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Master/Riposte/A_Man_M1H_A_Riposte_GroupSmall.A_Man_M1H_A_Riposte_GroupSmall'"); 

    FGameplayTagContainer metadata_riposte_medium;
    default metadata_riposte_medium.AddTag(GameplayTag::Character_Size_Medium);
    default AddRiposte( metadata_riposte_medium, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Master/Riposte/A_Man_M1H_A_Riposte_GroupMedium.A_Man_M1H_A_Riposte_GroupMedium'"); 

    FGameplayTagContainer metadata_riposte_big;
    default metadata_riposte_big.AddTag(GameplayTag::Character_Size_Big);
    default AddRiposte( metadata_riposte_big, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Master/Riposte/A_Man_M1H_A_Riposte_GroupBig.A_Man_M1H_A_Riposte_GroupBig'"); 
    
    FGameplayTagContainer metadata_riposte_flying;
    default metadata_riposte_flying.AddTag(GameplayTag::Character_Size_Flying);
    default AddRiposte( metadata_riposte_flying, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Master/Riposte/A_Man_M1H_A_Riposte_Flying.A_Man_M1H_A_Riposte_Flying'"); 
    
    FGameplayTagContainer metadata_riposte_demon;
    default metadata_riposte_demon.AddTag(GameplayTag::Character_Size_Demon);
    default AddRiposte( metadata_riposte_demon, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Attacks/Master/Riposte/A_Man_M1H_A_Riposte_Demons.A_Man_M1H_A_Riposte_Demons'"); 
    //////////
}

// ******************************************** //

// COMBOS //

class UAttack_Human_Torch_Ma : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

// Side Loop 17---------
class UAttack_Human_Torch_Ma_L01_17 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_L01_17::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_L_R02_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_L_R02_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_L_R02_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_L_R02_17::StaticClass());
}

class UAttack_Human_Torch_Ma_L_R02_17 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_L_R02_17::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Torch_Ma_R_L03_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_R_L03_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_R_L03_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_R_L03_17::StaticClass());
}

class UAttack_Human_Torch_Ma_R_L03_17 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_R_L03_17::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_L_R02_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_L_R02_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_L_R02_17::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_L_R02_17::StaticClass());
}
// Side Loop 17 End---------

// Side Loop 23---------
class UAttack_Human_Torch_Ma_L01_23 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_L01_23::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_L_R02_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_L_R02_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_L_R02_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_L_R02_23::StaticClass());
}

class UAttack_Human_Torch_Ma_L_R02_23 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_L_R02_23::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Torch_Ma_R_L03_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_R_L03_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_R_L03_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_R_L03_23::StaticClass());
}

class UAttack_Human_Torch_Ma_R_L03_23 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_R_L03_23::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_L_R02_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_L_R02_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_L_R02_23::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_L_R02_23::StaticClass());
}
// Side Loop 23 End---------

// Side Loop Slow---------
class UAttack_Human_Torch_Ma_L01_Slow : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_L01_Slow::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_L_R02_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_L_R02_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_L_R02_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_L_R02_Slow::StaticClass());
}

class UAttack_Human_Torch_Ma_L_R02_Slow : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_L_R02_Slow::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Torch_Ma_R_L03_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_R_L03_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_R_L03_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_R_L03_Slow::StaticClass());
}

class UAttack_Human_Torch_Ma_R_L03_Slow : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_R_L03_Slow::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_L_R02_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_L_R02_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_L_R02_Slow::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_L_R02_Slow::StaticClass());
}
// Side Loop Slow End---------

// Top Slow2---------
class UAttack_Human_Torch_Ma_T01_Slow2 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_T01_Slow2::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_T_T02_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_T_T02_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_T_T02_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_T_T02_Slow2::StaticClass());
}

class UAttack_Human_Torch_Ma_T_T02_Slow2 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_T_T02_Slow2::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_T_T02_2_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_T_T02_2_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_T_T02_2_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_T_T02_2_Slow2::StaticClass());
}

class UAttack_Human_Torch_Ma_T_T02_2_Slow2 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_T_T02_2_Slow2::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Torch_Ma_T_T02_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Torch_Ma_T_T02_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,  UAttack_Human_Torch_Ma_T_T02_Slow2::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,  UAttack_Human_Torch_Ma_T_T02_Slow2::StaticClass());
}
// Top Slow2 End---------

// Bot Slow---------
class UAttack_Human_Torch_Ma_B01_Slow : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_B01_Slow::StaticClass();
}
// Bot Slow End---------

// Bot Slow2---------
class UAttack_Human_Torch_Ma_B01_Slow2 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_B01_Slow2::StaticClass();
}
// Bot Slow2 End---------

// Bot Slow3---------
class UAttack_Human_Torch_Ma_B01_Slow3 : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_B01_Slow3::StaticClass();
}
// Bot Slow3 End---------

// Bot Other---------
class UAttack_Human_Torch_Ma_B01_Other : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_B01_Other::StaticClass();
}
// Bot Other End---------

class UAttack_Human_Torch_Placeholder : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Placeholder::StaticClass();
}


// ******************************************** //

// RIPOSTE
class UAttack_Human_Torch_Ma_Riposte : UAttack_Human_Torch_Ma
{
    default m_MetaData = UConfig_Human_Torch_Ma_Riposte::StaticClass();
}
//
