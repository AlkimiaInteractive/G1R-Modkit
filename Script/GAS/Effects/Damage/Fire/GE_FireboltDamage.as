class UGE_FireBolt_Damage : UGE_Damage_Fire
{
		// The effect wont be added if the character already has this tag
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	//default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
}