////////////////////Demon_Fire_Sleeper_Ruushk_03
UCLASS()
class UAnimConfig_Demon_Fire_Sleeper_Ruushk_03 : UAnimConfig_Demon_Fire
{
	default AddAnimForItem(GameplayTag::Item_Weapon_Claw, UWeaponMeleeItemAnimConfig_Demon_Fire_Sleeper_Ruushk_03_Combat::StaticClass());
}

UCLASS()
class UAttackMeleeConfig_Demon_Fire_Sleeper_Ruushk_03_Flamethrower : UAttackMeleeConfig_Demon_Fire_Flamethrower
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Sleeper_Ruushk_03_Flamethrower_Montage.A_FireDemon_Sleeper_Ruushk_03_Flamethrower_Montage'";
}

UCLASS()
class UComboAttackConfig_Demon_Fire_Sleeper_Ruushk_03_Flamethrower : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Fire_Sleeper_Ruushk_03_Flamethrower::StaticClass();
    default m_GA_Attack = UGA_FireDemon_Flamethrower::StaticClass();
}

UCLASS()
class UComboAttackConfig_Demon_Fire_Sleeper_Ruushk_03_Firewall : UComboAttackConfigScript
{
    default m_MetaData = UAttackMeleeConfig_Demon_Fire_Sleeper_Ruushk_03_Firewall::StaticClass();
    default m_GA_Attack = UGA_FireDemon_FirewallArea::StaticClass();
}

UCLASS()
class UAttackMeleeConfig_Demon_Fire_Sleeper_Ruushk_03_Firewall : UAttackMeleeConfig_Demon_Fire_Firewall
{
    default m_AttackMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/FireDemon/Combat/Attacks/A_FireDemon_Sleeper_Ruushk_03_Ring_Montage.A_FireDemon_Sleeper_Ruushk_03_Ring_Montage'";
    default m_ActorClass = n"Blueprint'/Game/Items/Magic/FireDemon/Firewall/BP_FireDemon_Sleeper_Ruushk_03_Firewall.BP_FireDemon_Sleeper_Ruushk_03_Firewall_C'";
}


UCLASS()
class UWeaponMeleeItemAnimConfig_Demon_Fire_Sleeper_Ruushk_03_Combat : UWeaponMeleeItemAnimConfig_Demon_Fire_Combat
{
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra01) =    UComboAttackConfig_Demon_Fire_Sleeper_Ruushk_03_Flamethrower::StaticClass();
    default m_Attacks.FindOrAdd(GameplayTag::Combat_Attack_Extra02) =    UComboAttackConfig_Demon_Fire_Sleeper_Ruushk_03_Firewall::StaticClass();
}
