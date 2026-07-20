UCLASS()
class UProjectileSpellConfig_FireBall_MiltenSleeper : UProjectileSpellConfig_FireBall
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Rechargeable;

    default m_SpellLevels.Empty();
    
    default AddSpellLevel(2.f, 0.4f, 0.f, UGA_Spell_SpawnRechargeableProjectile::StaticClass(), USpellConfigLevelData_MiltenSleeper_FireBall_lvl3::StaticClass());
    default AddSpellLevel(2.f, 0.6f, 0.0f, UGA_Spell_SpawnRechargeableProjectile::StaticClass(), USpellConfigLevelData_MiltenSleeper_FireBall_lvl3::StaticClass());
    default AddSpellLevel(2.f, 0.8f, 2.0f, UGA_Spell_SpawnRechargeableProjectile::StaticClass(), USpellConfigLevelData_MiltenSleeper_FireBall_lvl3::StaticClass());


}


class USpellConfigLevelData_MiltenSleeper_FireBall_lvl1 : USpellConfigLevelData_FireBall_lvl1
{
    default m_WeaponConfigOverride = UMiltenSleeperFireBallProjectileDefinition_Lvl3::StaticClass();
}

class USpellConfigLevelData_MiltenSleeper_FireBall_lvl2 : USpellConfigLevelData_FireBall_lvl2
{
   default m_WeaponConfigOverride = UMiltenSleeperFireBallProjectileDefinition_Lvl3::StaticClass();
}

class USpellConfigLevelData_MiltenSleeper_FireBall_lvl3 : USpellConfigLevelData_FireBall_lvl3
{
   default m_WeaponConfigOverride = UMiltenSleeperFireBallProjectileDefinition_Lvl3::StaticClass();
}

UCLASS()
class UMiltenSleeperFireBallProjectileDefinition_Lvl1 : UFireBallProjectileDefinition_Lvl1
{
	default m_Name = "MiltenSleeperFireBall_lvl1";
	default m_Radius = 50.0f;
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fourth, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 150.0f);

	default m_AimingAssistance.m_enableAimingAssistance = false;
}

UCLASS()
class UMiltenSleeperFireBallProjectileDefinition_Lvl2 : UFireBallProjectileDefinition_Lvl2
{
	default m_Name = "MiltenSleeperFireBall_lvl2";
	default m_Radius = 50.0f;
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fourth, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 150.0f);

	default m_AimingAssistance.m_enableAimingAssistance = false;
}

class UMiltenSleeperFireBallProjectileDefinition_Lvl3 : UFireBallProjectileDefinition_Lvl3
{
	default m_Name = "MiltenSleeperFireBall_lvl3";
	default m_Radius = 50.0f;
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fourth, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 150.0f);

	default m_AimingAssistance.m_enableAimingAssistance = false;
}

