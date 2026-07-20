UCLASS()
class UBaseCharacterEffectComponentsConfig : UCharacterEffectComponentsConfig
{
	
}

UCLASS()
class UDefaultCharacterEffectComponentsConfig : UBaseCharacterEffectComponentsConfig
{
    default m_EffectComponentsConfiguration.Add(UFloatingSpellItemEffectComponentConfig::StaticClass());

	default m_EffectComponentsConfiguration.Add(UBurnEffectStateComponentConfig::StaticClass());
	default m_EffectComponentsConfiguration.Add(UPyrokinesisEffectStateComponentConfig::StaticClass());
	default m_EffectComponentsConfiguration.Add(USlowdownEffectStateComponentConfig::StaticClass());
	
	default m_EffectComponentsConfiguration.Add(UFreezeEffectStateComponentConfig::StaticClass());
	default m_EffectComponentsConfiguration.Add(UElectrifiedEffectStateComponentConfig::StaticClass());
	default m_EffectComponentsConfiguration.Add(UParalyzeComponentConfig::StaticClass());
	
	default m_EffectComponentsConfiguration.Add(UFearEffectStateComponentConfig::StaticClass());

	default m_EffectComponentsConfiguration.Add(USleepEffectStateComponentConfig::StaticClass());

	default m_EffectComponentsConfiguration.Add(UCharmEffectStateComponentConfig::StaticClass());

	default m_EffectComponentsConfiguration.Add(UShrinkEffectStateComponentConfig::StaticClass());

	default m_EffectComponentsConfiguration.Add(UUnconsciousComponentConfig::StaticClass());

	default m_EffectComponentsConfiguration.Add(UAlcoholEffectStateComponentConfig::StaticClass());
	default m_EffectComponentsConfiguration.Add(USwampweedEffectStateComponentConfig::StaticClass());
}
