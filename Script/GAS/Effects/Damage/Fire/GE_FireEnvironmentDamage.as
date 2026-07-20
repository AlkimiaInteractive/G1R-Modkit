class UGE_FireEnvironmentDamage : UGE_Damage_Fire_Infinite
{
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));

		// Stack config for effect
	// default StackLimitCount = 1;
	// default StackingType = EGameplayEffectStackingType::AggregateByTarget;
	// default bSuppressStackingCues = true;

	default TargetTagRequirements.RemovalTagRequirements.RequireTags.AddTag(GameplayTag::State_Swimming);
	default TargetTagRequirements.RemovalTagRequirements.RequireTags.AddTag(GameplayTag::State_InWater_MidWater);
	default TargetTagRequirements.RemovalTagRequirements.RequireTags.AddTag(GameplayTag::State_InWater_DeepWater);

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_BlockConversation);
}