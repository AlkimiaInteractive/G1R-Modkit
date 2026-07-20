UCLASS()
class UAttackMeleeConfig_MCQueen_Ph2_A_R01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Attacks/MCQueen_Ph2_A_R01_Montage.MCQueen_Ph2_A_R01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Hits/Parried/MCQueen_Ph2_Hit_Parried_Right_Montage.MCQueen_Ph2_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Hits/Deflected/MCQueen_Ph2_HitDeflected_R_Montage.MCQueen_Ph2_HitDeflected_R_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.2f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_MCQueen_Ph2_A_L02 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Attacks/MCQueen_Ph2_A_R_L02_Montage.MCQueen_Ph2_A_R_L02_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Hits/Parried/MCQueen_Ph2_Hit_Parried_Left_Montage.MCQueen_Ph2_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Hits/Deflected/MCQueen_Ph2_HitDeflected_L_Montage.MCQueen_Ph2_HitDeflected_L_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.2f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_MCQueen_Ph2_A_R03 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Attacks/MCQueen_Ph2_A_L_R03_Montage.MCQueen_Ph2_A_L_R03_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Hits/Parried/MCQueen_Ph2_Hit_Parried_Right_Montage.MCQueen_Ph2_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Hits/Deflected/MCQueen_Ph2_HitDeflected_R_Montage.MCQueen_Ph2_HitDeflected_R_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.2f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_MCQueen_Ph2_A_LeftSide : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Attacks/MCQueen_Ph2_LeftSide_Montage.MCQueen_Ph2_LeftSide_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.2f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_MCQueen_Ph2_A_RightSide : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Attacks/MCQueen_Ph2_RightSide_Montage.MCQueen_Ph2_RightSide_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.2f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_MCQueen_Ph2_A_Stomp : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Attacks/A_MCQueen_Ph2_A_Stomp_Montage.A_MCQueen_Ph2_A_Stomp_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.2f);
	default m_SuperArmorDamageMultiplier = 3.0f;

    default m_CanKnockback = true;
}


UCLASS()
class UAttackMeleeConfig_MCQueen_Ph2_A_Spit : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Attacks/MCQueen_Ph2_A_Spit_Montage.MCQueen_Ph2_A_Spit_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_ProjectileClass = UMCQueen_Spit::StaticClass();
    default m_ArrowGravityModifier = 0.2;
	default m_ProjectileSpeedMin = 500.0;
	default m_ProjectileSpeedMax = 4500.0;
}

// ******************************************** //

// COMBOS //

class UAttack_MCQueen_Phase2 : UComboAttackConfigScript
{
    default m_GA_Attack = UGameplayAbilityAttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph2_A_R01 : UAttack_MCQueen_Phase2
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph2_A_R01::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_MCQueen_Ph2_A_L02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_MCQueen_Ph2_A_L02::StaticClass());
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph2_A_L02 : UAttack_MCQueen_Phase2
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph2_A_L02::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_MCQueen_Ph2_A_R03::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_MCQueen_Ph2_A_R03::StaticClass());
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph2_A_R03 : UAttack_MCQueen_Phase2
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph2_A_R03::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph2_A_LeftSide : UAttack_MCQueen_Phase2
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph2_A_LeftSide::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph2_A_RightSide : UAttack_MCQueen_Phase2
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph2_A_RightSide::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph2_A_Stomp : UAttack_MCQueen_Phase2
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph2_A_Stomp::StaticClass();

    default m_GA_Attack = UGA_AttackStomp::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCQueen_Ph2_A_LeftClose : UAttack_MCQueen_Phase2
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph2_A_L02::StaticClass();
}


UCLASS()
class UComboAttackConfig_MCQueen_Ph2_A_Spit : UAttack_MCQueen_Phase2
{
    default m_MetaData = UAttackMeleeConfig_MCQueen_Ph2_A_Spit::StaticClass();
    default m_GA_Attack = UGA_AttackThrow_NoTurns::StaticClass();
}