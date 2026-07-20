
UCLASS()
class UAttackMeleeConfig_Swampshark_AttackLeft : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Attacks/A_Swampshark_AttackLeft_Montage.A_Swampshark_AttackLeft_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Parried/A_Swampshark_N_Hit_Parried_L_Montage.A_Swampshark_N_Hit_Parried_L_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Deflected/A_Swampshark_HitDeflected_L_Montage.A_Swampshark_HitDeflected_L_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Swampshark_AttackLeft : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Swampshark_AttackLeft::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Swampshark_Attack_Top::StaticClass());
}

UCLASS()
class UAttackMeleeConfig_Swampshark_AttackRight : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Attacks/A_Swampshark_AttackRight_Montage.A_Swampshark_AttackRight_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Parried/A_Swampshark_N_Hit_Parried_R_Montage.A_Swampshark_N_Hit_Parried_R_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Combat/Hits/Deflected/A_Swampshark_HitDeflected_R_Montage.A_Swampshark_HitDeflected_R_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Swampshark_AttackRight : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Swampshark_AttackRight::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    // default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Swampshark_Attack_Top::StaticClass());
}



UCLASS()
class UWeaponMeleeItemAnimConfig_Swampshark : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Swampshark/SwampShark_AnimBP.SwampShark_AnimBP_C'";


    //IDLE BREAKERS
    default AddIdleBreaker(n"", 0.4f, 1);
    default AddIdleBreaker(n"", 0.6f, 2);
    default AddIdleBreaker(n"", 0.8f, 2);
    default AddIdleBreaker(n"", 1.0f, 2);
   
    
    //WALK BREAKERS
    default AddWalkBreaker(n"", 0.8f, 2);
    default AddWalkBreaker(n"", 0.6f, 1);
    default AddWalkBreaker(n"", 1.0f, 2);
    

   // TURNS
   //default m_TurnsData = UTurnsData_Swampshark::StaticClass();
   

    // HITS
    default m_HitsData = UHitData_Default_Swampshark::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Swampshark::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Swampshark_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Swampshark/SwampShark_AnimBP_Combat.SwampShark_AnimBP_Combat_C'";

    //COMBAT IDLE BREAKERS
    default AddIdleBreaker(n"", 0.4f, 1);
    default AddIdleBreaker(n"", 1.5f, 2);
    default AddIdleBreaker(n"", 0.6f, 2);
    default AddIdleBreaker(n"", 1.0f, 2);
    
    //COMBAT WALK BREAKERS
    default AddWalkBreaker(n"", 0.6f, 1);
    default AddWalkBreaker(n"", 0.8f, 2);
    default AddWalkBreaker(n"", 1.5f, 2);
    default AddWalkBreaker(n"", 0.4f, 3);

    // TURNS
    //default m_TurnsData = UTurnsData_Swampshark_Combat::StaticClass();
    

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    
    // Equip
    default m_EquipData= UEquipData_Swampshark::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =   UComboAttackConfig_Swampshark_AttackLeft::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =   UComboAttackConfig_Swampshark_AttackRight::StaticClass();

	// HITS
    default m_HitsData = UHitData_Default_Swampshark::StaticClass();
    // 

    // TAUNTS
    default m_TauntData = UTauntData_Swampshark::StaticClass();

    default m_ConsumablesData = UConsumablesData_Swampshark_Combat::StaticClass();
}

UCLASS()
class UAnimConfig_Swampshark : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Quadruped_Generic::StaticClass();
    //default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Swampshark::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Swampshark_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Swampshark::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_Jaw, UWeaponMeleeItemAnimConfig_Swampshark_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Swimming, USwimming_Swampshark_Combat::StaticClass());
	default AddAnimForItem(GameplayTag::Item_Weapon_WaterWalking, USwimming_Swampshark_Combat::StaticClass());
	
}

UCLASS()
class UInteractAnimConfig_Swampshark_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Actions/A_Swampshark_EatItem_Montage.A_Swampshark_EatItem_Montage'";
}