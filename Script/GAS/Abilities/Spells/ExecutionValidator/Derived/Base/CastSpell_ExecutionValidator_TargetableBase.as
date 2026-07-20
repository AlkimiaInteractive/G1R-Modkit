UCLASS()
class UCastSpellExecutionValidatorTargeableBase : UCastSpellExecutionValidatorDefault
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

        if(!IsDataInValidState(castExecData))
            return false;

        auto TargetingDataModule = DataModule::GetTargetingDataModule(castExecData.SourceActor);
        if (TargetingDataModule == nullptr)
            return false;

        auto targetActorFromDatamodule = TargetingDataModule.GetTarget();
        if(targetActorFromDatamodule != nullptr && targetActorFromDatamodule != castExecData.TargetActor)
            return false;

        //The validator is common for trace and start casting so if the validator is for trace we have not check State_TraceTarget tag
        if(castExecData.CheckForTrace)
            return true;

        auto abComp = GothicGAS::GetAbilitySystemComponent(castExecData.SourceActor);
        if(abComp.HasGameplayTag(GameplayTag::State_Ignore_TraceTarget))
            return true;

        return abComp.HasGameplayTag(GameplayTag::State_TraceTarget);
    }

    bool IsDataInValidState(USpellExecutionValidatorData ExecutionValidatorData) const override
    {
        if(!Super::IsDataInValidState(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<USpellExecutionValidatorDataTargetable>(ExecutionValidatorData);
        auto targetActor = castExecData.TargetActor;
        auto filterClass = castExecData.FilterClass;
        auto reachableCollisionChannel = castExecData.ReachableCollisionChannel;

        if(targetActor == nullptr)
        {
            PrintDebugOnScreen(FName("TargetInValidState - targetActor == nullptr"), 10.f, FColor::Red);
            return false;
        }
        if(filterClass == nullptr)
        {
            PrintDebugOnScreen(FName("TargetInValidState - filterClass == nullptr"), 10.f, FColor::Red);
            return false;
        }

        if(reachableCollisionChannel == ECollisionChannel::ECC_MAX)
        {
            PrintDebugOnScreen(FName("TargetInValidState - ReachableCollisionChannel == ECollisionChannel::ECC_MAX"), 10.f, FColor::Red);
            return false;
        }

        if(!targetActor.IsA(filterClass))
        {
            PrintDebugOnScreen(FName("TargetInValidState - !Actor.IsA(GetFilterConfigClass().Get()"), 10.f, FColor::Red);
            return false;
        }

        return true;
    }
}