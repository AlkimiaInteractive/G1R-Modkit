// WEAPON MELEE
UCLASS()
class UAttackMeleeConfig_CorKalomDemon_Sleeper_L01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/FireDemon_ScratchLeft_Montage.FireDemon_ScratchLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Parried/A_FireDemon_Hit_Parried_Left_Montage.A_FireDemon_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Deflected/A_FireDemon_HitDeflected_Left_Montage.A_FireDemon_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_CorKalomDemon_Sleeper_R01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/FireDemon_ScratchRight_Montage.FireDemon_ScratchRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Parried/A_FireDemon_Hit_Parried_Right_Montage.A_FireDemon_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Deflected/A_FireDemon_HitDeflected_Right_Montage.A_FireDemon_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_CorKalomDemon_Sleeper_T01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_FinisherUpper_Montage.A_FireDemon_FinisherUpper_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Parried/A_FireDemon_Hit_Parried_Top_Montage.A_FireDemon_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Deflected/A_FireDemon_HitDeflected_Top_Montage.A_FireDemon_HitDeflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 5.0f;
}

UCLASS()
class UAttackMeleeConfig_CorKalomDemon_Sleeper_Charge : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Charge_Montage.A_FireDemon_Charge_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 5.0f;
}

UCLASS()
class UAttackMeleeConfig_CorKalomDemon_Sleeper_Explosion : UAttackSpawnActorConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/Lord/A_LordDemon_FireExplosion_Montage.A_LordDemon_FireExplosion_Montage'";

    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 3000.0f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 3000.0f);
    default m_SuperArmorDamageMultiplier = 500.0f;
    default m_CanKnockback = true;
    
    default m_ActorClass = n"Blueprint'/Game/Items/Magic/LordDemon/FireExplosion/BP_LordDemon_FireExplosion.BP_LordDemon_FireExplosion_C'";
    default m_SocketName = n"armorfront";
}

UCLASS()
class UAttackMeleeConfig_CorKalomDemon_Sleeper_HellArms_BreachZigZag : UAttackSpawnActorConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/Lord/A_LordDemon_HellArms_Summon_Montage.A_LordDemon_HellArms_Summon_Montage'";
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_ActorClass = n"Blueprint'/Game/Items/Magic/CorKalomDemon/BreachZigZag/BP_FireDemon_HellArmsArea_BreachZigZag_CorKalomDemon.BP_FireDemon_HellArmsArea_BreachZigZag_CorKalomDemon_C'";
    //default m_ActorClass = n"Blueprint'/Game/Items/Magic/FireDemon/HellArms/Base/BP_FireDemon_HellArmsArea_Base.BP_FireDemon_HellArmsArea_Base_C'";
}

UCLASS()
class UAttackMeleeConfig_CorKalomDemon_Sleeper_HellArms_Ring : UAttackSpawnActorConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Ring_Montage.A_FireDemon_Ring_Montage'";
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_ActorClass = n"Blueprint'/Game/Items/Magic/FireDemon/HellArms/Ring/BP_FireDemon_HellArmsArea_Ring.BP_FireDemon_HellArmsArea_Ring_C'";
}

UCLASS()
class UAttackMeleeConfig_Pyrolaser : UAttackCapsuleLoopConfig
{
    UPROPERTY()
    float m_MaxRollOffset = 0.f;
    UPROPERTY()
    float m_RotationVelocity = 1.f;
}

UCLASS()
class UAttackMeleeConfig_CorKalomDemon_Sleeper_Laser : UAttackMeleeConfig_Pyrolaser
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/PH_FireDemon_PyroLaser_Montage.PH_FireDemon_PyroLaser_Montage'";
   
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 2.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_CapsuleHalfHeight = 2000.0f;
    default m_CapsuleRadius = 35.0f;
    default m_CapsuleLengthSpeed = 1800.f;
    default m_MaxRollOffset = 0.f;
    default m_RotationVelocity = 50.f;

    default m_AIMaxSeconds = 1.f;
    default m_PlayerSeconds = 1.f;
}


UCLASS()
class UComboAttackConfig_CorKalomDemon_Sleeper_L01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_CorKalomDemon_Sleeper_L01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_CorKalomDemon_Sleeper_R01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_CorKalomDemon_Sleeper_R01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_CorKalomDemon_Sleeper_T01::StaticClass());
}

UCLASS()
class UComboAttackConfig_CorKalomDemon_Sleeper_R01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_CorKalomDemon_Sleeper_R01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_CorKalomDemon_Sleeper_L01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_CorKalomDemon_Sleeper_L01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_CorKalomDemon_Sleeper_T01::StaticClass());
}

UCLASS()
class UComboAttackConfig_CorKalomDemon_Sleeper_T01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_CorKalomDemon_Sleeper_T01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass(); 
}

UCLASS()
class UComboAttackConfig_CorKalomDemon_Sleeper_Charge : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_CorKalomDemon_Sleeper_Charge::StaticClass();
    // default m_GA_Attack = UGA_AttackMelee::StaticClass();
    default m_GA_Attack = UGA_AttackCharge::StaticClass();
}

UCLASS()
class UComboAttackConfig_CorKalomDemon_Sleeper_Explosion : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_CorKalomDemon_Sleeper_Explosion::StaticClass();
    default m_GA_Attack = UGA_FireDemon_FireExplosion::StaticClass();
}

UCLASS()
class UComboAttackConfig_CorKalomDemon_Sleeper_HellArms_BreachZigZag : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_CorKalomDemon_Sleeper_HellArms_BreachZigZag::StaticClass();
    default m_GA_Attack = UGA_FireDemon_HellArmsArea_BreachZigZag::StaticClass();
}

UCLASS()
class UComboAttackConfig_CorKalomDemon_Sleeper_HellArms_Ring : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_CorKalomDemon_Sleeper_HellArms_Ring::StaticClass();
    default m_GA_Attack = UGA_FireDemon_HellArmsArea_Ring::StaticClass();
}

UCLASS()
class UComboAttackConfig_CorKalomDemon_Sleeper_Fire_Laser : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_CorKalomDemon_Sleeper_Laser::StaticClass();
	default m_GA_Attack = UGA_LordDemon_Pyrolaser::StaticClass();
}



// General
UCLASS()
class UWeaponMeleeItemAnimConfig_CorKalomDemon_Sleeper : UItemAnimConfig
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
    default m_HitsData = UHitData_CorKalomDemon_Sleeper::StaticClass();
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_CorKalomDemon_Sleeper_Combat : UWeaponMeleeItemAnimConfig
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
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_FireDemon::StaticClass();
   
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UComboAttackConfig_CorKalomDemon_Sleeper_R01::StaticClass();//UComboAttackConfig_LordDemon_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UComboAttackConfig_CorKalomDemon_Sleeper_L01::StaticClass();//UComboAttackConfig_LordDemon_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UComboAttackConfig_CorKalomDemon_Sleeper_T01::StaticClass();//UComboAttackConfig_LordDemon_T01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_CorKalomDemon_Sleeper_Charge::StaticClass();//   UComboAttackConfig_LordDemon_Charge::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =    UComboAttackConfig_CorKalomDemon_Sleeper_HellArms_BreachZigZag::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =    UComboAttackConfig_CorKalomDemon_Sleeper_Explosion::StaticClass();
    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =    UComboAttackConfig_LordDemon_HellArms_Ring::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =    UComboAttackConfig_CorKalomDemon_Sleeper_Fire_Laser::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra04) =    UComboAttackConfig_Demon_Fire_Fireball_R::StaticClass();


    
    //

	// HITS
    default m_HitsData = UHitData_CorKalomDemon_Sleeper::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Demon::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Demon_Kalom::StaticClass();
}

UCLASS()
class UHitData_CorKalomDemon_Sleeper : UHitData_Default_Demon_Kalom
{
    default EmptyDeathArray();
    default AddDeath(n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Hits/Defeated/Lord/A_LordDemon_SleeperAltar_Defeat_Start_Montage.A_LordDemon_SleeperAltar_Defeat_Start_Montage'");
}

UCLASS()
class UAnimConfig_CorKalomDemon_Sleeper : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_CorKalomDemon_Sleeper::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Claw, UWeaponMeleeItemAnimConfig_CorKalomDemon_Sleeper_Combat::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Projectile_Right, UProjectile_Demon_Fire_Projectile_R::StaticClass());
    //default AddAnimForItem(GameplayTag::Spell_MagicBeam, UProjectile_Demon_Fire_Laser::StaticClass());
}

