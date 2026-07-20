class USpellConfigurationContainer_Scriptable : USpellConfigurationContainer
{
    default m_CastStateLockMovementGameplayEffectClass = UGE_SetStateLockMovement_Cast::StaticClass();
    default m_SpellStateLockMovementGameplayEffectClass = UGE_SetStateLockMovement_Spell::StaticClass();
}

class UGE_SetStateLockMovement_Cast : UScriptGameplayEffect
{
	// Duraction of the effect
	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreMovementInput);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_BlockState);

}
  

class UGE_SetStateLockMovement_Spell : UScriptGameplayEffect
{
	// Duraction of the effect
	default DurationPolicy = EGameplayEffectDurationType::Infinite;

	// Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreMovementInput);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_BlockState);

}