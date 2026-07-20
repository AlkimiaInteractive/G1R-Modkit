UCLASS()
class UCastSpellExecutionValidatorCharm : UCastSpellExecutionValidatorTargetableCharacterDebuff
{
    default RequiredTag = GameplayTag::Debuff_Charm;
    default BlockedTag = GameplayTag::Debuff_Blocked_Charm;
    
    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(!Super::IsValid_Scriptable(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<USpellExecutionValidatorDataTargetableDebuff>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

        auto gothicCharacter = Cast<AGothicCharacter>(castExecData.TargetActor);
        
        if(HasAnyCharmTag(gothicCharacter))
        {
            PrintDebugOnScreen(FName("IsTargetValid - HasAnyCharmTag(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }
        if(HasBlockedTag(gothicCharacter))
        {
            PrintDebugOnScreen(FName("IsTargetValid_Script - HasBlockedTag(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }
        if(!CheckValidTargetSpecies(gothicCharacter))
        {
            PrintDebugOnScreen(FName("IsTargetValid - !CheckValidTargetSpecies(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }

        if(gothicCharacter.IsPlayerControlled() || gothicCharacter.IsPlayerCharacter())
        {
            return false;
        } 
        return true;
    }

    bool HasBlockedTag(AGothicCharacter gothicChar) const
    {
        return HasTag(gothicChar, BlockedTag);
    }

    
    bool CheckValidTargetSpecies(AGothicCharacter NewTarget) const
    {       
        if(NewTarget != nullptr)
        {
            if(NewTarget.IsHuman())
                return true;
        }    
        return false;
    }

    bool HasAnyCharmTag(AGothicCharacter gothicChar) const
    {
        if(gothicChar == nullptr)
            return false;
        auto abComp = gothicChar.GetGothicAbilitySystemComponent();

        return abComp.HasGameplayTag(RequiredTag);
    }
}