UCLASS(Blueprintable)
class AFireboltVisual : ASpellBallVisual_AS
{
    default m_ProjectileDebuffTag = GameplayTag::Debuff_Burn;
    TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap() const override
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_BurnInfinite::StaticClass());
        return effects;
    }
}