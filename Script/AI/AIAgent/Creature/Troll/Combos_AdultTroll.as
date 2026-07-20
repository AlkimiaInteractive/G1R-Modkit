// ATTACKS NOT SHRINKED
UCLASS()
class UAttackMeleeConfig_Troll_Attack_Right01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/A_AdultTroll_RightAttack_Montage.A_AdultTroll_RightAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Parried/A_AdultTroll_HitParried_R_Montage.A_AdultTroll_HitParried_R_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Deflected/A_AdultTroll_HitDeflected_R_Montage.A_AdultTroll_HitDeflected_R_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_Troll_Attack_Left02 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/A_AdultTroll_R_LeftAttack02_Montage.A_AdultTroll_R_LeftAttack02_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Parried/A_AdultTroll_HitParried_L_Montage.A_AdultTroll_HitParried_L_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Deflected/A_AdultTroll_HitDeflected_L_Montage.A_AdultTroll_HitDeflected_L_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_Troll_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/A_AdultTroll_BottomAttack_Montage.A_AdultTroll_BottomAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Parried/A_AdultTroll_HitParried_B_Montage.A_AdultTroll_HitParried_B_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Deflected/A_AdultTroll_HitDeflected_B_Montage.A_AdultTroll_HitDeflected_B_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_AdultTroll_ThrowGoblin : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/A_AdultTroll_ThrowGoblinAttack_Montage.A_AdultTroll_ThrowGoblinAttack_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 40.0f;

    default m_ProjectileClass = UTrollThrowGoblinProjectile::StaticClass();
    default m_ArrowGravityModifier = 0.7;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 1800.0;

    default m_ProjectileRotator = FVector(0, -100, 0);

    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_AdultTroll_ThrowStone : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/A_AdultTroll_ThrowRockAttack_Montage.A_AdultTroll_ThrowRockAttack_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 50.0f;

    default m_ProjectileClass = UTrollThrowBigRockProjectile::StaticClass();
    default m_ArrowGravityModifier = 0.7;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 1800.0;

    default m_ProjectileRotator = FVector(0, -150, 0);

    default m_CanKnockback = true;
}


UCLASS()
class UComboAttackConfig_Troll_Attack_Right01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Troll_Attack_Right01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Troll_Attack_Left02::StaticClass());    
}

UCLASS()
class UComboAttackConfig_Troll_Attack_Left02 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Troll_Attack_Left02::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();    
}

UCLASS()
class UComboAttackConfig_Troll_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Troll_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
    
}

UCLASS()
class UComboAttackConfig_TrollAdult_PickGoblin : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_AdultTroll_ThrowGoblin::StaticClass();
    default m_GA_Attack = UGA_TrollAdult_PickGoblin::StaticClass();
}

UCLASS()
class UComboAttackConfig_TrollAdult_ThrowStone : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_AdultTroll_ThrowStone::StaticClass();
    default m_GA_Attack = UGA_AttackThrow::StaticClass();
}

// ATTACKS SHRINKED

UCLASS()
class UAttackMeleeConfig_Troll_Shrinked_Attack_Right01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/Shrinked/A_ShrinkedTroll_RightAttack_Montage.A_ShrinkedTroll_RightAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Parried/A_AdultTroll_HitParried_R_Montage.A_AdultTroll_HitParried_R_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Deflected/A_AdultTroll_HitDeflected_R_Montage.A_AdultTroll_HitDeflected_R_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackDirection = GameplayTag::Combat_Attack_Right;
}

UCLASS()
class UAttackMeleeConfig_Troll_Shrinked_Attack_Left02 : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/Shrinked/A_ShrinkedTroll_R_LeftAttack02_Montage.A_ShrinkedTroll_R_LeftAttack02_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Parried/A_AdultTroll_HitParried_L_Montage.A_AdultTroll_HitParried_L_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Deflected/A_AdultTroll_HitDeflected_L_Montage.A_AdultTroll_HitDeflected_L_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 5.0f;

    default m_AttackDirection = GameplayTag::Combat_Attack_Left;
}

UCLASS()
class UAttackMeleeConfig_Troll_Shrinked_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/Shrinked/A_ShrinkedTroll_BottomAttack_Montage.A_ShrinkedTroll_BottomAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Parried/A_AdultTroll_HitParried_B_Montage.A_AdultTroll_HitParried_B_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Deflected/A_AdultTroll_HitDeflected_B_Montage.A_AdultTroll_HitDeflected_B_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_AttackDirection = GameplayTag::Combat_Attack_Bottom;
}

// UCLASS()
// class UAttackMeleeConfig_Troll_Shrinked_Attack_Top : UAttackMeleeConfig
// {
//     default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/Shrinked/A_AdultTroll_Shrinked_TopAttack_02_Montage.A_AdultTroll_Shrinked_TopAttack_02_Montage'";
//     default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Parried/A_AdultTroll_HitParried_T_Montage.A_AdultTroll_HitParried_T_Montage'";
//     default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Hits/Deflected/A_AdultTroll_HitDeflected_T_Montage.A_AdultTroll_HitDeflected_T_Montage'";

// 	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
// 	default m_SuperArmorDamageMultiplier = 5.0f;

//     default m_AttackDirection = GameplayTag::Combat_Attack_Top;
// }

UCLASS()
class UAttackMeleeConfig_AdultTroll_Shrinked_ThrowRock : UAttackThrowConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Attacks/Shrinked/A_ShrinkedTroll_ThrowRockAttack_Montage.A_ShrinkedTroll_ThrowRockAttack_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 20.0f;

    default m_ProjectileClass = UTrollThrowRockProjectile::StaticClass();
    default m_ArrowGravityModifier = 0.7;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 1800.0;

    default m_ProjectileRotator = FVector(0, -250, 0);
}


UCLASS()
class UComboAttackConfig_Troll_Shrinked_Attack_Right01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Troll_Shrinked_Attack_Right01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Extra03,   UComboAttackConfig_Troll_Shrinked_Attack_Left02::StaticClass());    
}

UCLASS()
class UComboAttackConfig_Troll_Shrinked_Attack_Left02 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Troll_Shrinked_Attack_Left02::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();    
}

UCLASS()
class UComboAttackConfig_Troll_Shrinked_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Troll_Shrinked_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();    
}

// UCLASS()
// class UComboAttackConfig_Troll_Shrinked_Attack_Top : UComboAttackConfigScript
// {
//     default m_MetaData = UAttackMeleeConfig_Troll_Shrinked_Attack_Top::StaticClass();
//     default m_GA_Attack = UGA_AttackMelee::StaticClass();   
// }

UCLASS()
class UComboAttackConfig_Troll_ShrinkedAdult_ThrowStone : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_AdultTroll_Shrinked_ThrowRock::StaticClass();
    default m_GA_Attack = UGA_AttackThrow::StaticClass();
}