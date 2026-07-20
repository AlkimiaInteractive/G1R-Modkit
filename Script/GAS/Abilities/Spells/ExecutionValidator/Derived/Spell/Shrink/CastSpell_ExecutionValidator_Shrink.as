UCLASS()
class UCastSpellExecutionValidatorShrink : UCastSpellExecutionValidatorTargetableCharacterDebuff
{
    default RequiredTag = GameplayTag::Debuff_Shrink;
    
    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(!Super::IsValid_Scriptable(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<USpellExecutionValidatorDataTargetableDebuff>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

        auto gothicCharacter = Cast<AGothicCharacter>(castExecData.TargetActor);

        if(HasAnyShrinkTag(gothicCharacter))
        {
            //PrintDebugOnScreen(FName("IsTargetValid_Script - HasAnyShrinkTag(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }
        if(!CheckValidTargetSpecies(gothicCharacter))
        {
            //PrintDebugOnScreen(FName("IsTargetValid_Script - !CheckValidTargetSpecies(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }
        return true;
    }

    bool CheckValidTargetSpecies(const AGothicCharacter NewTarget) const
    {       
        if(NewTarget != nullptr)
        {
            if(NewTarget.IsSpecies(GameplayTag::Species_Creature_Troll))
                return true;
        }    
        return false;
    }

    bool HasAnyShrinkTag(const AGothicCharacter gothicChar) const
    {
        if(gothicChar == nullptr)
            return false;
        auto abComp = gothicChar.GetGothicAbilitySystemComponent();

        return abComp.HasGameplayTag(RequiredTag);
    }
}