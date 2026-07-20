// ATTACKS NOT SHRINKED
UCLASS()
class UAttackMeleeConfig_JuvenileTroll_Attack_Right01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Attacks/A_JuvenileTroll_RightAttack_Montage.A_JuvenileTroll_RightAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Hits/Parried/A_JuvenileTroll_HitParried_R_Montage.A_JuvenileTroll_HitParried_R_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Hits/Deflected/A_JuvenileTroll_HitDeflected_R_Montage.A_JuvenileTroll_HitDeflected_R_Montage'";


	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_JuvenileTroll_Attack_Left02 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Attacks/A_JuvenileTroll_R_LeftAttack02_Montage.A_JuvenileTroll_R_LeftAttack02_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Hits/Parried/A_JuvenileTroll_HitParried_L_Montage.A_JuvenileTroll_HitParried_L_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Hits/Deflected/A_JuvenileTroll_HitDeflected_L_Montage.A_JuvenileTroll_HitDeflected_L_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_JuvenileTroll_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Attacks/A_JuvenileTroll_BottomAttack_Montage.A_JuvenileTroll_BottomAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Hits/Parried/A_JuvenileTroll_HitParried_B_Montage.A_JuvenileTroll_HitParried_B_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Hits/Deflected/A_JuvenileTroll_HitDeflected_B_Montage.A_JuvenileTroll_HitDeflected_B_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_JuvenileTroll_ThrowRock : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Attacks/A_JuvenileTroll_ThrowRockAttack_Montage.A_JuvenileTroll_ThrowRockAttack_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 40.0f;

    default m_ProjectileClass = UTrollThrowRockProjectile::StaticClass();
    default m_ArrowGravityModifier = 0.7;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 1800.0;
    default m_CanKnockback = true;

    default m_ProjectileRotator = FVector(0, -250, 0);
}


UCLASS()
class UComboAttackConfig_JuvenileTroll_Attack_Right01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_JuvenileTroll_Attack_Right01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_JuvenileTroll_Attack_Left02::StaticClass());    
}

UCLASS()
class UComboAttackConfig_JuvenileTroll_Attack_Left02 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_JuvenileTroll_Attack_Left02::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();    
}

UCLASS()
class UComboAttackConfig_JuvenileTroll_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_JuvenileTroll_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
    
}

UCLASS()
class UComboAttackConfig_TrollJuvenile_PickRock : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_JuvenileTroll_ThrowRock::StaticClass();
    default m_GA_Attack = UGA_AttackThrow::StaticClass();
}