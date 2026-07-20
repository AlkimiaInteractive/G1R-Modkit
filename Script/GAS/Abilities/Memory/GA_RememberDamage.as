class UGA_RememberDamage : UGameplayAbilityMemory
{
    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Perception.HitOnSelf().PerceptionGained.BindUFunction(this, n"SensedMyselfGotHit");
        Perception.SeeHitOnOtherCharacter().PerceptionGained.BindUFunction(this, n"SensedSomeoneElseGotHit");
    }

    UFUNCTION()
    bool IsCharacterStateInvolvedWithPlayer(AGothicCharacterState OtherCharacterState)
    {
        if (OtherCharacterState.IsPlayerCharacter() || OtherCharacterState.IsPlayerControlled())
            return true;

        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if (OtherCharacterState.IsInPartyWith(PlayerCharacter.CharacterState))
            return true;

        auto SummonerCharacterState = OtherCharacterState.SummonedBy();
        if (!IsValid(SummonerCharacterState))
            return false;

        if (SummonerCharacterState.IsPlayerCharacter() || SummonerCharacterState.IsPlayerControlled())
            return true;

        if (SummonerCharacterState.IsInPartyWith(PlayerCharacter.CharacterState))
            return true;

        return false;
    }

    UFUNCTION()
    private void SensedMyselfGotHit(const FRememberedPerception&in Perception,
                                              const FPerceptionShortTermMemory&in Memory)
    {
        bool bIsIntentionalAttack = IsIntentionalAttack(Perception);

        FGameplayTagContainer AdditionalTags;
        if (IsCharacterStateInvolvedWithPlayer(Perception.Instigator.CharacterState))
        {
            AdditionalTags.AddTag(GameplayTag::Character_Player);
        }

        if (bIsIntentionalAttack)
        {
            if (Perception.Instigator.Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Fist))
            {
                LongTermMemory.UpdateLastMemoryAgainstMeMatchingAll(GameplayTag::Memory_Combat_WasDamaged_Intentionally_Fist, Perception.Instigator.CharacterState, AdditionalTags);
            }
            else
            {
                LongTermMemory.UpdateLastMemoryAgainstMeMatchingAll(GameplayTag::Memory_Combat_WasDamaged_Intentionally, Perception.Instigator.CharacterState, AdditionalTags);
            }
        }
        else
        {
            LongTermMemory.MemorizeActionAgainstMe(GameplayTag::Memory_Combat_WasDamaged_Unintentionally, Perception.Instigator.CharacterState, AdditionalTags);
        }
    }

    UFUNCTION()
    private void SensedSomeoneElseGotHit(const FRememberedPerception&in Perception,
                                               const FPerceptionShortTermMemory&in Memory)
    {
        FGameplayTagContainer AdditionalTags;
        if (Perception.Instigator.CharacterState == AvatarCharacterState && IsCharacterStateInvolvedWithPlayer(Perception.Affected.CharacterState))
        {
            AdditionalTags.AddTag(GameplayTag::Character_Player);
        }

        auto Hostility = Perception.Origin.CharacterState.Relationship.GetHostilityTowards(Perception.Instigator.Character.CharacterState);
        if (Hostility == ERelationshipHostility::TrainingFight)
            return;

        bool bIsIntentionalAttack = IsIntentionalAttack(Perception);

        if (bIsIntentionalAttack)
        {
            if (Perception.Instigator.Character.HasDrawnFists())
            {
                LongTermMemory.UpdateLastMemoryAgainstCharacterAll(GameplayTag::Memory_Combat_WasDamaged_Intentionally_Fist, Perception.Affected.CharacterState, Perception.Instigator.CharacterState, AdditionalTags);
            }
            else
            {
                LongTermMemory.UpdateLastMemoryAgainstCharacterAll(GameplayTag::Memory_Combat_WasDamaged_Intentionally, Perception.Affected.CharacterState, Perception.Instigator.CharacterState, AdditionalTags);
            }

            if (!AvatarCharacterState.IsFriendlyTowards(Perception.Origin.CharacterState))
                return;
        }
        else if (!Perception.Affected.CharacterState.IsImmortal())
        {
            LongTermMemory.MemorizeActionAgainstCharacter(GameplayTag::Memory_Combat_WasDamaged_Unintentionally, Perception.Affected.CharacterState, Perception.Instigator.CharacterState, AdditionalTags);
        }
    }

    bool IsIntentionalAttack(const FRememberedPerception&in Perception)
    {
        if (Perception.Instigator.Character == nullptr)
                return false;

        if (Perception.Affected.Character != nullptr && Perception.Affected.CharacterState == Perception.Target.CharacterState)
            return true;

        bool bInstigatorIsPlayer = Perception.Instigator.Character.IsPlayerControlled();

        if (Perception.Affected.CharacterState == Perception.Target.CharacterState)
            return true;

        if (Perception.Sensing.CharacterState.Species.MatchesTag(GameplayTag::Species_Creature))
            return true;

        // if (bInstigatorIsPlayer && !Perception.Instigator.CharacterState.IsInConflict() && !Perception.Affected.CharacterState.IsImmortal())
        //     return true;

        if (bInstigatorIsPlayer && Perception.Affected.CharacterState.Relationship.IsFriendlyTowards(Perception.Instigator.CharacterState))
            return false;

        if (bInstigatorIsPlayer)
            return true;
        
        return false;
    }
}