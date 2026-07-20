UCLASS()
class UWeaponMeleeItemAnimConfig_JuvenileTroll : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/JuvenileTroll/JuvenileTroll_AnimBP.JuvenileTroll_AnimBP_C'";
	
    
    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Idles/Breaker/A_JuvenileTroll_IdleBreaker_01.A_JuvenileTroll_IdleBreaker_01'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Idles/Breaker/A_JuvenileTroll_IdleBreaker_02.A_JuvenileTroll_IdleBreaker_02'", 0.3f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Idles/Breaker/A_JuvenileTroll_IdleBreaker_03.A_JuvenileTroll_IdleBreaker_03'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Idles/Breaker/A_JuvenileTroll_IdleBreaker_04.A_JuvenileTroll_IdleBreaker_04'", 0.7f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Idles/Breaker/A_JuvenileTroll_IdleBreaker_05.A_JuvenileTroll_IdleBreaker_05'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Idles/Breaker/A_JuvenileTroll_IdleBreaker_06.A_JuvenileTroll_IdleBreaker_06'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Idles/Breaker/A_JuvenileTroll_IdleBreaker_07.A_JuvenileTroll_IdleBreaker_07'", 0.4f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Grounded/N/Breaker/A_JuvenileTroll_WalkBreaker_01.A_JuvenileTroll_WalkBreaker_01'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Grounded/N/Breaker/A_JuvenileTroll_WalkBreaker_02.A_JuvenileTroll_WalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Grounded/N/Breaker/A_JuvenileTroll_WalkBreaker_03.A_JuvenileTroll_WalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Grounded/N/Breaker/A_JuvenileTroll_WalkBreaker_04.A_JuvenileTroll_WalkBreaker_04'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Grounded/N/Breaker/A_JuvenileTroll_WalkBreaker_05.A_JuvenileTroll_WalkBreaker_05'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/Grounded/N/Breaker/A_JuvenileTroll_WalkBreaker_06.A_JuvenileTroll_WalkBreaker_06'", 0.5f, 2);
    

   // TURNS
   default m_TurnsData = UTurnsData_JuvenileTroll::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_JuvenileTroll::StaticClass();
    //    
}

UCLASS()
class UWeaponMeleeItemAnimConfig_JuvenileTroll_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/JuvenileTroll/JuvenileTroll_AnimBP_Combat.JuvenileTroll_AnimBP_Combat_C'";

    //IDLE COMBAT BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_01.A_JuvenileTroll_CombatIdleBreaker_01'", 1.0f, 2);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_02.A_JuvenileTroll_CombatIdleBreaker_02'", 0.3f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_03.A_JuvenileTroll_CombatIdleBreaker_03'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_04.A_JuvenileTroll_CombatIdleBreaker_04'", 0.7f, 2);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_05.A_JuvenileTroll_CombatIdleBreaker_05'", 0.6f, 1);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_06.A_JuvenileTroll_CombatIdleBreaker_06'", 0.8f, 2);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_07.A_JuvenileTroll_CombatIdleBreaker_07'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_08.A_JuvenileTroll_CombatIdleBreaker_08'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_09.A_JuvenileTroll_CombatIdleBreaker_09'", 0.4f, 1);
    // default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Idles/Breaker/A_JuvenileTroll_CombatIdleBreaker_10.A_JuvenileTroll_CombatIdleBreaker_10'", 0.4f, 1);
    
    //WALK COMBAT BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Grounded/N/Breaker/A_JuvenileTroll_CombatWalkBreaker_01.A_JuvenileTroll_CombatWalkBreaker_01'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Grounded/N/Breaker/A_JuvenileTroll_CombatWalkBreaker_02.A_JuvenileTroll_CombatWalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Grounded/N/Breaker/A_JuvenileTroll_CombatWalkBreaker_03.A_JuvenileTroll_CombatWalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Grounded/N/Breaker/A_JuvenileTroll_CombatWalkBreaker_04.A_JuvenileTroll_CombatWalkBreaker_04'", 0.8f, 2);
    // default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Grounded/N/Breaker/A_JuvenileTroll_CombatWalkBreaker_05.A_JuvenileTroll_CombatWalkBreaker_05'", 0.6f, 1);
    // default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Grounded/N/Breaker/A_JuvenileTroll_CombatWalkBreaker_06.A_JuvenileTroll_CombatWalkBreaker_06'", 0.5f, 2);
    // default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Grounded/N/Breaker/A_JuvenileTroll_CombatWalkBreaker_07.A_JuvenileTroll_CombatWalkBreaker_07'", 0.5f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/JuvenileTroll/Combat/Movement/Grounded/N/Breaker/A_JuvenileTroll_CombatWalkBreaker_08.A_JuvenileTroll_CombatWalkBreaker_08'", 0.5f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_JuvenileTroll_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Troll_Juvenile::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_JuvenileTroll_Attack_Right01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_JuvenileTroll_Attack_Left02::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =      UComboAttackConfig_JuvenileTroll_Attack_Bottom::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_JuvenileTroll::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_JuvenileTroll::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Troll_Juvenile::StaticClass();
    //
}


UCLASS()
class UAnimConfig_JuvenileTroll : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_JuvenileTroll::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_JuvenileTroll_Eat_Item::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_JuvenileTroll_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_JuvenileTroll_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Actions/A_JuvenileTroll_Montage_EatItem.A_JuvenileTroll_Montage_EatItem'";
}