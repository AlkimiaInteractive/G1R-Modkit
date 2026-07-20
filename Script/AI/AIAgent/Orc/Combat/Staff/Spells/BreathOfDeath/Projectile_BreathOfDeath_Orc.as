//Definition of the visual (speed, radius, lifetime) and their damage.
UCLASS()
class UBreathOfDeathDefinition_Orc : UBreathOfDeathDefinition
{
	default m_Name = "BreathOfDeath_Orc";

	default m_HitEffect = UGE_Wind_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Impact_Wind, 5000.0f);
	default m_LifeTime = 10.0f;
}
