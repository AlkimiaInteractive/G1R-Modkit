
//////////////////
UCLASS()
class UAttackMeleeConfig_ShadowBeast_Charge_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Attacks/Shadow_Beast_TopAttack_Charge_Montage.Shadow_Beast_TopAttack_Charge_Montage'";
    //default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/supAr/Shadow_Beast_N_Hit_SupAr_F_Montage.Shadow_Beast_N_Hit_SupAr_F_Montage'";
    //default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/supAr/Shadow_Beast_N_Hit_SupAr_F_Montage.Shadow_Beast_N_Hit_SupAr_F_Montage'";

    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.0f);
    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 15000.f;

    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_ShadowBeast_Stomp : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Attacks/A_Shadow_Beast_AreaAttack_Montage.A_Shadow_Beast_AreaAttack_Montage'";
    //default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Parried/Shadow_Beast_N_Hit_Parried_Right_Montage.Shadow_Beast_N_Hit_Parried_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 0.5f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.0f);
	default m_SuperArmorDamageMultiplier = 3.0f;

    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_ShadowBeast_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Attacks/A_Shadow_Beast_TrampleAttack01_Montage.A_Shadow_Beast_TrampleAttack01_Montage'";
    //default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Parried/Shadow_Beast_N_Hit_Parried_Top_Montage.Shadow_Beast_N_Hit_Parried_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}

UCLASS()
class UAttackMeleeConfig_ShadowBeast_Headbutt : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Attacks/A_Shadow_Beast_Headbutt_Anim_Montage.A_Shadow_Beast_Headbutt_Anim_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/supAr/Shadow_Beast_N_Hit_SupAr_F_Montage.Shadow_Beast_N_Hit_SupAr_F_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/supAr/Shadow_Beast_N_Hit_SupAr_F_Montage.Shadow_Beast_N_Hit_SupAr_F_Montage'";


    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;

    default m_CanKnockback = false;
}

UCLASS()
class UAttackMeleeConfig_ShadowBeast_Scratch_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Attacks/Shadow_Beast_ScratchLeft_Montage.Shadow_Beast_ScratchLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Parried/A_Shadow_Beast_N_Hit_Parried_Left_Montage.A_Shadow_Beast_N_Hit_Parried_Left_Montage'";
	default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Deflected/A_Shadow_Beast_HitDeflected_Left_Montage.A_Shadow_Beast_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_ShadowBeast_Scratch_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Attacks/Shadow_Beast_ScratchRight_Montage.Shadow_Beast_ScratchRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Parried/A_Shadow_Beast_N_Hit_Parried_Right_Montage.A_Shadow_Beast_N_Hit_Parried_Right_Montage'";
	default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Hits/Deflected/A_Shadow_Beast_HitDeflected_Right_Montage.A_Shadow_Beast_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UComboAttackConfig_ShadowBeast_Charge_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_ShadowBeast_Charge_Top::StaticClass();
    default m_GA_Attack = UGA_AttackUnstoppableCharge::StaticClass();
}

UCLASS()
class UComboAttackConfig_ShadowBeast_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_ShadowBeast_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_ShadowBeast_Headbutt : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_ShadowBeast_Headbutt::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_ShadowBeast_Stomp : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_ShadowBeast_Stomp::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_ShadowBeast_Scratch_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_ShadowBeast_Scratch_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_ShadowBeast_Scratch_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_ShadowBeast_Scratch_Right::StaticClass());
}

UCLASS()
class UComboAttackConfig_ShadowBeast_Scratch_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_ShadowBeast_Scratch_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_ShadowBeast_Scratch_Left::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_ShadowBeast_Scratch_Left::StaticClass());
}


UCLASS()
class UWeaponMeleeItemAnimConfig_ShadowBeast : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Shadow_Beast/Shadow_Beast_AnimBP.Shadow_Beast_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Idles/Breaker/A_Shadow_Beast_IdleBreaker_01.A_Shadow_Beast_IdleBreaker_01'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Idles/Breaker/A_Shadow_Beast_IdleBreaker_02.A_Shadow_Beast_IdleBreaker_02'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Idles/Breaker/A_Shadow_Beast_IdleBreaker_03.A_Shadow_Beast_IdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Idles/Breaker/A_Shadow_Beast_IdleBreaker_04.A_Shadow_Beast_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Idles/Breaker/A_Shadow_Beast_IdleBreaker_05.A_Shadow_Beast_IdleBreaker_05'", 0.5f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Idles/Breaker/A_Shadow_Beast_IdleBreaker_06.A_Shadow_Beast_IdleBreaker_06'", 0.5f, 1);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Breaker/A_Shadow_Beast_WalkBreaker_01.A_Shadow_Beast_WalkBreaker_01'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Breaker/A_Shadow_Beast_WalkBreaker_02.A_Shadow_Beast_WalkBreaker_02'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Breaker/A_Shadow_Beast_WalkBreaker_03.A_Shadow_Beast_WalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Breaker/A_Shadow_Beast_WalkBreaker_04.A_Shadow_Beast_WalkBreaker_04'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Breaker/A_Shadow_Beast_WalkBreaker_05.A_Shadow_Beast_WalkBreaker_05'", 0.4f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_Shadow_Beast::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_ShadowBeast::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_ShadowBeast::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_ShadowBeast_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Shadow_Beast/Shadow_Beast_AnimBP_Combat.Shadow_Beast_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Idles/Breaker/A_Shadow_Beast_CombatIdleBreaker_01.A_Shadow_Beast_CombatIdleBreaker_01'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Idles/Breaker/A_Shadow_Beast_CombatIdleBreaker_02.A_Shadow_Beast_CombatIdleBreaker_02'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Idles/Breaker/A_Shadow_Beast_CombatIdleBreaker_03.A_Shadow_Beast_CombatIdleBreaker_03'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Idles/Breaker/A_Shadow_Beast_CombatIdleBreaker_04.A_Shadow_Beast_CombatIdleBreaker_04'", 0.5f, 1);
    
    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Breaker/A_Shadow_Beast_CombatWalkBreaker_01.A_Shadow_Beast_CombatWalkBreaker_01'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Breaker/A_Shadow_Beast_CombatWalkBreaker_02.A_Shadow_Beast_CombatWalkBreaker_02'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Breaker/A_Shadow_Beast_CombatWalkBreaker_03.A_Shadow_Beast_CombatWalkBreaker_03'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Breaker/A_Shadow_Beast_CombatWalkBreaker_04.A_Shadow_Beast_CombatWalkBreaker_04'", 0.5f, 2);
    

    // TURNS
    default m_TurnsData = UTurnsData_Shadow_Beast_Combat::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 270.0f;
    default m_RotateSpeedMagnetAI = 270.0f;
    default m_RotateSpeedCharge = 15.0f;
    
    // Equip
    default m_EquipData = UEquipData_ShadowBeast::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_ShadowBeast_Charge_Top::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_ShadowBeast_Headbutt ::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_ShadowBeast_Scratch_Right::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_ShadowBeast_Scratch_Left::StaticClass();
    
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =      UComboAttackConfig_ShadowBeast_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =      UComboAttackConfig_ShadowBeast_Stomp::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Default_ShadowBeast::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Default_ShadowBeast::StaticClass();
    //
    
    // TAUNTS
    default m_TauntData = UTauntData_Shadowbeast::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_ShadowBeast_Combat::StaticClass();
}


UCLASS()
class UAnimConfig_ShadowBeast : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Quadruped_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_ShadowBeast::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Shadowbeast_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Shadowbeast_Eat_Meatbug::StaticClass());

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_ShadowBeast::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_ShadowBeast_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_ShadowBeast_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_ShadowBeast_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Shadowbeast_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_Montage_EatItem.Shadow_Beast_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_Shadowbeast_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_Montage_EatMeatbug.Shadow_Beast_Montage_EatMeatbug'";
}