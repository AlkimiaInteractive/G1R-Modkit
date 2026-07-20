UCLASS()
class UWeaponMeleeItemAnimConfig_Troll : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/AdultTroll/AdultTroll_AnimBP.AdultTroll_AnimBP_C'";

    
    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Idles/Breaker/A_AdultTroll_IdleBreaker_01.A_AdultTroll_IdleBreaker_01'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Idles/Breaker/A_AdultTroll_IdleBreaker_02.A_AdultTroll_IdleBreaker_02'", 0.3f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Idles/Breaker/A_AdultTroll_IdleBreaker_03.A_AdultTroll_IdleBreaker_03'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Idles/Breaker/A_AdultTroll_IdleBreaker_04.A_AdultTroll_IdleBreaker_04'", 0.7f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Idles/Breaker/A_AdultTroll_IdleBreaker_05.A_AdultTroll_IdleBreaker_05'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Idles/Breaker/A_AdultTroll_IdleBreaker_06.A_AdultTroll_IdleBreaker_06'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Idles/Breaker/A_AdultTroll_IdleBreaker_07.A_AdultTroll_IdleBreaker_07'", 0.4f, 1);
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Breaker/A_AdultTroll_WalkBreaker_01.A_AdultTroll_WalkBreaker_01'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Breaker/A_AdultTroll_WalkBreaker_02.A_AdultTroll_WalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Breaker/A_AdultTroll_WalkBreaker_03.A_AdultTroll_WalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Breaker/A_AdultTroll_WalkBreaker_04.A_AdultTroll_WalkBreaker_04'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Breaker/A_AdultTroll_WalkBreaker_05.A_AdultTroll_WalkBreaker_05'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Breaker/A_AdultTroll_WalkBreaker_06.A_AdultTroll_WalkBreaker_06'", 0.5f, 2);
    

   // TURNS
   default m_TurnsData = UTurnsData_Troll::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Troll::StaticClass();
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Troll_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/AdultTroll/AdultTroll_AnimBP_Combat.AdultTroll_AnimBP_Combat_C'";

    //IDLE COMBAT BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_01.A_AdultTroll_CombatIdleBreaker_01'", 1.0f, 2);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_02.A_AdultTroll_CombatIdleBreaker_02'", 0.3f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_03.A_AdultTroll_CombatIdleBreaker_03'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_04.A_AdultTroll_CombatIdleBreaker_04'", 0.7f, 2);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_05.A_AdultTroll_CombatIdleBreaker_05'", 0.6f, 1);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_06.A_AdultTroll_CombatIdleBreaker_06'", 0.8f, 2);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_07.A_AdultTroll_CombatIdleBreaker_07'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_08.A_AdultTroll_CombatIdleBreaker_08'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_09.A_AdultTroll_CombatIdleBreaker_09'", 0.4f, 1);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Idles/Breaker/A_AdultTroll_CombatIdleBreaker_10.A_AdultTroll_CombatIdleBreaker_10'", 0.4f, 1);
    
    //WALK COMBAT BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Breaker/A_AdultTroll_CombatWalkBreaker_01.A_AdultTroll_CombatWalkBreaker_01'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Breaker/A_AdultTroll_CombatWalkBreaker_02.A_AdultTroll_CombatWalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Breaker/A_AdultTroll_CombatWalkBreaker_03.A_AdultTroll_CombatWalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Breaker/A_AdultTroll_CombatWalkBreaker_04.A_AdultTroll_CombatWalkBreaker_04'", 0.8f, 2);
    // default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Breaker/A_AdultTroll_CombatWalkBreaker_05.A_AdultTroll_CombatWalkBreaker_05'", 0.6f, 1);
    // default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Breaker/A_AdultTroll_CombatWalkBreaker_06.A_AdultTroll_CombatWalkBreaker_06'", 0.5f, 2);
    // default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Breaker/A_AdultTroll_CombatWalkBreaker_07.A_AdultTroll_CombatWalkBreaker_07'", 0.5f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Breaker/A_AdultTroll_CombatWalkBreaker_08.A_AdultTroll_CombatWalkBreaker_08'", 0.5f, 2);
    

    // TURNS
    default m_TurnsData = UTurnsData_Troll_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 270.0f;
    default m_RotateSpeedMagnetAI = 270.0f;
    
    // Equip
    default m_EquipData = UEquipData_Troll::StaticClass();
    
    // COMBOS (Not shrinked)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Troll_Attack_Left02::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Troll_Attack_Right01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =      UComboAttackConfig_Troll_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =      UComboAttackConfig_TrollAdult_PickGoblin::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UComboAttackConfig_TrollAdult_ThrowStone::StaticClass();
    //

    // COMBOS (Shrinked)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =      UComboAttackConfig_Troll_Shrinked_Attack_Right01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra03) =      UComboAttackConfig_Troll_Shrinked_Attack_Left02::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra04) =      UComboAttackConfig_Troll_Shrinked_Attack_Bottom::StaticClass();
    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra05) =         UComboAttackConfig_Troll_Shrinked_Attack_Top::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra06) =      UComboAttackConfig_Troll_ShrinkedAdult_ThrowStone::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Troll::StaticClass();
    // 

    // DODGES
    //default m_DodgesData = UDodgesData_Troll::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Troll_Adult::StaticClass();
    //
}


UCLASS()
class UAnimConfig_Troll : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Troll::StaticClass());

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Troll_Eat_Item::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Troll_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile_Right, UProjectile_AdultTroll_ThrowGoblin::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_AdultTroll_ThrowStone::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile, UProjectile_AdultTroll_Shrinked_ThrowRock::StaticClass());
}


UCLASS()
class UInteractAnimConfig_Troll_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Actions/A_AdultTroll_Montage_EatItem.A_AdultTroll_Montage_EatItem'";
}    

UCLASS()
class UProjectile_AdultTroll_ThrowGoblin : UItemAnimConfig
{
    default m_EquipData = UEquipData_AdultTroll_ThrowGoblin::StaticClass();
}

UCLASS()
class UProjectile_AdultTroll_Shrinked_ThrowRock : UItemAnimConfig
{
    default m_EquipData = UEquipData_AdultTroll_ThrowRock::StaticClass();
}

UCLASS()
class UProjectile_AdultTroll_ThrowStone : UItemAnimConfig
{
    default m_EquipData = UEquipData_AdultTroll_ThrowRock::StaticClass();
}
