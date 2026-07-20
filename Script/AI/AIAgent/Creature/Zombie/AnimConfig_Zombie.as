UCLASS()
class UAttackMeleeConfig_Zombie_AttackRight : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Attacks/Zombie_ScratchRight_Montage.Zombie_ScratchRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Hits/Parried/A_Zombie_Hit_Parried_Right_Montage.A_Zombie_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Hits/Deflected/A_Zombie_HitDeflected_Right_Montage.A_Zombie_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Zombie_AttackRight : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Zombie_AttackRight::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Zombie_AttackLeft::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Zombie_AttackLeft::StaticClass());
}

UCLASS()
class UAttackMeleeConfig_Zombie_AttackLeft : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Attacks/Zombie_ScratchLeft_Montage.Zombie_ScratchLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Hits/Parried/A_Zombie_Hit_Parried_Left_Montage.A_Zombie_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/Combat/Hits/Deflected/A_Zombie_HitDeflected_Left_Montage.A_Zombie_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Zombie_AttackLeft : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Zombie_AttackLeft::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Zombie_AttackRight::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Zombie_AttackRight::StaticClass());
}


UCLASS()
class UWeaponMeleeItemAnimConfig_Zombie : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Zombie/Zombie_AnimBP.Zombie_AnimBP_C'";
	
    //IDLE BREAKERS
    //default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Idles/Breaker/A_Zombie_IdleBreaker_01.A_Zombie_IdleBreaker_01'", 0.4f, 1);
    
    //WALK BREAKERS
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Movement/Grounded/N/Breaker/A_Zombie_WalkBreaker_01.A_Zombie_WalkBreaker_01'", 0.4f, 1);
    

   // TURNS
   default m_TurnsData = UTurnsData_Zombie::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Zombie::StaticClass();
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Zombie_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Zombie/Zombie_AnimBP_Combat.Zombie_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Idles/Breaker/A_Zombie_CombatIdleBreaker_01.A_Zombie_CombatIdleBreaker_01'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Idles/Breaker/A_Zombie_CombatIdleBreaker_02.A_Zombie_CombatIdleBreaker_02'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Idles/Breaker/A_Zombie_CombatIdleBreaker_03.A_Zombie_CombatIdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Idles/Breaker/A_Zombie_CombatIdleBreaker_04.A_Zombie_CombatIdleBreaker_04'", 0.4f, 1);
    
    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Breaker/A_Zombie_CombatWalkBreaker_01.A_Zombie_CombatWalkBreaker_01'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Breaker/A_Zombie_CombatWalkBreaker_02.A_Zombie_CombatWalkBreaker_02'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Breaker/A_Zombie_CombatWalkBreaker_03.A_Zombie_CombatWalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Zombie/Combat/Movement/Grounded/N/Breaker/A_Zombie_CombatWalkBreaker_04.A_Zombie_CombatWalkBreaker_04'", 0.4f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Zombie_Combat::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 360.0f;
    
    // Equip
    default m_EquipData = UEquipData_Zombie::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Zombie_AttackLeft::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Zombie_AttackRight::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Zombie::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Zombie::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Zombie::StaticClass();
}

UCLASS()
class UAnimConfig_Zombie : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Zombie::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Claw, UWeaponMeleeItemAnimConfig_Zombie_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Zombie_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Zombie_Combat::StaticClass());

}