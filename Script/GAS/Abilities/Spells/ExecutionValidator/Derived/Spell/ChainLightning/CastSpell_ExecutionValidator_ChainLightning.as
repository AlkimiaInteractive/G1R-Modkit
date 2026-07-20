UCLASS()
class UCastSpellExecutionValidatorChainLightning : UCastSpellExecutionValidatorTargetableCharacterDebuff
{
    default m_ExecutionValidatorData = UChainLightningSpellExecutionValidatorData::StaticClass();

    default RequiredTag = GameplayTag::State_LaunchingSpell_ChainLightning;
    UPROPERTY()
    FGameplayTag RequiredTagOnTarget = GameplayTag::State_ReceivingSpell_ChainLightning;;
    
    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(!Super::IsValid_Scriptable(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<UChainLightningSpellExecutionValidatorData>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

        auto TargetCharacter = Cast<AGothicCharacter>(castExecData.TargetActor);
        auto SourceCharacter = Cast<AGothicCharacter>(castExecData.SourceActor);

        auto abComp = TargetCharacter.GetGothicAbilitySystemComponent();

        if(abComp.HasGameplayTag(GameplayTag::State_Cant_Electrified))
        {
            PrintDebugOnScreen(FName("IsTargetValid_Script - State_Cant_Electrified"), 10.f, FColor::Red);
            return false;
        }

        //Check that the player is not under the effect of other chain lightning  
        if(HasAnyChainLightningTag(TargetCharacter))
        {
            PrintDebugOnScreen(FName("IsTargetValid_Script - HasAnyChainLightningTag(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }
        // if(IsFriendly(SourceCharacter, TargetCharacter))
        // {
        //     PrintDebugOnScreen(FName("IsTargetValid_Script - IsFriendly(gothicCharacter)"), 10.f, FColor::Red);
        //     return false;
        // }
        return true;
    }

    // bool IsFriendly(AGothicCharacter SourceCharacter, AGothicCharacter TargetCharacter) const
    // {
    //     //If there is one of the args, force fake result.
    //     if(SourceCharacter == nullptr || TargetCharacter == nullptr)
    //         return true;

        
    //     //auto playerAiController = SourceCharacter.GetAI();
    //     //if(playerAiController == nullptr)
    //     if(SourceCharacter.IsPlayerControlled() || SourceCharacter.IsPlayerCharacter()) // source is player
    //     {
    //         //auto aiTargetController = TargetCharacter.GetAI();
    //         //if(aiTargetController != nullptr)
    //         if(!TargetCharacter.IsPlayerControlled() && !TargetCharacter.IsPlayerCharacter()) //target is AI
    //         {
    //             //Due the player hasnt relations, we have to check the inverse relation, from the AI to the player
            
    //             return TargetCharacter.IsFriendlyTowards(SourceCharacter);
    //         }
    //         else
    //         {
    //             return true;
    //         }
            
    //     }
    //     else
    //     {
    //         return SourceCharacter.IsFriendlyTowards(TargetCharacter);
    //     }

        
    // }

    //Used only for test while the AI is aiming other AIs
    bool IsPlayerChar_NOT_USE_ME(AActor target)
    {
        auto playerController = Gameplay::GetPlayerController(0);
        auto playerChar = Gameplay::GetPlayerPawn(0);
        if(target == playerChar)
            return true;
        return false;
    }

    bool HasAnyChainLightningTag(AGothicCharacter gothicCharacter) const
    {
        if(gothicCharacter == nullptr)
            return false;
        auto abComp = gothicCharacter.GetGothicAbilitySystemComponent();

        return abComp.HasGameplayTag(RequiredTag) || abComp.HasGameplayTag(RequiredTagOnTarget);
    }

    bool IsDataInValidState(USpellExecutionValidatorData ExecutionValidatorData) const override
    {
        if(!Super::IsDataInValidState(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<UChainLightningSpellExecutionValidatorData>(ExecutionValidatorData);
        auto DebuffTagOnTarget = castExecData.DebuffTagOnTarget;

        if(DebuffTagOnTarget != RequiredTagOnTarget)
        {
            FString text = FString("DebuffTagOnTarget != RequiredTagOnTarget -> ");
            text.Append(DebuffTagOnTarget.ToString()).Append(FString(" != ")).Append(DebuffTagOnTarget.ToString());
            PrintDebugOnScreen(FName(text), 10.f, FColor::Red);
            return false;
        }
        return true;
    }

}