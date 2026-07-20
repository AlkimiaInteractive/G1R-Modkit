UCLASS()
class UAttackMeleeConfig_MCQueen_Ph1_A_RightSide : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Attacks/MCQueen_Ph1_A_RightSide_Montage.MCQueen_Ph1_A_RightSide_Montage'";
    default m_ParriedMontage = n"";
    default m_DeflectedMontage = n"";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_MCQueen_Ph1_A_LeftSide : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Attacks/MCQueen_Ph1_A_LeftSide_Montage.MCQueen_Ph1_A_LeftSide_Montage'";
    default m_ParriedMontage = n"";
    default m_DeflectedMontage = n"";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_MCQueen_Ph1_A_R01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Attacks/MCQueen_Ph1_A_R01_Montage.MCQueen_Ph1_A_R01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Hits/Parried/MCQueen_Ph1_Hit_Parried_Right_Montage.MCQueen_Ph1_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Hits/Deflected/MCQueen_Ph1_HitDeflected_R_Montage.MCQueen_Ph1_HitDeflected_R_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_MCQueen_Ph1_A_Spit : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Attacks/MCQueen_Ph1_A_Spit_Montage.MCQueen_Ph1_A_Spit_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_ProjectileClass = UMCQueen_Spit::StaticClass();
    default m_ArrowGravityModifier = 0.2;
	default m_ProjectileSpeedMin = 500.0;
	default m_ProjectileSpeedMax = 4500.0;
}

// ******************************************** //

// COMBOS //

class UAttack_MCQueen_Phase1 : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph1_A_RightSide : UAttack_MCQueen_Phase1
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph1_A_RightSide::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph1_A_LeftSide : UAttack_MCQueen_Phase1
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph1_A_LeftSide::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph1_A_R01 : UAttack_MCQueen_Phase1
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph1_A_R01::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph1_A_Spit : UAttack_MCQueen_Phase1
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph1_A_Spit::StaticClass();
    default m_GA_Attack = UGA_AttackThrow_NoTurns::StaticClass();
}