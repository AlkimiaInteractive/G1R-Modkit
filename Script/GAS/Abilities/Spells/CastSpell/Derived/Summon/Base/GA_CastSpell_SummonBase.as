class UGA_CastSpell_SummonBase : UGA_CastSpell_Default
{
    // UFUNCTION(BlueprintOverride)
    // bool OnFinishCastAbilityByAnimNotify_Scriptable()
    // {
    //     return true;
    // }

    UPROPERTY()
    USummonManagerComponent m_SummonManagerComponent;

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
    {
        if(!GetAvatarActorFromActorInfo().HasAuthority())
            return;

        auto SpellConfig = Cast<USummonSpellConfig_Base>(Cast<USpellConfigurationContainer_Scroll_Summon>(m_SpellConfigurationContainerClass.Get().GetDefaultObject()).GetSpellConfig()).GetSummonConfig();
        auto FAISpawnData = SpellConfig.m_CharactersToSpawn;
        auto Radius= SpellConfig.m_MaxSummonDistance;
        
        if(FAISpawnData.IsEmpty())
            return;

        m_SummonManagerComponent = CreateOrGetSummonManagetComponent();
        if(m_SummonManagerComponent == nullptr)
        {
            EndAbility();
            return;
        }

        m_SummonManagerComponent.InitializeNavMeshInvokerActor(FAISpawnData, GetAvatarActorFromActorInfo().GetActorLocation(), Radius);

    }

    USummonManagerComponent CreateOrGetSummonManagetComponent()
    {
        return USummonManagerComponent::GetOrCreate(GetAvatarActorFromActorInfo());
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility(bool bWasCancelled)
    {
        if(bWasCancelled && m_SummonManagerComponent != nullptr && !HasCreatedSpellAbilityServer())
            m_SummonManagerComponent.ClearNavMeshInvokerActor();
    }
    
}