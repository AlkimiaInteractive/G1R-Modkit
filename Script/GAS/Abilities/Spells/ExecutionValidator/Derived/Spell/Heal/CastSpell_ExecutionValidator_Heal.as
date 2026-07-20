UCLASS()
class UCastSpellExecutionValidatorHeal : UCastSpellExecutionValidatorTargeableBase
{
    default m_ExecutionValidatorData = UHealSpellExecutionValidatorData::StaticClass();

    UPROPERTY()
    FGameplayTag BlockedTag = GameplayTag::Debuff_Blocked_Heal;
    
    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(!Super::IsValid_Scriptable(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<UHealSpellExecutionValidatorData>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

        if(castExecData.TargetActor == nullptr)
            return false;

        if(castExecData.TargetActor != castExecData.SourceActor)
        {
            //if(!IsVisibleTarget(targetActor))
            FCollisionResponseContainer responses;
            responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
            responses.SetResponse(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);

            if(!MagicScript::IsTargetReachable(castExecData.SourceActor, castExecData.TargetActor, ECollisionChannel::ECC_Visibility, responses))
                return false;
        }

        auto gothicCharacter = Cast<AGothicCharacter>(castExecData.TargetActor);
        if(gothicCharacter.IsDead() || gothicCharacter.IsDefeated())
            return false;   

        if(HasBlockedTag(gothicCharacter))
        {
            PrintDebugOnScreen(FName("IsTargetValid_Script - HasBlockedTag(gothicCharacter)"), 10.f, FColor::Red);
            return false;
        }
        //@DE - You can use heal to damage undead creatures.
        if(gothicCharacter.IsUndead())
            return true;

        return gothicCharacter.GetHealthAttribute() < gothicCharacter.GetMaxHealthAttribute();
        

    }

    bool HasBlockedTag(AGothicCharacter gothicChar) const
    {
        return HasTag(gothicChar, BlockedTag);
    }

    bool IsDataInValidState(USpellExecutionValidatorData ExecutionValidatorData) const override
    {
        if(!Super::IsDataInValidState(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<UHealSpellExecutionValidatorData>(ExecutionValidatorData);
        auto targetActor = castExecData.TargetActor;

        if(targetActor == nullptr)
        {
            PrintDebugOnScreen(FName("TargetInValidState - targetActor == nullptr"), 10.f, FColor::Red);
            return false;
        }
        return true;
    }

}