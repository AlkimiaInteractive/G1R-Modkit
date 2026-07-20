UCLASS()
class UStoneWaveDefinition_StoneGolem : UWindFistDefinition
{
	default m_Name = "StoneWave_StoneGolem";

	default m_HitEffect = UGE_Wind_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Impact_Wind, 20.0f);
	default m_LifeTime = 10.0f;

	default m_SuperArmorDamageBase = 61.f;
}
