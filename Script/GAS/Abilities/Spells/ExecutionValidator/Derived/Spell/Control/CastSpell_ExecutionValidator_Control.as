UCLASS()
class UCastSpellExecutionValidatorControl : UCastSpellExecutionValidatorTargetableCharacter
{
     default m_ExecutionValidatorData = UControlSpellExecutionValidatorData::StaticClass();

    UPROPERTY()
    FGameplayTag BlockedTag = GameplayTag::Debuff_Blocked_Control;

    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(!Super::IsValid_Scriptable(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<UControlSpellExecutionValidatorData>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

         //Player cannot control another player
        if(castExecData.TargetActor.IsA(AGothicPlayerCharacter::StaticClass()))
        {
            //PrintDebugOnScreen(FName("IsTargetValid_Script - Actor.IsA(AGothicPlayerCharacter::StaticClass()"), 10.f, FColor::Red);
            return false;
        }
        
        auto gothicCharacter = Cast<AGothicCharacter>(castExecData.TargetActor);

        if(HasBlockedTag(gothicCharacter))
        {
            //PrintDebugOnScreen(FName("IsTargetValid_Script - HasBlockedTag(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }

        if(!gothicCharacter.IsHuman())
        {
          return false;
        }

        if(gothicCharacter.GetDistanceTo(castExecData.SourceActor) > castExecData.TraceRange)
        {
            //PrintDebugOnScreen(FName("IsTargetValid_Script - gothicCharacter.GetDistanceTo(avatarActor) > GetRangeFromConfig()"), 10.f, FColor::Red);
            return false;
        }
        if(gothicCharacter.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_Controlled))
        {
           // PrintDebugOnScreen(FName("IsTargetValid_Script - gothicCharacter.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_Controlled)"), 10.f, FColor::Red);
            return false;
        }
        if(gothicCharacter.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_Controlling))
        {
            //PrintDebugOnScreen(FName("IsTargetValid_Script - gothicCharacter.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_Controlling)"), 10.f, FColor::Red);
            return false;
        }
        const auto SourceCharacter = Cast<AGothicCharacter>(castExecData.SourceActor);
        if(SourceCharacter.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_Controlled))
        {
            //PrintDebugOnScreen(FName("IsTargetValid_Script - SourceCharacter.GetGothicAbilitySystemComponent().HasGameplayTag(GameplayTag::State_Controlled)"), 10.f, FColor::Red);
            return false;
        }
        return true;
    }

    bool HasBlockedTag(AGothicCharacter gothicChar) const
    {
        return HasTag(gothicChar, BlockedTag);
    }
}