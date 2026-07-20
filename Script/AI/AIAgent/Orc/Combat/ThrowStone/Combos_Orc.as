
// ATTACK ANIMATIONS DATA //

UCLASS()
class UConfig_Orc_Attack_Ranged_Base : UAttackThrowConfig
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/Specials/OrcM_S1H_ThrowStoneAttack01_Montage.OrcM_S1H_ThrowStoneAttack01_Montage'";

    default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Blunt, 0.6f);
    //default m_DamageMultipliers.Add(GameplayTag::Item_Damage_Physical_Edge, 1.0f);
	default m_SuperArmorDamageMultiplier = 1.0f;

    default m_ProjectileClass = UOrcThrowStone::StaticClass();
    default m_ArrowGravityModifier = 0.7;
	default m_ProjectileSpeedMin = 1.0;
	default m_ProjectileSpeedMax = 1800.0;
}

UCLASS()
class UConfig_Orc_Attack_Ranged_Fists : UConfig_Orc_Attack_Ranged_Base
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Attacks/Specials/OrcM_ThrowStoneAttack01_Montage.OrcM_ThrowStoneAttack01_Montage'";
}

UCLASS()
class UConfig_Orc_Attack_Ranged_Melee : UConfig_Orc_Attack_Ranged_Base
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Attacks/Specials/OrcM_S1H_ThrowStoneAttack01_Montage.OrcM_S1H_ThrowStoneAttack01_Montage'";
}

// ******************************************** //

// COMBOS //


UCLASS()
class UComboAttackConfig_Orc_ThrowStone_Fists : UComboAttackConfigScript
{
	default m_MetaData = UConfig_Orc_Attack_Ranged_Fists::StaticClass();
	default m_GA_Attack = UGA_AttackThrow::StaticClass();
}


UCLASS()
class UComboAttackConfig_Orc_ThrowStone_Melee : UComboAttackConfigScript
{
	default m_MetaData = UConfig_Orc_Attack_Ranged_Melee::StaticClass();
	default m_GA_Attack = UGA_AttackThrow::StaticClass();
}



// ******************************************** //


UCLASS()
class UProjectile_Orc_ThrowRock : UItemAnimConfig
{
    default m_EquipData = UEquipData_Orc_Rock::StaticClass();
}

UCLASS()
class UEquipData_Orc_Rock : UEquipData
{
    default m_SocketName = n"weapon_r";
}

