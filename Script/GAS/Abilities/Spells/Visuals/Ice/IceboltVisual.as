UCLASS(Blueprintable)
class AIceboltVisual : ASpellBallVisual_AS
{
    default m_ProjectileDebuffTag = GameplayTag::Debuff_Freeze;

    TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap() const override
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_Freeze_5Secs::StaticClass());
        return effects;        
    }
}