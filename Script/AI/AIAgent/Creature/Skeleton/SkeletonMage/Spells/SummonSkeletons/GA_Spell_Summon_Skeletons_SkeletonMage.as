class UGA_Spell_Summon_Skeletons_SkeletonMage : UGA_Spell_SummonAI
{
    default m_SpellConfigClass = USpell_Summon_Skeletons_SkeletonMage_Config::StaticClass();
	default m_SummonCreatureVisualEffectClass = n"Blueprint'/Game/Items/Magic/Summon/SkeletonMage/BP_SkeletonMage_SummonSkeletonsVisualEffect.BP_SkeletonMage_SummonSkeletonsVisualEffect_C'";

    USummonManagerComponent CreateOrGetSummonManagetComponent() override
    {
        return USkeletonMageSummonManagerComponent::GetOrCreate(GetAvatarActorFromActorInfo());
    }

}
