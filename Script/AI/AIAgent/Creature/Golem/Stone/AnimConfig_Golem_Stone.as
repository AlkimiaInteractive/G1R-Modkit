
//////////////////
// Attack

UCLASS()
class UAttackMeleeConfig_Golem_Stone_L01 : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Golem_Stone_Directions_Attack01_Montage.Golem_Stone_Directions_Attack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Hits/Parried/A_Stone_Golem_Hit_Parried_Left_Montage.A_Stone_Golem_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Hits/Deflected/A_Stone_Golem_HitDeflected_Left_Montage.A_Stone_Golem_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Golem_Stone_L_R02 : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Golem_Stone_Directions_Attack02_Montage.Golem_Stone_Directions_Attack02_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Hits/Parried/A_Stone_Golem_Hit_Parried_Right_Montage.A_Stone_Golem_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Hits/Deflected/A_Stone_Golem_HitDeflected_Right_Montage.A_Stone_Golem_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Golem_Stone_L01 : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Stone_L01::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Golem_Stone_L_R02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Golem_Stone_L_R02::StaticClass());
}

UCLASS()
class UComboAttackConfig_Golem_Stone_L_R02 : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Stone_L_R02::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

// UCLASS()
// class UAttackMeleeConfig_Golem_Stone_Charge : UAttackMeleeConfig
// {
//     // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/A_StoneGolem_JumpAttack04_Montage2.A_StoneGolem_JumpAttack04_Montage2'";
//     default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/A_StoneGolem_ChargeAttack_Montage.A_StoneGolem_ChargeAttack_Montage'";
//     // default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Hits/Parried/A_Stone_Golem_Hit_Parried_Charge_Montage.A_Stone_Golem_Hit_Parried_Charge_Montage'";
//     // default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Hits/Deflected/A_Stone_Golem_HitDeflected_Charge_Montage.A_Stone_Golem_HitDeflected_Charge_Montage'";

// 	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
// 	default m_SuperArmorDamageMultiplier = 1.0f;
//     default m_CanKnockback = true;
// }

// UCLASS()
// class UComboAttackConfig_Golem_Stone_Charge : UComboAttackConfigScript
// {
// 	default m_MetaData = UAttackMeleeConfig_Golem_Stone_Charge::StaticClass();
// 	default m_GA_Attack = UGA_AttackCharge::StaticClass();
// }

UCLASS()
class UComboAttackConfig_Golem_Stone_StoneWave : UComboAttackConfigScript
{
	default m_GA_Attack = UGA_CastSpell_StoneWave_StoneGolem::StaticClass();
}

UCLASS()
class UComboAttackConfig_Golem_Stone_Teleport : UComboAttackConfigScript
{
	default m_GA_Attack = UGA_CastSpell_Teleport_StoneGolem::StaticClass();
}

// UCLASS()
// class UAttackMeleeConfig_Golem_Stone_Wave : UAttackThrowConfig
// {
//     default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Golem_Stone_WaveAttack02_Montage.Golem_Stone_WaveAttack02_Montage'";

//     default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.01f);
// 	default m_SuperArmorDamageMultiplier = 10.0f;

//     default m_ProjectileClass = UGolemStone_PHWave::StaticClass();
//     // default m_ProjectileClass = UGolemStoneRock::StaticClass();
//     default m_ArrowGravityModifier = 0;
// 	default m_ProjectileSpeedMin = 1.0;
// 	default m_ProjectileSpeedMax = 1800.0;
// }

// UCLASS()
// class UComboAttackConfig_Golem_Stone_Wave : UComboAttackConfigScript
// {
// 	default m_MetaData = UAttackMeleeConfig_Golem_Stone_Wave::StaticClass();
// 	default m_GA_Attack = UGA_AttackThrow::StaticClass();
// }

///
// TP
///

UCLASS()
class UAttackMeleeConfig_Golem_Stone_TP01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/A_StoneGolem_TeleportAttack_In_01_Montage.A_StoneGolem_TeleportAttack_In_01_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Golem_Stone_TP01 : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Stone_TP01::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UAttackMeleeConfig_Golem_Stone_TP02 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/A_StoneGolem_TeleportAttack_In_02_Montage.A_StoneGolem_TeleportAttack_In_02_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Golem_Stone_TP02 : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Stone_TP02::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}


///
// TP END
///

///
// GRENADE
///


UCLASS()
class UAttackMeleeConfig_Golem_Stone_Grenade : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Golem_Stone_ThrowGrenadeAttack02_Montage.Golem_Stone_ThrowGrenadeAttack02_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 50.0f;

    default m_ProjectileClass = UGolemStoneRock::StaticClass();
    default m_ArrowGravityModifier = 0.8f;
	default m_ProjectileSpeedMin = 100.0;
	default m_ProjectileSpeedMax = 1800.0; //2200
    default m_ProjectileRotator = FVector(300, -300, 0);
}

UCLASS()
class UComboAttackConfig_Golem_Stone_Grenade : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Stone_Grenade::StaticClass();
	default m_GA_Attack = UGA_AttackThrow::StaticClass();
}

///
// GRENADE END
///

UCLASS()
class UAttackMeleeConfig_Golem_Stone_TestIdle : UAttackMeleeConfig
{
	default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Placeholders/PH_StoneGolem_Idle_N_Combat_Breath_Montage.PH_StoneGolem_Idle_N_Combat_Breath_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}
UCLASS()
class UComboAttackConfig_Golem_Stone_TestIdle : UComboAttackConfigScript
{
	default m_MetaData = UAttackMeleeConfig_Golem_Stone_TestIdle::StaticClass();
	default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Golem_Stone : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Stone_Golem/Stone_Golem_AnimBP.Stone_Golem_AnimBP_C'";
	
    
    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Idles/Breaker/A_StoneGolem_IdleBreaker_01.A_StoneGolem_IdleBreaker_01'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Idles/Breaker/A_StoneGolem_IdleBreaker_02.A_StoneGolem_IdleBreaker_02'", 0.9f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Idles/Breaker/A_StoneGolem_IdleBreaker_03.A_StoneGolem_IdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Idles/Breaker/A_StoneGolem_IdleBreaker_04.A_StoneGolem_IdleBreaker_04'", 0.7f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Idles/Breaker/A_StoneGolem_IdleBreaker_05.A_StoneGolem_IdleBreaker_05'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Idles/Breaker/A_StoneGolem_IdleBreaker_06.A_StoneGolem_IdleBreaker_06'", 0.3f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Idles/Breaker/A_StoneGolem_IdleBreaker_07.A_StoneGolem_IdleBreaker_07'", 0.5f, 1);
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Breaker/A_StoneGolem_WalkBreaker_01.A_StoneGolem_WalkBreaker_01'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Breaker/A_StoneGolem_WalkBreaker_02.A_StoneGolem_WalkBreaker_02'", 0.9f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Breaker/A_StoneGolem_WalkBreaker_03.A_StoneGolem_WalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Breaker/A_StoneGolem_WalkBreaker_04.A_StoneGolem_WalkBreaker_04'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Movement/Grounded/N/Breaker/A_StoneGolem_WalkBreaker_05.A_StoneGolem_WalkBreaker_05'", 0.4f, 1);
    

   // TURNS
   default m_TurnsData = UTurnsData_Golem_Stone::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Golem_Stone::StaticClass();
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Golem_Stone_Combat : UWeaponMeleeItemAnimConfig
{
	default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Stone_Golem/Stone_Golem_AnimBP_Combat.Stone_Golem_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Idles/Breaker/A_StoneGolem_CombatIdleBreaker_01.A_StoneGolem_CombatIdleBreaker_01'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Idles/Breaker/A_StoneGolem_CombatIdleBreaker_02.A_StoneGolem_CombatIdleBreaker_02'", 0.8f, 1); 
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Idles/Breaker/A_StoneGolem_CombatIdleBreaker_03.A_StoneGolem_CombatIdleBreaker_03'", 0.5f, 1); 
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Idles/Breaker/A_StoneGolem_CombatIdleBreaker_04.A_StoneGolem_CombatIdleBreaker_04'", 0.4f, 1); 
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Idles/Breaker/A_StoneGolem_CombatIdleBreaker_05.A_StoneGolem_CombatIdleBreaker_05'", 0.5f, 1);     
    
    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Breaker/A_StoneGolem_CombatWalkBreaker_01.A_StoneGolem_CombatWalkBreaker_01'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Breaker/A_StoneGolem_CombatWalkBreaker_02.A_StoneGolem_CombatWalkBreaker_02'", 0.9f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Breaker/A_StoneGolem_CombatWalkBreaker_03.A_StoneGolem_CombatWalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Breaker/A_StoneGolem_CombatWalkBreaker_04.A_StoneGolem_CombatWalkBreaker_04'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Movement/Grounded/N/Breaker/A_StoneGolem_CombatWalkBreaker_05.A_StoneGolem_CombatWalkBreaker_05'", 0.3f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Golem_Stone_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_Golem_Stone::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =      UComboAttackConfig_Golem_Stone_Grenade::StaticClass();
    // default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UComboAttackConfig_Golem_Stone_Wave::StaticClass();
	default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Golem_Stone_L_R02::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Golem_Stone_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UComboAttackConfig_Golem_Stone_StoneWave::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =      UComboAttackConfig_Golem_Stone_TestIdle::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Golem_Stone::StaticClass();
    // 

    // // DODGES
    // default m_DodgesData = UDodgesData_Golem_Stone::StaticClass();
    //

        // TAUNTS
    default m_TauntData = UTauntData_Golem_Stone::StaticClass(); 
}

UCLASS()
class UProjectile_Golem_Stone_Rock : UItemAnimConfig
{
    default m_EquipData = UEquipData_Golem_Stone_Rock::StaticClass();
}

UCLASS()
class UProjectile_Golem_Stone_Wave : UItemAnimConfig //Placeholder, waiting to use the real attack
{
    default m_EquipData = UEquipData_Golem_Stone_Wave::StaticClass();
}

UCLASS()
class UAnimConfig_Golem_Stone : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Golem_Stone::StaticClass());

	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Golem_Stone_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile_Right, UProjectile_Golem_Stone_Rock::StaticClass());

    default AddAnimForItem(GameplayTag::Spell_StoneWave, UStoneWave_StoneGolem::StaticClass());
    default AddAnimForItem(GameplayTag::Spell_Teleport_StoneGolem, UTeleport_StoneGolem::StaticClass());
}

UCLASS()
class  UStoneWave_StoneGolem : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Spells/StoneWave/Golem_Stone_Wave_Cast_Montage.Golem_Stone_Wave_Cast_Montage'";
    default m_CastEndMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Spells/StoneWave/Golem_Stone_Wave_Cast_Montage.Golem_Stone_Wave_Cast_Montage'";
    //default m_CastFailMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Spells/StoneWave/Golem_Stone_Wave_Failure_Montage.Golem_Stone_Wave_Failure_Montage'";
}

UCLASS()
class  UTeleport_StoneGolem : UGenericRune_Human
{
    default m_CastMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Spells/Teleport/StoneGolem_TeleportAttack_In_01_Montage.StoneGolem_TeleportAttack_In_01_Montage'";
    default m_LaunchMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Spells/Teleport/StoneGolem_TeleportAttack_Out_01_Montage.StoneGolem_TeleportAttack_Out_01_Montage'";

}
