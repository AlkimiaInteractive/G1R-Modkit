
//////////////////
UCLASS()
class UAttackMeleeConfig_Bloodhound_Bite_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Attacks/Bloodhound_Bite_Montage.Bloodhound_Bite_Montage'";
    // default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Attacks/A_Bloodhound_Dsg_B0_Montage.A_Bloodhound_Dsg_B0_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Hits/Parried/Bloodhound_N_Hit_Parried_Top_Montage.Bloodhound_N_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Hits/Deflected/A_Bloodhound_HitDeflected_Bite_Montage.A_Bloodhound_HitDeflected_Bite_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Bloodhound_Scratch_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Attacks/Bloodhound_ScratchLeft_Montage.Bloodhound_ScratchLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Hits/Parried/Bloodhound_N_Hit_Parried_Left_Montage.Bloodhound_N_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Hits/Deflected/A_Bloodhound_HitDeflected_Left_Montage.A_Bloodhound_HitDeflected_Left_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Bloodhound_Scratch_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Attacks/Bloodhound_ScratchRight_Montage.Bloodhound_ScratchRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Hits/Parried/Bloodhound_N_Hit_Parried_Right_Montage.Bloodhound_N_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Hits/Deflected/A_Bloodhound_HitDeflected_Right_Montage.A_Bloodhound_HitDeflected_Right_Montage'";

	default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.5f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Bloodhound_WalkBwd : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Combat/MoveBack/A_Bloodhound_Combat_MoveBack_Montage.A_Bloodhound_Combat_MoveBack_Montage'";
}

UCLASS()
class UComboAttackConfig_Bloodhound_Bite_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Bloodhound_Bite_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Bloodhound_Scratch_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Bloodhound_Scratch_Left::StaticClass());
}

UCLASS()
class UComboAttackConfig_Bloodhound_Scratch_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Bloodhound_Scratch_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Bloodhound_Scratch_Right::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Bloodhound_Scratch_Right::StaticClass());
}

UCLASS()
class UComboAttackConfig_Bloodhound_Scratch_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Bloodhound_Scratch_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Bloodhound_Scratch_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Bloodhound_Scratch_Left::StaticClass());
}

UCLASS()
class UComboAttackConfig_Bloodhound_WalkBwd : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Bloodhound_WalkBwd::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Bloodhound : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Bloodhound/Bloodhound_AnimBP.Bloodhound_AnimBP_C'";

    //IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Idles/Breaker/A_Bloodhound_IdleBreaker_01.A_Bloodhound_IdleBreaker_01'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Idles/Breaker/A_Bloodhound_IdleBreaker_02.A_Bloodhound_IdleBreaker_02'", 0.4f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Idles/Breaker/A_Bloodhound_IdleBreaker_03.A_Bloodhound_IdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Idles/Breaker/A_Bloodhound_IdleBreaker_04.A_Bloodhound_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Idles/Breaker/A_Bloodhound_IdleBreaker_05.A_Bloodhound_IdleBreaker_05'", 1.0f, 2);

    //WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Breaker/A_Bloodhound_WalkBreaker_01.A_Bloodhound_WalkBreaker_01'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Breaker/A_Bloodhound_WalkBreaker_02.A_Bloodhound_WalkBreaker_02'", 0.4f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Breaker/A_Bloodhound_WalkBreaker_03.A_Bloodhound_WalkBreaker_03'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Breaker/A_Bloodhound_WalkBreaker_04.A_Bloodhound_WalkBreaker_04'", 1.0f, 2);

   // TURNS
   default m_TurnsData = UTurnsData_Bloodhound::StaticClass();
   //

    // HITS
    default m_HitsData = UHitData_Default_Bloodhound::StaticClass();
    //    
    default m_ConsumablesData = UConsumablesData_Bloodhound::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Bloodhound_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Bloodhound/Bloodhound_AnimBP_Combat.Bloodhound_AnimBP_Combat_C'";

    // COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Idles/Breaker/A_Bloodhound_CombatIdleBreaker_01.A_Bloodhound_CombatIdleBreaker_01'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Idles/Breaker/A_Bloodhound_CombatIdleBreaker_02.A_Bloodhound_CombatIdleBreaker_02'", 1.2f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Idles/Breaker/A_Bloodhound_CombatIdleBreaker_03.A_Bloodhound_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Idles/Breaker/A_Bloodhound_CombatIdleBreaker_04.A_Bloodhound_CombatIdleBreaker_04'", 1.0f, 1);

    // COMBAT WALK BREAKERS
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Breaker/A_Bloodhound_CombatWalkBreaker_01.A_Bloodhound_CombatWalkBreaker_01'", 1.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Breaker/A_Bloodhound_CombatWalkBreaker_02.A_Bloodhound_CombatWalkBreaker_02'", 1.0f, 3);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Breaker/A_Bloodhound_CombatWalkBreaker_03.A_Bloodhound_CombatWalkBreaker_03'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Breaker/A_Bloodhound_CombatWalkBreaker_04.A_Bloodhound_CombatWalkBreaker_04'", 0.6f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_Bloodhound_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData = UEquipData_Bloodhound::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Bloodhound_Bite_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Bloodhound_Scratch_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Bloodhound_Scratch_Right::StaticClass();
    //

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_MoveBack) = UComboAttackConfig_Bloodhound_WalkBwd::StaticClass();

	// HITS
    default m_HitsData = UHitData_Default_Bloodhound::StaticClass();
    // 

    // DODGES
    default m_DodgesData = UDodgesData_Default_Bloodhound::StaticClass();
    //
    
    // TAUNTS
    default m_TauntData = UTauntdata_Bloodhound::StaticClass();
    //

    default m_ConsumablesData = UConsumablesData_Bloodhound_Combat::StaticClass();
}


UCLASS()
class UAnimConfig_Bloodhound : UAnimConfig
{
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig_Quadruped_Generic::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Bloodhound::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Bloodhound_Eat_Item::StaticClass());
    default AddAnimForAction(GameplayTag::Action_Smash_MeatBug, UInteractAnimConfig_Bloodhound_Eat_Meatbug::StaticClass());

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Bloodhound::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Bloodhound_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Bloodhound_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Bloodhound_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Bloodhound_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Montage_EatItem.Bloodhound_Montage_EatItem'";
}

UCLASS()
class UInteractAnimConfig_Bloodhound_Eat_Meatbug: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Montage_EatMeatbug.Bloodhound_Montage_EatMeatbug'";
}