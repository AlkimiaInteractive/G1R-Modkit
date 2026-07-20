UCLASS()
class UAttackMeleeConfig_Goblin_Black_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Attacks/GreenGoblin_BottomAttack_Montage.GreenGoblin_BottomAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Hits/Parried/GreenGoblin_Hit_Parried_Bottom_Montage.GreenGoblin_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Hits/Deflected/GreenGoblin_HitDeflected_Bottom_Montage.GreenGoblin_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Goblin_Black_Attack_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Attacks/GreenGoblin_LeftAttack_Montage.GreenGoblin_LeftAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Hits/Parried/GreenGoblin_Hit_Parried_Left_Montage.GreenGoblin_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Hits/Deflected/GreenGoblin_HitDeflected_Left_Montage.GreenGoblin_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}


UCLASS()
class UAttackMeleeConfig_Goblin_Black_Attack_Ranged : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Attacks/GreenGoblin_ThrowStoneAttack_Montage.GreenGoblin_ThrowStoneAttack_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_ProjectileClass = UGoblinThrowStoneBlack::StaticClass();
    default m_ArrowGravityModifier = 0.7;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 1800.0;
}

UCLASS()
class UComboAttackConfig_Goblin_Black_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Goblin_Black_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Goblin_Black_Attack_Left::StaticClass());
}

UCLASS()
class UComboAttackConfig_Goblin_Black_Attack_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Goblin_Black_Attack_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Goblin_Black_Attack_ThrowStone : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Goblin_Black_Attack_Ranged::StaticClass();
    default m_GA_Attack = UGA_AttackThrow::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Goblin_Black : UWeaponMeleeItemAnimConfig_Goblin
{
    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Goblin_Black_Mace_Combat : UWeaponMeleeItemAnimConfig_Goblin_Combat
{
    default m_Attacks.Add(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Goblin_Green_Mace_Attack_Bottom::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Left,     UComboAttackConfig_Goblin_Green_Mace_Attack_Left::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Top,     UComboAttackConfig_Goblin_Black_Attack_ThrowStone::StaticClass());
    //
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Goblin_Black_Sword_Combat : UWeaponMeleeItemAnimConfig_Goblin_Combat
{
    default m_Attacks.Add(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Goblin_Green_Sword_Attack_Bottom::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Left,     UComboAttackConfig_Goblin_Green_Sword_Attack_Left::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Top,     UComboAttackConfig_Goblin_Black_Attack_ThrowStone::StaticClass());
    //
}

UCLASS()
class UAnimConfig_Goblin_Black : UAnimConfig_Goblin
{
    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Goblin_Black::StaticClass());
	// default AddAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, UWeaponMeleeItemAnimConfig_Goblin_Black_Combat::StaticClass());
    // default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, UWeaponMeleeItemAnimConfig_Goblin_Black_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, UWeaponMeleeItemAnimConfig_Goblin_Black_Mace_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, UWeaponMeleeItemAnimConfig_Goblin_Black_Sword_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_Goblin::StaticClass());
}
