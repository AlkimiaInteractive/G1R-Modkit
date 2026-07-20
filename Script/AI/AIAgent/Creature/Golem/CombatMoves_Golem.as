UCLASS()
class UCM_GolemSpecialAttack_Base_Spell : UCM_CastSpell_Base
{
    void CastSpell() override
    {
        CastSpellOnce();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        // if (Combat.Self.IsMoving())
        // {
        //     Reason = "Currently moving";
        //     return false;
        // }

        if (Combat.Self.IsDoingMagic())
        {
            Reason = "Already doing magic";
            return false;
        }

        return true;
    }
}

UCLASS()
class UCM_GolemSpecialAttack_Stone_StoneWave : UCM_GolemSpecialAttack_Base_Spell
{
    default _SpellTag = GameplayTag::Spell_StoneWave;    
}

UCLASS()
class UCM_GolemSpecialAttack_Stone_Teleport : UCM_GolemSpecialAttack_Base_Spell
{
    default _SpellTag = GameplayTag::Spell_Teleport_StoneGolem;    
}
/** Do a BreakFloor as a Fire Golem */
UCLASS()
class UCM_GolemSpecialAttack_Fire_BreakFloor : UCM_CastSpell_Base
{
    default _SpellTag = GameplayTag::Spell_BreakFloor;
}
/** Do a BreakFloor as a Fire Golem */
UCLASS()
class UCM_GolemSpecialAttack_Fire_BreakFloor2 : UCM_CastSpell_Base
{
    default _SpellTag = GameplayTag::Spell_BreakFloor;

    void CastSpell() override
    {
        CastSpellOnce();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        // if (Combat.Self.IsMoving())
        // {
        //     Reason = "Currently moving";
        //     return false;
        // }

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
UCLASS()
class UCM_GolemSpecialAttack_Ice_IceWave : UCM_GolemSpecialAttack_Base_Spell
{
    default _SpellTag = GameplayTag::Spell_IceWave_IceGolem;
}

UCLASS()
class UCM_GolemSpecialAttack_Ice_IceBolt : UCM_GolemSpecialAttack_Base_Spell
{
    default _SpellTag = GameplayTag::Spell_IceBolt_IceGolem;
}