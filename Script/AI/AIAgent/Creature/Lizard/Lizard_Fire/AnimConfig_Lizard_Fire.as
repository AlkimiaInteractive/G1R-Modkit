
//////////////////
UCLASS()
class UAttackMeleeConfig_Lizard_Fire_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Attacks/Lizard_Fire_BottomAttack01_Montage.Lizard_Fire_BottomAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Parried/A_Lizard_Fire_N_Hit_Parried_Bottom_Montage.A_Lizard_Fire_N_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Deflected/A_Lizard_Fire_HitDeflected_Bottom_Montage.A_Lizard_Fire_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 2.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lizard_Fire_Attack_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Attacks/A_Lizard_Fire_RightAttack01_Montage.A_Lizard_Fire_RightAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Parried/A_Lizard_Fire_N_Hit_Parried_Right_Montage.A_Lizard_Fire_N_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Deflected/A_Lizard_Fire_HitDeflected_Right_Montage.A_Lizard_Fire_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 2.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lizard_Fire_Attack_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Attacks/Lizard_Fire_LeftAttack01_Montage.Lizard_Fire_LeftAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Parried/A_Lizard_Fire_N_Hit_Parried_Left_Montage.A_Lizard_Fire_N_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Deflected/A_Lizard_Fire_HitDeflected_L_Montage.A_Lizard_Fire_HitDeflected_L_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 2.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Lizard_Fire_Attack_Top : UAttackConeLoopConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Attacks/Lizard_Fire_Flamethrower_Montage.Lizard_Fire_Flamethrower_Montage'";
   
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 60.0f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 60.0f);
	default m_SuperArmorDamageMultiplier = 0.0f;

    default m_ConeLengthMeters = 700.0f;
    default m_ConeAngleDegrees = 10.0f;
    default m_ConeLengthSpeed = 665.f;

    default m_AIMaxSeconds = 5.0f;
    default m_PlayerSeconds = 5.0f;
}

///////////////////
///PRIME
//////////////////
UCLASS()
class UAttackMeleeConfig_Lizard_Fire_Attack_Bottom_Prime : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Attacks/AttacksPrime/Lizard_Fire_BottomAttack01_Prime_Montage.Lizard_Fire_BottomAttack01_Prime_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Parried/A_Lizard_Fire_N_Hit_Parried_Bottom_Montage.A_Lizard_Fire_N_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Deflected/A_Lizard_Fire_HitDeflected_Bottom_Montage.A_Lizard_Fire_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 2.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lizard_Fire_Attack_Right_Prime : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Attacks/AttacksPrime/A_Lizard_Fire_RightAttack01_Prime_Montage.A_Lizard_Fire_RightAttack01_Prime_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Parried/A_Lizard_Fire_N_Hit_Parried_Right_Montage.A_Lizard_Fire_N_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Deflected/A_Lizard_Fire_HitDeflected_Right_Montage.A_Lizard_Fire_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 2.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lizard_Fire_Attack_Left_Prime : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Attacks/AttacksPrime/Lizard_Fire_LeftAttack01_Prime_Montage1.Lizard_Fire_LeftAttack01_Prime_Montage1'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Parried/A_Lizard_Fire_N_Hit_Parried_Left_Montage.A_Lizard_Fire_N_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Deflected/A_Lizard_Fire_HitDeflected_L_Montage.A_Lizard_Fire_HitDeflected_L_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 2.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Lizard_Fire_Attack_Top_Prime : UAttackConeLoopConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Attacks/Lizard_Fire_Flamethrower_Montage.Lizard_Fire_Flamethrower_Montage'";
   
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Elemental_Fire, 80.0f);
	default m_SuperArmorDamageMultiplier = 0.0f;

    default m_ConeLengthMeters = 700.0f;
    default m_ConeAngleDegrees = 10.0f;
    default m_ConeLengthSpeed = 665.f;

    default m_AIMaxSeconds = 5.0f;
    default m_PlayerSeconds = 5.0f;
}
////////////////////////

UCLASS()
class UAttackMeleeConfig_Lizard_Fire_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/MoveBack/A_Lizard_Fire_Combat_MoveBack_Montage.A_Lizard_Fire_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Lizard_Fire_Attack_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_Attack_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_Fire_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_Fire_Attack_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_Attack_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

///////////////////////////
///PRIME
UCLASS()
class UComboAttackConfig_Lizard_Fire_Attack_Right_Prime : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_Attack_Right_Prime::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_Fire_Attack_Bottom_Prime : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_Attack_Bottom_Prime::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_Fire_Attack_Left_Prime : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_Attack_Left_Prime::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_Fire_Attack_Top_Prime : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_Attack_Top_Prime::StaticClass();
    default m_GA_Attack = UGA_FireLizard_Flamethrower::StaticClass();
}
////////////////

UCLASS()
class UComboAttackConfig_Lizard_Fire_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_Attack_Top::StaticClass();
    default m_GA_Attack = UGA_FireLizard_Flamethrower::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_Fire_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Fire_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

///////////////////////

UCLASS()
class UWeaponMeleeItemAnimConfig_Lizard_Fire : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lizard_Fire/Lizard_Fire_AnimBP.Lizard_Fire_AnimBP_C'";

    // IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Idles/Breaker/A_Lizard_Fire_IdleBreaker_01.A_Lizard_Fire_IdleBreaker_01'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Idles/Breaker/A_Lizard_Fire_IdleBreaker_02.A_Lizard_Fire_IdleBreaker_02'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Idles/Breaker/A_Lizard_Fire_IdleBreaker_03.A_Lizard_Fire_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Idles/Breaker/A_Lizard_Fire_IdleBreaker_04.A_Lizard_Fire_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Idles/Breaker/A_Lizard_Fire_IdleBreaker_05.A_Lizard_Fire_IdleBreaker_05'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Idles/Breaker/A_Lizard_Fire_IdleBreaker_06.A_Lizard_Fire_IdleBreaker_06'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Idles/Breaker/A_Lizard_Fire_IdleBreaker_07.A_Lizard_Fire_IdleBreaker_07'", 0.6f, 1);

    // WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Grounded/N/Breaker/A_Lizard_Fire_WalkBreaker_01.A_Lizard_Fire_WalkBreaker_01'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Grounded/N/Breaker/A_Lizard_Fire_WalkBreaker_02.A_Lizard_Fire_WalkBreaker_02'", 0.4f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Grounded/N/Breaker/A_Lizard_Fire_WalkBreaker_03.A_Lizard_Fire_WalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Grounded/N/Breaker/A_Lizard_Fire_WalkBreaker_04.A_Lizard_Fire_WalkBreaker_04'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Grounded/N/Breaker/A_Lizard_Fire_WalkBreaker_05.A_Lizard_Fire_WalkBreaker_05'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Grounded/N/Breaker/A_Lizard_Fire_WalkBreaker_06.A_Lizard_Fire_WalkBreaker_06'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Movement/Grounded/N/Breaker/A_Lizard_Fire_WalkBreaker_07.A_Lizard_Fire_WalkBreaker_07'", 0.6f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Lizard_Fire::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Lizard_Fire::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Lizard_Fire::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Lizard_Fire_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lizard_Fire/Lizard_Fire_AnimBP_Combat.Lizard_Fire_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_01.A_Lizard_Fire_CombatIdleBreaker_01'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_02.A_Lizard_Fire_CombatIdleBreaker_02'", 0.7f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_03.A_Lizard_Fire_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_04.A_Lizard_Fire_CombatIdleBreaker_04'", 0.4f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_05.A_Lizard_Fire_CombatIdleBreaker_05'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_06.A_Lizard_Fire_CombatIdleBreaker_06'", 0.6f, 2);

    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_01.A_Lizard_Fire_CombatWalkBreaker_01'", 0.9f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_02.A_Lizard_Fire_CombatWalkBreaker_02'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_03.A_Lizard_Fire_CombatWalkBreaker_03'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_04.A_Lizard_Fire_CombatWalkBreaker_04'", 0.4f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_05.A_Lizard_Fire_CombatWalkBreaker_05'", 0.4f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_06.A_Lizard_Fire_CombatWalkBreaker_06'", 0.6f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Lizard_Fire_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Lizard_Fire::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Lizard_Fire_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =  UComboAttackConfig_Lizard_Fire_Attack_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =  UComboAttackConfig_Lizard_Fire_Attack_Top::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =  UComboAttackConfig_Lizard_Fire_Attack_Right::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =  UComboAttackConfig_Lizard_Fire_MoveBwd::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Default_Lizard_Fire::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Lizard_Fire::StaticClass();
    //
    
    // TAUNTS
    default m_TauntData = UTauntData_Lizard_Fire::StaticClass(); 
    //

    default m_ConsumablesData = UConsumablesData_Lizard_Fire_Combat::StaticClass();
}

////////////////////////
///PRIME

UCLASS()
class UWeaponMeleeItemAnimConfig_Lizard_Fire_Prime_Combat : UWeaponMeleeItemAnimConfig
{
     default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lizard_Fire/Lizard_Fire_AnimBP_Combat.Lizard_Fire_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_01.A_Lizard_Fire_CombatIdleBreaker_01'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_02.A_Lizard_Fire_CombatIdleBreaker_02'", 0.7f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_03.A_Lizard_Fire_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_04.A_Lizard_Fire_CombatIdleBreaker_04'", 0.4f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_05.A_Lizard_Fire_CombatIdleBreaker_05'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Idles/Breaker/A_Lizard_Fire_CombatIdleBreaker_06.A_Lizard_Fire_CombatIdleBreaker_06'", 0.6f, 2);

    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_01.A_Lizard_Fire_CombatWalkBreaker_01'", 0.9f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_02.A_Lizard_Fire_CombatWalkBreaker_02'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_03.A_Lizard_Fire_CombatWalkBreaker_03'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_04.A_Lizard_Fire_CombatWalkBreaker_04'", 0.4f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_05.A_Lizard_Fire_CombatWalkBreaker_05'", 0.4f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Movement/Grounded/N/Breaker/A_Lizard_Fire_CombatWalkBreaker_06.A_Lizard_Fire_CombatWalkBreaker_06'", 0.6f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Lizard_Fire_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Lizard_Fire::StaticClass();
        // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Lizard_Fire_Attack_Bottom_Prime::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =  UComboAttackConfig_Lizard_Fire_Attack_Left_Prime::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =  UComboAttackConfig_Lizard_Fire_Attack_Top_Prime::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =  UComboAttackConfig_Lizard_Fire_Attack_Right_Prime::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =  UComboAttackConfig_Lizard_Fire_MoveBwd::StaticClass();
     //

	// HITS
    default m_HitsData = UHitData_Default_Lizard_Fire::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Lizard_Fire::StaticClass();
    //
    
    // TAUNTS
    default m_TauntData = UTauntData_Lizard_Fire::StaticClass(); 
    //
}

UCLASS()
class UItemAnimConfig_Lizard_Fire : UItemAnimConfig
{
    // HITS
    default m_HitsData = UHitData_Default_Lizard_Fire::StaticClass();
    //
}

UCLASS()
class UIKConfig_Lizard_Fire : UIKConfig_Quadruped_Generic
{
    default m_UpSpeed = 45.0f;
    default m_DownSpeed = 30.0f;
    default m_UpTraceDistance = 50.0f;
    
    default m_HipNTailRayLength = 70.0f;
    default m_MaxYawRotation = 65.0f;
}

UCLASS()
class ULocoBlendCurvesConfig_Lizard_Fire : ULocoBlendCurvesConfig_Creature
{
    default m_StrideBlendNRun = n"CurveFloat'/Game/AnimLibrary/Creatures/Lizard/Data/StrideBlend_N_Run_Lizard.StrideBlend_N_Run_Lizard'";
}
UCLASS()
class UAnimConfig_Lizard_Fire : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Lizard_Fire::StaticClass();
    default m_IKConfig = UIKConfig_Lizard_Fire::StaticClass();

    //default SetDefaultMovementAnimData(UItemAnimConfig_Lizard_Fire::StaticClass());

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Lizard_Fire_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Lizard_Fire_Eat_Meatbug::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Lizard_Fire::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Lizard_Fire_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Lizard_Fire_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Lizard_Fire_Combat::StaticClass());
}

UCLASS()
class UAnimConfig_Lizard_Fire_Prime : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Lizard_Fire::StaticClass();
    default m_IKConfig = UIKConfig_Lizard_Fire::StaticClass();

    //default SetDefaultMovementAnimData(UItemAnimConfig_Lizard_Fire::StaticClass());

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Lizard_Fire_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Lizard_Fire::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Lizard_Fire_Prime_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Lizard_Fire_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Lizard_Fire_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Lizard_Fire_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Actions/LizardFire_Montage_EatItem.LizardFire_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_Lizard_Fire_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Actions/LizardFire_Montage_EatMeatbug.LizardFire_Montage_EatMeatbug'";
}