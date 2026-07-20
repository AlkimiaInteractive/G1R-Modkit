
//////////////////
UCLASS()
class UAttackMeleeConfig_Lizard_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Attacks/Lizard_BottomAttack01_Montage.Lizard_BottomAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Hits/Parried/Lizard_N_Hit_Parried_Bottom_AnimMontage.Lizard_N_Hit_Parried_Bottom_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Hits/Deflected/A_Lizard_HitDeflected_Bottom_Montage.A_Lizard_HitDeflected_Bottom_Montage'";


    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lizard_Attack_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Attacks/A_Lizard_RightAttack01_Montage.A_Lizard_RightAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Hits/Parried/Lizard_N_Hit_Parried_Right_Montage.Lizard_N_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Hits/Deflected/A_Lizard_HitDeflected_Right_Montage.A_Lizard_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Attack_Attack_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/Attacks/Lizard_LeftAttack01_Montage.Lizard_LeftAttack01_Montage'";
   default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Parried/A_Lizard_Fire_N_Hit_Parried_Left_Montage.A_Lizard_Fire_N_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Combat/Hits/Deflected/A_Lizard_Fire_HitDeflected_L_Montage.A_Lizard_Fire_HitDeflected_L_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_Lizard_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Combat/MoveBack/A_Lizard_Combat_MoveBack_Montage.A_Lizard_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Lizard_Attack_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Attack_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_Attack_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Attack_Attack_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lizard_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lizard_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

///////////////////////

UCLASS()
class UWeaponMeleeItemAnimConfig_Lizard : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lizard/Lizard_AnimBP.Lizard_AnimBP_C'";

    // IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Idles/Breaker/A_Lizard_IdleBreaker_01.A_Lizard_IdleBreaker_01'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Idles/Breaker/A_Lizard_IdleBreaker_02.A_Lizard_IdleBreaker_02'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Idles/Breaker/A_Lizard_IdleBreaker_03.A_Lizard_IdleBreaker_03'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Idles/Breaker/A_Lizard_IdleBreaker_04.A_Lizard_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Idles/Breaker/A_Lizard_IdleBreaker_05.A_Lizard_IdleBreaker_05'", 0.5f, 1);

    // WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Breaker/A_Lizard_WalkBreaker_01.A_Lizard_WalkBreaker_01'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Breaker/A_Lizard_WalkBreaker_02.A_Lizard_WalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Breaker/A_Lizard_WalkBreaker_03.A_Lizard_WalkBreaker_03'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Breaker/A_Lizard_WalkBreaker_04.A_Lizard_WalkBreaker_04'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Breaker/A_Lizard_WalkBreaker_05.A_Lizard_WalkBreaker_05'", 0.5f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Lizard::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Lizard::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Lizard::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Lizard_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lizard/Lizard_AnimBP_Combat.Lizard_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Idles/Breaker/A_Lizard_CombatIdleBreaker_01.A_Lizard_CombatIdleBreaker_01'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Idles/Breaker/A_Lizard_CombatIdleBreaker_02.A_Lizard_CombatIdleBreaker_02'", 0.8f, 3);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Idles/Breaker/A_Lizard_CombatIdleBreaker_03.A_Lizard_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Idles/Breaker/A_Lizard_CombatIdleBreaker_04.A_Lizard_CombatIdleBreaker_04'", 0.5f, 2);

    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Breaker/A_Lizard_CombatWalkBreaker_01.A_Lizard_CombatWalkBreaker_01'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Breaker/A_Lizard_CombatWalkBreaker_02.A_Lizard_CombatWalkBreaker_02'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Breaker/A_Lizard_CombatWalkBreaker_03.A_Lizard_CombatWalkBreaker_03'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Breaker/A_Lizard_CombatWalkBreaker_04.A_Lizard_CombatWalkBreaker_04'", 0.5f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_Lizard_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Lizard::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Lizard_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =  UComboAttackConfig_Lizard_Attack_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =  UComboAttackConfig_Lizard_Attack_Right::StaticClass();
    //

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) = UComboAttackConfig_Lizard_MoveBwd::StaticClass();

	// HITS
    default m_HitsData = UHitData_Default_Lizard::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Lizard::StaticClass();
    //
    
    // TAUNTS
    default m_TauntData = UTauntData_Lizard::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_Lizard_Combat::StaticClass();
}

UCLASS()
class UIKConfig_Lizard : UIKConfig_Quadruped_Generic
{
    default m_UpSpeed = 45.0f;
    default m_DownSpeed = 30.0f;
    default m_UpTraceDistance = 50.0f;
    
    default m_HipNTailRayLength = 70.0f;
    default m_MaxYawRotation = 65.0f;
}

UCLASS()
class ULocoBlendCurvesConfig_Lizard : ULocoBlendCurvesConfig_Creature
{
    default m_StrideBlendNRun = n"CurveFloat'/Game/AnimLibrary/Creatures/Lizard/Data/StrideBlend_N_Run_Lizard.StrideBlend_N_Run_Lizard'";
}

UCLASS()
class UAnimConfig_Lizard : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Lizard::StaticClass();
    default m_IKConfig = UIKConfig_Lizard::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Lizard::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Lizard_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Lizard_Eat_Meatbug::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Lizard::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Lizard_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Lizard_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Lizard_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Lizard_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Actions/Lizard_Montage_EatItem.Lizard_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_Lizard_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Actions/Lizard_Montage_EatMeatbug.Lizard_Montage_EatMeatbug'";
}
