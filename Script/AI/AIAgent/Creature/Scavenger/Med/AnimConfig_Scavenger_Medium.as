
//////////////////

UCLASS()
class UAttackMeleeConfig_Scavenger_Medium_Attack_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Attacks/Scavenger_Med_TopAttack_Montage.Scavenger_Med_TopAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Hits/Parried/Scavenger_Med_Hit_Parried_Top_Montage.Scavenger_Med_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Hits/Deflected/Scavenger_Med_Hit_Deflected_Top_Montage.Scavenger_Med_Hit_Deflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.7f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Medium_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Attacks/Scavenger_Med_BottomAttack_Montage.Scavenger_Med_BottomAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Hits/Parried/Scavenger_Med_Hit_Parried_Bottom_Montage.Scavenger_Med_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Hits/Deflected/Scavenger_Med_HitDeflected_Bottom_Montage.Scavenger_Med_HitDeflected_Bottom_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Medium_Attack_Bottom_Short : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Attacks/Scavenger_Med_AttackLight_Montage.Scavenger_Med_AttackLight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Hits/Parried/Scavenger_Med_Hit_Parried_Bottom_Montage.Scavenger_Med_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Hits/Deflected/Scavenger_Med_HitDeflected_Bottom_Montage.Scavenger_Med_HitDeflected_Bottom_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Medium_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/MoveBack/A_Scavenger_Med_Combat_MoveBack_Montage.A_Scavenger_Med_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Scavenger_Medium_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Medium_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

     default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Scavenger_Medium_Attack_Top::StaticClass());
    // default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Scavenger_Medium_Attack_Top::StaticClass());

}

UCLASS()
class UComboAttackConfig_Scavenger_Medium_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Medium_Attack_Top::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Scavenger_Medium_Attack_BottomShort: UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Medium_Attack_Bottom_Short::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Scavenger_Medium_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Medium_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Scavenger_Medium : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Scavenger/Med/Scavenger_Med_AnimBP.Scavenger_Med_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Idles/Breaker/A_Scavenger_Med_IdleBreaker_01.A_Scavenger_Med_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Idles/Breaker/A_Scavenger_Med_IdleBreaker_02.A_Scavenger_Med_IdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Idles/Breaker/A_Scavenger_Med_IdleBreaker_03.A_Scavenger_Med_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Idles/Breaker/A_Scavenger_Med_IdleBreaker_04.A_Scavenger_Med_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Idles/Breaker/A_Scavenger_Med_IdleBreaker_05.A_Scavenger_Med_IdleBreaker_05'", 0.5f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Grounded/N/Breaker/A_Scavenger_Med_WalkBreaker_01.A_Scavenger_Med_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Grounded/N/Breaker/A_Scavenger_Med_WalkBreaker_02.A_Scavenger_Med_WalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Grounded/N/Breaker/A_Scavenger_Med_WalkBreaker_03.A_Scavenger_Med_WalkBreaker_03'", 1.0f, 4);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Movement/Grounded/N/Breaker/A_Scavenger_Med_WalkBreaker_04.A_Scavenger_Med_WalkBreaker_04'", 1.0f, 4);
    

   // TURNS
   default m_TurnsData = UTurnsData_Scavenger_Medium::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Scavenger_Medium::StaticClass();
    // 

    default m_ConsumablesData = UConsumablesData_Scavenger::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Scavenger_Medium_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Scavenger/Med/Scavenger_Med_AnimBP_Combat.Scavenger_Med_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Movement/Idles/Breaker/A_Scavenger_Med_CombatIdleBreaker_01.A_Scavenger_Med_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Movement/Idles/Breaker/A_Scavenger_Med_CombatIdleBreaker_02.A_Scavenger_Med_CombatIdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Movement/Idles/Breaker/A_Scavenger_Med_CombatIdleBreaker_03.A_Scavenger_Med_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Movement/Idles/Breaker/A_Scavenger_Med_CombatIdleBreaker_04.A_Scavenger_Med_CombatIdleBreaker_04'", 1.0f, 2);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Movement/Grounded/N/Breaker/A_Scavenger_Med_CombatWalkBreaker_01.A_Scavenger_Med_CombatWalkBreaker_01'", 10.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Movement/Grounded/N/Breaker/A_Scavenger_Med_CombatWalkBreaker_02.A_Scavenger_Med_CombatWalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Movement/Grounded/N/Breaker/A_Scavenger_Med_CombatWalkBreaker_03.A_Scavenger_Med_CombatWalkBreaker_03'", 1.0f, 4);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Med/Combat/Movement/Grounded/N/Breaker/A_Scavenger_Med_CombatWalkBreaker_04.A_Scavenger_Med_CombatWalkBreaker_04'", 1.0f, 4);

    // TURNS
    default m_TurnsData = UTurnsData_Scavenger_Medium_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Scavenger_Medium::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =     UComboAttackConfig_Scavenger_Medium_Attack_Top::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UComboAttackConfig_Scavenger_Medium_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UComboAttackConfig_Scavenger_Medium_Attack_BottomShort::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =     UComboAttackConfig_Scavenger_Medium_Attack_BottomShort::StaticClass();


    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =     UComboAttackConfig_Scavenger_Medium_MoveBwd::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Scavenger_Medium::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Scavenger_Medium::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Scavenger_Medium::StaticClass();

    default m_ConsumablesData = UConsumablesData_Scavenger_Combat::StaticClass();
}

UCLASS()
class UAnimConfig_Scavenger_Medium : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Razor_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Scavenger::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Scavenger_Medium_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Scavenger_Medium_Eat_Meatbug::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Scavenger_Medium::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Scavenger_Medium_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Scavenger_Medium_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Scavenger_Medium_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Scavenger_Medium_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Actions/Scavenger_Med_EatItem_Montage.Scavenger_Med_EatItem_Montage'";
}

UCLASS()
class UInteractAnimConfig_Scavenger_Medium_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Actions/Scavenger_Med_EatMeatbug_Montage.Scavenger_Med_EatMeatbug_Montage'";
}