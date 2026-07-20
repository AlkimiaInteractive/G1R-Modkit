
//////////////////
// Attack

UCLASS()
class UAttackMeleeConfig_Bloodfly_TopAttack : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Attacks/A_Bloodfly_TopAttack_Charge_Montage.A_Bloodfly_TopAttack_Charge_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Hits/Parried/A_Bloodfly_HitParried_Charge_Montage.A_Bloodfly_HitParried_Charge_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Hits/Deflected/A_Bloodfly_HitDeflected_Top_Montage.A_Bloodfly_HitDeflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Point, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Bloodfly_LeftAttack : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Attacks/Bloodfly_LeftAttack_Montage.Bloodfly_LeftAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Hits/Parried/A_Bloodfly_HitParried_Left_Montage.A_Bloodfly_HitParried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Hits/Deflected/A_Bloodfly_HitDeflected_Left_Montage.A_Bloodfly_HitDeflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Point, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UAttackMeleeConfig_Bloodfly_RightAttack : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Attacks/Bloodfly_RightAttack_Montage.Bloodfly_RightAttack_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Hits/Parried/A_Bloodfly_HitParried_Right_Montage.A_Bloodfly_HitParried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Hits/Deflected/A_Bloodfly_HitDeflected_Right_Montage.A_Bloodfly_HitDeflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Point, 0.9f);
	default m_SuperArmorDamageMultiplier = 1.0f;
}

UCLASS()
class UComboAttackConfig_Bloodfly_TopAttack : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Bloodfly_TopAttack::StaticClass();
    default m_GA_Attack = UGA_AttackCharge::StaticClass();
}
UCLASS()
class UComboAttackConfig_Bloodfly_LeftAttack : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Bloodfly_LeftAttack::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Bloodfly_RightAttack::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Bloodfly_RightAttack::StaticClass());
}

UCLASS()
class UComboAttackConfig_Bloodfly_RightAttack : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Bloodfly_RightAttack::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Bloodfly_LeftAttack::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Bloodfly_LeftAttack::StaticClass());
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Bloodfly : UItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Bloodfly/Bloodfly_AnimBP.Bloodfly_AnimBP_C'";

    //IDLE BREAKERS

    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Idles/Breaker/A_Bloodfly_IdleBreaker_01.A_Bloodfly_IdleBreaker_01'", 0.4f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Idles/Breaker/A_Bloodfly_IdleBreaker_02.A_Bloodfly_IdleBreaker_02'", 0.6f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Idles/Breaker/A_Bloodfly_IdleBreaker_03.A_Bloodfly_IdleBreaker_03'", 0.8f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Idles/Breaker/A_Bloodfly_IdleBreaker_04.A_Bloodfly_IdleBreaker_04'", 1.0f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Idles/Breaker/A_Bloodfly_IdleBreaker_05.A_Bloodfly_IdleBreaker_05'", 0.5f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Idles/Breaker/A_Bloodfly_IdleBreaker_06.A_Bloodfly_IdleBreaker_06'", 0.7f, 1);
    
    //WALK BREAKERS
    
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Breaker/A_Bloodfly_WalkBreaker_01.A_Bloodfly_WalkBreaker_01'", 0.4f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Breaker/A_Bloodfly_WalkBreaker_02.A_Bloodfly_WalkBreaker_02'", 0.6f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Breaker/A_Bloodfly_WalkBreaker_03.A_Bloodfly_WalkBreaker_03'", 0.8f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Breaker/A_Bloodfly_WalkBreaker_04.A_Bloodfly_WalkBreaker_04'", 1.0f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Breaker/A_Bloodfly_WalkBreaker_05.A_Bloodfly_WalkBreaker_05'", 0.5f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Breaker/A_Bloodfly_WalkBreaker_06.A_Bloodfly_WalkBreaker_06'", 0.7f, 1);

    // TURNS
    default m_TurnsData = UTurnsData_Bloodfly::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Bloodfly::StaticClass();
    //    

    default m_ConsumablesData = UConsumablesData_Bloodfly::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Bloodfly_Combat : UWeaponMeleeItemAnimConfig
{
    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/Bloodfly/Bloodfly_AnimBP_Combat.Bloodfly_AnimBP_Combat_C'";

    //IDLE COMBAT BREAKERS

    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Idles/Breaker/A_Bloodfly_CombatIdleBreaker_01.A_Bloodfly_CombatIdleBreaker_01'", 1.0f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Idles/Breaker/A_Bloodfly_CombatIdleBreaker_02.A_Bloodfly_CombatIdleBreaker_02'", 0.8f, 2);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Idles/Breaker/A_Bloodfly_CombatIdleBreaker_03.A_Bloodfly_CombatIdleBreaker_03'", 0.6f, 1);
    default AddIdleBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Idles/Breaker/A_Bloodfly_CombatIdleBreaker_04.A_Bloodfly_CombatIdleBreaker_04'", 0.4f, 1);
    
    //WALK COMBAT BREAKERS

    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Breaker/A_Bloodfly_CombatWalkBreaker_01.A_Bloodfly_CombatWalkBreaker_01'", 1.0f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Breaker/A_Bloodfly_CombatWalkBreaker_02.A_Bloodfly_CombatWalkBreaker_02'", 0.8f, 2);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Breaker/A_Bloodfly_CombatWalkBreaker_03.A_Bloodfly_CombatWalkBreaker_03'", 0.6f, 1);
    default AddWalkBreaker(n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Breaker/A_Bloodfly_CombatWalkBreaker_04.A_Bloodfly_CombatWalkBreaker_04'", 0.4f, 2);

    // TURNS
    default m_TurnsData = UTurnsData_Bloodfly_Combat::StaticClass();
    //

    // Rotate Magnet
     default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 180.0f;
    default m_RotateSpeedCharge = 15;

    // Equip
    default m_EquipData = UEquipData_Bloodfly::StaticClass();

    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =   UComboAttackConfig_Bloodfly_TopAttack::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Bloodfly_LeftAttack::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Bloodfly_RightAttack::StaticClass();
    //

    // HITS
    default m_HitsData = UHitData_Default_Bloodfly::StaticClass();
    //

    // DODGES
    default m_DodgesData = UDodgesData_Default_Bloodfly::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Bloodfly::StaticClass(); 
    //
    
    default m_ConsumablesData = UConsumablesData_Bloodfly_Combat::StaticClass();
}

UCLASS()
class UAnimConfig_Bloodfly : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    default m_IKConfig = UIKConfig::StaticClass();
    default m_PhysicalBonesConfig = UPhysicalBonesConfig_Creature_Bloodfly::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Bloodfly_Eat_Item::StaticClass());

	default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_Bloodfly::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_Claw, UWeaponMeleeItemAnimConfig_Bloodfly_Combat::StaticClass());
}

UCLASS()
class UInteractAnimConfig_Bloodfly_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Actions/Bloodfly_Montage_EatItem.Bloodfly_Montage_EatItem'";
}