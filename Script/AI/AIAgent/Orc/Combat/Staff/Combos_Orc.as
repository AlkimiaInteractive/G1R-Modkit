
// ATTACK ANIMATIONS DATA //

class UConfig_Orc_Sff1H_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Parried/A_OrcM_Sff1H_RH_HitParried_Montage.A_OrcM_Sff1H_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Deflected/A_OrcM_Sff1H_HitDeflected_R_Montage.A_OrcM_Sff1H_HitDeflected_R_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
    default m_AttackDirection = GameplayTag::Combat_Attack_Right;
}
class UConfig_Orc_Sff1H_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Parried/A_OrcM_Sff1H_LH_HitParried_Montage.A_OrcM_Sff1H_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Deflected/A_OrcM_Sff1H_HitDeflected_L_Montage.A_OrcM_Sff1H_HitDeflected_L_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
    default m_AttackDirection = GameplayTag::Combat_Attack_Left;
}
class UConfig_Orc_Sff1H_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Parried/A_OrcM_Sff1H_LH_HitParried_Montage.A_OrcM_Sff1H_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Hits/Deflected/A_OrcM_Sff1H_HitDeflected_B_Montage.A_OrcM_Sff1H_HitDeflected_B_Montage'";

    default m_AttackHandle = EAttackHandle::RightHand;
    default m_AttackDirection = GameplayTag::Combat_Attack_Bottom;
}

class UConfig_Orc_Sff1H_R01 : UConfig_Orc_Sff1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_01/A_OrcM_Sff1H_A_R01_Montage.A_OrcM_Sff1H_A_R01_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_Sff1H_L01 : UConfig_Orc_Sff1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_01/A_OrcM_Sff1H_A_L01_Montage.A_OrcM_Sff1H_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_Sff1H_B01 : UConfig_Orc_Sff1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_01/A_OrcM_Sff1H_A_B01_Montage.A_OrcM_Sff1H_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 3.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_Sff1H_L_R02 : UConfig_Orc_Sff1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_02/L_02/A_OrcM_Sff1H_A_L_R02_Montage.A_OrcM_Sff1H_A_L_R02_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_Sff1H_L_B02 : UConfig_Orc_Sff1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_02/L_02/A_OrcM_Sff1H_A_L_B02_Montage.A_OrcM_Sff1H_A_L_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_Sff1H_R_L02 : UConfig_Orc_Sff1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_02/R_02/A_OrcM_Sff1H_A_R_L02_Montage.A_OrcM_Sff1H_A_R_L02_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_Sff1H_R_B02 : UConfig_Orc_Sff1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_02/R_02/A_OrcM_Sff1H_A_R_B02_Montage.A_OrcM_Sff1H_A_R_B02_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

class UConfig_Orc_Sff1H_L_R03 : UConfig_Orc_Sff1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_03/L_03/A_OrcM_Sff1H_A_L_R03_Montage.A_OrcM_Sff1H_A_L_R03_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Orc_Sff1H_R_L03 : UConfig_Orc_Sff1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Attacks/A_03/R_03/A_OrcM_Sff1H_A_R_L03_Montage.A_OrcM_Sff1H_A_R_L03_Montage'"; 
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Energy, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

// ******************************************** //

// COMBOS //

class UAttack_Orc_Sff1H : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Orc_Sff1H_R01 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Orc_Sff1H_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_Sff1H_R_L02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Orc_Sff1H_R_L02::StaticClass());
}

class UAttack_Orc_Sff1H_L01 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_L01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Orc_Sff1H_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_Sff1H_L_R02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Orc_Sff1H_L_R02::StaticClass());
}

class UAttack_Orc_Sff1H_B01 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_B01::StaticClass();
}

class UAttack_Orc_Sff1H_L_R02 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_L_R02::StaticClass();
    
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Orc_Sff1H_R_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_Sff1H_R_L03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Orc_Sff1H_R_L03::StaticClass());
}

class UAttack_Orc_Sff1H_L_B02 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_L_B02::StaticClass();
}

class UAttack_Orc_Sff1H_R_L02 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_R_L02::StaticClass();
    
    default AddOption(GameplayTag::Combat_Attack_Bottom, UAttack_Orc_Sff1H_L_B02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,  UAttack_Orc_Sff1H_L_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,  UAttack_Orc_Sff1H_L_R03::StaticClass());
}

class UAttack_Orc_Sff1H_R_B02 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_R_B02::StaticClass();
}

class UAttack_Orc_Sff1H_L_R03 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_L_R03::StaticClass();
}

class UAttack_Orc_Sff1H_R_L03 : UAttack_Orc_Sff1H
{
    default m_MetaData = UConfig_Orc_Sff1H_R_L03::StaticClass();
}



// ******************************************** //
