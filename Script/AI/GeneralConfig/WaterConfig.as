UCLASS()
class UWaterConfigBase : UWaterConfig
{
	default m_Buoyancy = 1;
	default m_RagdollUnderWaterHeight = 140;

    default m_SurfaceWaterMinHeight = 0.1f;
    default m_MidWaterMinHeight = 70.f;
    default m_DeepWaterMinHeight = 130.f;

    default m_SurfaceWaterEffect = UGE_SurfaceWater::StaticClass();
    default m_MidWaterEffect = UGE_MidWater::StaticClass();
    default m_DeepWaterEffect = UGE_DeepWater::StaticClass();
}

class UGE_WaterVolume : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
}

class UGE_SurfaceWater : UGE_WaterVolume
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_InWater_SurfaceWater);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_InWater_SurfaceWater);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_InWater_SurfaceWater);

}

class UGE_MidWater : UGE_WaterVolume
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_InWater_MidWater);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_InWater_MidWater);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_InWater_MidWater);

    //When the character get burn, if its freeze, this remove the effect
	default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();
}

class UGE_DeepWater : UGE_WaterVolume
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_InWater_DeepWater);

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_InWater_DeepWater);
    
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_InWater_DeepWater);

    //When the character get burn, if its freeze, this remove the effect
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Freeze);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Ice);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Burn);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Fire);
    default TagsToRemoveOther.AddTag(GameplayTag::Debuff_Stack_Freeze_Hits);
    default RemoveOtherTags();
}

///     Humans
///     
///     
class UGE_SurfaceWater_Human : UGE_SurfaceWater
{
}

class UGE_MidWater_Human : UGE_MidWater
{
}

class UGE_DeepWater_Human : UGE_DeepWater
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Movement_InWater);
}

///     Player (generic)
///     
///     
class UGE_SurfaceWater_Player : UGE_SurfaceWater
{
}

class UGE_MidWater_Player : UGE_MidWater
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Movement_InWater);
}

class UGE_DeepWater_Player : UGE_DeepWater
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Movement_InWater);
}

///     SWAMP SHARK
class UGE_SurfaceWater_Creature : UGE_SurfaceWater
{
}

class UGE_MidWater_Creature : UGE_MidWater
{
}

class UGE_DeepWater_Creature : UGE_DeepWater
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Movement_InWater);
}

///     SWAMP SHARK
class UGE_SurfaceWater_SwampShark : UGE_SurfaceWater
{
}

class UGE_MidWater_SwampShark : UGE_MidWater
{
}

class UGE_DeepWater_SwampShark : UGE_DeepWater
{
}

///     FLYING CREATURES
///     
///     FOR FLYING Creatures we don't want Tag "State_Movement_InWater"
class UGE_SurfaceWater_Flying : UGE_SurfaceWater
{
}

class UGE_MidWater_Flying : UGE_MidWater
{
}

class UGE_DeepWater_Flying : UGE_DeepWater
{
}