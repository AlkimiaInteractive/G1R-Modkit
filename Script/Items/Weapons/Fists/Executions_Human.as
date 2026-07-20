UCLASS()
class UExecutionDataFists_Human_Untrained : UExecutionData
{
   default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Executions/Untrained/A_Man_Fists_Un_A_Execution_Humanoids_01_Montage.A_Man_Fists_Un_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Executions/Untrained/A_Man_Fists_Un_A_Execution_Humanoids_01_Montage.A_Man_Fists_Un_A_Execution_Humanoids_01_Montage'");
}

UCLASS()
class UExecutionDataFists_Human_Trained : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Executions/Trained/A_Man_Fists_Tr_A_Execution_Humanoids_01_Montage.A_Man_Fists_Tr_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Executions/Trained/A_Man_Fists_Tr_A_Execution_Humanoids_01_Montage.A_Man_Fists_Tr_A_Execution_Humanoids_01_Montage'");
}

UCLASS()
class UExecutionDataFists_Human_Master : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Executions/Master/A_Man_Fists_Ma_A_Execution_Humanoids_01_Montage.A_Man_Fists_Ma_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Attack/Executions/Master/A_Man_Fists_Ma_A_Execution_Humanoids_01_Montage.A_Man_Fists_Ma_A_Execution_Humanoids_01_Montage'");
}