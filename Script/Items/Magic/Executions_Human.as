UCLASS()
class UExecutionDataRune_Human : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Executions/A_Man_ScrollRune_A_Execution_Humanoids_01_Montage.A_Man_ScrollRune_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Executions/A_Man_ScrollRune_A_Execution_Humanoids_01_Montage.A_Man_ScrollRune_A_Execution_Humanoids_01_Montage'");
}


UCLASS()
class UExecutionDataScroll_Human : UExecutionData
{
    default SetDefaultExecutionMontage(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Executions/A_Man_ScrollRune_A_Execution_Humanoids_01_Montage.A_Man_ScrollRune_A_Execution_Humanoids_01_Montage'");
    
    FGameplayTagContainer metadataFrontHumanoid;
    default metadataFrontHumanoid.AddTag(GameplayTag::Character_Size_Humanoid);
    default AddExecutionMontage(metadataFrontHumanoid ,n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Executions/A_Man_ScrollRune_A_Execution_Humanoids_01_Montage.A_Man_ScrollRune_A_Execution_Humanoids_01_Montage'");
}