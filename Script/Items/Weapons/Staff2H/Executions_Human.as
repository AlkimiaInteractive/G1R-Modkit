UCLASS()
class UExecutionDataStaff2H_Human_Untrained : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Executions/Untrained/A_Man_Sff2H_Un_A_Execution_Humanoids_01_Montage.A_Man_Sff2H_Un_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Executions/Untrained/A_Man_Sff2H_Un_A_Execution_Humanoids_01_Montage.A_Man_Sff2H_Un_A_Execution_Humanoids_01_Montage'");
}

UCLASS()
class UExecutionDataStaff2H_Human_Trained : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Executions/Trained/A_Man_Sff2H_Tr_A_Execution_Humanoids_01_Montage.A_Man_Sff2H_Tr_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Executions/Trained/A_Man_Sff2H_Tr_A_Execution_Humanoids_01_Montage.A_Man_Sff2H_Tr_A_Execution_Humanoids_01_Montage'");
}

UCLASS()
class UExecutionDataStaff2H_Human_Master : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Executions/Master/A_Man_Sff2H_Ma_A_Execution_Humanoids_01_Montage.A_Man_Sff2H_Ma_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Executions/Master/A_Man_Sff2H_Ma_A_Execution_Humanoids_01_Montage.A_Man_Sff2H_Ma_A_Execution_Humanoids_01_Montage'");
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Attacks/Executions/Master/A_Man_Sff2H_Ma_A_Execution_Humanoids_02_Montage.A_Man_Sff2H_Ma_A_Execution_Humanoids_02_Montage'");
}