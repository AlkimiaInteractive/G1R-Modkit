
//////////////////
UCLASS()
class UAttackMeleeConfig_Molerat_Attack_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Attacks/Molerat_TopAttack01_Montage.Molerat_TopAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Parried/Molerat_N_Hit_Parried_Top_Montage.Molerat_N_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Deflected/Molerat_N_HitDeflected_Top_Montage.Molerat_N_HitDeflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Molerat_Attack_Top2 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Attacks/Molerat_TopAttack02_Montage.Molerat_TopAttack02_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Parried/Molerat_N_Hit_Parried_Top_Montage.Molerat_N_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Deflected/Molerat_N_HitDeflected_Top_Montage.Molerat_N_HitDeflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Molerat_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Molerat_Attack_Top::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Molerat_Attack_Top2 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Molerat_Attack_Top2::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

//Dig attack
UCLASS()
class UAttackMeleeConfig_Molerat_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Attacks/A_Molerat_Attack_Dig_Montage.A_Molerat_Attack_Dig_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Parried/A_Molerat_N_Hit_Parried_Dig_Montage.A_Molerat_N_Hit_Parried_Dig_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/Hits/Deflected/A_Molerat_N_HitDeflected_Dig_Montage.A_Molerat_N_HitDeflected_Dig_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Molerat_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Molerat_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackDig::StaticClass();
}

UCLASS()
class UAttackMeleeConfig_Molerat_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Combat/MoveBack/A_Molerat_Combat_MoveBack_Montage.A_Molerat_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Molerat_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Molerat_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UIKConfig_Molerat : UIKConfig_Quadruped_Generic
{
    default m_UpTraceDistance =40.0f;
    default m_DownTraceDistance = 40.0f;

    default m_HipNTailRayLength = 70.0f;
    default m_MaxYawRotation = 65.0f;
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Molerat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Molerat/Molerat_AnimBP.Molerat_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_01.A_Molerat_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_02.A_Molerat_IdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_03.A_Molerat_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_04.A_Molerat_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Idles/Breaker/A_Molerat_IdleBreaker_05.A_Molerat_IdleBreaker_05'", 2.0f, 3);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Breaker/A_Molerat_WalkBreaker_01.A_Molerat_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Breaker/A_Molerat_WalkBreaker_02.A_Molerat_WalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Breaker/A_Molerat_WalkBreaker_03.A_Molerat_WalkBreaker_03'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Breaker/A_Molerat_WalkBreaker_04.A_Molerat_WalkBreaker_04'", 1.0f, 4);

    // TURNS
    default m_TurnsData = UTurnsData_Molerat::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Molerat::StaticClass();
    // 

    default m_ConsumablesData = UConsumablesData_Molerat::StaticClass();
}


UCLASS()
class UWeaponMeleeItemAnimConfig_Molerat_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Molerat/Molerat_AnimBP_Combat.Molerat_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Idles/Breaker/A_Molerat_CombatIdleBreaker_01.A_Molerat_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Idles/Breaker/A_Molerat_CombatIdleBreaker_02.A_Molerat_CombatIdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Idles/Breaker/A_Molerat_CombatIdleBreaker_03.A_Molerat_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Idles/Breaker/A_Molerat_CombatIdleBreaker_04.A_Molerat_CombatIdleBreaker_04'", 1.0f, 2);

    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Breaker/A_Molerat_CombatWalkBreaker_01.A_Molerat_CombatWalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Breaker/A_Molerat_CombatWalkBreaker_02.A_Molerat_CombatWalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Breaker/A_Molerat_CombatWalkBreaker_03.A_Molerat_CombatWalkBreaker_03'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Breaker/A_Molerat_CombatWalkBreaker_04.A_Molerat_CombatWalkBreaker_04'", 1.0f, 4);

    // TURNS
    default m_TurnsData = UTurnsData_Molerat_Combat::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 15.0f;
    default m_RotateSpeedReorient = 180.f;
    default m_AttackRotateSpeedManualReorient = 180.f;
    
    // Equip
    default m_EquipData = UEquipData_Molerat::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_Molerat_Attack_Top::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Molerat_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =   UComboAttackConfig_Molerat_Attack_Top2::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =   UComboAttackConfig_Molerat_Attack_Top2::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =   UComboAttackConfig_Molerat_MoveBwd::StaticClass(); 
    //

	// HITS
    default m_HitsData = UHitData_Default_Molerat::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Molerat::StaticClass();
    //
    
    // TAUNTS
    default m_TauntData = UTauntData_Molerat::StaticClass();

    default m_ConsumablesData = UConsumablesData_Molerat_Combat::StaticClass();
}

UCLASS()
class UAnimConfig_Molerat : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Molerat::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Molerat_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Molerat_Eat_Meatbug::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Molerat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Molerat_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Molerat_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Molerat_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Molerat_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_EatItem_Montage.Molerat_EatItem_Montage'";
}

UCLASS()
class UInteractAnimConfig_Molerat_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_EatMeatbug_Montage.Molerat_EatMeatbug_Montage'";
}