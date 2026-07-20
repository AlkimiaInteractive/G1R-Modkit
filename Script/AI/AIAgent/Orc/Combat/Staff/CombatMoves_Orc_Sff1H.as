/** Do a FireBall spell */
UCLASS()
class UCM_OrcShamanSpell_FireBall_CastChargedBasedOnDistance : UCM_CastSpell_Orc_Shaman
{
    UCM_OrcShamanSpell_FireBall_CastChargedBasedOnDistance(float InMinRange, float InMaxRange)
    {
        MaxRange = InMaxRange;
        MinRange = InMinRange;
    }

    default _SpellTag = GameplayTag::Spell_Fireball;
    default MaxRange = 1000.0f;
    default MinRange = 200.0f;
    
    void CastSpell() override
    {
        CastSpellChargedBasedOnDistance();
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