//////////////////
UCLASS()
class UAttackMeleeConfig_Skeleton_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Attacks/Skeleton_AttackBottom_01_Montage.Skeleton_AttackBottom_01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Parried/Skeleton_N_Hit_Parried_Bottom_Montage.Skeleton_N_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Deflected/A_Skeleton_HitDeflected_Bottom_Montage.A_Skeleton_HitDeflected_Bottom_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Skeleton_Attack_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Attacks/Skeleton_AttackLeft_01_Montage.Skeleton_AttackLeft_01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Parried/Skeleton_N_Hit_Parried_Left_Montage.Skeleton_N_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Deflected/A_Skeleton_HitDeflected_Right_Montage.A_Skeleton_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

UCLASS()
class UAttackMeleeConfig_Skeleton_Attack_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Attacks/Skeleton_AttackRight_01_Montage.Skeleton_AttackRight_01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Parried/Skeleton_N_Hit_Parried_Right_Montage.Skeleton_N_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Deflected/A_Skeleton_HitDeflected_Left_Montage.A_Skeleton_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

UCLASS()
class UAttackMeleeConfig_Skeleton_Attack_BottomJump : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Attacks/A_Skeleton_AttackBottomJump_01_Montage.A_Skeleton_AttackBottomJump_01_Montage'";
    default m_ParriedMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Parried/Skeleton_N_Hit_Parried_Bottom_Montage.Skeleton_N_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Deflected/A_Skeleton_HitDeflected_BottonJump_Montage.A_Skeleton_HitDeflected_BottonJump_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 2.0f;

    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_Skeleton_Attack_Front : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Attacks/A_Skeleton_AttackFront_01_Montage.A_Skeleton_AttackFront_01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Parried/A_Skeleton_N_Hit_Parried_Front_Montage.A_Skeleton_N_Hit_Parried_Front_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Deflected/A_Skeleton_HitDeflected_Front_Montage.A_Skeleton_HitDeflected_Front_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

UCLASS()
class UAttackMeleeConfig_Skeleton_Attack_DwnUp : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Attacks/A_Skeleton_AttackDwnUp_01_Montage.A_Skeleton_AttackDwnUp_01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Parried/A_Skeleton_N_Hit_Parried_DwnUp_Montage.A_Skeleton_N_Hit_Parried_DwnUp_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/Combat/Hits/Deflected/A_Skeleton_HitDeflected_DwnUp_Montage.A_Skeleton_HitDeflected_DwnUp_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

UCLASS()
class UComboAttackConfig_Skeleton_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Skeleton_Attack_Bottom;
    default m_GA_Attack = UGA_AttackMelee;

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Skeleton_Attack_Right);
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Skeleton_Attack_Left);
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Skeleton_Attack_DwnUp);
}

UCLASS()
class UComboAttackConfig_Skeleton_Attack_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Skeleton_Attack_Left;
    default m_GA_Attack = UGA_AttackMelee;

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Skeleton_Attack_Right);
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Skeleton_Attack_Right);
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Skeleton_Attack_Front);
}

UCLASS()
class UComboAttackConfig_Skeleton_Attack_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Skeleton_Attack_Right;
    default m_GA_Attack = UGA_AttackMelee;

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Skeleton_Attack_Left);
    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Skeleton_Attack_Left);
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Skeleton_Attack_Front);
}

UCLASS()
class UComboAttackConfig_Skeleton_Attack_BottomJump : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Skeleton_Attack_BottomJump;
    default m_GA_Attack = UGA_AttackMelee;

    // default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Skeleton_Attack_Right);
    // default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Skeleton_Attack_Left);
}

UCLASS()
class UComboAttackConfig_Skeleton_Attack_Front : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Skeleton_Attack_Front;
    default m_GA_Attack = UGA_AttackMelee;

    // default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Skeleton_Attack_Right);
    // default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Skeleton_Attack_Left);
}

UCLASS()
class UComboAttackConfig_Skeleton_Attack_DwnUp : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Skeleton_Attack_DwnUp;
    default m_GA_Attack = UGA_AttackMelee;

    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Skeleton_Attack_Bottom);
    // default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Skeleton_Attack_Left);
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Skeleton : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Skeleton/Skeleton_AnimBP.Skeleton_AnimBP_C'";
	
    
    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Idles/Breaker/A_Skeleton_IdleBreaker_01.A_Skeleton_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Idles/Breaker/A_Skeleton_IdleBreaker_02.A_Skeleton_IdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Idles/Breaker/A_Skeleton_IdleBreaker_03.A_Skeleton_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Idles/Breaker/A_Skeleton_IdleBreaker_04.A_Skeleton_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Idles/Breaker/A_Skeleton_IdleBreaker_05.A_Skeleton_IdleBreaker_05'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Idles/Breaker/A_Skeleton_IdleBreaker_06.A_Skeleton_IdleBreaker_06'", 1.0f, 2);
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Breaker/A_Skeleton_WalkBreaker_01.A_Skeleton_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Breaker/A_Skeleton_WalkBreaker_02.A_Skeleton_WalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Breaker/A_Skeleton_WalkBreaker_03.A_Skeleton_WalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Breaker/A_Skeleton_WalkBreaker_04.A_Skeleton_WalkBreaker_04'", 1.0f, 4);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Movement/Grounded/N/Breaker/A_Skeleton_WalkBreaker_05.A_Skeleton_WalkBreaker_05'", 0.6f, 2);
    

   // TURNS
   default m_TurnsData = UTurnsData_Skeleton;
   //

    // HITS
    default m_HitsData = UHitData_Skeleton;
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Skeleton_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Skeleton/Skeleton_AnimBP_Combat.Skeleton_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Idles/Breaker/A_Skeleton_CombatIdleBreaker_01.A_Skeleton_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Idles/Breaker/A_Skeleton_CombatIdleBreaker_02.A_Skeleton_CombatIdleBreaker_02'", 1.0f, 4);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Idles/Breaker/A_Skeleton_CombatIdleBreaker_03.A_Skeleton_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Idles/Breaker/A_Skeleton_CombatIdleBreaker_04.A_Skeleton_CombatIdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Idles/Breaker/A_Skeleton_CombatIdleBreaker_05.A_Skeleton_CombatIdleBreaker_05'", 0.8f, 1);
    
    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Grounded/N/Breaker/A_Skeleton_CombatWalkBreaker_01.A_Skeleton_CombatWalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Grounded/N/Breaker/A_Skeleton_CombatWalkBreaker_02.A_Skeleton_CombatWalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Grounded/N/Breaker/A_Skeleton_CombatWalkBreaker_03.A_Skeleton_CombatWalkBreaker_03'", 1.0f, 4);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Skeleton/Combat/Movement/Grounded/N/Breaker/A_Skeleton_CombatWalkBreaker_04.A_Skeleton_CombatWalkBreaker_04'", 0.6f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_Skeleton_Combat;
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Skeleton;

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =      UComboAttackConfig_Skeleton_Attack_Bottom;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Skeleton_Attack_Right;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Skeleton_Attack_Left;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =        UComboAttackConfig_Skeleton_Attack_DwnUp;

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =        UComboAttackConfig_Skeleton_Attack_Front;
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =        UComboAttackConfig_Skeleton_Attack_BottomJump;
    //

	// HITS
    default m_HitsData = UHitData_Skeleton;
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Skeleton;
    //

    // TAUNTS
    default m_TauntData = UTauntData_Skeleton;//
}

UCLASS()
class UAnimConfig_Skeleton : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature;

	default m_IKConfig = UIKConfig_Biped_Generic;

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Skeleton);

    default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, UWeaponMeleeItemAnimConfig_Skeleton_Combat);
     default AddAnimForItem(GameplayTag::Item_Weapon_Axe_OneHand, UWeaponMeleeItemAnimConfig_Skeleton_Combat);
    default AddAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, UWeaponMeleeItemAnimConfig_Skeleton_Combat);
    default AddAnimForItem(GameplayTag::Item_Weapon_Axe_OneHand, UWeaponMeleeItemAnimConfig_Skeleton_Combat);
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Skeleton_Combat);
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Skeleton_Combat);
    // default AddAnimForItem(GameplayTag::Item_Weapon_Bow, UBow_Human);
}

UCLASS()
class UAnimConfig_Skeleton_Warrior : UAnimConfig_Skeleton
{
	
}