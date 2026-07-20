
UCLASS()
class UAttackMeleeConfig_Razor_Attack_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Attacks/Razor_AttackBiteLeft_Montage.Razor_AttackBiteLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Parried/Razor_Hit_Parried_Left_Montage.Razor_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Deflected/A_Razor_HitDeflected_Left_Montage.A_Razor_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Razor_Attack_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Attacks/Razor_AttackBiteRight_Montage.Razor_AttackBiteRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Parried/Razor_Hit_Parried_Right_Montage.Razor_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Deflected/A_Razor_HitDeflected_Right_Montage.A_Razor_HitDeflected_Right_Montage'";
	
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Razor_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Attacks/Razor_BottomAttack_Montage.Razor_BottomAttack_Montage'";
    // default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Parried/Razor_Hit_Parried_Charge_Montage.Razor_Hit_Parried_Charge_Montage'";
    // default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/Hits/Deflected/A_Razor_HitDeflected_Charge_Montage.A_Razor_HitDeflected_Charge_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.75f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_Razor_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Combat/MoveBack/A_Razor_Combat_MoveBack_Montage.A_Razor_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Razor_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Razor_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackCharge::StaticClass();
}

UCLASS()
class UComboAttackConfig_Razor_Attack_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Razor_Attack_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Razor_Attack_Right::StaticClass());
}

UCLASS()
class UComboAttackConfig_Razor_Attack_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Razor_Attack_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Razor_Attack_Left::StaticClass());
}

UCLASS()
class UComboAttackConfig_Razor_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Razor_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Razor : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Razor/Razor_AnimBP.Razor_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Idles/Breaker/A_Razor_IdleBreaker_01.A_Razor_IdleBreaker_01'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Idles/Breaker/A_Razor_IdleBreaker_02.A_Razor_IdleBreaker_02'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Idles/Breaker/A_Razor_IdleBreaker_03.A_Razor_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Idles/Breaker/A_Razor_IdleBreaker_04.A_Razor_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Idles/Breaker/A_Razor_IdleBreaker_05.A_Razor_IdleBreaker_05'", 1.0f, 2);
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Grounded/N/Breaker/A_Razor_WalkBreaker_01.A_Razor_WalkBreaker_01'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Grounded/N/Breaker/A_Razor_WalkBreaker_02.A_Razor_WalkBreaker_02'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Grounded/N/Breaker/A_Razor_WalkBreaker_03.A_Razor_WalkBreaker_03'", 0.4f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Movement/Grounded/N/Breaker/A_Razor_WalkBreaker_04.A_Razor_WalkBreaker_04'", 0.8f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Razor::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Razor::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Razor::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Razor_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Razor/Razor_AnimBP_Combat.Razor_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Combat/Movement/Idles/Breaker/A_Razor_CombatIdleBreaker_01.A_Razor_CombatIdleBreaker_01'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Combat/Movement/Idles/Breaker/A_Razor_CombatIdleBreaker_02.A_Razor_CombatIdleBreaker_02'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Combat/Movement/Idles/Breaker/A_Razor_CombatIdleBreaker_03.A_Razor_CombatIdleBreaker_03'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Combat/Movement/Idles/Breaker/A_Razor_CombatIdleBreaker_04.A_Razor_CombatIdleBreaker_04'", 0.4f, 2);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Combat/Movement/Grounded/N/Breaker/A_Razor_CombatWalkBreaker_01.A_Razor_CombatWalkBreaker_01'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Combat/Movement/Grounded/N/Breaker/A_Razor_CombatWalkBreaker_02.A_Razor_CombatWalkBreaker_02'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Combat/Movement/Grounded/N/Breaker/A_Razor_CombatWalkBreaker_03.A_Razor_CombatWalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Razor/Combat/Movement/Grounded/N/Breaker/A_Razor_CombatWalkBreaker_04.A_Razor_CombatWalkBreaker_04'", 1.0f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Razor_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_Razor::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Razor_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UComboAttackConfig_Razor_Attack_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =     UComboAttackConfig_Razor_Attack_Right::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_Razor_Attack_Bottom::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =     UComboAttackConfig_Razor_MoveBwd::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Razor::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Razor::StaticClass();
    //

    // TAUNTS 
    default m_TauntData = UTauntData_Razor::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_Razor_Combat::StaticClass();
}

UCLASS()
class UAnimConfig_Razor : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Razor_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Razor::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Razor_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Razor_Eat_Meatbug::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Razor::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Razor_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Razor_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Razor_Combat::StaticClass());

	//default AddAnimForAction(GameplayTag::Action_Ambient_ScratchEar, UInteractAnimConfig_Goblin_Scratch::StaticClass());
	//default AddAnimForAction(GameplayTag::Action_Ambient_Drink, UInteractAnimConfig_Goblin_Drink::StaticClass());
	//default AddAnimForAction(GameplayTag::Action_Ambient_Howl, UInteractAnimConfig_Goblin_Shout::StaticClass());
	//default AddAnimForAction(GameplayTag::Action_Ambient_Pee, UInteractAnimConfig_Goblin_Pee_Male::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Razor_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Actions/Razor_Montage_EatItem.Razor_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_Razor_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Actions/Razor_Montage_EatMeatbug.Razor_Montage_EatMeatbug'";
}