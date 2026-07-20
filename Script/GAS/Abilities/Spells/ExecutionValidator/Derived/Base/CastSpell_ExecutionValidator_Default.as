UCLASS()
class UCastSpellExecutionValidatorDefault : USpellExecutionValidatorBase
{
    default m_ExecutionValidatorData = USpellExecutionValidatorDataDefault::StaticClass();

    // USpellExecutionValidatorDataBase DoDataCast(USpellExecutionValidatorDataBase Data) override
    // {
    //     return Cast<USpellExecutionValidatorDataDefault>(Data);
    // }

    UPROPERTY()
    FGameplayTag m_CastingTag = FGameplayTag(GameplayTag::State_Casting);      
    UPROPERTY()
    FGameplayTag m_LaunchingSpellTag = FGameplayTag(GameplayTag::State_LaunchingSpell);
    UPROPERTY()
    FGameplayTag m_StateDoingMagicTag = GameplayTag::State_DoingMagic;

    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        auto castExecData = Cast<USpellExecutionValidatorDataDefault>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

        if(!IsDataInValidState(castExecData))
            return false;

        auto abComp = GothicGAS::GetAbilitySystemComponent(castExecData.SourceActor);
        FGameplayTagContainer cantCastTags;

        cantCastTags.AddTag(GameplayTag::Debuff_Death);
        cantCastTags.AddTag(GameplayTag::Debuff_Defeated);
        cantCastTags.AddTag(GameplayTag::Debuff_Defeated_Stay);
        cantCastTags.AddTag(GameplayTag::Debuff_Paralyzed);
        //cantCastTags.AddTag(GameplayTag::Debuff_Electrified);
        //cantCastTags.AddTag(GameplayTag::Debuff_Freeze);
        cantCastTags.AddTag(GameplayTag::Debuff_Fear);
        cantCastTags.AddTag(GameplayTag::Debuff_Sleep);
        cantCastTags.AddTag(GameplayTag::State_Knockback);
        //@DE - At this point, the mana is not needed to check; Is handled by abilities.
        if(!IsCastingOrLaunchingSpell(abComp))
        {
            auto gothicChar = Cast<AGothicCharacter>(castExecData.SourceActor);
            if(gothicChar != nullptr)
            {
                if(gothicChar.IsPlayerCharacterOrPlayerControlled())
                    cantCastTags.AddTag(GameplayTag::State_OutMana);
            }
        }
        
        if(abComp.HasAnyGameplayTags(cantCastTags))
            return false;


        return true;
    }

    bool IsDataInValidState(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(ExecutionValidatorData == nullptr)
            return false;
        
        auto castExecData = Cast<USpellExecutionValidatorDataDefault>(ExecutionValidatorData);
        
        auto sourceActor = castExecData.SourceActor;
        if(sourceActor == nullptr)
        {
            PrintDebugOnScreen(FName("TargetInValidState - sourceActor == nullptr"), 10.f, FColor::Red);
            return false;
        }
        return true;
    }

    bool HasTag(AGothicCharacter gothicChar, FGameplayTag Tag) const
    {
        if(gothicChar == nullptr)
            return false;
        auto abComp = gothicChar.GetGothicAbilitySystemComponent();
        return abComp.HasGameplayTag(Tag);
    }

    bool IsCastingOrLaunchingSpell(UGothicAbilitySystemComponent AbComp) const
    {
        if(AbComp == nullptr)
            return false;

        bool isCastingSpell = AbComp.HasGameplayTag(m_CastingTag);
        bool isLaunchingSpell = AbComp.HasGameplayTag(m_LaunchingSpellTag);
        bool isStateDoingMagic = AbComp.HasGameplayTag(m_StateDoingMagicTag);
        return isCastingSpell || isLaunchingSpell || isStateDoingMagic;
    }
    
}