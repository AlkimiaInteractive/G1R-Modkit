
// ATTACK ANIMATIONS DATA //

class UConfig_Human_Melee_Top : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H_v3/SAHit/A_Man_S1H_N_TP_1H_HitParried_Montage.A_Man_S1H_N_TP_1H_HitParried_Montage'";
}

class UConfig_Human_Melee_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H_v3/SAHit/A_Man_S1H_N_RP_1H_HitParried_Montage.A_Man_S1H_N_RP_1H_HitParried_Montage'";
}

class UConfig_Human_Melee_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H_v3/SAHit/A_Man_S1H_N_BP_1H_HitParried_Montage.A_Man_S1H_N_BP_1H_HitParried_Montage'";
}

class UConfig_Human_Melee_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H_v3/SAHit/A_Man_S1H_N_LP_1H_HitParried_Montage.A_Man_S1H_N_LP_1H_HitParried_Montage'";
}


class UConfig_Human_M_Top01 : UConfig_Human_Melee_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Down_Montage.Attack_Down_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Bottom01 : UConfig_Human_Melee_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Down_Montage.Attack_Down_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Bottom_Top02 : UConfig_Human_Melee_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Down_Montage.Attack_Down_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Bottom_Right02 : UConfig_Human_Melee_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Down_Right_Montage.Attack_Down_Right_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Bottom_Left02 : UConfig_Human_Melee_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Down_Left_Montage.Attack_Down_Left_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Right01 : UConfig_Human_Melee_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Right_Montage.Attack_Right_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Right_Top02 : UConfig_Human_Melee_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Down_Montage.Attack_Down_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Right_Bottom02 : UConfig_Human_Melee_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Right_Bottom_Montage.Attack_Right_Bottom_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Right_Left02 : UConfig_Human_Melee_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Right_Left_Montage.Attack_Right_Left_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Left01 : UConfig_Human_Melee_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Left_Montage.Attack_Left_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Left_Top02 : UConfig_Human_Melee_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Down_Montage.Attack_Down_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Left_Bottom02 : UConfig_Human_Melee_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Left_Bottom_Montage.Attack_Left_Bottom_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

class UConfig_Human_M_Left_Right02 : UConfig_Human_Melee_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/old/Fist/Attack/Attack_Left_Right_Montage.Attack_Left_Right_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;
}

// ******************************************** //

// COMBOS //
class UAttack_Human_M : UComboAttackConfigScript
{
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

class UAttack_Human_M_Top01 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Top01::StaticClass();
}

class UAttack_Human_M_Bottom01 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Bottom01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_M_Bottom_Top02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left, UAttack_Human_M_Left01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right, UAttack_Human_M_Right01::StaticClass());
}

class UAttack_Human_M_Bottom_Top02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Bottom_Top02::StaticClass();
}

class UAttack_Human_M_Bottom_Right02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Bottom_Right02::StaticClass();
}

class UAttack_Human_M_Bottom_Left02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Bottom_Left02::StaticClass();
}

class UAttack_Human_M_Left01 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Left01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_M_Top01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M_Bottom01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right, UAttack_Human_M_Right01::StaticClass());
}

class UAttack_Human_M_Left_Top02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Left_Top02::StaticClass();
}

class UAttack_Human_M_Left_Right02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Left_Right02::StaticClass();
}

class UAttack_Human_M_Left_Bottom02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Left_Bottom02::StaticClass();
}

class UAttack_Human_M_Right01 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Right01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top, UAttack_Human_M_Top01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Human_M_Bottom01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left, UAttack_Human_M_Left01::StaticClass());
}

class UAttack_Human_M_Right_Top02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Right_Top02::StaticClass();
}

class UAttack_Human_M_Right_Bottom02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Right_Bottom02::StaticClass();
}

class UAttack_Human_M_Right_Left02 : UAttack_Human_M
{
    default m_MetaData = UConfig_Human_M_Right_Left02::StaticClass();
}

// ******************************************** //