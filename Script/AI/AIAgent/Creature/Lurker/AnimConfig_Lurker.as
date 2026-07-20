
//////////////////
UCLASS()
class UAttackMeleeConfig_Lurker_Attack_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Attacks/Lurker_TopAttack_Montage.Lurker_TopAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Parried/Lurker_N_Hit_Parried_Top_AnimMontage.Lurker_N_Hit_Parried_Top_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Deflected/A_Lurker_HitDeflected_Top_Montage.A_Lurker_HitDeflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lurker_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Attacks/Lurker_ScratchBottomAttack_Montage.Lurker_ScratchBottomAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Parried/A_Lurker_Hit_Parried_Bottom_Montage.A_Lurker_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Deflected/A_Lurker_HitDeflected_Bottom_Montage.A_Lurker_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lurker_Attack_Left01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Attacks/A_Lurker_ScratchLeftAttack_Montage.A_Lurker_ScratchLeftAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Parried/A_Lurker_Hit_Parried_Left_Montage.A_Lurker_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Deflected/A_Lurker_HitDeflected_Left_Montage.A_Lurker_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lurker_Attack_Left02 : UAttackMeleeConfig_Lurker_Attack_Left01
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Attacks/A_Lurker_ScratchLeftAttack_Montage.A_Lurker_ScratchLeftAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Parried/A_Lurker_Hit_Parried_Left_Montage.A_Lurker_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Deflected/A_Lurker_HitDeflected_Left_Montage.A_Lurker_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lurker_Attack_Right01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Attacks/A_Lurker_ScratchRightAttack_Montage.A_Lurker_ScratchRightAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Parried/A_Lurker_Hit_Parried_Right_Montage.A_Lurker_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Deflected/A_Lurker_HitDeflected_Right_Montage.A_Lurker_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lurker_Attack_Right02 : UAttackMeleeConfig_Lurker_Attack_Right01
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Attacks/A_Lurker_ScratchRightAttack_Montage.A_Lurker_ScratchRightAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Parried/A_Lurker_Hit_Parried_Right_Montage.A_Lurker_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Hits/Deflected/A_Lurker_HitDeflected_Right_Montage.A_Lurker_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;

}

//This attack is only for when the Lurker is diving or swiming
UCLASS()
class UAttackMeleeConfig_Lurker_ChargeAttack : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/Attacks/Lurker_ChargeAttack_Montage.Lurker_ChargeAttack_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.25f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Lurker_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Combat/MoveBack/A_Lurker_Combat_MoveBack_Montage.A_Lurker_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Lurker_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lurker_Attack_Top::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lurker_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lurker_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Lurker_Attack_Right02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Lurker_Attack_Left02::StaticClass());
}


UCLASS()
class UComboAttackConfig_Lurker_Attack_Left01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lurker_Attack_Left01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Lurker_Attack_Right02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Lurker_Attack_Right02::StaticClass());
}

UCLASS()
class UComboAttackConfig_Lurker_Attack_Right01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lurker_Attack_Right01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Lurker_Attack_Left02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Lurker_Attack_Left02::StaticClass());
}

UCLASS()
class UComboAttackConfig_Lurker_Attack_Left02 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lurker_Attack_Left02::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lurker_Attack_Right02 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lurker_Attack_Right02::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

//This attack is only for when the Lurker is diving or swiming
UCLASS()
class UComboAttackConfig_Lurker_ChargeAttack : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lurker_ChargeAttack::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Lurker_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Lurker_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Lurker : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lurker/Lurker_AnimBP.Lurker_AnimBP_C'";

    // IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Idles/Breaker/A_Lurker_IdleBreaker_01.A_Lurker_IdleBreaker_01'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Idles/Breaker/A_Lurker_IdleBreaker_02.A_Lurker_IdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Idles/Breaker/A_Lurker_IdleBreaker_03.A_Lurker_IdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Idles/Breaker/A_Lurker_IdleBreaker_04.A_Lurker_IdleBreaker_04'", 0.9f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Idles/Breaker/A_Lurker_IdleBreaker_05.A_Lurker_IdleBreaker_05'", 0.9f, 2);
    
    // WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Breaker/A_Lurker_WalkBreaker_01.A_Lurker_WalkBreaker_01'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Breaker/A_Lurker_WalkBreaker_02.A_Lurker_WalkBreaker_02'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Breaker/A_Lurker_WalkBreaker_03.A_Lurker_WalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Breaker/A_Lurker_WalkBreaker_04.A_Lurker_WalkBreaker_04'", 1.0f, 2);

   // TURNS
   default m_TurnsData = UTurnsData_Lurker::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Default_Lurker::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Lurker::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Lurker_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Lurker/Lurker_AnimBP_Combat.Lurker_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Idles/Breaker/A_Lurker_CombatIdleBreaker_01.A_Lurker_CombatIdleBreaker_01'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Idles/Breaker/A_Lurker_CombatIdleBreaker_02.A_Lurker_CombatIdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Idles/Breaker/A_Lurker_CombatIdleBreaker_03.A_Lurker_CombatIdleBreaker_03'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Idles/Breaker/A_Lurker_CombatIdleBreaker_04.A_Lurker_CombatIdleBreaker_04'", 0.4f, 2);
    
    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Breaker/A_Lurker_CombatWalkBreaker_01.A_Lurker_CombatWalkBreaker_01'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Breaker/A_Lurker_CombatWalkBreaker_02.A_Lurker_CombatWalkBreaker_02'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Breaker/A_Lurker_CombatWalkBreaker_03.A_Lurker_CombatWalkBreaker_03'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Breaker/A_Lurker_CombatWalkBreaker_04.A_Lurker_CombatWalkBreaker_04'", 0.4f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_Lurker_Combat::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 270.0f;
    default m_RotateSpeedMagnetAI = 270.0f;
    
    // Equip
    default m_EquipData = UEquipData_Lurker::StaticClass();

    // COMBOS
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_Lurker_Attack_Top::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Lurker_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =   UComboAttackConfig_Lurker_Attack_Left01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =   UComboAttackConfig_Lurker_Attack_Right01::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) = UComboAttackConfig_Lurker_MoveBwd::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Default_Lurker::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Lurker::StaticClass();
    //
    
    // TAUNTS
    default m_TauntData = UTauntData_Lurker::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_Lurker_Combat::StaticClass();
}


UCLASS()
class UAnimConfig_Lurker : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Quadruped_Generic::StaticClass(); 
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Lurker::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Lurker_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Lurker_Eat_Meatbug::StaticClass());

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Lurker::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Lurker_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Lurker_Combat_Swimming::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Diving, USwimming_Lurker_Combat_Diving::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Lurker_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Actions/Lurker_Montage_EatItem.Lurker_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_Lurker_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Actions/Lurker_Montage_EatMeatbug.Lurker_Montage_EatMeatbug'";
}