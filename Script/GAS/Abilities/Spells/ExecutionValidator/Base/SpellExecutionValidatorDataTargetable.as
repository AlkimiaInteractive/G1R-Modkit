UCLASS()
class USpellExecutionValidatorDataTargetable : USpellExecutionValidatorDataDefault
{
    UPROPERTY()
    AActor TargetActor;

    UPROPERTY()
    UClass FilterClass;

    UPROPERTY()
    ECollisionChannel ReachableCollisionChannel;

    UPROPERTY()
    bool CheckForTrace = false;
}