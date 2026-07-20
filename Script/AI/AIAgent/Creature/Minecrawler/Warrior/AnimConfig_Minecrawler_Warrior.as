//////////////////////////////
// ATTACKS

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_Bottom : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCrawler_Warrior_BottomAttack01_Montage.MCrawler_Warrior_BottomAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Bottom_Montage.A_MCrawler_Warrior_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Bottom_Montage.A_MCrawler_Warrior_Hit_Deflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_Left : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCrawler_Warrior_LeftAttack01_Montage.MCrawler_Warrior_LeftAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Left_Montage.A_MCrawler_Warrior_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Left_Montage.A_MCrawler_Warrior_Hit_Deflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_Right : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCrawler_Warrior_RightAttack01_Montage.MCrawler_Warrior_RightAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Right_Montage.A_MCrawler_Warrior_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Right_Montage.A_MCrawler_Warrior_Hit_Deflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_Top : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCrawler_Warrior_TopAttack01_Montage.MCrawler_Warrior_TopAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Top_Montage.A_MCrawler_Warrior_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Top_Montage.A_MCrawler_Warrior_Hit_Deflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_TopDefensive : UAttackMeleeConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCrawler_Warrior_TopAttack01_Montage.MCrawler_Warrior_TopAttack01_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Top_Montage.A_MCrawler_Warrior_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Top_Montage.A_MCrawler_Warrior_Hit_Deflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.2f;

    default m_CanKnockback = true;
}

UCLASS()
class USpitProjectile_MCTemple : UItemAnimConfig
{
    default m_EquipData = UEquipData_MCTemple_UProjectile::StaticClass();
}

UCLASS()
class UEquipData_MCTemple_UProjectile : UEquipData
{
    default m_SocketName = n"jaw";
}

UCLASS()
class UAttackMeleeConfig_MCTemple_Spit : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/A_MCrawler_Temple_AttackSpit_Montage.A_MCrawler_Temple_AttackSpit_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 1.0f);
	default m_SuperArmorDamageMultiplier = 10.0f;

    default m_ProjectileClass = UMCQueen_Spit::StaticClass();
    default m_ArrowGravityModifier = 0.2;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 3000.0;
}


UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_Bottom : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_Bottom::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Warrior_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Warrior_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Minecrawler_Warrior_Top::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Minecrawler_Warrior_Top::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_Left : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_Left::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Warrior_Right::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Warrior_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Minecrawler_Warrior_Top::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Minecrawler_Warrior_Bottom::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_Right : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_Right::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Warrior_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Warrior_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Minecrawler_Warrior_Top::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Minecrawler_Warrior_Bottom::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_Top : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_Top::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Warrior_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Warrior_Left::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Minecrawler_Warrior_Bottom::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Minecrawler_Warrior_Bottom::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_TopDefensive : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_TopDefensive::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UComboAttackConfig_MCTemple_Spit : UAttack_MCQueen_Phase1
{
    default m_MetaData = UAttackMeleeConfig_MCTemple_Spit::StaticClass();
    default m_GA_Attack = UGA_AttackThrow::StaticClass();
}

UCLASS()
class UItemAnimConfig_Minecrawler_Warrior : UItemAnimConfig
{

    default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler_Warrior/MCrawler_Warrior_AnimBP.MCrawler_Warrior_AnimBP_C'";

    //IDLE BREAKERS


    //WALK BREAKERS

    //TURNS
    default m_TurnsData = UTurnsData_Minecrawler_Warrior::StaticClass();
    //    

    // HITS
	default m_HitsData = UHitData_Default_Minecrawler_Warrior::StaticClass();
	//
 
}


/*UCLASS()
class UItemAnimConfig_Minecrawler_Warrior_Combat : UItemAnimConfig_Minecrawler_Warrior
{
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) = UComboAttackConfig_Minecrawler_Warrior_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) = UComboAttackConfig_Minecrawler_Warrior_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) = UComboAttackConfig_Minecrawler_Warrior_Right::StaticClass();
}*/


UCLASS()
class UWeaponMeleeItemAnimConfig_Minecrawler_Warrior_Combat : UWeaponMeleeItemAnimConfig
{
     default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler_Warrior/MCrawler_Warrior_AnimBP_Combat.MCrawler_Warrior_AnimBP_Combat_C'";

    // Pivots
    //default m_PivotR180 = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_WalkTurn180.A_Wolf_WalkTurn180'";
    //default m_PivotL180 = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_WalkTurn180.A_Wolf_WalkTurn180'";

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 360.0f;
    
    // Equip
    default m_EquipData = UEquipData_Minecrawler_Warrior::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Minecrawler_Warrior_Bottom::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UComboAttackConfig_Minecrawler_Warrior_Top::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Minecrawler_Warrior_Left::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Minecrawler_Warrior_Right::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =      UComboAttackConfig_Minecrawler_Warrior_TopDefensive::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =      UComboAttackConfig_MCTemple_Spit::StaticClass();
    
    //

    //TURNS
    default m_TurnsData = UTurnsData_Minecrawler_Warrior_Combat::StaticClass();
    //

    // HITS
	default m_HitsData = UHitData_Default_Minecrawler_Warrior::StaticClass();
	//

    // DODGES
    default m_DodgesData = UDodgesData_Minecrawler_Warrior::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Minecrawler_Warrior::StaticClass();
    //
}

UCLASS()
class UAnimConfig_Minecrawler_Warrior : UAnimConfig
{
    default m_IKConfig = UIKConfig_Minecrawler_Generic::StaticClass();
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Minecrawler_Warrior_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UItemAnimConfig_Minecrawler_Warrior::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_MinecrawlerLeg, UWeaponMeleeItemAnimConfig_Minecrawler_Warrior_Combat::StaticClass());

}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_Bottom_King : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCKing/MCrawler_Warrior_BottomAttack01_King_Montage.MCrawler_Warrior_BottomAttack01_King_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Bottom_Montage.A_MCrawler_Warrior_Hit_Parried_Bottom_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Bottom_Montage.A_MCrawler_Warrior_Hit_Deflected_Bottom_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_Left_King : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCKing/MCrawler_Warrior_LeftAttack01_King_Montage.MCrawler_Warrior_LeftAttack01_King_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Left_Montage.A_MCrawler_Warrior_Hit_Parried_Left_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Left_Montage.A_MCrawler_Warrior_Hit_Deflected_Left_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_Right_King : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCKing/MCrawler_Warrior_RightAttack01_King_Montage.MCrawler_Warrior_RightAttack01_King_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Right_Montage.A_MCrawler_Warrior_Hit_Parried_Right_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Right_Montage.A_MCrawler_Warrior_Hit_Deflected_Right_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_Top_King : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCKing/MCrawler_Warrior_TopAttack01_King_Montage.MCrawler_Warrior_TopAttack01_King_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Top_Montage.A_MCrawler_Warrior_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Top_Montage.A_MCrawler_Warrior_Hit_Deflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.0f;
}

UCLASS()
class UAttackMeleeConfig_Minecrawler_Warrior_TopDefensive_King : UAttackMeleeConfig
{
    default m_AttackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Attacks/MCKing/MCrawler_Warrior_TopAttack01_King_Montage.MCrawler_Warrior_TopAttack01_King_Montage'";
    default m_ParriedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Parried/A_MCrawler_Warrior_Hit_Parried_Top_Montage.A_MCrawler_Warrior_Hit_Parried_Top_Montage'";
    default m_DeflectedMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Combat/Hits/Deflected/A_MCrawler_Warrior_Hit_Deflected_Top_Montage.A_MCrawler_Warrior_Hit_Deflected_Top_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 2.2f;

    default m_CanKnockback = true;
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_Bottom_King : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_Bottom_King::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Warrior_Right_King::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Warrior_Left_King::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Minecrawler_Warrior_Top_King::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Minecrawler_Warrior_Top::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_Left_King : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_Left_King::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Warrior_Right_King::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Warrior_Right::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Minecrawler_Warrior_Top_King::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Minecrawler_Warrior_Bottom_King::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_Right_King : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_Right_King::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    //default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Warrior_Left::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Warrior_Left_King::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Minecrawler_Warrior_Top_King::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Minecrawler_Warrior_Bottom_King::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_Top_King : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_Top_King::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();

    default AddOption(GameplayTag::Combat_Attack_Right,   UComboAttackConfig_Minecrawler_Warrior_Right_King::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Left,   UComboAttackConfig_Minecrawler_Warrior_Left_King::StaticClass());
    //default AddOption(GameplayTag::Combat_Attack_Top,   UComboAttackConfig_Minecrawler_Warrior_Bottom::StaticClass());
    default AddOption(GameplayTag::Combat_Attack_Bottom,   UComboAttackConfig_Minecrawler_Warrior_Bottom_King::StaticClass());
}

UCLASS()
class UComboAttackConfig_Minecrawler_Warrior_TopDefensive_King : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Minecrawler_Warrior_TopDefensive_King::StaticClass();
    default m_GA_Attack = UGA_AttackMelee::StaticClass();
}

UCLASS()
class UWeaponMeleeItemAnimConfig_Minecrawler_Warrior_King_Combat : UWeaponMeleeItemAnimConfig
{
     default m_AnimInstanceClass = n"AnimBlueprint'/Game/AnimLibrary/Creatures/MCrawler_Warrior/MCrawler_Warrior_AnimBP_Combat.MCrawler_Warrior_AnimBP_Combat_C'";

    // Pivots
    //default m_PivotR180 = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_WalkTurn180.A_Wolf_WalkTurn180'";
    //default m_PivotL180 = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_WalkTurn180.A_Wolf_WalkTurn180'";

    // Rotate Magnet
    default m_RotateSpeedMagnetPlayer = 180.0f;
    default m_RotateSpeedMagnetAI = 360.0f;
    
    // Equip
    default m_EquipData = UEquipData_Minecrawler_Warrior::StaticClass();
    
    // COMBOS (see Combos_Human.as)
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Bottom) =   UComboAttackConfig_Minecrawler_Warrior_Bottom_King::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Top) =      UComboAttackConfig_Minecrawler_Warrior_Top_King::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Left) =      UComboAttackConfig_Minecrawler_Warrior_Left_King::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Right) =      UComboAttackConfig_Minecrawler_Warrior_Right_King::StaticClass();

    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =      UComboAttackConfig_Minecrawler_Warrior_TopDefensive_King::StaticClass();
    
    //

    //TURNS
    default m_TurnsData = UTurnsData_Minecrawler_Warrior_Combat::StaticClass();
    //

    // HITS
	default m_HitsData = UHitData_Default_Minecrawler_Warrior::StaticClass();
	//

    // DODGES
    default m_DodgesData = UDodgesData_Minecrawler_Warrior::StaticClass();
    //

    // TAUNTS
    default m_TauntData = UTauntData_Minecrawler_Warrior::StaticClass();
    //
}

UCLASS()
class UAnimConfig_Minecrawler_Warrior_King : UAnimConfig
{
    default m_IKConfig = UIKConfig_Minecrawler_Generic::StaticClass();
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
    
    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Minecrawler_Warrior_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UItemAnimConfig_Minecrawler_Warrior::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_MinecrawlerLeg, UWeaponMeleeItemAnimConfig_Minecrawler_Warrior_King_Combat::StaticClass());

}

UCLASS()
class UAnimConfig_Minecrawler_Temple : UAnimConfig
{
    default m_IKConfig = UIKConfig_Minecrawler_Generic::StaticClass();
    default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();

    default AddAnimForAction(GameplayTag::Action_Eat_Item, UInteractAnimConfig_Minecrawler_Warrior_Eat_Item::StaticClass());

    default SetDefaultMovementAnimData(UItemAnimConfig_Minecrawler_Warrior::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_MinecrawlerLeg, UWeaponMeleeItemAnimConfig_Minecrawler_Warrior_Combat::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile, USpitProjectile_MCTemple::StaticClass());

}

UCLASS()
class UInteractAnimConfig_Minecrawler_Warrior_Eat_Item: UInteractAnimConfig
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Actions/MCrawler_Warrior_Montage_EatItem.MCrawler_Warrior_Montage_EatItem'";
}
