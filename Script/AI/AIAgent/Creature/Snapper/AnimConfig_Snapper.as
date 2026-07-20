UCLASS()
class UAttackMeleeConfig_Snapper_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Attacks/Snapper_AttackBottom_Montage.Snapper_AttackBottom_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Hits/Parried/A_Snapper_N_Hit_Parried_Tail_Montage.A_Snapper_N_Hit_Parried_Tail_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Hits/Deflected/A_Snapper_HitDeflected_Tail_Montage.A_Snapper_HitDeflected_Tail_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.00f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_Snapper_Attack_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Attacks/A_Snapper_AttackJumpFwd_Montage.A_Snapper_AttackJumpFwd_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Hits/Parried/A_Snapper_N_Hit_Parried_Jump_Montage.A_Snapper_N_Hit_Parried_Jump_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Hits/Deflected/A_Snapper_HitDeflected_JumpFwd_Montage.A_Snapper_HitDeflected_JumpFwd_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.00f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

class UAttackMeleeConfig_Snapper_Attack_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Attacks/Snapper_AttackBiteLeft_Montage.Snapper_AttackBiteLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Hits/Parried/Snapper_Hit_Parried_Left_Montage.Snapper_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Hits/Deflected/A_Snapper_HitDeflected_Left_Montage.A_Snapper_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Snapper_Attack_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Attacks/Snapper_AttackBiteRight_Montage.Snapper_AttackBiteRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Hits/Parried/Snapper_Hit_Parried_Right_Montage.Snapper_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/Hits/Deflected/A_Snapper_HitDeflected_Right_Montage.A_Snapper_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Snapper_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Combat/MoveBack/A_Snapper_Combat_MoveBack_Montage.A_Snapper_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Snapper_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Snapper_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Snapper_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Snapper_Attack_Top::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Snapper_Attack_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Snapper_Attack_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Snapper_Attack_Right::StaticClass());
}

UCLASS()
class UComboAttackConfig_Snapper_Attack_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Snapper_Attack_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Snapper_Attack_Left::StaticClass());
}

UCLASS()
class UComboAttackConfig_Snapper_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Snapper_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Snapper : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Snapper/Snapper_AnimBP.Snapper_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Idles/Breaker/A_Snapper_IdleBreaker_01.A_Snapper_IdleBreaker_01'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Idles/Breaker/A_Snapper_IdleBreaker_02.A_Snapper_IdleBreaker_02'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Idles/Breaker/A_Snapper_IdleBreaker_03.A_Snapper_IdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Idles/Breaker/A_Snapper_IdleBreaker_04.A_Snapper_IdleBreaker_04'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Idles/Breaker/A_Snapper_IdleBreaker_05.A_Snapper_IdleBreaker_05'", 0.5f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Idles/Breaker/A_Snapper_IdleBreaker_06.A_Snapper_IdleBreaker_06'", 0.4f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Breaker/A_Snapper_WalkBreaker_01.A_Snapper_WalkBreaker_01'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Breaker/A_Snapper_WalkBreaker_02.A_Snapper_WalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Breaker/A_Snapper_WalkBreaker_03.A_Snapper_WalkBreaker_03'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Breaker/A_Snapper_WalkBreaker_04.A_Snapper_WalkBreaker_04'", 0.6f, 4);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Breaker/A_Snapper_WalkBreaker_05.A_Snapper_WalkBreaker_05'", 0.5f, 2);
    

    // TURNS
    default m_TurnsData = UTurnsData_Snapper::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Snapper::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_Snapper::StaticClass();    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Snapper_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Snapper/Snapper_AnimBP_Combat.Snapper_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Idles/Breaker/A_Snapper_CombatIdleBreaker_01.A_Snapper_CombatIdleBreaker_01'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Idles/Breaker/A_Snapper_CombatIdleBreaker_02.A_Snapper_CombatIdleBreaker_02'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Idles/Breaker/A_Snapper_CombatIdleBreaker_03.A_Snapper_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Idles/Breaker/A_Snapper_CombatIdleBreaker_04.A_Snapper_CombatIdleBreaker_04'", 0.4f, 2);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Breaker/A_Snapper_CombatWalkBreaker_01.A_Snapper_CombatWalkBreaker_01'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Breaker/A_Snapper_CombatWalkBreaker_02.A_Snapper_CombatWalkBreaker_02'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Breaker/A_Snapper_CombatWalkBreaker_03.A_Snapper_CombatWalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Breaker/A_Snapper_CombatWalkBreaker_04.A_Snapper_CombatWalkBreaker_04'", 0.4f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_Snapper_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Snapper::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UComboAttackConfig_Snapper_Attack_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =     UComboAttackConfig_Snapper_Attack_Right::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UComboAttackConfig_Snapper_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =     UComboAttackConfig_Snapper_Attack_Top::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =     UComboAttackConfig_Snapper_MoveBwd::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Snapper::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Snapper::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Snapper::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_Snapper_Combat::StaticClass();
}
UCLASS()
class UAnimConfig_Snapper : UAnimConfig
{
    default m_IKConfig = UIKConfig_Razor_Generic::StaticClass();
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Snapper::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Snapper_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Snapper_Eat_Meatbug::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Snapper::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Snapper_Combat::StaticClass());	
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Snapper_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Snapper_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Snapper_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Montage_EatItem.Snapper_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_Snapper_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Montage_EatMeatbug.Snapper_Montage_EatMeatbug'";
}