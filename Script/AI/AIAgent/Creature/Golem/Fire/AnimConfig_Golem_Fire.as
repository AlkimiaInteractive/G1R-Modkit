//////////////////
// Attack
UCLASS()
class UAttackMeleeConfig_Golem_Fire_AttackL_Right02 : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Hits/Parried/A_FireGolem_N_Hit_Parried_R_Montage.A_FireGolem_N_Hit_Parried_R_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Hits/Deflected/A_FireGolem_HitDeflected_L_Montage.A_FireGolem_HitDeflected_L_Montage'";
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Attacks/A_FireGolem_Direction_L_RightAttack02_Montage.A_FireGolem_Direction_L_RightAttack02_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 5.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Golem_Fire_AttackLeft01 : UAttackMeleeConfig
{
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Hits/Parried/A_FireGolem_N_Hit_Parried_L_Montage.A_FireGolem_N_Hit_Parried_L_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Hits/Deflected/A_FireGolem_HitDeflected_R_Montage.A_FireGolem_HitDeflected_R_Montage'";
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Attacks/A_FireGolem_Direction_LeftAttack01_Montage.A_FireGolem_Direction_LeftAttack01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 5.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Golem_Fire_AttackTop : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Attacks/A_FireGolem_BreakFloorAttack_01_Montage.A_FireGolem_BreakFloorAttack_01_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 5.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UProjectile_Golem_Fire_Rock : UItemAnimConfig
{
    default m_EquipData = UEquipData_Golem_Fire_Rock::StaticClass();
}

UCLASS()
class UAttackMeleeConfig_Golem_Fire_Grenade : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Attacks/A_FireGolem_Throw_Grenade_Montage.A_FireGolem_Throw_Grenade_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 80.0f);
	default m_SuperArmorDamageMultiplier = 40.0f;

    default m_ProjectileClass = UGolemFireRock::StaticClass();
    default m_ArrowGravityModifier = 0.8f;
	default m_ProjectileSpeedMin = 100.0;
	default m_ProjectileSpeedMax = 2800.0;

    default m_ProjectileRotator = FVector(0, -250, 0);
}

UCLASS()
class UComboAttackConfig_Golem_Fire_Grenade : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Fire_Grenade::StaticClass();
	default m_GA_Attack = UGA_AttackThrow::StaticClass();
}

UCLASS()
class UComboAttackConfig_Golem_Fire_AttackL_Right02 : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Fire_AttackL_Right02::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Golem_Fire_AttackLeft01 : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Fire_AttackLeft01::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,  UComboAttackConfig_Golem_Fire_AttackL_Right02::StaticClass());
}

UCLASS()
class UComboAttackConfig_Golem_Fire_AttackTop : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Fire_AttackTop::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Golem_Fire_BreakFloor : UComboAttackConfigScript
{
	default m_GA_Attack = UGA_CastSpell_BreakFloor_FireGolem::StaticClass();
}

UCLASS()
class UAttackMeleeConfig_Golem_Fire_TestIdle : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Attacks/Test/PH_FireGolem_Idle_N_Combat_Breath_Montage.PH_FireGolem_Idle_N_Combat_Breath_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
UCLASS()
class UComboAttackConfig_Golem_Fire_TestIdle : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Fire_TestIdle::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Golem_Fire : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Fire_Golem/Fire_Golem_AnimBP.Fire_Golem_AnimBP_C'";
	
    
    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Idles/Breaker/A_FireGolem_IdleBreaker_01.A_FireGolem_IdleBreaker_01'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Idles/Breaker/A_FireGolem_IdleBreaker_02.A_FireGolem_IdleBreaker_02'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Idles/Breaker/A_FireGolem_IdleBreaker_03.A_FireGolem_IdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Idles/Breaker/A_FireGolem_IdleBreaker_04.A_FireGolem_IdleBreaker_04'", 0.4f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Breaker/A_FireGolem_WalkBreaker_01.A_FireGolem_WalkBreaker_01'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Breaker/A_FireGolem_WalkBreaker_02.A_FireGolem_WalkBreaker_02'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Breaker/A_FireGolem_WalkBreaker_03.A_FireGolem_WalkBreaker_03'", 0.4f, 1);
    

   // TURNS
   default m_TurnsData = UTurnsData_Golem_Fire::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Golem_Fire::StaticClass();
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Golem_Fire_Combat : UWeaponMeleeItemAnimConfig
{
	default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Fire_Golem/Fire_Golem_AnimBP_Combat.Fire_Golem_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Idles/Breaker/A_FireGolem_CombatIdleBreaker_01.A_FireGolem_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Idles/Breaker/A_FireGolem_CombatIdleBreaker_02.A_FireGolem_CombatIdleBreaker_02'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Idles/Breaker/A_FireGolem_CombatIdleBreaker_03.A_FireGolem_CombatIdleBreaker_03'", 0.6f, 1);    
    
    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Breaker/A_FireGolem_CombatWalkBreaker_01.A_FireGolem_CombatWalkBreaker_01'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Breaker/A_FireGolem_CombatWalkBreaker_02.A_FireGolem_CombatWalkBreaker_02'", 0.8f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Golem_Fire_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Golem_Fire::StaticClass();
  
    // COMBOS (see Combos_Human.as)
    // default m_Attacks.Add(GameplayTag::Combat_Attack_Right, UComboAttackConfig_Golem_Fire_AttackL_Right02::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Left, UComboAttackConfig_Golem_Fire_AttackLeft01::StaticClass());
    // default m_Attacks.Add(GameplayTag::Combat_Attack_Top, UComboAttackConfig_Golem_Fire_AttackTop::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Top, UComboAttackConfig_Golem_Fire_BreakFloor::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Bottom, UComboAttackConfig_Golem_Fire_Grenade::StaticClass());

    default m_Attacks.Add(GameplayTag::Combat_Attack_Extra02, UComboAttackConfig_Golem_Fire_TestIdle::StaticClass());
    //

	// HITS
    default m_HitsData = UHitData_Golem_Fire::StaticClass();
    // 

    // DODGES
    // default m_DodgesData = UDodgesData_Golem_Fire::StaticClass();
    //

       // TAUNTS
    default m_TauntData = UTauntData_Golem_Fire::StaticClass(); 
}

UCLASS()
class UAnimConfig_Golem_Fire : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Golem_Fire::StaticClass());

	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Golem_Fire_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_BreakFloor, UBreakFloor_FireGolem::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile_Right, UProjectile_Golem_Fire_Rock::StaticClass());
}

UCLASS()
class UBreakFloor_FireGolem : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Attacks/Spells/BreakFloor/A_FireGolem_BreakFloor_Cast_Montage.A_FireGolem_BreakFloor_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Attacks/Spells/BreakFloor/A_FireGolem_BreakFloor_Failure_Montage.A_FireGolem_BreakFloor_Failure_Montage'";
    default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Attacks/Spells/BreakFloor/A_FireGolem_BreakFloor_Failure_Montage.A_FireGolem_BreakFloor_Failure_Montage'";
}
