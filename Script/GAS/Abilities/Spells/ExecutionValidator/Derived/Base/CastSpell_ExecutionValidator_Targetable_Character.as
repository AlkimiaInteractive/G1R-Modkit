UCLASS()
class UCastSpellExecutionValidatorTargetableCharacter : UCastSpellExecutionValidatorTargeableBase
{
    default m_ExecutionValidatorData = USpellExecutionValidatorDataTargetable::StaticClass();

    // USpellExecutionValidatorDataBase DoDataCast(USpellExecutionValidatorDataBase Data) override
    // {
    //     return Cast<USpellExecutionValidatorDataTargetable>(Data);
    // }

    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(!Super::IsValid_Scriptable(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<USpellExecutionValidatorDataTargetable>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

        auto TargetCharacter = Cast<AGothicCharacter>(castExecData.TargetActor);
        auto SourceCharacter = Cast<AGothicCharacter>(castExecData.SourceActor);
        if(TargetCharacter.IsDead() || TargetCharacter.IsDefeated())
        {
            PrintDebugOnScreen(FName("IsTargetValid_Script - gothicCharacter.IsDead() || gothicCharacter.IsDefeated()"), 10.f, FColor::Red);
            return false;
        }

        // if(IsFriendly(SourceCharacter, TargetCharacter))
        // {
        //     PrintDebugOnScreen(FName("IsTargetValid_Script - IsFriendly(gothicCharacter)"), 10.f, FColor::Red);
        //     return false;
        // }
            
        FCollisionResponseContainer responses;
        responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
        responses.SetResponse(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);

        //if(!IsVisibleTarget(targetActor))
        if(!MagicScript::IsTargetReachable(castExecData.SourceActor, castExecData.TargetActor, castExecData.ReachableCollisionChannel, responses,/*, EDrawDebugTrace::ForOneFrame*/))
        {
            PrintDebugOnScreen(FName("IsTargetValid_Script - !MagicScript::IsTargetReachable"), 10.f, FColor::Red);
            return false;
        }

        return true;
    }

        bool IsFriendly(AGothicCharacter SourceCharacter, AGothicCharacter TargetCharacter) const
    {
        //If there is one of the args, force fake result.
        if(SourceCharacter == nullptr || TargetCharacter == nullptr)
            return true;

        
        //auto playerAiController = SourceCharacter.GetAI();
        //if(playerAiController == nullptr)
        if(SourceCharacter.IsPlayerControlled() || SourceCharacter.IsPlayerCharacter()) // source is player
        {
            //auto aiTargetController = TargetCharacter.GetAI();
            //if(aiTargetController != nullptr)
            if(!TargetCharacter.IsPlayerControlled() && !TargetCharacter.IsPlayerCharacter()) //target is AI
            {
                //Due the player hasnt relations, we have to check the inverse relation, from the AI to the player
            
                return TargetCharacter.IsFriendlyTowards(SourceCharacter);
            }
            else
            {
                return true;
            }
            
        }
        else
        {
            return SourceCharacter.IsFriendlyTowards(TargetCharacter);
        }

        
    }
}