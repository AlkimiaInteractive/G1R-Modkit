//Definition of the visual (speed, radius, lifetime) and their damage.
UCLASS()
class UStormOfFireDefinition_Orc : UStormOfFireDefinition
{
	default m_Name = "StormFire_Orc";

	default m_HitEffect = UGE_StormOfFireDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 50.0f);
	default m_LifeTime = 8.0f;
	default m_ExplosionPath = n"";
	default m_SuperArmorDamageBase = 10.0f;

	default InitialSpeed = 300.0f;

	default m_Speed = 1500.0f;

	default SpawnOffset = 50.0f;
	default m_StormRadius = 75.f;
}
