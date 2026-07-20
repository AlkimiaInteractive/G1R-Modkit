UCLASS()
class UAttackMeleeConfig_Biter_Attack_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Attacks/Biter_AttackLeft_Montage.Biter_AttackLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Parried/A_Biter_Hit_Parried_Left_Montage.A_Biter_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Deflected/A_Biter_HitDeflected_Left_Montage.A_Biter_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Biter_Attack_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Attacks/Biter_AttackRight_Montage.Biter_AttackRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Parried/A_Biter_Hit_Parried_Right_Montage.A_Biter_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Deflected/A_Biter_HitDeflected_Right_Montage.A_Biter_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Biter_Attack_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Attacks/Biter_AttackTop_Montage.Biter_AttackTop_Montage'";
    // default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Parried/A_Biter_Hit_Parried_Charge_L_Montage.A_Biter_Hit_Parried_Charge_L_Montage'";
    // default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/Hits/Deflected/A_Biter_HitDeflected_Top_Montage.A_Biter_HitDeflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_Biter_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Combat/MoveBack/A_Biter_Combat_MoveBack_Montage.A_Biter_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Biter_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Biter_Attack_Top::StaticClass();
    default m_GA_Attack = UGA_AttackCharge::StaticClass();
}

UCLASS()
class UComboAttackConfig_Biter_Attack_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Biter_Attack_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Biter_Attack_Right::StaticClass());
}

UCLASS()
class UComboAttackConfig_Biter_Attack_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Biter_Attack_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Biter_Attack_Left::StaticClass());
}

UCLASS()
class UComboAttackConfig_Biter_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Biter_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Biter : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Biter/Biter_AnimBP.Biter_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Idles/Breaker/A_Biter_IdleBreaker_01.A_Biter_IdleBreaker_01'", 0.5f, 1);
    //default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Idles/Breaker/A_Biter_IdleBreaker_02.A_Biter_IdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Idles/Breaker/A_Biter_IdleBreaker_03.A_Biter_IdleBreaker_03'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Idles/Breaker/A_Biter_IdleBreaker_04.A_Biter_IdleBreaker_04'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Idles/Breaker/A_Biter_IdleBreaker_05.A_Biter_IdleBreaker_05'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Idles/Breaker/A_Biter_IdleBreaker_06.A_Biter_IdleBreaker_06'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Idles/Breaker/A_Biter_IdleBreaker_07.A_Biter_IdleBreaker_07'", 0.4f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Breaker/A_Biter_WalkBreaker_01.A_Biter_WalkBreaker_01'", 0.5f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Breaker/A_Biter_WalkBreaker_02.A_Biter_WalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Breaker/A_Biter_WalkBreaker_03.A_Biter_WalkBreaker_03'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Breaker/A_Biter_WalkBreaker_04.A_Biter_WalkBreaker_04'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Breaker/A_Biter_WalkBreaker_05.A_Biter_WalkBreaker_05'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Breaker/A_Biter_WalkBreaker_06.A_Biter_WalkBreaker_06'", 0.6f, 1);

   // TURNS
   default m_TurnsData = UTurnsData_Biter::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Biter::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Biter::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Biter_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Biter/Biter_AnimBP_Combat.Biter_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Idles/Breaker/A_Biter_CombatIdleBreaker_01.A_Biter_CombatIdleBreaker_01'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Idles/Breaker/A_Biter_CombatIdleBreaker_02.A_Biter_CombatIdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Idles/Breaker/A_Biter_CombatIdleBreaker_03.A_Biter_CombatIdleBreaker_03'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Idles/Breaker/A_Biter_CombatIdleBreaker_04.A_Biter_CombatIdleBreaker_04'", 0.4f, 2);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Breaker/A_Biter_CombatWalkBreaker_01.A_Biter_CombatWalkBreaker_01'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Breaker/A_Biter_CombatWalkBreaker_02.A_Biter_CombatWalkBreaker_02'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Breaker/A_Biter_CombatWalkBreaker_03.A_Biter_CombatWalkBreaker_03'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Breaker/A_Biter_CombatWalkBreaker_04.A_Biter_CombatWalkBreaker_04'", 0.4f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_Biter_Combat::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 270.0f;
    default m_RotateSpeedMagnetAI = 320.0f;
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_Biter::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_Biter_Attack_Top::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UComboAttackConfig_Biter_Attack_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =     UComboAttackConfig_Biter_Attack_Right::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =     UComboAttackConfig_Biter_MoveBwd::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Biter::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Biter::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Biter::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_Biter_Combat::StaticClass();
}

UCLASS()
class UAnimConfig_Biter : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Razor_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Biter::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Biter_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Biter_Eat_Meatbug::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Biter::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Biter_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Biter_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Biter_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Biter_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Actions/Biter_EatItem_Montage.Biter_EatItem_Montage'";
}

UCLASS()
class UInteractAnimConfig_Biter_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Actions/Biter_EatMeatbug_Montage.Biter_EatMeatbug_Montage'";
}