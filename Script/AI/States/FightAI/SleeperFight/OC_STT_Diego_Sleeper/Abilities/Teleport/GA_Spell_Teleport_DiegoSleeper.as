class UGA_Spell_Teleport_DiegoSleeper : UGA_Spell_Teleport_Creature
{
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	//default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
	
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	//default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::State_Hit);

	TSubclassOf<UScriptGameplayEffect> m_InvulnerableGE = UGE_State_Invulnerable_DiegoSleeper::StaticClass();

	UFUNCTION(BlueprintOverride)
	void DoSpellBehaviour_Scriptable()
	{
		Super::DoSpellBehaviour_Scriptable();
		GetAbilitySystemComponentFromActorInfo().RemoveActiveGameplayEffectBySourceEffect(m_InvulnerableGE, nullptr);
	}

	UFUNCTION(BlueprintOverride)
	void OnActivateSpellServer_Scriptable()
	{
		auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_SpawnExplosion);
		Super::OnActivateSpellServer_Scriptable();
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_Activate);
		
	}

	UFUNCTION(BlueprintOverride)
	void OnEndSpellServer_Scriptable()
	{
		auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_Deactivate);
		Super::OnEndSpellServer_Scriptable();
	}
}





