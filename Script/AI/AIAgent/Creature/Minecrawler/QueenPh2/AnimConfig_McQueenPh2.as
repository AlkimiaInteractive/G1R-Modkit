UCLASS()
class UAnimConfig_MCQueen_Ph2 : UAnimConfig
{
	default m_LocoBlendCurvesConfig = ULocoBlendCurvesConfig_Creature::StaticClass();
	default m_IKConfig = UIKConfig_Minecrawler_Generic::StaticClass();

    default SetDefaultMovementAnimData(UWeaponMeleeItemAnimConfig_MCQueen_Ph2::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Weapon_MinecrawlerLeg, UWeaponMeleeItemAnimConfig_MCQueen_Combat_Ph2::StaticClass());
    default AddAnimForItem(GameplayTag::Item_Projectile, USpitProjectile_MCQueen::StaticClass());
}