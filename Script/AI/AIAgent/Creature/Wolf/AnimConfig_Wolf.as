
//////////////////
// BITE
UCLASS()
class UAttackMeleeConfig_Wolf_Bite_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/A_Wolf_A_B01_Dsg_Montage.A_Wolf_A_B01_Dsg_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Parried/Wolf_N_Hit_Parried_Bottom_AnimMontage.Wolf_N_Hit_Parried_Bottom_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Deflected/A_Wolf_HitDeflected_Bottom_Montage.A_Wolf_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Wolf_Bite_Bottom2 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/A_Wolf_A_B02_Dsg_Montage.A_Wolf_A_B02_Dsg_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Parried/Wolf_N_Hit_Parried_Bottom_AnimMontage.Wolf_N_Hit_Parried_Bottom_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Deflected/A_Wolf_HitDeflected_Bottom_Montage.A_Wolf_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Wolf_Bite_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/A_Wolf_A_T01_Dsg_Montage.A_Wolf_A_T01_Dsg_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Parried/Wolf_N_Hit_Parried_Top_AnimMontage.Wolf_N_Hit_Parried_Top_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Deflected/A_Wolf_HitDeflected_Top_Montage.A_Wolf_HitDeflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Wolf_Bite_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/Wolf_AttackLight_Montage.Wolf_AttackLight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Parried/Wolf_N_Hit_Parried_Top_AnimMontage.Wolf_N_Hit_Parried_Top_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Deflected/A_Wolf_HitDeflected_Top_Montage.A_Wolf_HitDeflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Wolf_Bite_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_Bite_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Wolf_Bite_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Wolf_Bite_Rigth::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
}

UCLASS()
class UComboAttackConfig_Wolf_Bite_Bottom2 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_Bite_Bottom2::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Wolf_Bite_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Wolf_Bite_Rigth::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
}


UCLASS()
class UComboAttackConfig_Wolf_Bite_Rigth : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_Bite_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
     default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Wolf_Bite_Bottom::StaticClass());
}

UCLASS()
class UComboAttackConfig_Wolf_Bite_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_Bite_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
     default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Wolf_Bite_Bottom::StaticClass());
}

UCLASS()
class UAttackMeleeConfig_Wolf_Bite_Bottom_Alpha : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/A_Wolf_A_B01_Dsg_Alpha_Montage.A_Wolf_A_B01_Dsg_Alpha_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Parried/Wolf_N_Hit_Parried_Bottom_AnimMontage.Wolf_N_Hit_Parried_Bottom_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Deflected/A_Wolf_HitDeflected_Bottom_Montage.A_Wolf_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Wolf_Bite_Bottom2_Alpha : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/A_Wolf_A_B02_Dsg_Alpha_Montage.A_Wolf_A_B02_Dsg_Alpha_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Parried/Wolf_N_Hit_Parried_Bottom_AnimMontage.Wolf_N_Hit_Parried_Bottom_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Deflected/A_Wolf_HitDeflected_Bottom_Montage.A_Wolf_HitDeflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Wolf_Bite_Right_Alpha : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/A_Wolf_A_T01_Dsg_Montage.A_Wolf_A_T01_Dsg_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Parried/Wolf_N_Hit_Parried_Top_AnimMontage.Wolf_N_Hit_Parried_Top_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Deflected/A_Wolf_HitDeflected_Top_Montage.A_Wolf_HitDeflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Wolf_Bite_Left_Alpha : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Attacks/Wolf_AttackLight_Alpha_Montage.Wolf_AttackLight_Alpha_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Parried/Wolf_N_Hit_Parried_Top_AnimMontage.Wolf_N_Hit_Parried_Top_AnimMontage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Hits/Deflected/A_Wolf_HitDeflected_Top_Montage.A_Wolf_HitDeflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Wolf_WalkBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/MoveBack/A_Wolf_Combat_MoveBack_Montage.A_Wolf_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Wolf_Bite_Bottom_Alpha : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_Bite_Bottom_Alpha::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Wolf_Bite_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Wolf_Bite_Rigth::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
}

UCLASS()
class UComboAttackConfig_Wolf_Bite_Bottom2_Alpha : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_Bite_Bottom2_Alpha::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Wolf_Bite_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Wolf_Bite_Rigth::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
}


UCLASS()
class UComboAttackConfig_Wolf_Bite_Rigth_Alpha : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_Bite_Right_Alpha::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
     default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Wolf_Bite_Bottom::StaticClass());
}

UCLASS()
class UComboAttackConfig_Wolf_Bite_Left_Alpha : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_Bite_Left_Alpha::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Wolf_WalkBwd::StaticClass());
     default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Wolf_Bite_Bottom::StaticClass());
}

UCLASS()
class UComboAttackConfig_Wolf_WalkBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Wolf_WalkBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Wolf : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Wolf/Wolf_AnimBP.Wolf_AnimBP_C'";


    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Idles/Breaker/A_Wolf_IdleBreaker_01.A_Wolf_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Idles/Breaker/A_Wolf_IdleBreaker_02.A_Wolf_IdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Idles/Breaker/A_Wolf_IdleBreaker_03.A_Wolf_IdleBreaker_03'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Idles/Breaker/A_Wolf_IdleBreaker_04.A_Wolf_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Idles/Breaker/A_Wolf_IdleBreaker_05.A_Wolf_IdleBreaker_05'", 0.7f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Idles/Breaker/A_Wolf_IdleBreaker_06.A_Wolf_IdleBreaker_06'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Idles/Breaker/A_Wolf_IdleBreaker_07.A_Wolf_IdleBreaker_07'", 0.5f, 1);
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Breaker/A_Wolf_WalkBreaker_01.A_Wolf_WalkBreaker_01'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Breaker/A_Wolf_WalkBreaker_02.A_Wolf_WalkBreaker_02'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Breaker/A_Wolf_WalkBreaker_04.A_Wolf_WalkBreaker_04'", 1.0f, 2);
    
    // TURNS
    default m_TurnsData = UTurnsData_Wolf::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Wolf::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Wolf::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Wolf_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Wolf/Wolf_AnimBP_Combat.Wolf_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Idles/Breaker/A_Wolf_CombatIdleBreaker_01.A_Wolf_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Idles/Breaker/A_Wolf_CombatIdleBreaker_02.A_Wolf_CombatIdleBreaker_02'", 1.5f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Idles/Breaker/A_Wolf_CombatIdleBreaker_03.A_Wolf_CombatIdleBreaker_03'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Idles/Breaker/A_Wolf_CombatIdleBreaker_04.A_Wolf_CombatIdleBreaker_04'", 1.0f, 2);
    
    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Breaker/A_Wolf_CombatWalkBreaker_01.A_Wolf_CombatWalkBreaker_01'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Breaker/A_Wolf_CombatWalkBreaker_02.A_Wolf_CombatWalkBreaker_02'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Breaker/A_Wolf_CombatWalkBreaker_03.A_Wolf_CombatWalkBreaker_03'", 1.5f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Breaker/A_Wolf_CombatWalkBreaker_04.A_Wolf_CombatWalkBreaker_04'", 0.4f, 3);

    // TURNS
    default m_TurnsData = UTurnsData_Wolf_Combat::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 300.0f;
    default m_RotateSpeedMagnetAI = 300.0f;
    
    // Equip
    default m_EquipData= UEquipData_Wolf::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Wolf_Bite_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_Wolf_Bite_Bottom2::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Wolf_Bite_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Wolf_Bite_Left::StaticClass();

    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =   UComboAttackConfig_Wolf_Bite_Bottom2::StaticClass();
    //
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) = UComboAttackConfig_Wolf_WalkBwd::StaticClass();

	// HITS
    default m_HitsData = UHitData_Default_Wolf::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Wolf::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Wolf::StaticClass();

    default m_ConsumablesData = UConsumablesData_Wolf_Combat::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Wolf_Combat_Alpha : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Wolf/Wolf_AnimBP_Combat.Wolf_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Idles/Breaker/A_Wolf_CombatIdleBreaker_01.A_Wolf_CombatIdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Idles/Breaker/A_Wolf_CombatIdleBreaker_02.A_Wolf_CombatIdleBreaker_02'", 1.5f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Idles/Breaker/A_Wolf_CombatIdleBreaker_03.A_Wolf_CombatIdleBreaker_03'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Idles/Breaker/A_Wolf_CombatIdleBreaker_04.A_Wolf_CombatIdleBreaker_04'", 1.0f, 2);
    
    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Breaker/A_Wolf_CombatWalkBreaker_01.A_Wolf_CombatWalkBreaker_01'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Breaker/A_Wolf_CombatWalkBreaker_02.A_Wolf_CombatWalkBreaker_02'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Breaker/A_Wolf_CombatWalkBreaker_03.A_Wolf_CombatWalkBreaker_03'", 1.5f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Breaker/A_Wolf_CombatWalkBreaker_04.A_Wolf_CombatWalkBreaker_04'", 0.4f, 3);

    // TURNS
    default m_TurnsData = UTurnsData_Wolf_Combat::StaticClass();
    //

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 300.0f;
    default m_RotateSpeedMagnetAI = 300.0f;
    
    // Equip
    default m_EquipData= UEquipData_Wolf::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Wolf_Bite_Bottom_Alpha::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_Wolf_Bite_Bottom2_Alpha::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Wolf_Bite_Left_Alpha::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Wolf_Bite_Left_Alpha::StaticClass();

    //default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =   UComboAttackConfig_Wolf_Bite_Bottom2::StaticClass();
    //
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) = UComboAttackConfig_Wolf_WalkBwd::StaticClass();

	// HITS
    default m_HitsData = UHitData_Default_Wolf::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Wolf::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Wolf::StaticClass();

    default m_ConsumablesData = UConsumablesData_Wolf::StaticClass();
}

UCLASS()
class UAnimConfig_Wolf : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Quadruped_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Wolf::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Wolf_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Wolf_Eat_Meatbug::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Wolf::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Wolf_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Wolf_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Wolf_Combat::StaticClass());
	
    // default AddAnimActionCycleBreaker(GameplayTag::Action_Ambient_ScratchEar, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_ScratchEar.Wolf_Montage_ScratchEar'");
	// default AddAnimActionCycleBreaker(GameplayTag::Action_Ambient_Shake, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_Shaking.Wolf_Montage_Shaking'");
	// default AddAnimActionCycleBreaker(GameplayTag::Action_Ambient_Dig, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/DigGround/Wolf_DigGround_Montage.Wolf_DigGround_Montage'");
}

UCLASS()
class UAnimConfig_Wolf_Alpha : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Quadruped_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Wolf::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Wolf::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Wolf_Combat_Alpha::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Wolf_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Wolf_Combat::StaticClass());
	
    // default AddAnimActionCycleBreaker(GameplayTag::Action_Ambient_ScratchEar, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_ScratchEar.Wolf_Montage_ScratchEar'");
	// default AddAnimActionCycleBreaker(GameplayTag::Action_Ambient_Shake, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_Shaking.Wolf_Montage_Shaking'");
	// default AddAnimActionCycleBreaker(GameplayTag::Action_Ambient_Dig, n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/DigGround/Wolf_DigGround_Montage.Wolf_DigGround_Montage'");
}

UCLASS()
class UInteractAnimConfig_Wolf_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_EatItem.Wolf_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_Wolf_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_EatMeatbug.Wolf_Montage_EatMeatbug'";
}