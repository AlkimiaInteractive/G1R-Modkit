
// ATTACK ANIMATIONS DATA //
class UConfig_Human_Fists_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Untrained/A_Man_Fists_Un_RH_HitParried_Montage.A_Man_Fists_Un_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Untrained/A_Man_Fists_Un_HitDeflected_R_Montage.A_Man_Fists_Un_HitDeflected_R_Montage'"; 
}

class UConfig_Human_Fists_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Untrained/A_Man_Fists_Un_LH_HitParried_Montage.A_Man_Fists_Un_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Untrained/A_Man_Fists_Un_HitDeflected_L_Montage.A_Man_Fists_Un_HitDeflected_L_Montage'"; 
}

class UConfig_Human_Fists_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Untrained/A_Man_Fists_Un_RH_HitParried_Montage.A_Man_Fists_Un_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Untrained/A_Man_Fists_Un_HitDeflected_B_Montage.A_Man_Fists_Un_HitDeflected_B_Montage'"; 
}

class UConfig_Human_Fists_Top : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Parried/Untrained/A_Man_Fists_Un_LH_HitParried_Montage.A_Man_Fists_Un_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Hits/Deflected/Untrained/A_Man_Fists_Un_HitDeflected_T_Montage.A_Man_Fists_Un_HitDeflected_T_Montage'"; 
}

class UConfig_Human_Fists_Un_R01 : UConfig_Human_Fists_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Untrained/A_Man_Fists_Un_A_R01_Montage.A_Man_Fists_Un_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::LeftHand;
}

class UConfig_Human_Fists_Un_L01 : UConfig_Human_Fists_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Untrained/A_Man_Fists_Un_A_L01_Montage.A_Man_Fists_Un_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::RightHand;
}

class UConfig_Human_Fists_Un_B01 : UConfig_Human_Fists_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Untrained/A_Man_Fists_Un_A_B01_Montage.A_Man_Fists_Un_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_Fists_Un_T01 : UConfig_Human_Fists_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Untrained/A_Man_Fists_Un_A_T01_Montage.A_Man_Fists_Un_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;

    default m_AttackHandle = EAttackHandle::RightHand;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_Fists_Un : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_Fists_Un_R01 : UAttack_Human_Fists_Un
{
    default m_MetaData = UConfig_Human_Fists_Un_R01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates,  UAttack_Human_Fists_Un_L01::StaticClass());
}

class UAttack_Human_Fists_Un_L01 : UAttack_Human_Fists_Un
{
    default m_MetaData = UConfig_Human_Fists_Un_L01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates,  UAttack_Human_Fists_Un_R01::StaticClass());
}

class UAttack_Human_Fists_Un_B01 : UAttack_Human_Fists_Un
{
    default m_MetaData = UConfig_Human_Fists_Un_B01::StaticClass();
}

class UAttack_Human_Fists_Un_T01 : UAttack_Human_Fists_Un
{
    default m_MetaData = UConfig_Human_Fists_Un_T01::StaticClass();
}

