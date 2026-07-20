
//////////////////

UCLASS()
class UAttackMeleeConfig_Scavenger_Young_Attack_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Attacks/Scavenger_Young_TopAttack_Montage.Scavenger_Young_TopAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Hits/Parried/Scavenger_Young_Hit_Parried_Top_Montage.Scavenger_Young_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Hits/Deflected/Scavenger_Young_Hit_Deflected_Top_Montage.Scavenger_Young_Hit_Deflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Young_Attack_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Attacks/Scavenger_Young_BottomAttack_Montage.Scavenger_Young_BottomAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Hits/Parried/Scavenger_Young_Hit_Parried_Bottom_Montage.Scavenger_Young_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Hits/Deflected/Scavenger_Young_Hit_Deflected_Bottom_Montage.Scavenger_Young_Hit_Deflected_Bottom_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Young_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/MoveBack/A_Scavenger_Combat_MoveBack_Montage.A_Scavenger_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Scavenger_Young_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Young_Attack_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

}

UCLASS()
class UComboAttackConfig_Scavenger_Young_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Young_Attack_Top::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_Scavenger_Young_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Young_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Scavenger_Young : UWeaponMeleeItemAnimConfig
{
     default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Scavenger/Young/Scavenger_Young_AnimBP.Scavenger_Young_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Idles/Breaker/A_Scavenger_IdleBreaker_01.A_Scavenger_IdleBreaker_01'", 0.4f, 1);
    //default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Idles/Breaker/A_Scavenger_IdleBreaker_02.A_Scavenger_IdleBreaker_02'", 0.5f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Idles/Breaker/A_Scavenger_IdleBreaker_03.A_Scavenger_IdleBreaker_03'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Idles/Breaker/A_Scavenger_IdleBreaker_04.A_Scavenger_IdleBreaker_04'", 1.0f, 1);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Breaker/A_Scavenger_WalkBreaker_01.A_Scavenger_WalkBreaker_01'", 0.4f, 1);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Breaker/A_Scavenger_WalkBreaker_02.A_Scavenger_WalkBreaker_02'", 0.5f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Breaker/A_Scavenger_WalkBreaker_03.A_Scavenger_WalkBreaker_03'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Breaker/A_Scavenger_WalkBreaker_04.A_Scavenger_WalkBreaker_04'", 1.0f, 1);
    

   // TURNS
   default m_TurnsData = UTurnsData_Scavenger_Young::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Scavenger_Young::StaticClass();
    // 
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Scavenger_Young_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Scavenger/Young/Scavenger_Young_AnimBP_Combat.Scavenger_Young_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Idle/Breaker/A_Scavenger_CombatIdleBreaker_01.A_Scavenger_CombatIdleBreaker_01'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Idle/Breaker/A_Scavenger_CombatIdleBreaker_02.A_Scavenger_CombatIdleBreaker_02'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Idle/Breaker/A_Scavenger_CombatIdleBreaker_03.A_Scavenger_CombatIdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Idle/Breaker/A_Scavenger_CombatIdleBreaker_04.A_Scavenger_CombatIdleBreaker_04'", 0.5f, 2);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Breaker/A_Scavenger_CombatWalkBreaker_01.A_Scavenger_CombatWalkBreaker_01'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Breaker/A_Scavenger_CombatWalkBreaker_02.A_Scavenger_CombatWalkBreaker_02'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Breaker/A_Scavenger_CombatWalkBreaker_03.A_Scavenger_CombatWalkBreaker_03'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Breaker/A_Scavenger_CombatWalkBreaker_04.A_Scavenger_CombatWalkBreaker_04'", 0.4f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Scavenger_Young_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Scavenger_Young::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) = UComboAttackConfig_Scavenger_Young_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) = UComboAttackConfig_Scavenger_Young_Attack_Top::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) = UComboAttackConfig_Scavenger_Young_MoveBwd::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Scavenger_Young::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Scavenger_Young::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Scavenger_Young::StaticClass();
    //
}

UCLASS()
class UAnimConfig_Scavenger_Young : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Razor_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Scavenger::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Scavenger_Young_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Scavenger_Young::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Scavenger_Young_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Scavenger_Young_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Scavenger_Young_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Scavenger_Young_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Actions/Scavenger_Young_EatItem_Montage.Scavenger_Young_EatItem_Montage'";
}