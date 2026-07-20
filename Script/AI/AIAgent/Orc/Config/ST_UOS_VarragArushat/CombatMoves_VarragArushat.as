/** Do a BreathOfDeath spell */
UCLASS()
class UCM_OrcShamanSpell_BreathOfDeath : UCM_CastSpell_Orc_Shaman
{
    default _SpellTag = GameplayTag::Spell_BreathOfDeath;

    void CastSpell() override
    {
        CastSpellOnce();        
    }

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
}