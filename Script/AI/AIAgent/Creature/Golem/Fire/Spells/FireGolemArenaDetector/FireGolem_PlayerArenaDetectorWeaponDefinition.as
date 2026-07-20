UCLASS()
class UPlayerArenaDetector_FireGolem : UWeaponDefinition
{
	default m_Name = "PlayerArenaDetector_FireGolem";

	default m_HitEffect = UGE_FireGolem_PlayerArenaDetector::StaticClass();
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.00f);
}

class UGE_FireGolem_PlayerArenaDetector : UScriptGameplayEffect
{
    //Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_InFireGolemArena);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_InFireGolemArena);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_InFireGolemArena);
}
