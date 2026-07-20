/** Do a ChainLightning spell */
UCLASS()
class UCM_OrcShamanSpell_ChainLightning_CastForSeconds : UCM_CastSpell_Orc_Shaman
{
    UCM_OrcShamanSpell_ChainLightning_CastForSeconds(float InSeconds)
    {
        MinSeconds = Math::Max(InSeconds, 0.0f);
        MaxSeconds = MinSeconds;
    }

    UCM_OrcShamanSpell_ChainLightning_CastForSeconds(float InMinSeconds, float InMaxSeconds)
    {
        MinSeconds = Math::Max(InMinSeconds, 0.0f);
        MaxSeconds = Math::Max(InMaxSeconds, MinSeconds);
    }

    default _SpellTag = GameplayTag::Spell_ChainLightning;

    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::Debuff_Electrified);

    UPROPERTY()
    float MinSeconds = 10.0f;

    UPROPERTY()
    float MaxSeconds = 10.0f;

    bool ConditionsToContinueSpell() const override
    {
        if (!IsValid(Combat.CharacterOfInterest) || Combat.DistanceToCharacterOfInterest < 200.0f)
        {
            OnShouldStopSpell();
        }

        return Super::ConditionsToContinueSpell();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Self.IsDoingMagic())
        {
            Reason = "Already doing magic";
            return false;
        }

        // auto SelectedSpellItem = Combat.GetSelectedSpellItem();
        // if (SelectedSpellItem == nullptr)
        //     return false;

        // if (!Combat.Self.CanUseSpell(SelectedSpellItem))
        //     return false;

        return true;
    }

    void CastSpell() override
    {
        StartCastingSustainedSpell(MinSeconds, MaxSeconds);        
    }

    bool WouldAttackCollideWithWall() const override
    {
        if(Combat.CharacterState.HasGameplayTag(GameplayTag::State_TraceTarget_TargetDetected))
            return false;
        return true;
    }
}