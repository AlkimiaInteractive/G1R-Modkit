
// ATTACK ANIMATIONS DATA //

class UConfig_Human_S1HTestLvl_Un_scaled_L01 : UConfig_Human_S1H_Left
{
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Un_scaled_L01_Montage.Test_S1H_Un_scaled_L01_Montage'";
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Tr_same_L01_Montage.Test_S1H_Tr_same_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_S1HTestLvl_Un_same_L01 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Un_same_L01_Montage.Test_S1H_Un_same_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_S1HTestLvl_Tr_same_L01 : UConfig_Human_S1H_Left
{
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Tr_same_L01_Montage.Test_S1H_Tr_same_L01_Montage'";
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Tr_same3_L01_Montage.Test_S1H_Tr_same3_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_S1HTestLvl_Tr_same_L_R02 : UConfig_Human_S1H_Right
{
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Tr_same_L_R02_Montage.Test_S1H_Tr_same_L_R02_Montage'";
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Tr_same3_L_R02_Montage.Test_S1H_Tr_same3_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}


class UConfig_Human_S1HTestLvl_Tr_same_R_L03 : UConfig_Human_S1H_Left
{
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Tr_same_R_L03_Montage.Test_S1H_Tr_same_R_L03_Montage'";
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Test_S1H_Tr_same3_R_L03_Montage.Test_S1H_Tr_same3_R_L03_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_S1HTestLvl_Ma_L01 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/A_01/A_Man_S1H_N_A_L01_Montage.A_Man_S1H_N_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_S1HTestLvl_Ma_L_R02 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/A_02/L_02/A_Man_S1H_N_A_L_R02_Montage.A_Man_S1H_N_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}


class UConfig_Human_S1HTestLvl_Ma_R_L03 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Attacks/A_03/R_03/A_Man_S1H_N_A_R_L03_Montage.A_Man_S1H_N_A_R_L03_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_S1HTestLvl : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_S1HTestLvl_Un_scaled_L01 : UAttack_Human_S1HTestLvl
{
    default m_MetaData = UConfig_Human_S1HTestLvl_Un_scaled_L01::StaticClass();
}

class UAttack_Human_S1HTestLvl_Un_same_L01 : UAttack_Human_S1HTestLvl
{
    default m_MetaData = UConfig_Human_S1HTestLvl_Un_same_L01::StaticClass();
}

class UAttack_Human_S1HTestLvl_Tr_same_L01 : UAttack_Human_S1HTestLvl
{
    default m_MetaData = UConfig_Human_S1HTestLvl_Tr_same_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1HTestLvl_Tr_same_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1HTestLvl_Tr_same_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1HTestLvl_Tr_same_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UAttack_Human_S1HTestLvl_Tr_same_L_R02::StaticClass());
}

class UAttack_Human_S1HTestLvl_Tr_same_L_R02 : UAttack_Human_S1HTestLvl
{
    default m_MetaData = UConfig_Human_S1HTestLvl_Tr_same_L_R02::StaticClass();    

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1HTestLvl_Tr_same_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1HTestLvl_Tr_same_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1HTestLvl_Tr_same_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UAttack_Human_S1HTestLvl_Tr_same_R_L03::StaticClass());
}

class UAttack_Human_S1HTestLvl_Tr_same_R_L03 : UAttack_Human_S1HTestLvl
{
    default m_MetaData = UConfig_Human_S1HTestLvl_Tr_same_R_L03::StaticClass();
}

class UAttack_Human_S1HTestLvl_Ma_L01 : UAttack_Human_S1HTestLvl
{
    default m_MetaData = UConfig_Human_S1HTestLvl_Ma_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1HTestLvl_Ma_same_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1HTestLvl_Ma_same_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1HTestLvl_Ma_same_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UAttack_Human_S1HTestLvl_Ma_same_L_R02::StaticClass());
}

class UAttack_Human_S1HTestLvl_Ma_same_L_R02 : UAttack_Human_S1HTestLvl
{
    default m_MetaData = UConfig_Human_S1HTestLvl_Ma_L_R02::StaticClass();    

    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1HTestLvl_Ma_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1HTestLvl_Ma_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1HTestLvl_Ma_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UAttack_Human_S1HTestLvl_Ma_R_L03::StaticClass());
}

class UAttack_Human_S1HTestLvl_Ma_R_L03 : UAttack_Human_S1HTestLvl
{
    default m_MetaData = UConfig_Human_S1HTestLvl_Ma_R_L03::StaticClass();
}


// ---------------------------------------------------------------------------------------------------------//
// ---------------------------------------------------------------------------------------------------------//




// ---------------------------------------------------------------------------------------------------------//
// ---------------------------------------------------------------------------------------------------------//

// ATTACK ANIMATIONS DATA TRAINED +3//

class UConfig_Human_S1H_Tr3_R01 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_01/A_Man_Test_A_R01_Montage.A_Man_Test_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_S1H_Tr3_L01 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_01/A_Man_Test_A_L01_Montage.A_Man_Test_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_S1H_Tr3_B01 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_01/A_Man_Test_Off_B01_Montage.A_Man_Test_Off_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_S1H_Tr3_T01 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_01/A_Man_Test_Off_T01_2_Montage.A_Man_Test_Off_T01_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.01f);
	default m_SuperArmorDamageMultiplier = 5.0f;
}

class UConfig_Human_S1H_Tr3_R_L02 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/R_02/A_Man_Test_3_A_R_L02_Montage.A_Man_Test_3_A_R_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr3_R_B02 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/R_02/A_Man_Test_3_A_R_B02_Montage.A_Man_Test_3_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_S1H_Tr3_R_T02 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/R_02/A_Man_Test_3_A_R_T02_Montage.A_Man_Test_3_A_R_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr3_L_R02 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/L_02/A_Man_Test_3_A_L_R02_Montage.A_Man_Test_3_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr3_L_B02 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/L_02/A_Man_Test_3_A_L_B02_3_Montage.A_Man_Test_3_A_L_B02_3_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_S1H_Tr3_L_T02 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/L_02/A_Man_Test_3_A_L_T02_2_Montage.A_Man_Test_3_A_L_T02_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr3_T_R02 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/T_02/A_Man_Test_3_A_T_R02_Montage.A_Man_Test_3_A_T_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr3_T_L02 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/T_02/A_Man_Test_3_A_T_L02_Montage.A_Man_Test_3_A_T_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr3_T_B02 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_02/T_02/A_Man_Test_3_A_T_B02_2_Montage.A_Man_Test_3_A_T_B02_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_S1H_Tr3_R_L03 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_03/R_03/A_Man_Test_3_A_R_L03_3_Montage.A_Man_Test_3_A_R_L03_3_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_S1H_Tr3_R_B03 : UConfig_Human_S1H_Tr3_R_B02
{
}

class UConfig_Human_S1H_Tr3_R_T03 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_03/R_03/A_Man_Test_3_A_R_T03_3_Montage.A_Man_Test_3_A_R_T03_3_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_S1H_Tr3_L_R03 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_03/L_03/A_Man_Test_3_A_L_R03_2_Montage.A_Man_Test_3_A_L_R03_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}


class UConfig_Human_S1H_Tr3_L_B03 : UConfig_Human_S1H_Tr3_L_B02
{
}

class UConfig_Human_S1H_Tr3_L_T03 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_03/L_03/A_Man_Test_3_A_L_T03_Montage.A_Man_Test_3_A_L_T03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_S1H_Tr3_T_R03 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_03/T_03/A_Man_Test_3_A_T_R03_Montage.A_Man_Test_3_A_T_R03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_S1H_Tr3_T_L03 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr3/A_03/T_03/A_Man_Test_3_A_T_L03_Montage.A_Man_Test_3_A_T_L03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_S1H_Tr3_T_B03 : UConfig_Human_S1H_Tr3_T_B02
{
}

// ******************************************** //

// COMBOS //

class UAttack_Human_S1H_Tr3 : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_S1H_Tr3_R01 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1H_Tr3_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr3_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr3_R_T02::StaticClass());
}

class UAttack_Human_S1H_Tr3_L01 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr3_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_Tr3_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr3_L_T02::StaticClass());
}

class UAttack_Human_S1H_Tr3_B01 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_B01::StaticClass();
}

class UAttack_Human_S1H_Tr3_T01 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_T01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr3_T_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr3_T_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_T_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_S1H_Tr3_T_B02::StaticClass());
}

class UAttack_Human_S1H_Tr3_R_L02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_R_L02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr3_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_Tr3_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_L_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr3_L_T03::StaticClass());
}

class UAttack_Human_S1H_Tr3_R_B02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_R_B02::StaticClass();
}

class UAttack_Human_S1H_Tr3_R_T02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_R_T02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr3_T_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr3_T_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_T_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_S1H_Tr3_T_B03::StaticClass());
}

class UAttack_Human_S1H_Tr3_L_R02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1H_Tr3_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr3_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_R_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr3_R_T03::StaticClass());
}

class UAttack_Human_S1H_Tr3_L_B02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_L_B02::StaticClass();
}

class UAttack_Human_S1H_Tr3_L_T02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_L_T02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr3_T_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr3_T_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_T_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_S1H_Tr3_T_B03::StaticClass());
}

class UAttack_Human_S1H_Tr3_T_R02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_T_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1H_Tr3_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr3_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_R_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr3_R_T03::StaticClass());
}

class UAttack_Human_S1H_Tr3_T_L02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_T_L02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr3_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_Tr3_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr3_L_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr3_L_T03::StaticClass());
}

class UAttack_Human_S1H_Tr3_T_B02 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_T_B02::StaticClass();
}

class UAttack_Human_S1H_Tr3_R_L03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_R_L03::StaticClass();
}

class UAttack_Human_S1H_Tr3_R_B03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_R_B03::StaticClass();
}

class UAttack_Human_S1H_Tr3_R_T03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_R_T03::StaticClass();
}

class UAttack_Human_S1H_Tr3_L_R03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_L_R03::StaticClass();
}

class UAttack_Human_S1H_Tr3_L_B03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_L_B03::StaticClass();
}

class UAttack_Human_S1H_Tr3_L_T03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_L_T03::StaticClass();
}

class UAttack_Human_S1H_Tr3_T_R03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_T_R03::StaticClass();
}
class UAttack_Human_S1H_Tr3_T_L03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_T_L03::StaticClass();
}
class UAttack_Human_S1H_Tr3_T_B03 : UAttack_Human_S1H_Tr3
{
    default m_MetaData = UConfig_Human_S1H_Tr3_T_B03::StaticClass();
}

// ******************************************** //

// ---------------------------------------------------------------------------------------------------------//
// ---------------------------------------------------------------------------------------------------------//




// ---------------------------------------------------------------------------------------------------------//
// ---------------------------------------------------------------------------------------------------------//

// ATTACK ANIMATIONS DATA TRAINED +5//

class UConfig_Human_S1H_Tr5_R01 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_01/A_Man_Test_A_R01_Montage.A_Man_Test_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_S1H_Tr5_L01 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_01/A_Man_Test_A_L01_Montage.A_Man_Test_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_S1H_Tr5_B01 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_01/A_Man_Test_Off_B01_Montage.A_Man_Test_Off_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_S1H_Tr5_T01 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_01/A_Man_Test_Off_T01_2_Montage.A_Man_Test_Off_T01_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.01f);
	default m_SuperArmorDamageMultiplier = 5.0f;
}

class UConfig_Human_S1H_Tr5_R_L02 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/R_02/A_Man_Test_3_A_R_L02_Montage.A_Man_Test_3_A_R_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr5_R_B02 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/R_02/A_Man_Test_3_A_R_B02_Montage.A_Man_Test_3_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_S1H_Tr5_R_T02 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/R_02/A_Man_Test_3_A_R_T02_Montage.A_Man_Test_3_A_R_T02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr5_L_R02 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/L_02/A_Man_Test_3_A_L_R02_Montage.A_Man_Test_3_A_L_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr5_L_B02 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/L_02/A_Man_Test_3_A_L_B02_3_Montage.A_Man_Test_3_A_L_B02_3_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_S1H_Tr5_L_T02 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/L_02/A_Man_Test_3_A_L_T02_2_Montage.A_Man_Test_3_A_L_T02_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr5_T_R02 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/T_02/A_Man_Test_3_A_T_R02_Montage.A_Man_Test_3_A_T_R02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr5_T_L02 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/T_02/A_Man_Test_3_A_T_L02_Montage.A_Man_Test_3_A_T_L02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.1f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_S1H_Tr5_T_B02 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_02/T_02/A_Man_Test_3_A_T_B02_2_Montage.A_Man_Test_3_A_T_B02_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_S1H_Tr5_R_L03 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_03/R_03/A_Man_Test_3_A_R_L03_3_Montage.A_Man_Test_3_A_R_L03_3_Montage'";
            
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_S1H_Tr5_R_B03 : UConfig_Human_S1H_Tr5_R_B02
{
}

class UConfig_Human_S1H_Tr5_R_T03 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_03/R_03/A_Man_Test_3_A_R_T03_3_Montage.A_Man_Test_3_A_R_T03_3_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_S1H_Tr5_L_R03 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_03/L_03/A_Man_Test_3_A_L_R03_2_Montage.A_Man_Test_3_A_L_R03_2_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}


class UConfig_Human_S1H_Tr5_L_B03 : UConfig_Human_S1H_Tr5_L_B02
{
}

class UConfig_Human_S1H_Tr5_L_T03 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_03/L_03/A_Man_Test_3_A_L_T03_Montage.A_Man_Test_3_A_L_T03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

class UConfig_Human_S1H_Tr5_T_R03 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_03/T_03/A_Man_Test_3_A_T_R03_Montage.A_Man_Test_3_A_T_R03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_S1H_Tr5_T_L03 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/PoseToPose/Test_LevelWeapon/Tr5/A_03/T_03/A_Man_Test_3_A_T_L03_Montage.A_Man_Test_3_A_T_L03_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}

class UConfig_Human_S1H_Tr5_T_B03 : UConfig_Human_S1H_Tr5_T_B02
{
}

// ******************************************** //

// COMBOS //

class UAttack_Human_S1H_Tr5 : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_S1H_Tr5_R01 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1H_Tr5_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr5_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr5_R_T02::StaticClass());
}

class UAttack_Human_S1H_Tr5_L01 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr5_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_Tr5_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr5_L_T02::StaticClass());
}

class UAttack_Human_S1H_Tr5_B01 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_B01::StaticClass();
}

class UAttack_Human_S1H_Tr5_T01 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_T01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr5_T_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr5_T_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_T_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_S1H_Tr5_T_B02::StaticClass());
}

class UAttack_Human_S1H_Tr5_R_L02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_R_L02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr5_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_Tr5_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_L_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr5_L_T03::StaticClass());
}

class UAttack_Human_S1H_Tr5_R_B02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_R_B02::StaticClass();
}

class UAttack_Human_S1H_Tr5_R_T02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_R_T02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr5_T_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr5_T_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_T_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_S1H_Tr5_T_B03::StaticClass());
}

class UAttack_Human_S1H_Tr5_L_R02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_L_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1H_Tr5_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr5_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_R_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr5_R_T03::StaticClass());
}

class UAttack_Human_S1H_Tr5_L_B02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_L_B02::StaticClass();
}

class UAttack_Human_S1H_Tr5_L_T02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_L_T02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr5_T_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr5_T_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_T_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_S1H_Tr5_T_B03::StaticClass());
}

class UAttack_Human_S1H_Tr5_T_R02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_T_R02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UAttack_Human_S1H_Tr5_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UAttack_Human_S1H_Tr5_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_R_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr5_R_T03::StaticClass());
}

class UAttack_Human_S1H_Tr5_T_L02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_T_L02::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Human_S1H_Tr5_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Human_S1H_Tr5_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_S1H_Tr5_L_B03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UAttack_Human_S1H_Tr5_L_T03::StaticClass());
}

class UAttack_Human_S1H_Tr5_T_B02 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_T_B02::StaticClass();
}

class UAttack_Human_S1H_Tr5_R_L03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_R_L03::StaticClass();
}

class UAttack_Human_S1H_Tr5_R_B03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_R_B03::StaticClass();
}

class UAttack_Human_S1H_Tr5_R_T03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_R_T03::StaticClass();
}

class UAttack_Human_S1H_Tr5_L_R03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_L_R03::StaticClass();
}

class UAttack_Human_S1H_Tr5_L_B03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_L_B03::StaticClass();
}

class UAttack_Human_S1H_Tr5_L_T03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_L_T03::StaticClass();
}

class UAttack_Human_S1H_Tr5_T_R03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_T_R03::StaticClass();
}
class UAttack_Human_S1H_Tr5_T_L03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_T_L03::StaticClass();
}
class UAttack_Human_S1H_Tr5_T_B03 : UAttack_Human_S1H_Tr5
{
    default m_MetaData = UConfig_Human_S1H_Tr5_T_B03::StaticClass();
}

// ******************************************** //
