class UGA_Spell_Teleport_MiltenSleeper : UGA_Spell_Teleport_Creature
{
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
	
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::State_Hit);

	UFUNCTION(BlueprintOverride)
	void OnActivateSpellServer_Scriptable()
	{
		auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_SpawnExplosion);
		Super::OnActivateSpellServer_Scriptable();
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_SpawnShield);
		
	}


}





