// ATTACK ANIMATIONS DATA //

class UConfig_Human_Sw1HTest3lvl0_T01 : UConfig_Human_S1H_Top
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S1H_lvl0/A_Man_TestS1H_A_T01_Montage.A_Man_TestS1H_A_T01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Sw1HTest3lvl0_B01 : UConfig_Human_S1H_Bottom
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S1H_lvl0/A_Man_TestS1H_A_B01_Montage.A_Man_TestS1H_A_B01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

class UConfig_Human_Sw1HTest3lvl0_R01 : UConfig_Human_S1H_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S1H_lvl0/A_Man_TestS1H_A_R01_Montage.A_Man_TestS1H_A_R01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Sw1HTest3lvl0_L01 : UConfig_Human_S1H_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Test_S1H_lvl0/A_Man_TestS1H_A_L01_Montage.A_Man_TestS1H_A_L01_Montage'";
    
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_SuperArmorResistanceMultiplier = 1.25f;
}

// COMBOS //

class UAttack_Human_Sw1HTest3lvl0 : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}


class UAttack_Human_Sw1HTest3lvl0_T01 : UAttack_Human_Sw1HTest3lvl0
{
    default m_MetaData = UConfig_Human_Sw1HTest3lvl0_T01::StaticClass();
}

class UAttack_Human_Sw1HTest3lvl0_B01 : UAttack_Human_Sw1HTest3lvl0
{
    default m_MetaData = UConfig_Human_Sw1HTest3lvl0_B01::StaticClass();
}

class UAttack_Human_Sw1HTest3lvl0_L01 : UAttack_Human_Sw1HTest3lvl0
{
    default m_MetaData = UConfig_Human_Sw1HTest3lvl0_L01::StaticClass();
}

class UAttack_Human_Sw1HTest3lvl0_R01 : UAttack_Human_Sw1HTest3lvl0
{
    default m_MetaData = UConfig_Human_Sw1HTest3lvl0_R01::StaticClass();
}