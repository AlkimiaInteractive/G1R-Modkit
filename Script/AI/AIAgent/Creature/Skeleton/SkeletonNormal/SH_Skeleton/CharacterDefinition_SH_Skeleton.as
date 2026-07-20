UCLASS()
class UGE_SH_Skeleton_AI : UGE_Skeleton_AI
{
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);

	FConditionalGameplayEffect conditionalSummonGE;
	default conditionalSummonGE.EffectClass = UGE_SummonedNotVisible::StaticClass(); 
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);

	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalSummonGE);
	default RemoveAbility(UGA_Summon_Skeleton::StaticClass());
    default AddAbility(UGA_Summon_SH_Skeleton::StaticClass());
}

UCLASS()
class UCharacterDefinition_SH_Skeleton : UCharacterDefinition_Creature_SH_ZombieSkeleton
{
	default m_UniqueName = n"SH_Skeleton";
	default m_AbilitiesEffect = UGE_SH_Skeleton_AI::StaticClass();
}
