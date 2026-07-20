// Oxygen depletion over time.
class UGE_OxygenDepletion : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	
    default Period.Value = 1.f;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Oxygen::StaticClass(), n"OxygenDepletionRate");
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeSource = EGameplayEffectAttributeCaptureSource::Source;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.Coefficient.Value = -1.0f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Oxygen::StaticClass(), n"Oxygen");
	default Modifiers.Add(modifier);
}

// Oxygen recovery over time.
class UGE_OxygenRecovery : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
	
    default Period.Value = 1.0f;

	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Oxygen::StaticClass(), n"OxygenRecoveryRate");
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeSource = EGameplayEffectAttributeCaptureSource::Source;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.Coefficient.Value = 1.0f;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Oxygen::StaticClass(), n"Oxygen");
	default Modifiers.Add(modifier);
}

// Restore oxygen immediately.
class UGE_OxygenRestore : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;
	
	FGameplayModifierInfo modifier;
	default modifier.ModifierMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::AttributeBased;
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeToCapture = GetAttribute(UAttributeSet_Oxygen::StaticClass(), n"MaxOxygen");
	default modifier.ModifierMagnitude.AttributeBasedMagnitude.BackingAttribute.AttributeSource = EGameplayEffectAttributeCaptureSource::Source;
	default modifier.ModifierOp = EGameplayModOp::Additive;
	default modifier.Attribute = GetAttribute(UAttributeSet_Oxygen::StaticClass(), n"Oxygen");
	default Modifiers.Add(modifier);
}

// Set health = 0 immediately.
// See also: UImGuiDebugTool_Health::OnDisplay() ... if (ImGui::Button("Kill"))
class UGE_OxygenRanOut : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

    // to pass checks in UAttributeSet_Health::ShouldCharacterDie()
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_KillCharacter);

	FGameplayModifierInfo modifier;
	default modifier.ModifierOp = EGameplayModOp::Override;
	default modifier.Attribute = GetAttribute(UAttributeSet_Health::StaticClass(), n"Health");
	default Modifiers.Add(modifier);
}

class UGA_Swim : UGameplayAbilitySwim
{
    default m_OxygenDepletionEffect = UGE_OxygenDepletion::StaticClass();
	default m_OxygenRecoveryEffect = UGE_OxygenRecovery::StaticClass();
    default m_OxygenRanOutEffect = UGameplayEffect_KillCharacter::StaticClass(); //UGE_OxygenRanOut::StaticClass(); // note: both GEs should work
    default m_OxygenRestoreEffect = UGE_OxygenRestore::StaticClass();

	default m_ParticlePausingTags.AddTag(GameplayTag::State_Interact_Ongoing);

	UFUNCTION(BlueprintOverride)
	void Server_ApplyEffects_OxygenRanOut_Scriptable()
	{
		ApplyGameplayEffect(m_OxygenRanOutEffect);
	}
}

class UGA_Swim_Human : UGA_Swim
{
	default m_DiveParticlesToSpawnOnHands = nullptr;
	default m_DiveParticlesToSpawnOnBody = nullptr;
	default m_DiveParticlesToSpawnOnHead = n"/Script/Niagara.NiagaraSystem'/Game/Assets/VFX/Particles/Ambient/WaterInteraction/P_Water_Bubbles_Body1.P_Water_Bubbles_Body1'";

	//@DE - For controlled humans: controlled NPC dont die, keeps 1 health point. On this case, oxigenRanOut is a damage evaluated by Damage.as executor to allow apply damage limitations on humans.
	//it uses a environment weapon.
	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	TSubclassOf<UWeaponDefinition> m_DrownEnvironmentWeapon = UWorldDrownWeapon::StaticClass();

	UFUNCTION(BlueprintOverride)
	void Server_ApplyEffects_OxygenRanOut_Scriptable()
	{
		if(!IsControlledBySpell())
		{
			Super::Server_ApplyEffects_OxygenRanOut_Scriptable();
			return;
		}

		auto avatar = GetAvatarActorFromActorInfo();
		auto maxHealth = Cast<AGothicCharacter>(avatar).GetMaxHealthAttribute();
		auto gothicAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
		
		FHitResult hit;
		FGameplayEffectContext_HitResponse hit_data;
		hit_data.Impact = GameplayTag::Combat_HitType_Dot;
		hit_data.WeaponUsed = m_DrownEnvironmentWeapon;
		hit_data.MultiplierDamages.Add(GameplayTag::Item_Damage_Environment_Drown, maxHealth);
		GothicGAS::ApplyDamageTo(gothicAbComp, avatar, nullptr, gothicAbComp, hit_data, hit);

		EndControlSpell();
		
		if(!IsDead())
			EndAbility();
	}

	bool IsDead()
	{
		return Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).IsDead();
	}

	void EndControlSpell()
	{
		GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::Event_Controlled_Drown, FGameplayEventData());
	}

	//	default m_DrownEnvironmentWeapon 
						
	bool IsControlledBySpell()
	{
		return Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).HasTagExact(GameplayTag::State_Controlled);
	}
}