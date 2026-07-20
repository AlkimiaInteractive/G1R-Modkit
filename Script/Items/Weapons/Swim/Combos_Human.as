
// ATTACK ANIMATIONS DATA //

class UConfig_Human_Swimming : UAttackMeleeConfig
{
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

class UConfig_Human_Swimming_L01 : UConfig_Human_Swimming
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Swim/Attacks/A_Man_Swim_A_L01_Montage.A_Man_Swim_A_L01_Montage'";
}

// ******************************************** //

// COMBOS //

class UAttack_Human_Swimming : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

class UAttack_Human_Swimming_L01 : UAttack_Human_Swimming
{
    default m_MetaData = UConfig_Human_Swimming_L01::StaticClass();
}
