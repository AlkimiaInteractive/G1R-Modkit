

//////////////////
UCLASS()
class UAttackMeleeConfig_OrcDog_Headbutt_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Attacks/OrcDog_Headbutt_Montage.OrcDog_Headbutt_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Parried/OrcDog_N_Hit_Parried_Bottom_AnimMontage.OrcDog_N_Hit_Parried_Bottom_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Deflected/A_OrcDog_HitDeflected_Bottom_Montage.A_OrcDog_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.8f);
	default m_SuperArmorDamageMultiplier = 1.2f;

    default m_CanKnockback = true;
}

UCLASS()
class UAttackMeleeConfig_OrcDog_Bite_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Attacks/A_OrcDog_BiteLeft_Montage.A_OrcDog_BiteLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Parried/OrcDog_N_Hit_Parried_Left_Montage.OrcDog_N_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Deflected/A_OrcDog_HitDeflected_Left_Montage.A_OrcDog_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_OrcDog_Bite_Left02 : UAttackMeleeConfig_OrcDog_Bite_Left
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Attacks/A_OrcDog_BiteLeft_Montage.A_OrcDog_BiteLeft_Montage'";
}

UCLASS()
class UAttackMeleeConfig_OrcDog_Bite_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Attacks/A_OrcDog_BiteRight_Montage.A_OrcDog_BiteRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Parried/OrcDog_N_Hit_Parried_Right_Montage.OrcDog_N_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Hits/Deflected/A_OrcDog_HitDeflected_Right_Montage.A_OrcDog_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_OrcDog_Bite_Right02 : UAttackMeleeConfig_OrcDog_Bite_Right
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/Attacks/A_OrcDog_BiteRight_Montage.A_OrcDog_BiteRight_Montage'";
}

UCLASS()
class UAttackMeleeConfig_OrcDog_WalkBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Combat/MoveBack/A_OrcDog_Combat_MoveBack_Montage.A_OrcDog_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_OrcDog_Headbutt_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_OrcDog_Headbutt_Top::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_OrcDog_Bite_Left02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_OrcDog_Bite_Right02::StaticClass());
}

UCLASS()
class UComboAttackConfig_OrcDog_Bite_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_OrcDog_Bite_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
    
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_OrcDog_Bite_Right02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_OrcDog_Bite_Right02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_OrcDog_Headbutt_Top::StaticClass());
}

UCLASS()
class UComboAttackConfig_OrcDog_Bite_Left02 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_OrcDog_Bite_Left02::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_OrcDog_Bite_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_OrcDog_Bite_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_OrcDog_Bite_Left02::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_OrcDog_Bite_Left02::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_OrcDog_Headbutt_Top::StaticClass());
}

UCLASS()
class UComboAttackConfig_OrcDog_Bite_Right02 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_OrcDog_Bite_Right02::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_OrcDog_WalkBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_OrcDog_WalkBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_OrcDog : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/OrcDog/OrcDog_AnimBP.OrcDog_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Idles/Breaker/A_OrcDog_IdleBreaker_01.A_OrcDog_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Idles/Breaker/A_OrcDog_IdleBreaker_02.A_OrcDog_IdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Idles/Breaker/A_OrcDog_IdleBreaker_03.A_OrcDog_IdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Idles/Breaker/A_OrcDog_IdleBreaker_04.A_OrcDog_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Idles/Breaker/A_OrcDog_IdleBreaker_05.A_OrcDog_IdleBreaker_05'", 0.5f, 1);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Breaker/A_OrcDog_WalkBreaker_01.A_OrcDog_WalkBreaker_01'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Breaker/A_OrcDog_WalkBreaker_02.A_OrcDog_WalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Breaker/A_OrcDog_WalkBreaker_03.A_OrcDog_WalkBreaker_03'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Breaker/A_OrcDog_WalkBreaker_04.A_OrcDog_WalkBreaker_04'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Breaker/A_OrcDog_WalkBreaker_05.A_OrcDog_WalkBreaker_05'", 1.0f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_OrcDog::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_OrcDog::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_OrcDog::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_OrcDog_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/OrcDog/OrcDog_AnimBP_Combat.OrcDog_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Idles/Breaker/A_OrcDog_CombatIdleBreaker_01.A_OrcDog_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Idles/Breaker/A_OrcDog_CombatIdleBreaker_02.A_OrcDog_CombatIdleBreaker_02'", 1.0f, 3);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Idles/Breaker/A_OrcDog_CombatIdleBreaker_03.A_OrcDog_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Idles/Breaker/A_OrcDog_CombatIdleBreaker_04.A_OrcDog_CombatIdleBreaker_04'", 0.8f, 2);

    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Breaker/A_OrcDog_CombatWalkBreaker_01.A_OrcDog_CombatWalkBreaker_01'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Breaker/A_OrcDog_CombatWalkBreaker_02.A_OrcDog_CombatWalkBreaker_02'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Breaker/A_OrcDog_CombatWalkBreaker_03.A_OrcDog_CombatWalkBreaker_03'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Breaker/A_OrcDog_CombatWalkBreaker_04.A_OrcDog_CombatWalkBreaker_04'", 1.0f, 3);

    // TURNS
    default m_TurnsData = UTurnsData_OrcDog_Combat::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 270.0f;
    default m_RotateSpeedMagnetAI = 270.0f;
    
    // Equip
    default m_EquipData = UEquipData_OrcDog::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =   UComboAttackConfig_OrcDog_Bite_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =  UComboAttackConfig_OrcDog_Bite_Right::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_OrcDog_Headbutt_Top::StaticClass();
    //
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_OrcDog_Headbutt_Top::StaticClass();
    
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) = UComboAttackConfig_OrcDog_WalkBwd::StaticClass();

	// HITS
    default m_HitsData = UHitData_Default_OrcDog::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_OrcDog::StaticClass();
    //
    
    // TAUNTS
    default m_TauntData = UTauntData_Orcdog::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_OrcDog_Combat::StaticClass();
}


UCLASS()
class UAnimConfig_OrcDog : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Quadruped_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_OrcDog::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_OrcDog_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_OrcDog_Eat_Meatbug::StaticClass());

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_OrcDog::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_OrcDog_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_OrcDog_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_OrcDog_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_OrcDog_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Actions/OrcDog_Montage_EatItem.OrcDog_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_OrcDog_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Actions/OrcDog_Montage_EatMeatbug.OrcDog_Montage_EatMeatbug'";
}