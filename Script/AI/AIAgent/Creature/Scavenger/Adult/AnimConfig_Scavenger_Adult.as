
//////////////////
UCLASS()
class UAttackMeleeConfig_Scavenger_Adult_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Attacks/A_Scavenger_Adult_LeftAttack01_Montage.A_Scavenger_Adult_LeftAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Parried/Scavenger_Adult_Hit_Parried_Left_Montage.Scavenger_Adult_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Deflected/A_Scavenger_Adult_HitDeflected_Left_Montage.A_Scavenger_Adult_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Adult_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Attacks/A_Scavenger_Adult_RightAttack01_Montage.A_Scavenger_Adult_RightAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Parried/Scavenger_Adult_Hit_Parried_Right_Montage.Scavenger_Adult_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Deflected/A_Scavenger_Adult_HitDeflected_Right_Montage.A_Scavenger_Adult_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.5f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Adult_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Attacks/Scavenger_Adult_TopAttack_Montage.Scavenger_Adult_TopAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Parried/Scavenger_Adult_Hit_Parried_Top_Montage.Scavenger_Adult_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Deflected/A_Scavenger_Adult_HitDeflected_Top_Montage.A_Scavenger_Adult_HitDeflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Adult_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Attacks/Scavenger_Adult_BottomAttack_Montage.Scavenger_Adult_BottomAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Parried/Scavenger_Adult_Hit_Parried_Bottom_Montage.Scavenger_Adult_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Hits/Deflected/A_Scavenger_Adult_HitDeflected_Bottom_Montage.A_Scavenger_Adult_HitDeflected_Bottom_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}

UCLASS()
class UAttackMeleeConfig_Scavenger_Adult_MoveBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/MoveBack/A_Scavenger_Adult_Combat_MoveBack_Montage.A_Scavenger_Adult_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Scavenger_Adult_Attack_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Adult_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Scavenger_Adult_Attack_Bottom::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Scavenger_Adult_Attack_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Scavenger_Adult_Attack_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Scavenger_Adult_Attack_Top::StaticClass());
}
UCLASS()
class UComboAttackConfig_Scavenger_Adult_Attack_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Adult_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Scavenger_Adult_Attack_Bottom::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Scavenger_Adult_Attack_Left::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Scavenger_Adult_Attack_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Scavenger_Adult_Attack_Top::StaticClass());
}

UCLASS()
class UComboAttackConfig_Scavenger_Adult_Attack_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Adult_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Scavenger_Adult_Attack_Top::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Scavenger_Adult_Attack_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Scavenger_Adult_Attack_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Scavenger_Adult_Attack_Top::StaticClass());

}

UCLASS()
class UComboAttackConfig_Scavenger_Adult_Attack_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Adult_Top::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}


UCLASS()
class UComboAttackConfig_Scavenger_Adult_MoveBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Scavenger_Adult_MoveBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Scavenger_Adult : UItemAnimConfig
{
     default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Scavenger/Adult/Scavenger_Adult_AnimBP.Scavenger_Adult_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Idles/Breaker/A_Scavenger_Adult_IdleBreaker_01.A_Scavenger_Adult_IdleBreaker_01'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Idles/Breaker/A_Scavenger_Adult_IdleBreaker_02.A_Scavenger_Adult_IdleBreaker_02'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Idles/Breaker/A_Scavenger_Adult_IdleBreaker_03.A_Scavenger_Adult_IdleBreaker_03'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Idles/Breaker/A_Scavenger_Adult_IdleBreaker_04.A_Scavenger_Adult_IdleBreaker_04'", 0.8f, 2);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Breaker/A_Scavenger_Adult_WalkBreaker_01.A_Scavenger_Adult_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Breaker/A_Scavenger_Adult_WalkBreaker_02.A_Scavenger_Adult_WalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Breaker/A_Scavenger_Adult_WalkBreaker_03.A_Scavenger_Adult_WalkBreaker_03'", 1.0f, 4);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Breaker/A_Scavenger_Adult_WalkBreaker_04.A_Scavenger_Adult_WalkBreaker_04'", 1.0f, 4);
    

   // TURNS
   default m_TurnsData = UTurnsData_Scavenger_Adult::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Scavenger_Adult::StaticClass();
    // 
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Scavenger_Adult_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Scavenger/Adult/Scavenger_Adult_AnimBP_Combat.Scavenger_Adult_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Idles/Breaker/A_Scavenger_Adult_CombatIdleBreaker_01.A_Scavenger_Adult_CombatIdleBreaker_01'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Idles/Breaker/A_Scavenger_Adult_CombatIdleBreaker_02.A_Scavenger_Adult_CombatIdleBreaker_02'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Idles/Breaker/A_Scavenger_Adult_CombatIdleBreaker_03.A_Scavenger_Adult_CombatIdleBreaker_03'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Idles/Breaker/A_Scavenger_Adult_CombatIdleBreaker_04.A_Scavenger_Adult_CombatIdleBreaker_04'", 0.4f, 1);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Breaker/A_Scavenger_Adult_CombatWalkBreaker_01.A_Scavenger_Adult_CombatWalkBreaker_01'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Breaker/A_Scavenger_Adult_CombatWalkBreaker_02.A_Scavenger_Adult_CombatWalkBreaker_02'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Breaker/A_Scavenger_Adult_CombatWalkBreaker_03.A_Scavenger_Adult_CombatWalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Breaker/A_Scavenger_Adult_CombatWalkBreaker_04.A_Scavenger_Adult_CombatWalkBreaker_04'", 0.4f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Scavenger_Adult_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Scavenger_Adult::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =     UComboAttackConfig_Scavenger_Adult_Attack_Right::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UComboAttackConfig_Scavenger_Adult_Attack_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =     UComboAttackConfig_Scavenger_Adult_Attack_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =     UComboAttackConfig_Scavenger_Adult_Attack_Top::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) =  UComboAttackConfig_Scavenger_Adult_MoveBwd::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Scavenger_Adult::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Scavenger_Adult::StaticClass();

    // TAUNTS
   default m_TauntData = UTauntData_Scavenger_Adult::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Scavenger_Adult_Rideable : UItemAnimConfig
{
     default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Scavenger/Adult/Scavenger_Adult_AnimBP.Scavenger_Adult_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Idles/Breaker/A_Scavenger_Adult_IdleBreaker_01.A_Scavenger_Adult_IdleBreaker_01'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Idles/Breaker/A_Scavenger_Adult_IdleBreaker_02.A_Scavenger_Adult_IdleBreaker_02'", 0.9f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Idles/Breaker/A_Scavenger_Adult_IdleBreaker_03.A_Scavenger_Adult_IdleBreaker_03'", 0.7f, 1);
    //default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Idles/Breaker/A_Scavenger_Adult_IdleBreaker_04.A_Scavenger_Adult_IdleBreaker_04'", 0.8f, 2);
    
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Breaker/A_Scavenger_Adult_WalkBreaker_01.A_Scavenger_Adult_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Breaker/A_Scavenger_Adult_WalkBreaker_02.A_Scavenger_Adult_WalkBreaker_02'", 2.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Breaker/A_Scavenger_Adult_WalkBreaker_03.A_Scavenger_Adult_WalkBreaker_03'", 1.0f, 4);
    //default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Breaker/A_Scavenger_Adult_WalkBreaker_04.A_Scavenger_Adult_WalkBreaker_04'", 1.0f, 4);
    

   // TURNS
   default m_TurnsData = UTurnsData_Scavenger_Adult::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Scavenger_Adult_Rideable::StaticClass();
    // 
}

UCLASS()
class UAnimConfig_Scavenger_Adult : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Razor_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Scavenger::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Scavenger_Adult_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Scavenger_Adult::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Scavenger_Adult_Combat::StaticClass());

    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Scavenger_Adult_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Scavenger_Adult_Combat::StaticClass());
}

UCLASS()
class UAnimConfig_Scavenger_Adult_Rideable : UAnimConfig_Scavenger_Adult
{
    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Scavenger_Adult_Rideable::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Scavenger_Adult_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Actions/Scavenger_Adult_EatItem_Montage.Scavenger_Adult_EatItem_Montage'";
}