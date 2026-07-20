
class UConfig_Human_T1H_Tr_Demo_L01 : UConfig_Human_T1H_Left
{
    default m_AttackMontage = n"T1H_Tr_DemoAnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/DemoTrained/A_Man_T1H_Tr_Demo_A_L01_Montage.A_Man_T1H_Tr_Demo_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 5.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

class UConfig_Human_T1H_Tr_Demo_T01 : UConfig_Human_T1H_Top
{
    default m_AttackMontage = n"T1H_Tr_DemoAnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/DemoTrained/A_Man_T1H_Tr_Demo_A_T01_Montage.A_Man_T1H_Tr_Demo_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 10.0f);
	default m_SuperArmorDamageMultiplier = 0.0f;
}

class UConfig_Human_T1H_Tr_Demo_B01 : UConfig_Human_T1H_Bottom
{
    default m_AttackMontage = n"T1H_Tr_DemoAnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Attacks/DemoTrained/A_Man_T1H_Tr_Demo_A_B01_Montage.A_Man_T1H_Tr_Demo_A_B01_Montage'";
 
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 5.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 0.5f;
}

// ******************************************** //

// COMBOS //

class UAttack_Human_T1H_Tr_Demo : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_T1H_Tr_Demo_L01 : UAttack_Human_T1H_Tr_Demo
{
    default m_MetaData = UConfig_Human_T1H_Tr_Demo_L01::StaticClass();
}

class UAttack_Human_T1H_Tr_Demo_B01 : UAttack_Human_T1H_Tr_Demo
{
    default m_MetaData = UConfig_Human_T1H_Tr_Demo_B01::StaticClass();
}

class UAttack_Human_T1H_Tr_Demo_T01 : UAttack_Human_T1H_Tr_Demo
{
    default m_MetaData = UConfig_Human_T1H_Tr_Demo_T01::StaticClass();
}
