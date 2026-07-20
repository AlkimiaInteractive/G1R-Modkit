UCLASS()
class UCM_SkeletonMageSpecialAttack_Base_Spell : UCM_CastSpell_Base
{
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

/** Cast spell once */
UCLASS()
class UCM_SkeletonMageSpecialAttack_CastSpellOnce : UCM_SkeletonMageSpecialAttack_Base_Spell
{
    void CastSpell() override
    {
        CastSpellOnce();
    }
}

/** Cast spell for n seconds */
UCLASS()
class UCM_SkeletonMageSpecialAttack_CastSpellForSeconds : UCM_SkeletonMageSpecialAttack_Base_Spell
{
    UCM_SkeletonMageSpecialAttack_CastSpellForSeconds(float InSeconds)
    {
        MinSeconds = Math::Clamp(InSeconds, 0.0f, MAX_flt);
        MaxSeconds = MinSeconds;
    }

    UCM_SkeletonMageSpecialAttack_CastSpellForSeconds(float InMinSeconds, float InMaxSeconds)
    {
        MinSeconds = Math::Clamp(InMinSeconds, 0.0f, MAX_flt);
        MaxSeconds = Math::Clamp(InMaxSeconds, MinSeconds, MAX_flt);
    }

    UPROPERTY()
    float MinSeconds = 10.0f;

    UPROPERTY()
    float MaxSeconds = 10.0f;

    default MoveTypes.AddTag(GameplayTag::Action_CastSpell);

    void CastSpell() override
    {
        StartCastingSustainedSpell(MinSeconds, MaxSeconds);
    }
}

UCLASS()
class UCM_SkeletonMageSpecialAttack_SummonSkeletons : UCM_SkeletonMageSpecialAttack_CastSpellOnce
{
    default _SpellTag = GameplayTag::Spell_Summon_Skeletons_SkeletonMage;
}

UCLASS()
class UCM_SkeletonMageSpecialAttack_SoulHarvest : UCM_SkeletonMageSpecialAttack_CastSpellOnce
{
    default _SpellTag = GameplayTag::Spell_SoulHarvest;
}

UCLASS()
class UCM_SkeletonMageSpecialAttack_MagicBeam : UCM_SkeletonMageSpecialAttack_CastSpellForSeconds
{
    default _SpellTag = GameplayTag::Spell_MagicBeam;

    default MinSeconds = 50.0f;
    default MaxSeconds = 50.0f;

    bool ConditionsToContinueSpell() const override
    {
        if (!IsValid(Combat.CharacterOfInterest) || Combat.DistanceToCharacterOfInterest < 200.0f)
        {
            OnShouldStopSpell();
        }

        return Super::ConditionsToContinueSpell();
    }
}

UCLASS()
class UCM_SkeletonMageSpecialAttack_Teleport : UCM_SkeletonMageSpecialAttack_CastSpellOnce
{
    default _SpellTag = GameplayTag::Spell_Teleport_SkeletonMage;
}