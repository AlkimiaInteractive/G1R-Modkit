// WEAPON MELEE
UCLASS()
class UAttackMeleeConfig_Demon_Lesser_L01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Attacks/LesserDemon_ScratchLeft_Montage.LesserDemon_ScratchLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Hits/Parried/A_LesserDemon_Hit_Parried_Left_Montage.A_LesserDemon_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Hits/Deflected/A_LesserDemon_HitDeflected_Left_Montage.A_LesserDemon_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Demon_Lesser_R01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Attacks/A_LesserDemon_ScratchRight_Montage.A_LesserDemon_ScratchRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Hits/Parried/A_LesserDemon_Hit_Parried_Right_Montage.A_LesserDemon_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Hits/Deflected/A_LesserDemon_HitDeflected_Right_Montage.A_LesserDemon_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Demon_Lesser_T01 : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Attacks/A_LesserDemon_FinisherUpper_Montage.A_LesserDemon_FinisherUpper_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Hits/Parried/A_LesserDemon_Hit_Parried_Top_Montage.A_LesserDemon_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Hits/Deflected/A_LesserDemon_HitDeflected_Top_Montage.A_LesserDemon_HitDeflected_Top_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.2f;
}


UCLASS()
class UComboAttackConfig_Demon_Lesser_L01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Lesser_L01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Demon_Lesser_R01::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Demon_Lesser_R01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Demon_Lesser_T01::StaticClass());
}

UCLASS()
class UComboAttackConfig_Demon_Lesser_R01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Lesser_R01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Demon_Lesser_L01::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Demon_Lesser_L01::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Demon_Lesser_T01::StaticClass());
}

UCLASS()
class UComboAttackConfig_Demon_Lesser_T01 : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Lesser_T01::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

// General
UCLASS()
class UWeaponMeleeItemAnimConfig_Demon_Lesser : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/LesserDemon/LesserDemon_AnimBP.LesserDemon_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Idles/Breaker/A_LesserDemon_IdleBreaker_01.A_LesserDemon_IdleBreaker_01'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Idles/Breaker/A_LesserDemon_IdleBreaker_02.A_LesserDemon_IdleBreaker_02'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Idles/Breaker/A_LesserDemon_IdleBreaker_03.A_LesserDemon_IdleBreaker_03'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Idles/Breaker/A_LesserDemon_IdleBreaker_04.A_LesserDemon_IdleBreaker_04'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Idles/Breaker/A_LesserDemon_IdleBreaker_05.A_LesserDemon_IdleBreaker_05'", 0.7f, 1);
    
    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Breaker/A_LesserDemon_WalkBreaker_01.A_LesserDemon_WalkBreaker_01'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Breaker/A_LesserDemon_WalkBreaker_02.A_LesserDemon_WalkBreaker_02'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Breaker/A_LesserDemon_WalkBreaker_03.A_LesserDemon_WalkBreaker_03'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Breaker/A_LesserDemon_WalkBreaker_04.A_LesserDemon_WalkBreaker_04'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Breaker/A_LesserDemon_WalkBreaker_05.A_LesserDemon_WalkBreaker_05'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Breaker/A_LesserDemon_WalkBreaker_06.A_LesserDemon_WalkBreaker_06'", 0.7f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Breaker/A_LesserDemon_WalkBreaker_07.A_LesserDemon_WalkBreaker_07'", 0.7f, 1);

   // TURNS
    default m_TurnsData = UTurnsData_Demon_Lesser::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Demon_Lesser::StaticClass();
    //    
}


UCLASS()
class UWeaponMeleeItemAnimConfig_Demon_Lesser_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/LesserDemon/LesserDemon_AnimBP_Combat.LesserDemon_AnimBP_Combat_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Idles/Breaker/A_LesserDemon_CombatIdleBreaker_01.A_LesserDemon_CombatIdleBreaker_01'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Idles/Breaker/A_LesserDemon_CombatIdleBreaker_02.A_LesserDemon_CombatIdleBreaker_02'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Idles/Breaker/A_LesserDemon_CombatIdleBreaker_03.A_LesserDemon_CombatIdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Idles/Breaker/A_LesserDemon_CombatIdleBreaker_04.A_LesserDemon_CombatIdleBreaker_04'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Idles/Breaker/A_LesserDemon_CombatIdleBreaker_05.A_LesserDemon_CombatIdleBreaker_05'", 0.8f, 1);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Breaker/A_LesserDemon_CombatWalkBreaker_01.A_LesserDemon_CombatWalkBreaker_01'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Breaker/A_LesserDemon_CombatWalkBreaker_02.A_LesserDemon_CombatWalkBreaker_02'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Breaker/A_LesserDemon_CombatWalkBreaker_03.A_LesserDemon_CombatWalkBreaker_03'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Breaker/A_LesserDemon_CombatWalkBreaker_04.A_LesserDemon_CombatWalkBreaker_04'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Breaker/A_LesserDemon_CombatWalkBreaker_05.A_LesserDemon_CombatWalkBreaker_05'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Breaker/A_LesserDemon_CombatWalkBreaker_06.A_LesserDemon_CombatWalkBreaker_06'", 1.0f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Demon_Lesser_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_LesserDemon::StaticClass();
   
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =    UComboAttackConfig_Demon_Lesser_R01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =     UComboAttackConfig_Demon_Lesser_L01::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =     UComboAttackConfig_Demon_Lesser_T01::StaticClass();
    //

	// HITS
    default m_HitsData = UHitData_Demon_Lesser::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Demon_Lesser::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Demon_Lesser::StaticClass();
}

UCLASS()
class UAnimConfig_Demon_Lesser : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Biped_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Demon_Lesser::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Claw, UWeaponMeleeItemAnimConfig_Demon_Lesser_Combat::StaticClass());

}
