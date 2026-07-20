UCLASS()
class UCM_Spell_Milten_Fireball : UCM_CastSpellChargedBasedOnDistance
{
    UCM_Spell_Milten_Fireball(float InMinRange, float InMaxRange)
    {
        MaxRange = InMaxRange;
        MinRange = InMinRange;
    }

    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Milten_Brazier);
    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::Debuff_Milten_Brazier);

    default _SpellTag = GameplayTag::Spell_Fireball;
}

UCLASS()
class UCM_Spell_Milten_FireBolt : UCM_CastSpellMultiple
{
    UCM_Spell_Milten_FireBolt(int InAmount)
    {
        MinAmount = Math::Clamp(InAmount, 0, MAX_int32);
        MaxAmount = MinAmount;
    }

    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Milten_Brazier);
    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::Debuff_Milten_Brazier);

    default _SpellTag = GameplayTag::Spell_Firebolt;
}

UCLASS()
class UCM_Spell_Milten_Teleport : UCM_CastSpellOnce
{
    default _SpellTag = GameplayTag::Item_Spell_Sleeper_Teleport_Milten;

    default BlockIfCharacterHasAnyOf.RemoveTag(GameplayTag::Debuff_Milten_Brazier);
}

UCLASS()
class UCM_WaitForBrazierDamage : UAITask_CombatMove
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        AI.WaitSeconds(10.0f);
    }
}