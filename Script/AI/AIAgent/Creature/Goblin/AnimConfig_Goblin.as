
UCLASS()
class UWeaponMeleeItemAnimConfig_Goblin : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Green_Goblin/GreenGoblin_AnimBP.GreenGoblin_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Idles/Breaker/A_GreenGoblin_IdleBreaker_01.A_GreenGoblin_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Idles/Breaker/A_GreenGoblin_IdleBreaker_02.A_GreenGoblin_IdleBreaker_02'", 0.7f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Idles/Breaker/A_GreenGoblin_IdleBreaker_03.A_GreenGoblin_IdleBreaker_03'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Idles/Breaker/A_GreenGoblin_IdleBreaker_04.A_GreenGoblin_IdleBreaker_04'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Idles/Breaker/A_GreenGoblin_IdleBreaker_05.A_GreenGoblin_IdleBreaker_05'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Idles/Breaker/A_GreenGoblin_IdleBreaker_06.A_GreenGoblin_IdleBreaker_06'", 0.9f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Idles/Breaker/A_GreenGoblin_IdleBreaker_07.A_GreenGoblin_IdleBreaker_07'", 0.9f, 1);
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Breaker/A_GreenGoblin_WalkBreaker_01.A_GreenGoblin_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Breaker/A_GreenGoblin_WalkBreaker_02.A_GreenGoblin_WalkBreaker_02'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Breaker/A_GreenGoblin_WalkBreaker_03.A_GreenGoblin_WalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Breaker/A_GreenGoblin_WalkBreaker_04.A_GreenGoblin_WalkBreaker_04'", 0.7f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Breaker/A_GreenGoblin_WalkBreaker_05.A_GreenGoblin_WalkBreaker_05'", 0.8f, 1);
    

   // TURNS
   default m_TurnsData = UTurnsData_Goblin::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Goblin::StaticClass();
    //
}

UCLASS()
class UProjectile_Goblin : UItemAnimConfig
{
    default m_EquipData = UEquipData_Goblin_UProjectile::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Goblin_Combat : UWeaponMeleeItemAnimConfig
{

    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Green_Goblin/GreenGoblin_AnimBP_Combat.GreenGoblin_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Idles/Breaker/A_GreenGoblin_CombatIdleBreaker_01.A_GreenGoblin_CombatIdleBreaker_01'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Idles/Breaker/A_GreenGoblin_CombatIdleBreaker_02.A_GreenGoblin_CombatIdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Idles/Breaker/A_GreenGoblin_CombatIdleBreaker_03.A_GreenGoblin_CombatIdleBreaker_03'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Idles/Breaker/A_GreenGoblin_CombatIdleBreaker_04.A_GreenGoblin_CombatIdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Idles/Breaker/A_GreenGoblin_CombatIdleBreaker_05.A_GreenGoblin_CombatIdleBreaker_05'", 0.7f, 2);
    

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Breaker/A_GreenGoblin_CombatWalkBreaker_01.A_GreenGoblin_CombatWalkBreaker_01'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Breaker/A_GreenGoblin_CombatWalkBreaker_02.A_GreenGoblin_CombatWalkBreaker_02'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Breaker/A_GreenGoblin_CombatWalkBreaker_03.A_GreenGoblin_CombatWalkBreaker_03'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Breaker/A_GreenGoblin_CombatWalkBreaker_04.A_GreenGoblin_CombatWalkBreaker_04'", 0.9f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Breaker/A_GreenGoblin_CombatWalkBreaker_05.A_GreenGoblin_CombatWalkBreaker_05'", 0.7f, 3);

    // TURNS
    default m_TurnsData = UTurnsData_Goblin_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Goblin::StaticClass();

	// HITS
    default m_HitsData = UHitData_Goblin::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Goblin::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Goblin::StaticClass();
    //
}

UCLASS()
class UAnimConfig_Goblin : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Pick_ToInventory, UInteractAnimConfig_Goblin_Pick::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Goblin_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Goblin::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Goblin_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Goblin_Combat::StaticClass());
	//default AddAnimForItem(GameplayTag::Item_Weapon_Mace_OneHand, UWeaponMeleeItemAnimConfig_Goblin_Combat::StaticClass());
    //default AddAnimForItem(GameplayTag::Item_Weapon_Sword_OneHand, UWeaponMeleeItemAnimConfig_Goblin_Combat::StaticClass());
    //default AddAnimForItem(GameplayTag::Item_Weapon_Projectile, UProjectile_Goblin::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Goblin_Pick : UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_Montage_PickUp.GreenGoblin_Montage_PickUp'";
}

UCLASS()
class UInteractAnimConfig_Goblin_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_Montage_PickUpAndEat.GreenGoblin_Montage_PickUpAndEat'";
}