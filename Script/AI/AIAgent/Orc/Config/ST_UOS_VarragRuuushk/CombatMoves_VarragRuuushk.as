/** Do a StormOfFire spell */
UCLASS()
class UCM_OrcShamanSpell_StormOfFire : UCM_CastSpell_Orc_Shaman
{
    default _SpellTag = GameplayTag::Spell_StormOfFire;

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

        // if (!Combat.Self.CarryComponent.EquippedItemDefinition.HasItemSpec(GameplayTag::AISpellKeywords_Casting_Charged))
        //     return false;

        return true;
    }
}