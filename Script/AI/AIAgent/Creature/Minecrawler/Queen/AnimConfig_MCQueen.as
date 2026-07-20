
UCLASS()                        /*CACHIAU*/
class UWeaponMeleeItemAnimConfig_MCQueen : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"/Script/Engine.AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler_Queen/MCrawlerQueen_AnimBP.MCrawlerQueen_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Combat_MCQueen_Phase1::StaticClass();
    //  

    // TAUNTS
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt02).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt03).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Short_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    //  
}

UCLASS()
class UWeaponMeleeItemAnimConfig_MCQueen_Ph2 : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"/Script/Engine.AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler_Queen/MCrawlerQueen_AnimBP.MCrawlerQueen_AnimBP_C'";

    // HITS
    default m_HitsData = UHitData_Combat_MCQueen_Phase2::StaticClass();
    //  

    // TAUNTS
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt02).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt03).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Short_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    //

    // TAUNTS
    default m_TauntData = UTauntData_Minecrawler_Queen_Ph2::StaticClass();
}

UCLASS()
class USpitProjectile_MCQueen : UItemAnimConfig
{
    default m_EquipData = UEquipData_MCQueen_UProjectile::StaticClass();
}

UCLASS()
class UEquipData_MCQueen_UProjectile : UEquipData
{
    default m_SocketName = n"jaw";
}

UCLASS()
class UWeaponMeleeItemAnimConfig_MCQueen_Combat_Ph1 : UWeaponMeleeItemAnimConfig
{

    default m_AnimInstanceClass = n"/Script/Engine.AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler_Queen/MCrawlerQueen_AnimBP.MCrawlerQueen_AnimBP_C'";

    // TURNS
    default m_TurnsData = UTurnsData_MCQueen_Phase2::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Minecrawler_Queen::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.Add(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_MCQueen_Ph1_A_R01::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Left,    UComboAttackConfig_MCQueen_Ph1_A_Spit::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Top,     UComboAttackConfig_MCQueen_Ph1_A_LeftSide::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Bottom,     UComboAttackConfig_MCQueen_Ph1_A_RightSide::StaticClass());
    //

	// HITS
    default m_HitsData = UHitData_Combat_MCQueen_Phase1::StaticClass();
    // 

    // DODGES
    //default m_DodgesData = UDodgesData_MCQueen::StaticClass();
    //

    // TAUNTS
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Taunt/MCQueen_Ph2_Taunt_01_Montage.MCQueen_Ph2_Taunt_01_Montage'"));
    // //default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt02).Animations.Add(TSoftObjectPtr<UAnimMontage>(n""));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Aggressive_Taunt03).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Taunt/MCQueen_Ph2_Taunt_03_Montage.MCQueen_Ph2_Taunt_03_Montage'"));
    // default m_Taunts.FindOrAdd(GameplayTag::Combat_Taunt_Short_Taunt01).Animations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Taunt/MCQueen_Ph2_Taunt_Short_01_Montage.MCQueen_Ph2_Taunt_Short_01_Montage'"));
    //

    // TAUNTS
    default m_TauntData = UTauntData_Minecrawler_Queen_Ph1::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_MCQueen_Combat_Ph2 : UWeaponMeleeItemAnimConfig
{

    default m_AnimInstanceClass = n"/Script/Engine.AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler_Queen/MCrawlerQueen_AnimBP.MCrawlerQueen_AnimBP_C'";

    // TURNS
     default m_TurnsData = UTurnsData_MCQueen_Phase2::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 100.0f;
    default m_RotateSpeedMagnetAI = 100.0f;
    
    // Equip
    default m_EquipData = UEquipData_Minecrawler_Queen::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.Add(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_MCQueen_Ph2_A_R01::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Left,    UComboAttackConfig_MCQueen_Ph2_A_Spit::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Bottom,     UComboAttackConfig_MCQueen_Ph2_A_Stomp::StaticClass());
    default m_Attacks.Add(GameplayTag::Combat_Attack_Top,     UComboAttackConfig_MCQueen_Ph2_A_LeftSide::StaticClass());
    
    //default m_Attacks.Add(GameplayTag::Combat_Attack_Bottom,     UComboAttackConfig_MCQueen_Ph2_A_RightSide::StaticClass());    
    //

	// HITS
    default m_HitsData = UHitData_Combat_MCQueen_Phase2::StaticClass();
    // 

    // DODGES
    //default m_DodgesData = UDodgesData_MCQueen::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Minecrawler_Queen_Ph2::StaticClass();
}

UCLASS()
class UAnimConfig_MCQueen : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Minecrawler_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_MCQueen::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_MinecrawlerLeg, UWeaponMeleeItemAnimConfig_MCQueen_Combat_Ph1::StaticClass());
    //default AddAnimForItem(GameplayTag::Item_Weapon_MinecrawlerLeg, UWeaponMeleeItemAnimConfig_MCQueen_Combat_Ph2::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile, USpitProjectile_MCQueen::StaticClass());
}