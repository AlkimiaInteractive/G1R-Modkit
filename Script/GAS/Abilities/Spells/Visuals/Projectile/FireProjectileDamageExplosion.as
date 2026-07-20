UCLASS()
class AFireProjectileDamageExplosion : ASphereProjectileDamageExplosionVisual
{
    default m_ProjectileDebuffTag = GameplayTag::Debuff_Burn;
  
    TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const override
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_BurnInfinite::StaticClass());
        return effects;   
    }
}


UCLASS()
class ACapsuleFireProjectileDamageExplosion : ACapsuleProjectileDamageExplosionVisual
{
    default m_ProjectileDebuffTag = GameplayTag::Debuff_Burn;
  
    TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const override
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_BurnInfinite::StaticClass());
        return effects;   
    }
}
