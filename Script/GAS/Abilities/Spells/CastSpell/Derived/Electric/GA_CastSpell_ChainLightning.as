
class UGA_CastSpell_ChainLightning : UGA_CastSpell_Targetable_Character_Debuff
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_ChainLightning::StaticClass();
    default m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_ChainLightning;

    // UPROPERTY()
    // FGameplayTag m_LaunchingSpellTag = FGameplayTag(GameplayTag::State_LaunchingSpell_ChainLightning);
    // UPROPERTY()
    // FGameplayTag m_ReceivingSpell = FGameplayTag(GameplayTag::State_ReceivingSpell_ChainLightning);
    
    default m_SpellConfigClass = UChainLightningSpellConfig::StaticClass();
    default m_WeaponContainer = UItAr_Rune_ChainLightning_Base::StaticClass();

    default m_ExecutionValidator = UCastSpellExecutionValidatorChainLightning::StaticClass();

    default m_DebuffTag = GameplayTag::State_LaunchingSpell_ChainLightning;
    UPROPERTY()
    FGameplayTag RequiredTagOnTarget = GameplayTag::State_ReceivingSpell_ChainLightning;


    void InitializeValidatorData(USpellExecutionValidatorDataDefault Data, AActor SourceActor,
                                 AActor TargetActor) const override
    {
        Super::InitializeValidatorData(Data, SourceActor, TargetActor);
        UChainLightningSpellExecutionValidatorData data = Cast<UChainLightningSpellExecutionValidatorData>(Data);
        data.DebuffTagOnTarget = RequiredTagOnTarget;
    }


    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        return IsTargetValid_Script(GetAvatarActorFromActorInfo(), GetTarget());
    }
   
}

class UGA_CastSpell_Scroll_ChainLightning : UGA_CastSpell_ChainLightning
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_ChainLightning::StaticClass();
}