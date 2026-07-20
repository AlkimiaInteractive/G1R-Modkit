UCLASS()
class UExecutionDataBow_Human : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Executions/A_Man_Bow_A_Execution_Humanoids_01_Montage.A_Man_Bow_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Executions/A_Man_Bow_A_Execution_Humanoids_01_Montage.A_Man_Bow_A_Execution_Humanoids_01_Montage'");
}


UCLASS()
class UExecutionDataCrossBow_Human : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Executions/A_Man_Crossbow_A_Execution_Humanoids_01_Montage.A_Man_Crossbow_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Executions/A_Man_Crossbow_A_Execution_Humanoids_01_Montage.A_Man_Crossbow_A_Execution_Humanoids_01_Montage'");
}