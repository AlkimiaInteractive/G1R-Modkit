// WEAPON MELEE
UCLASS()
class UAttackMeleeConfig_Demon_Fire_L01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/FireDemon_ScratchLeft_Montage.FireDemon_ScratchLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Parried/A_FireDemon_Hit_Parried_Left_Montage.A_FireDemon_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Deflected/A_FireDemon_HitDeflected_Left_Montage.A_FireDemon_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Demon_Fire_R01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/FireDemon_ScratchRight_Montage.FireDemon_ScratchRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Parried/A_FireDemon_Hit_Parried_Right_Montage.A_FireDemon_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Deflected/A_FireDemon_HitDeflected_Right_Montage.A_FireDemon_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Demon_Fire_T01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_FinisherUpper_Montage.A_FireDemon_FinisherUpper_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Parried/A_FireDemon_Hit_Parried_Top_Montage.A_FireDemon_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Deflected/A_FireDemon_HitDeflected_Charge_Montage.A_FireDemon_HitDeflected_Charge_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_Demon_Fire_Charge : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Charge_Montage.A_FireDemon_Charge_Montage'";
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/PH_ChargeUnified_Montage.PH_ChargeUnified_Montage'";
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Charge_Attack_Montage.A_FireDemon_Charge_Attack_Montage'";
    // default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Parried/A_FireDemon_Hit_Parried_Charge_Montage.A_FireDemon_Hit_Parried_Charge_Montage'";
    // default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Deflected/A_FireDemon_HitDeflected_Charge_Montage.A_FireDemon_HitDeflected_Charge_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_Demon_Fire_Firewall : UAttackSpawnActorConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Ring_Montage.A_FireDemon_Ring_Montage'";
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 60.0f);
    default m_ActorClass = n"Blueprint'/Game/Items/Magic/FireDemon/Firewall/BP_FireDemon_Firewall.BP_FireDemon_Firewall_C'";
}


UCLASS()
class UAttackMeleeConfig_Demon_Fire_Flamethrower : UAttackConeLoopConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Flamethrower_Montage.A_FireDemon_Flamethrower_Montage'";
   
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 80.0f);
	default m_SuperArmorDamageMultiplier = 0.0f;

    default m_ConeLengthMeters = 700.0f;
    default m_ConeAngleDegrees = 12.0f;
    default m_ConeLengthSpeed = 700.f;

    default m_AIMaxSeconds = 3.0f;
    default m_PlayerSeconds = 3.0f;
}

UCLASS()
class UComboAttackConfig_Demon_Fire_L01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Fire_L01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Demon_Fire_R01::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Demon_Fire_R01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Demon_Fire_T01::StaticClass());
}

UCLASS()
class UComboAttackConfig_Demon_Fire_R01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Fire_R01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Demon_Fire_L01::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Demon_Fire_L01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Demon_Fire_T01::StaticClass());
}

UCLASS()
class UComboAttackConfig_Demon_Fire_T01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Fire_T01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass(); 
}

UCLASS()
class UComboAttackConfig_Demon_Fire_Charge : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Fire_Charge::StaticClass();
    default m_GA_Attack = UGA_AttackCharge::StaticClass();
}

UCLASS()
class UComboAttackConfig_Demon_Fire_Flamethrower : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Fire_Flamethrower::StaticClass();
    default m_GA_Attack = UGA_FireDemon_Flamethrower::StaticClass();
}

UCLASS()
class UComboAttackConfig_Demon_Fire_Firewall : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Fire_Firewall::StaticClass();
    default m_GA_Attack = UGA_FireDemon_FirewallArea::StaticClass();
}

UCLASS()
class UAttackMeleeConfig_Demon_Fire_Fireball_R : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Fireball_01_Montage.A_FireDemon_Fireball_01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.f);
	default m_SuperArmorDamageMultiplier = 1.0f;
    default m_SuperArmorResistanceMultiplier = 1.0f;

    default m_ProjectileClass = UDemonFireballProjectileDefinition::StaticClass();
    default m_ArrowGravityModifier = 0;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 1800.0;
}

UCLASS()
class UAttackMeleeConfig_Demon_Fire_Fireball_L : UAttackMeleeConfig_Demon_Fire_Fireball_R
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Fireball_02_Montage.A_FireDemon_Fireball_02_Montage'";

    default m_ProjectileClass = UDemonFireballLeftProjectileDefinition::StaticClass();
}


UCLASS()
class UComboAttackConfig_Demon_Fire_Fireball_R : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Demon_Fire_Fireball_R::StaticClass();
	default m_GA_Attack = UGA_AttackThrow::StaticClass();
}

UCLASS()
class UComboAttackConfig_Demon_Fire_Fireball_L : UComboAttackConfig_Demon_Fire_Fireball_R
{
	default m_MetaData = UAttackMeleeConfig_Demon_Fire_Fireball_L::StaticClass();
}




// General
UCLASS()
class UWeaponMeleeItemAnimConfig_Demon_Fire : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/FireDemon/DemonFire_AnimBP.DemonFire_AnimBP_C'";

    //IDLE BREAKERS
    // default AddIdleBreaker(n"", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Idles/Breaker/A_FireDemon_IdleBreaker_01.A_FireDemon_IdleBreaker_01'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Idles/Breaker/A_FireDemon_IdleBreaker_02.A_FireDemon_IdleBreaker_02'", 0.7f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Idles/Breaker/A_FireDemon_IdleBreaker_03.A_FireDemon_IdleBreaker_03'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Idles/Breaker/A_FireDemon_IdleBreaker_04.A_FireDemon_IdleBreaker_04'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Idles/Breaker/A_FireDemon_IdleBreaker_05.A_FireDemon_IdleBreaker_05'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Idles/Breaker/A_FireDemon_IdleBreaker_06.A_FireDemon_IdleBreaker_06'", 0.3f, 1);
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Grounded/N/Breaker/A_FireDemon_WalkBreaker_01.A_FireDemon_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Grounded/N/Breaker/A_FireDemon_WalkBreaker_02.A_FireDemon_WalkBreaker_02'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Grounded/N/Breaker/A_FireDemon_WalkBreaker_03.A_FireDemon_WalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Grounded/N/Breaker/A_FireDemon_WalkBreaker_04.A_FireDemon_WalkBreaker_04'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Grounded/N/Breaker/A_FireDemon_WalkBreaker_05.A_FireDemon_WalkBreaker_05'", 0.3f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Movement/Grounded/N/Breaker/A_FireDemon_WalkBreaker_06.A_FireDemon_WalkBreaker_06'", 0.2f, 1);

   // TURNS
    default m_TurnsData = UTurnsData_Demon_Fire::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Default_Demon::StaticClass();
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Demon_Fire_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/FireDemon/DemonFire_AnimBP_Combat.DemonFire_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Idles/Breaker/A_FireDemon_CombatIdleBreaker_01.A_FireDemon_CombatIdleBreaker_01'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Idles/Breaker/A_FireDemon_CombatIdleBreaker_02.A_FireDemon_CombatIdleBreaker_02'", 0.9f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Idles/Breaker/A_FireDemon_CombatIdleBreaker_03.A_FireDemon_CombatIdleBreaker_03'", 0.7f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Idles/Breaker/A_FireDemon_CombatIdleBreaker_04.A_FireDemon_CombatIdleBreaker_04'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Idles/Breaker/A_FireDemon_CombatIdleBreaker_05.A_FireDemon_CombatIdleBreaker_05'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Idles/Breaker/A_FireDemon_CombatIdleBreaker_06.A_FireDemon_CombatIdleBreaker_06'", 0.7f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Idles/Breaker/A_FireDemon_CombatIdleBreaker_07.A_FireDemon_CombatIdleBreaker_07'", 0.4f, 1);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Grounded/N/Breaker/A_FireDemon_CombatWalkBreaker_01.A_FireDemon_CombatWalkBreaker_01'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Grounded/N/Breaker/A_FireDemon_CombatWalkBreaker_02.A_FireDemon_CombatWalkBreaker_02'", 0.9f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Grounded/N/Breaker/A_FireDemon_CombatWalkBreaker_03.A_FireDemon_CombatWalkBreaker_03'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Grounded/N/Breaker/A_FireDemon_CombatWalkBreaker_04.A_FireDemon_CombatWalkBreaker_04'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/FireDemon/Combat/Movement/Grounded/N/Breaker/A_FireDemon_CombatWalkBreaker_05.A_FireDemon_CombatWalkBreaker_05'", 0.7f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Demon_Fire_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 50.0f;
    
    // Equip
    default m_EquipData = UEquipData_FireDemon::StaticClass();
   
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UComboAttackConfig_Demon_Fire_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UComboAttackConfig_Demon_Fire_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =     UComboAttackConfig_Demon_Fire_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UComboAttackConfig_Demon_Fire_Charge::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =    UComboAttackConfig_Demon_Fire_Flamethrower::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =    UComboAttackConfig_Demon_Fire_Firewall::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =    UComboAttackConfig_Demon_Fire_Fireball_R::StaticClass();

    //

	// HITS
    default m_HitsData = UHitData_Default_Demon::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Demon::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Demon_Fire::StaticClass();
    //
}

UCLASS()
class UProjectile_Demon_Fire_Projectile_R : UItemAnimConfig
{
    default m_EquipData = UEquipData_Demon_Fire_R::StaticClass();
}

UCLASS()
class UProjectile_Demon_Fire_Projectile_L : UItemAnimConfig
{
    default m_EquipData = UEquipData_Demon_Fire_L::StaticClass();
}



UCLASS()
class UAnimConfig_Demon_Fire : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Demon_Fire::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Claw, UWeaponMeleeItemAnimConfig_Demon_Fire_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile_Right, UProjectile_Demon_Fire_Projectile_R::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile_Left, UProjectile_Demon_Fire_Projectile_L::StaticClass());
}
