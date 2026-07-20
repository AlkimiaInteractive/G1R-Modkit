//////////////////
// Attack
UCLASS()
class UAttackMeleeConfig_MiniGolem_Ice_AttackLeft : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/MiniGolem/A_MiniIceGolem_Direction_Attack01_Montage.A_MiniIceGolem_Direction_Attack01_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Hits/Deflected/A_IceGolem_HitDeflected_R_Montage.A_IceGolem_HitDeflected_R_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Hits/Parried/A_IceGolem_N_Hit_Parried_R_Montage.A_IceGolem_N_Hit_Parried_R_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_MiniGolem_Ice_AttackRight : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/MiniGolem/A_MiniIceGolem_Direction_Attack02_Montage.A_MiniIceGolem_Direction_Attack02_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Hits/Deflected/A_IceGolem_HitDeflected_L_Montage.A_IceGolem_HitDeflected_L_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Hits/Parried/A_IceGolem_N_Hit_Parried_L_Montage.A_IceGolem_N_Hit_Parried_L_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_MiniGolem_Ice_AttackLeft : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_MiniGolem_Ice_AttackLeft::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right , UComboAttackConfig_MiniGolem_Ice_AttackRight::StaticClass());
}

UCLASS()
class UComboAttackConfig_MiniGolem_Ice_AttackRight : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_MiniGolem_Ice_AttackRight::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_MiniGolem_Ice_Icebolt : UComboAttackConfigScript
{
	default m_GA_Attack = UGA_CastSpell_IceBolt_IceGolem::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_MiniGolem_Ice : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Ice_Golem/Ice_Golem_AnimBP.Ice_Golem_AnimBP_C'";
	
    /*
    //IDLE BREAKERS
    default AddIdleBreaker(n"", 0.4f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"", 0.4f, 1);
    
    */

   // TURNS
   default m_TurnsData = UTurnsData_Golem_Ice::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Golem_Ice::StaticClass();
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_MiniGolem_Ice_Combat : UWeaponMeleeItemAnimConfig
{
	default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Ice_Golem/Ice_Golem_AnimBP_Combat.Ice_Golem_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    //default AddIdleBreaker(n"", 0.4f, 1);    
    
    //COMBAT WALK BREAKERS
    //default AddWalkBreaker(n"", 0.6f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Golem_Ice::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_Golem_Ice::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.Add(GameplayTag::Combat_Attack_Left,  UComboAttackConfig_MiniGolem_Ice_AttackLeft::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Right, UComboAttackConfig_MiniGolem_Ice_AttackRight::StaticClass());
    //default m_Attacks.Add(GameplayTag::Combat_Attack_Bottom, UComboAttackConfig_Golem_Ice_IceWave::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Top, UComboAttackConfig_Golem_Ice_Icebolt::StaticClass());

    // default m_Attacks.Add(GameplayTag::Combat_Attack_Extra02,); // Projectiles attack
    //

	// HITS
    default m_HitsData = UHitData_Golem_Ice::StaticClass();
    // 

    // DODGES
    // default m_DodgesData = UDodgesData_Golem_Ice::StaticClass();
    //

        // TAUNTS
    default m_TauntData = UTauntData_Golem_Ice::StaticClass(); 
}

// UCLASS()
// class UProjectile_MiniGolem_Ice_Throw_Grenade : UItemAnimConfig
// {
//     default m_EquipData = UEquipData_Golem_Ice_Throw_Grenade::StaticClass();
// }

UCLASS()
class UProjectile_MiniGolem_Ice_Throw_IceBolt : UItemAnimConfig
{
    default m_EquipData = UEquipData_Golem_Ice_Throw_IceBolt::StaticClass();
}



UCLASS()
class UAnimConfig_MiniGolem_Ice : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Golem_Ice::StaticClass());

	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Golem_Ice_Combat::StaticClass());
    //default AddAnimForItem(GameplayTag::Item_Projectile_Right, UProjectile_Golem_Ice_Throw_Grenade::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_IceWave_IceGolem, UIceWave_IceGolem::StaticClass());

    // default AddAnimForItem(GameplayTag::Spell_IceBolt_IceGolem, UIceBolt_IceGolem_Hand::StaticClass());
    // default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_Golem_Ice_Throw_IceBolt::StaticClass());

    //To activate this version change UProjectile_Golem_Ice_Throw_IceBolt AND UGA_Spell_IceGolem_IceBolt
    default AddAnimForItem(GameplayTag::Spell_IceBolt_IceGolem, UIceBolt_IceGolem_FromHead::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_Golem_Ice_Throw_IceBolt::StaticClass());
    
}


// UCLASS()
// class UIceWave_IceGolem : UGenericRune_Human
// {
//     default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/IceWave/A_IceGolem_WaveAttack_Cast_Montage.A_IceGolem_WaveAttack_Cast_Montage'";
//     default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/IceWave/A_IceGolem_WaveAttack_Cast_Failure_Montage.A_IceGolem_WaveAttack_Cast_Failure_Montage'";
//     default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/IceWave/A_IceGolem_WaveAttack_Cast_Failure_Montage.A_IceGolem_WaveAttack_Cast_Failure_Montage'";
// }

// UCLASS()
// class UIceBolt_IceGolem_FromHead : UGenericRune_Human
// {
//     default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/Icebolt/A_IceGolem_IceShotsAttack01_Cast_Montage.A_IceGolem_IceShotsAttack01_Cast_Montage'";
//     default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/Icebolt/A_IceGolem_IceShotsAttack01_CastEnd_Montage.A_IceGolem_IceShotsAttack01_CastEnd_Montage'";
    
//     default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/Icebolt/A_IceGolem_IceShotsAttack01_Launch_Montage.A_IceGolem_IceShotsAttack01_Launch_Montage'";
//     default m_LaunchEndMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/Icebolt/A_IceGolem_IceShotsAttack01_CastEnd_Montage.A_IceGolem_IceShotsAttack01_CastEnd_Montage'";
// }

// UCLASS()
// class UIceBolt_IceGolem_Hand : UGenericRune_Human
// {
//     default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/Icebolt/PH_IceGolem_IceShots_v2_Cast_Montage.PH_IceGolem_IceShots_v2_Cast_Montage'";
//     default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/Icebolt/A_IceGolem_IceShotsAttack01_Cast_Failure_Montage.A_IceGolem_IceShotsAttack01_Cast_Failure_Montage'";
    
//     default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/Icebolt/PH_IceGolem_IceShots_v2_Launch_Montage.PH_IceGolem_IceShots_v2_Launch_Montage'";
//     default m_LaunchFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Ice_Golem/Combat/Attacks/Icebolt/A_IceGolem_IceShotsAttack01_Launch_Failure_Montage.A_IceGolem_IceShotsAttack01_Launch_Failure_Montage'";
// }