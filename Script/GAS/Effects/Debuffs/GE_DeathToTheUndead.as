class UGE_DeathToTheUndead : UGE_Damage
{
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Invulnerable);
}
