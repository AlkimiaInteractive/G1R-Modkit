UCLASS()
class UCastSpellExecutionValidatorPyrokinesis : UCastSpellExecutionValidatorTargetableCharacterDebuff
{
    default RequiredTag = GameplayTag::Debuff_Pyrokinesis;
    //default BlockedTag = GameplayTag::Debuff_Blocked_Sleep;

    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(!Super::IsValid_Scriptable(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<USpellExecutionValidatorDataTargetableDebuff>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

        auto gothicCharacter = Cast<AGothicCharacter>(castExecData.TargetActor);

        if(HasAnyPyrokinesisTag(gothicCharacter))
        {
            PrintDebugOnScreen(FName("IsTargetValid_Script - HasAnyPyrokinesisTag(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }
        // if(HasBlockedTag(gothicCharacter))
        // {
        //     PrintDebugOnScreen(FName("IsTargetValid_Script - HasBlockedTag(gothicCharacter)"), 10.f, FColor::Red);
        //     return false;
        // }
        // if(!CheckValidTargetSpecies(gothicCharacter))
        // {
        //     PrintDebugOnScreen(FName("IsTargetValid_Script - !CheckValidTargetSpecies(gothicCharacter)"), 10.f, FColor::Red);
        //     return false;
        // }
        
        return true;
    }

    

    bool HasBlockedTag(AGothicCharacter gothicChar) const
    {
        return HasTag(gothicChar, BlockedTag);
    }

    bool CheckValidTargetSpecies(AGothicCharacter gothicChar) const
    {       
        if(gothicChar != nullptr)
        {
            if(gothicChar.IsHuman())
                return true;
        }    
        return false;
    }

    bool HasAnyPyrokinesisTag(AGothicCharacter gothicChar) const
    {
        return HasTag(gothicChar, RequiredTag);
    }
}