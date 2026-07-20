
// ATTACK ANIMATIONS DATA //
class UConfig_Human_S2HTest_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/A_Man_S1H_RH_HitParried_Montage.A_Man_S1H_RH_HitParried_Montage'"; 
}

class UConfig_Human_S2HTest_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/A_Man_S1H_LH_HitParried_Montage.A_Man_S1H_LH_HitParried_Montage'"; 
}

class UConfig_Human_S2HTest_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/A_Man_S1H_BP_HitParried_Montage.A_Man_S1H_BP_HitParried_Montage'"; 
}

class UConfig_Human_S2HTest_Top : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Hits/Parried/A_Man_S1H_TP_HitParried_Montage.A_Man_S1H_TP_HitParried_Montage'"; 
}
class UConfig_Human_Sw2HTest3_R01 : UConfig_Human_S2H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_01/A_Man_TestS2H_A_R01_Montage.A_Man_TestS2H_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_L01 : UConfig_Human_S2H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_01/A_Man_TestS2H_3A_A_L01_Montage.A_Man_TestS2H_3A_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_B01 : UConfig_Human_S2H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_01/A_Man_TestS2H_3_A_B01_Montage.A_Man_TestS2H_3_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_T01 : UConfig_Human_S2H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_01/A_Man_TestS2H_3_A_T01_Montage.A_Man_TestS2H_3_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_R_L02 : UConfig_Human_S2H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/R_02/A_Man_TestS2H_A_R_L02_Montage.A_Man_TestS2H_A_R_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.15f);
	default m_SuperArmorDamageMultiplier = 1.25f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_R_B02 : UConfig_Human_S2H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/R_02/A_Man_TestS2H_A_R_B02_Montage.A_Man_TestS2H_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_R_T02 : UConfig_Human_S2H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/R_02/A_Man_TestS2H_A_R_T02_Montage.A_Man_TestS2H_A_R_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.15f);
	default m_SuperArmorDamageMultiplier = 1.25f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_L_R02 : UConfig_Human_S2H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/L_02/A_Man_TestS2H_3A_A_L_R02_Montage.A_Man_TestS2H_3A_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.15f);
	default m_SuperArmorDamageMultiplier = 1.25f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_L_B02 : UConfig_Human_S2H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/L_02/A_Man_TestS2H_A_L_B02_Montage.A_Man_TestS2H_A_L_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_L_T02 : UConfig_Human_S2H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/L_02/A_Man_TestS2H_A_L_T02_2_Montage.A_Man_TestS2H_A_L_T02_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.15f);
	default m_SuperArmorDamageMultiplier = 1.25f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_T_R02 : UConfig_Human_S2H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/T_02/A_Man_TestS2H_A_T_R02_Montage.A_Man_TestS2H_A_T_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.15f);
	default m_SuperArmorDamageMultiplier = 1.25f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_T_L02 : UConfig_Human_S2H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/T_02/A_Man_TestS2H_A_T_L02_Montage.A_Man_TestS2H_A_T_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.15f);
	default m_SuperArmorDamageMultiplier = 1.25f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_T_B02 : UConfig_Human_S2H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/T_02/A_Man_TestS2H_A_T_B02_Montage.A_Man_TestS2H_A_T_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_R_L03 : UConfig_Human_S2H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_03/R_03/A_Man_TestS2H_3B_A_R_L03_Montage.A_Man_TestS2H_3B_A_R_L03_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 1.8f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}


class UConfig_Human_Sw2HTest3_R_B03 : UConfig_Human_S2H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/R_02/A_Man_TestS2H_A_R_B02_Montage.A_Man_TestS2H_A_R_B02_Montage'";
        
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_R_T03 : UConfig_Human_S2H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_03/R_03/A_Man_TestS2H_A_R_T03_3_Montage.A_Man_TestS2H_A_R_T03_3_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 1.8f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_L_R03 : UConfig_Human_S2H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_03/L_03/A_Man_TestS2H_A_L_R03_Montage.A_Man_TestS2H_A_L_R03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 1.8f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_L_B03 : UConfig_Human_S2H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/L_02/A_Man_TestS2H_A_L_B02_Montage.A_Man_TestS2H_A_L_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_L_T03 : UConfig_Human_S2H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_03/L_03/A_Man_TestS2H_A_L_T03_Montage.A_Man_TestS2H_A_L_T03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 1.8f;

    default m_SuperArmorResistanceMultiplier = 1.5f;
}

class UConfig_Human_Sw2HTest3_T_R03 : UConfig_Human_S2H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_03/T_03/A_Man_TestS2H_A_T_R03_Montage.A_Man_TestS2H_A_T_R03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 1.8f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_T_L03 : UConfig_Human_S2H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_03/T_03/A_Man_TestS2H_A_T_L03_Montage.A_Man_TestS2H_A_T_L03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 1.8f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_Sw2HTest3_T_B03 : UConfig_Human_S2H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/A_02/T_02/A_Man_TestS2H_A_T_B02_Montage.A_Man_TestS2H_A_T_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.3f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_S2HTest_Riposte : UAttackRiposteConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.0f;

    // RIPOSTES
    // RIPOSTES
    FGameplayTagContainer metadata_riposte_humanoid;
    default metadata_riposte_humanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddRiposte( metadata_riposte_humanoid, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Attack/Riposte/A_Man_S2H_A_Riposte_Humanoids.A_Man_S2H_A_Riposte_Humanoids'"); 

    FGameplayTagContainer metadata_riposte_orc;
    default metadata_riposte_orc.AddTag(GameplayTag::Character_Size_Orc);
    default AddRiposte( metadata_riposte_orc, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Attack/Riposte/A_Man_S2H_A_Riposte_Humanoids.A_Man_S2H_A_Riposte_Humanoids'"); 

    FGameplayTagContainer metadata_riposte_small;
    default metadata_riposte_small.AddTag(GameplayTag::Character_Size_Small);
    default AddRiposte( metadata_riposte_small, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Attack/Riposte/A_Man_S2H_A_Riposte_GroupSmall.A_Man_S2H_A_Riposte_GroupSmall'"); 

    FGameplayTagContainer metadata_riposte_medium;
    default metadata_riposte_medium.AddTag(GameplayTag::Character_Size_Medium);
    default AddRiposte( metadata_riposte_medium, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Attack/Riposte/A_Man_S2H_A_Riposte_GroupMedium.A_Man_S2H_A_Riposte_GroupMedium'"); 

    FGameplayTagContainer metadata_riposte_big;
    default metadata_riposte_big.AddTag(GameplayTag::Character_Size_Big);
    default AddRiposte( metadata_riposte_big, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Attack/Riposte/A_Man_S2H_A_Riposte_GroupBig.A_Man_S2H_A_Riposte_GroupBig'"); 
    
    FGameplayTagContainer metadata_riposte_flying;
    default metadata_riposte_flying.AddTag(GameplayTag::Character_Size_Flying);
    default AddRiposte( metadata_riposte_flying, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Attack/Riposte/A_Man_S2H_A_Riposte_Flying.A_Man_S2H_A_Riposte_Flying'"); 
    
    FGameplayTagContainer metadata_riposte_demon;
    default metadata_riposte_demon.AddTag(GameplayTag::Character_Size_Demon);
    default AddRiposte( metadata_riposte_demon, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Attack/Riposte/A_Man_S2H_A_Riposte_Demons.A_Man_S2H_A_Riposte_Demons'"); 
    //////////
    //////////
}

// ******************************************** //

// COMBOS //

class UAttack_Human_Sw2HTest3 : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_Sw2HTest3_R01 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Sw2HTest3_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sw2HTest3_R_T02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_Sw2HTest3_R_L02::StaticClass());
}

class UAttack_Human_Sw2HTest3_L01 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sw2HTest3_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sw2HTest3_L_T02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sw2HTest3_L_R02::StaticClass());
}

class UAttack_Human_Sw2HTest3_B01 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_B01::StaticClass();
}

class UAttack_Human_Sw2HTest3_T01 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_T01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Sw2HTest3_T_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sw2HTest3_T_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_T_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_Sw2HTest3_T_B02::StaticClass());
}

class UAttack_Human_Sw2HTest3_R_L02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_R_L02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sw2HTest3_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sw2HTest3_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_L_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sw2HTest3_L_T03::StaticClass());
}

class UAttack_Human_Sw2HTest3_R_B02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_R_B02::StaticClass();
}

class UAttack_Human_Sw2HTest3_R_T02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_R_T02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sw2HTest3_T_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Sw2HTest3_T_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_T_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_Sw2HTest3_T_B03::StaticClass());
}

class UAttack_Human_Sw2HTest3_L_R02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_Sw2HTest3_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_R_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Sw2HTest3_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sw2HTest3_R_T03::StaticClass());
}

class UAttack_Human_Sw2HTest3_L_B02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_L_B02::StaticClass();
}

class UAttack_Human_Sw2HTest3_L_T02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_L_T02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sw2HTest3_T_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Sw2HTest3_T_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_T_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_Sw2HTest3_T_B03::StaticClass());
}

class UAttack_Human_Sw2HTest3_T_R02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_T_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_Sw2HTest3_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_Sw2HTest3_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_R_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sw2HTest3_R_T03::StaticClass());
}

class UAttack_Human_Sw2HTest3_T_L02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_T_L02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_Sw2HTest3_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_Sw2HTest3_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_Sw2HTest3_L_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_Sw2HTest3_L_T03::StaticClass());
}

class UAttack_Human_Sw2HTest3_T_B02 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_T_B02::StaticClass();
}

class UAttack_Human_Sw2HTest3_R_L03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_R_L03::StaticClass();
}

class UAttack_Human_Sw2HTest3_R_B03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_R_B03::StaticClass();
}
class UAttack_Human_Sw2HTest3_R_T03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_R_T03::StaticClass();
}

class UAttack_Human_Sw2HTest3_L_R03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_L_R03::StaticClass();
}

class UAttack_Human_Sw2HTest3_L_B03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_L_B03::StaticClass();
}

class UAttack_Human_Sw2HTest3_L_T03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_L_T03::StaticClass();
}

class UAttack_Human_Sw2HTest3_T_R03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_T_R03::StaticClass();
}
class UAttack_Human_Sw2HTest3_T_L03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_T_L03::StaticClass();
}
class UAttack_Human_Sw2HTest3_T_B03 : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_Sw2HTest3_T_B03::StaticClass();
}

// ******************************************** //

// RIPOSTE
class UAttack_Human_Sw2HTest3_Riposte : UAttack_Human_Sw2HTest3
{
    default m_MetaData = UConfig_Human_S2H_Riposte::StaticClass();
}
//



//////////////////////////////////////////////////////////////////////////////
//      GOMEZ
//////////////////////////////////////////////////////////////////////////////

// class UConfig_Gomez_S2H_AreaFront : UAttackMeleeConfig
// {

//     default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/Gomez/A_Gomez_TestS2H_AreaAttack_Montage.A_Gomez_TestS2H_AreaAttack_Montage'";
    
//     default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
// 	default m_SuperArmorDamageMultiplier = 2.0f;

//     default m_SuperArmorResistanceMultiplier = 10.0f;
// }

// class UAttack_Gomez_S2H_AreaFront : UAttack_Human_Sw2HTest3
// {
//     default m_MetaData =  UConfig_Gomez_S2H_AreaFront::StaticClass();
// }

// class UConfig_Gomez_S2H_GuardStrike : UAttackMeleeConfig
// {

//     default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S2H/Gomez/A_Gomez_TestS2H_GuardStrikeAttack_Montage.A_Gomez_TestS2H_GuardStrikeAttack_Montage'";
    
//     default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
// 	default m_SuperArmorDamageMultiplier = 10.0f;

//     default m_CanKnockback = true;

//     default m_SuperArmorResistanceMultiplier = 10.0f;
// }

// class UAttack_Gomez_S2H_GuardStrike : UAttack_Human_Sw2HTest3
// {
//     default m_MetaData =  UConfig_Gomez_S2H_GuardStrike::StaticClass();
// }