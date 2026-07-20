
// ATTACK ANIMATIONS DATA //
class UConfig_Human_M2H_Right : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Untrained/A_Man_M2H_Un_RH_HitParried_Montage.A_Man_M2H_Un_RH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Untrained/A_Man_M2H_Un_HitDeflected_R_Montage.A_Man_M2H_Un_HitDeflected_R_Montage'"; 

    default m_AttackDirection = GameplayTag::Combat_Attack_Right;

    //default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_M2H_Left : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Untrained/A_Man_M2H_Un_LH_HitParried_Montage.A_Man_M2H_Un_LH_HitParried_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Untrained/A_Man_M2H_Un_HitDeflected_L_Montage.A_Man_M2H_Un_HitDeflected_L_Montage'"; 

    default m_AttackDirection = GameplayTag::Combat_Attack_Left;

    //default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_M2H_Bottom : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Untrained/A_Man_M2H_Un_LH_HitParried_Montage.A_Man_M2H_Un_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Untrained/A_Man_M2H_Un_HitDeflected_B_RH_Montage.A_Man_M2H_Un_HitDeflected_B_RH_Montage'"; 

    default m_AttackDirection = GameplayTag::Combat_Attack_Bottom;

    //default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_M2H_Top : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Parried/Untrained/A_Man_M2H_Un_LH_HitParried_Montage.A_Man_M2H_Un_LH_HitParried_Montage'"; 
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Hits/Deflected/Untrained/A_Man_M2H_Un_HitDeflected_T_RH_Montage.A_Man_M2H_Un_HitDeflected_T_RH_Montage'";

    default m_AttackDirection = GameplayTag::Combat_Attack_Top;
    
    //default m_SuperArmorResistanceMultiplier = 1.5f;

    default m_AttackHandle = EAttackHandle::BothHands;
}

class UConfig_Human_M2H_Un_R01 : UConfig_Human_M2H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Untrained/A_Man_M2H_Un_A_R01_Montage.A_Man_M2H_Un_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M2H_Un_L01 : UConfig_Human_M2H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Untrained/A_Man_M2H_Un_A_L01_Montage.A_Man_M2H_Un_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_M2H_Un_B01 : UConfig_Human_M2H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Untrained/A_Man_M2H_Un_A_B01_Montage.A_Man_M2H_Un_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

class UConfig_Human_M2H_Un_T01 : UConfig_Human_M2H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Attacks/Untrained/A_Man_M2H_Un_A_T01_Montage.A_Man_M2H_Un_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.25f;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_M2H_Un : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_M2H_Un_R01 : UAttack_Human_M2H_Un
{
    default m_MetaData = UConfig_Human_M2H_Un_R01::StaticClass();

     default AddOptionByTiming(GameplayTag::Combat_Attack_Right, EComboTiming::ResetStates,  UAttack_Human_M2H_Un_L01::StaticClass());
}

class UAttack_Human_M2H_Un_L01 : UAttack_Human_M2H_Un
{
    default m_MetaData = UConfig_Human_M2H_Un_L01::StaticClass();

    default AddOptionByTiming(GameplayTag::Combat_Attack_Left, EComboTiming::ResetStates,  UAttack_Human_M2H_Un_R01::StaticClass());
}

class UAttack_Human_M2H_Un_B01 : UAttack_Human_M2H_Un
{
    default m_MetaData = UConfig_Human_M2H_Un_B01::StaticClass();
}

class UAttack_Human_M2H_Un_T01 : UAttack_Human_M2H_Un
{
    default m_MetaData = UConfig_Human_M2H_Un_T01::StaticClass();
}
