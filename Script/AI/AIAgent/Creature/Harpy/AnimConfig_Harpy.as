//////////////////
// Attack
UCLASS()
class UAttackMeleeConfig_Harpy_R01_Grounded : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Attacks/Harpy_N_RightAttack_Montage.Harpy_N_RightAttack_Montage'";
    default m_ParriedMontage = n"";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Deflected/A_Harpy_HitDeflected_R_Montage.A_Harpy_HitDeflected_R_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Harpy_L01_Grounded : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Attacks/Harpy_N_LeftAttack_Montage.Harpy_N_LeftAttack_Montage'";
    default m_ParriedMontage = n"";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Deflected/A_Harpy_HitDeflected_R_Montage.A_Harpy_HitDeflected_R_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Harpy_R01_Grounded : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Harpy_R01_Grounded::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Harpy_L01_Grounded : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Harpy_L01_Grounded::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UAttackMeleeConfig_Harpy_R01_Flying : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Attacks/Harpy_A_R01_Montage.Harpy_A_R01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Parried/A_Harpy_N_Hit_Parried_Right_Montage.A_Harpy_N_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Deflected/A_Harpy_HitDeflected_R_Montage.A_Harpy_HitDeflected_R_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Harpy_L01_Flying : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Attacks/Harpy_A_L01_Montage.Harpy_A_L01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Parried/A_Harpy_N_Hit_Parried_Left_Montage.A_Harpy_N_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Deflected/A_Harpy_HitDeflected_L_Montage.A_Harpy_HitDeflected_L_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Harpy_R01_Flying : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Harpy_R01_Flying::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Harpy_L01_Flying::StaticClass());
}

UCLASS()
class UComboAttackConfig_Harpy_L01_Flying : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Harpy_L01_Flying::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Harpy_R01_Flying::StaticClass());
}

UCLASS()
class UAttackMeleeConfig_Harpy_ThrowWing_Flying : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Attacks/Harpy_A_ThrowWings_Montage.Harpy_A_ThrowWings_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_ProjectileClass = UHarpyThrowWing::StaticClass();
    default m_ArrowGravityModifier = 0.7;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 1800.0;
    default m_ProjectileRotator = FVector(0, 0, 0);
}

UCLASS()
class UComboAttackConfig_Harpy_ThrowWing_Flying : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Harpy_ThrowWing_Flying::StaticClass();
    default m_GA_Attack = UGA_AttackThrow_Flying::StaticClass();
}

UCLASS()
class UAttackMeleeConfig_Harpy_Charge_Flying : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Attacks/Harpy_AttackFeet_Montage.Harpy_AttackFeet_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Parried/A_Harpy_N_Hit_Parried_Charge_Montage.A_Harpy_N_Hit_Parried_Charge_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Hits/Deflected/A_Harpy_HitDeflected_Charge_Montage.A_Harpy_HitDeflected_Charge_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
    default m_CanKnockback = true;
}

UCLASS()
class UComboAttackConfig_Harpy_Charge_Flying : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Harpy_Charge_Flying::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UAnimConfig_Harpy_Grounded : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Harpy/Harpy_AnimBP_Base.Harpy_AnimBP_Base_C'";

    //IDLE BREAKERS
    
    //WALK BREAKERS
    
    // TURNS
    default m_TurnsData = UTurnsData_Harpy::StaticClass();
    //

    // DODGES
    //default m_DodgesData = UDodgesData_Default_Harpy::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Harpy_Grounded::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Harpy::StaticClass();
}

UCLASS()
class UAnimConfig_Harpy_Flying : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Harpy/Harpy_AnimBP_Base.Harpy_AnimBP_Base_C'";

    //IDLE BREAKERS
    
    //WALK BREAKERS
    
    // TURNS
    //default m_TurnsData = UTurnsData_Harpy::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Default_Harpy::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Harpy::StaticClass();
    //    

    //default m_ConsumablesData = UConsumablesData_Harpy::StaticClass();
}

UCLASS()
class UProjectile_Harpy : UItemAnimConfig
{
    default m_EquipData = UEquipData_Harpy_UProjectile::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Harpy_Combat_Flying : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Harpy/Harpy_AnimBP_Combat.Harpy_AnimBP_Combat_C'";

    // TURNS
    //default m_TurnsData = UTurnsData_Harpy::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_Harpy::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right)      = UComboAttackConfig_Harpy_R01_Flying::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left)       = UComboAttackConfig_Harpy_L01_Flying::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top)        = UComboAttackConfig_Harpy_ThrowWing_Flying::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom)     = UComboAttackConfig_Harpy_Charge_Flying::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Harpy::StaticClass();
    
    // HITS
    default m_HitsData = UHitData_Default_Harpy::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Default_Harpy::StaticClass();
    //
    
    default m_ConsumablesData = UConsumablesData_Harpy::StaticClass();
}


UCLASS()
class UWeaponMeleeItemAnimConfig_Harpy_Combat_Grounded : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Harpy/Harpy_AnimBP_Combat.Harpy_AnimBP_Combat_C'";

    // TURNS
    default m_TurnsData = UTurnsData_Harpy::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_Harpy_Grounded::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right)      = UComboAttackConfig_Harpy_R01_Grounded::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left)      = UComboAttackConfig_Harpy_L01_Grounded::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Harpy::StaticClass();
    
    // HITS
    default m_HitsData = UHitData_Default_Harpy_Grounded::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Default_Harpy::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_Harpy_Combat::StaticClass();
}

UCLASS()
class UAnimConfig_Harpy : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Harpy_Eat_Item::StaticClass());

	default SetDefaultMovementAnimData(UAnimConfig_Harpy_Grounded::StaticClass());
	default SetDefaultMovementAnimData(UAnimConfig_Harpy_Flying::StaticClass(), EMovementMode::MOVE_Flying);

    default AddAnimForItem(GameplayTag::Item_Weapon_Claw_Grounded, UWeaponMeleeItemAnimConfig_Harpy_Combat_Grounded::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Claw_Flying, UWeaponMeleeItemAnimConfig_Harpy_Combat_Flying::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_Harpy::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Harpy_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Actions/Harpy_EatItem_Montage.Harpy_EatItem_Montage'";
}