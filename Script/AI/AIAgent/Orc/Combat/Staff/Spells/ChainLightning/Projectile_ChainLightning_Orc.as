UCLASS()
class ULightningRayDefinition_Base_Orc : ULightningRayDefinition_Base
{
	default m_Name = "LightingRay_Base_Orc";
	
	//default m_HitEffect = UGE_ChainLightning_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 50.0f);

	default m_MaxLinks = 3;

	default m_FindLinkEachSeconds = 2.0f;

	default m_AreaToFindNewTargetsCm = 500.0f;

	default m_MaxDistanceRayCm = 1000.0f;

	default m_EffectOnRemoval = UGE_Paralyze_Cooldown::StaticClass();
}

UCLASS()
class ULightningRayDefinition_WithParalysis_Orc : ULightningRayDefinition_Base_Orc
{
	default m_Name = "LightingRay_WithParalysis_Orc";
	
	default m_HitEffect = UGE_ChainLightning_WithParalysis_Damage::StaticClass();
}

UCLASS()
class ULightningRayDefinition_WithoutParalysis_Orc : ULightningRayDefinition_Base_Orc
{
	default m_Name = "LightingRay_WithoutParalysis_Orc";
	default m_HitEffect = UGE_ChainLightning_WithoutParalysis_Damage::StaticClass();
}