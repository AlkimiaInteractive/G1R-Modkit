
class UGA_CastSpell_Teleport_DiegoSleeper : UGA_CastSpell_Teleport_Creature
{
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	//default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
	
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	//default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::State_Hit);

    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_DiegoSleeper_Teleport::StaticClass();

    UClass GetTeleportSpotFilterClass() override
    {
        auto currentCharacter =  Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        return Cast<UCharacterDefinition_Human_OC_STT_Diego_Sleeper>(currentCharacter.GetCharacterDefinition()).m_TeleportSpotFilterClass;
    }   

    UCreatureTeleportComponent GetTeleportComponent() override
    {
        return Cast<UCreatureTeleportComponent>(UCreatureTeleportComponent::Get(GetAvatarActorFromActorInfo()));
    } 

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        auto teleportComp =  UDiegoSleeperTeleportComponent::GetOrCreate(GameplayAbilityActorInfo.GetAvatarActor());
        if(teleportComp == nullptr)
            return false;
        if(teleportComp.m_ForceTeleportToExecutionLocation)
            return true;
        return Cast<UGothicAbilitySystemComponent>(GameplayAbilityActorInfo.AbilitySystemComponent).HasGameplayTag(GameplayTag::State_CanDoTeleport);
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.GiveAbility(UGA_DiegoSleeperInvulnerableVisualManager::StaticClass(), 1, -1, nullptr);
        Super::OnActivateCastSpellServer_Scriptable(castMontage);
        Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).RemoveTag(GameplayTag::State_CanDoTeleport);
    }

    ATeleportSpotVisual GetTeleportSpot(UCreatureTeleportComponent TeleportComponent,
                                        UClass TeleportSpotFilterClass) override
    {
        auto diegoTeleportComp = Cast<UDiegoSleeperTeleportComponent>(TeleportComponent);
        if(diegoTeleportComp == nullptr)
            return nullptr;
        //@DE - We do not need to find a teleport spot. We already have the location
        if(diegoTeleportComp.m_ForceTeleportToExecutionLocation)
            return nullptr;
        return Super::GetTeleportSpot(TeleportComponent, TeleportSpotFilterClass);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_SpawnExplosion);
        ClearAbilityByClass(UGA_Diego_Sleeper_HealthMonitor::StaticClass());
        ClearAbilityByClass(UGA_CastSpell_Teleport_DiegoSleeper::StaticClass());
    }

    void ClearAbilityByClass(TSubclassOf<UScriptGameplayAbility> Ability)
    {
        FGameplayAbilitySpec outHandle;
        GetAbilitySystemComponentFromActorInfo().FindAbilitySpecFromClass(Ability, outHandle);
        if(MagicScript::IsValidGameplaySpecHandle(outHandle.Handle))
            GetAbilitySystemComponentFromActorInfo().ClearAbility(outHandle.Handle);
    }
}


class UGA_CastSpell_Teleport_DiegoSleeper_Bow : UGA_CastSpell_Teleport_DiegoSleeper
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_DiegoSleeper_Teleport_Bow::StaticClass();
}

class UGA_CastSpell_Teleport_DiegoSleeper_Sword : UGA_CastSpell_Teleport_DiegoSleeper
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_DiegoSleeper_Teleport_Sword::StaticClass();
}


class UGA_DiegoSleeper_GiveTeleportComponent : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;
    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        UDiegoSleeperTeleportComponent::GetOrCreate(GetAvatarActorFromActorInfo());
    }
}