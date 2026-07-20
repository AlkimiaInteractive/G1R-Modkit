
// ATTACK ANIMATIONS DATA //
class UConfig_Human_T1H_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Parried/A_Man_T1H_RH_HitParried_Montage.A_Man_T1H_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Deflected/A_Man_T1H_HitDeflected_R_Montage.A_Man_T1H_HitDeflected_R_Montage'";

default m_AttackDirection = GameplayTag::Combat_Attack_Right;

    default m_AttackHandle = EAttackHandle::RightHand;
}

class UConfig_Human_T1H_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Parried/A_Man_T1H_LH_HitParried_Montage.A_Man_T1H_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Deflected/A_Man_T1H_HitDeflected_L_Montage.A_Man_T1H_HitDeflected_L_Montage'";

default m_AttackDirection = GameplayTag::Combat_Attack_Left;

    default m_AttackHandle = EAttackHandle::RightHand;
}

class UConfig_Human_T1H_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Parried/A_Man_T1H_RH_HitParried_Montage.A_Man_T1H_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Deflected/A_Man_T1H_HitDeflected_B_Montage.A_Man_T1H_HitDeflected_B_Montage'"; 

default m_AttackDirection = GameplayTag::Combat_Attack_Bottom;

    default m_AttackHandle = EAttackHandle::RightHand;
}

class UConfig_Human_T1H_Top : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Parried/A_Man_T1H_LH_HitParried_Montage.A_Man_T1H_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Hits/Deflected/A_Man_T1H_HitDeflected_T_Montage.A_Man_T1H_HitDeflected_T_Montage'";

    default m_AttackDirection = GameplayTag::Combat_Attack_Top;

    default m_AttackHandle = EAttackHandle::RightHand;
}

class UConfig_Human_T1H_Un_L01 : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Untrained/A_Man_T1H_Un_A_L01_Montage.A_Man_T1H_Un_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Un_R01 : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Untrained/A_Man_T1H_Un_A_R01_Montage.A_Man_T1H_Un_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Un_T01 : UConfig_Human_T1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Untrained/A_Man_T1H_Un_A_T01_Montage.A_Man_T1H_Un_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Un_B01 : UConfig_Human_T1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/Untrained/A_Man_T1H_Un_A_B01_Montage.A_Man_T1H_Un_A_B01_Montage'";
 
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_T1H_Un : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_T1H_Un_L01 : UAttack_Human_T1H_Un
{
    default m_MetaData = UConfig_Human_T1H_Un_L01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates,  UAttack_Human_T1H_Un_R01::StaticClass());
}

class UAttack_Human_T1H_Un_R01 : UAttack_Human_T1H_Un
{
    default m_MetaData = UConfig_Human_T1H_Un_R01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates,  UAttack_Human_T1H_Un_L01::StaticClass());
}

class UAttack_Human_T1H_Un_B01 : UAttack_Human_T1H_Un
{
    default m_MetaData = UConfig_Human_T1H_Un_B01::StaticClass();
}

class UAttack_Human_T1H_Un_T01 : UAttack_Human_T1H_Un
{
    default m_MetaData = UConfig_Human_T1H_Un_T01::StaticClass();
}
