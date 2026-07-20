UCLASS()
class UAnimConfig_Minecrawler_Nymph : UAnimConfig
{
    default m_IKConfig = UIKConfig_Minecrawler_Generic;
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature;

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Minecrawler_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UItemAnimConfig_Minecrawler_Nymph);
    default AddAnimForItem(GameplayTag::Item_Weapon_MinecrawlerLeg, UWeaponMeleeItemAnimConfig_Minecrawler_Nymph_Combat);
}

UCLASS()
class UItemAnimConfig_Minecrawler_Nymph : UItemAnimConfig
{
    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Idles/Breaker/A_MCrawler_IdleBreaker_01.A_MCrawler_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Idles/Breaker/A_MCrawler_IdleBreaker_02.A_MCrawler_IdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Idles/Breaker/A_MCrawler_IdleBreaker_03.A_MCrawler_IdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Idles/Breaker/A_MCrawler_IdleBreaker_04.A_MCrawler_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Idles/Breaker/A_MCrawler_IdleBreaker_05.A_MCrawler_IdleBreaker_05'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Idles/Breaker/A_MCrawler_IdleBreaker_07.A_MCrawler_IdleBreaker_07'", 0.5f, 1);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Grounded/N/Breaker/A_MCrawler_WalkBreaker_01.A_MCrawler_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Grounded/N/Breaker/A_MCrawler_WalkBreaker_02.A_MCrawler_WalkBreaker_02'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Grounded/N/Breaker/A_MCrawler_WalkBreaker_03.A_MCrawler_WalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Grounded/N/Breaker/A_MCrawler_WalkBreaker_04.A_MCrawler_WalkBreaker_04'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Movement/Grounded/N/Breaker/A_MCrawler_WalkBreaker_05.A_MCrawler_WalkBreaker_05'", 0.5f, 1);

    //TURNS
    default m_TurnsData = UTurnsData_Minecrawler;
    //

    // HITS
	default m_HitsData = UHitData_Combat_Minecrawler;
	//

    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler/MCrawler_AnimBP.MCrawler_AnimBP_C'";
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Nymph_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Nymph/Attacks/MCrawler_Nymph_BottomAttack_01_Montage.MCrawler_Nymph_BottomAttack_01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Parried/MCrawler_N_Hit_Parried_Bottom_Montage.MCrawler_N_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Deflected/A_MCrawler_HitDeflected_Bottom_Montage.A_MCrawler_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Nymph_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Nymph/Attacks/MCrawler_Nymph_LeftAttack01_Montage.MCrawler_Nymph_LeftAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Parried/MCrawler_N_Hit_Parried_Left_Montage.MCrawler_N_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Deflected/A_MCrawler_HitDeflected_Left_Montage.A_MCrawler_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Nymph_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Nymph/Attacks/MCrawler_Nymph_RightAttack01_Montage.MCrawler_Nymph_RightAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Parried/MCrawler_N_Hit_Parried_Right_Montage.MCrawler_N_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Hits/Deflected/A_MCrawler_HitDeflected_Right_Montage.A_MCrawler_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Minecrawler_Nymph_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Nymph_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Nymph_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Nymph_Left::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Nymph_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Nymph_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Nymph_Right::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Nymph_Right::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Nymph_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Nymph_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Nymph_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Nymph_Left::StaticClass());
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Minecrawler_Nymph_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler/MCrawler_AnimBP_Combat.MCrawler_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Combat/Movement/Idles/Breaker/A_MCrawler_CombatIdleBreaker_01.A_MCrawler_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Combat/Movement/Idles/Breaker/A_MCrawler_CombatIdleBreaker_02.A_MCrawler_CombatIdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Combat/Movement/Idles/Breaker/A_MCrawler_CombatIdleBreaker_03.A_MCrawler_CombatIdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Combat/Movement/Idles/Breaker/A_MCrawler_CombatIdleBreaker_04.A_MCrawler_CombatIdleBreaker_04'", 1.0f, 2);
    

    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Combat/Movement/Grounded/N/Breaker/A_MCrawler_CombatWalkBreaker_01.A_MCrawler_CombatWalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Combat/Movement/Grounded/N/Breaker/A_MCrawler_CombatWalkBreaker_02.A_MCrawler_CombatWalkBreaker_02'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Combat/Movement/Grounded/N/Breaker/A_MCrawler_CombatWalkBreaker_03.A_MCrawler_CombatWalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/MCrawler/Combat/Movement/Grounded/N/Breaker/A_MCrawler_CombatWalkBreaker_04.A_MCrawler_CombatWalkBreaker_04'", 1.0f, 2);
    

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Minecrawler::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Minecrawler_Nymph_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Minecrawler_Nymph_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Minecrawler_Nymph_Right::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_Minecrawler_Nymph_Bottom::StaticClass();
    
    //

    //TURNS
    default m_TurnsData = UTurnsData_Minecrawler_Combat::StaticClass();
    //

    // HITS
	default m_HitsData = UHitData_Combat_Minecrawler::StaticClass();
	//

    // DODGES
    default m_DodgesData = UDodgesData_Minecrawler::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Minecrawler::StaticClass();

    // TAUNTS SET TO TEST
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Short_Taunt01_Montage.MCrawler_Short_Taunt01_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Observer_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Short_Taunt01_Montage.MCrawler_Short_Taunt01_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Short_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Short_Taunt01_Montage.MCrawler_Short_Taunt01_Montage'"));

    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Aggressive_Taunt01_Montage.MCrawler_Aggressive_Taunt01_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Observer_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Aggressive_Taunt01_Montage.MCrawler_Aggressive_Taunt01_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Short_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Aggressive_Taunt01_Montage.MCrawler_Aggressive_Taunt01_Montage'"));

    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Aggressive_Taunt02_Montage.MCrawler_Aggressive_Taunt02_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Observer_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Aggressive_Taunt02_Montage.MCrawler_Aggressive_Taunt02_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Short_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Aggressive_Taunt02_Montage.MCrawler_Aggressive_Taunt02_Montage'"));

    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Observer_Taunt01_Montage.MCrawler_Observer_Taunt01_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Observer_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Observer_Taunt01_Montage.MCrawler_Observer_Taunt01_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Short_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Taunt/MCrawler_Observer_Taunt01_Montage.MCrawler_Observer_Taunt01_Montage'"));
    //
}