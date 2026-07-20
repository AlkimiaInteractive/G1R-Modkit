UCLASS(meta=(DisplayName="Lava Damage Region Trait"))
class URegionTrait_LavaDamage : URegionTrait_DamageBase
{
    default m_def = UEnvironment_LavaDefinition::StaticClass();

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Dot;
    }
}