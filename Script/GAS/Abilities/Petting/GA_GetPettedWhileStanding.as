UCLASS()
class UGA_GetPettedWhileStanding_Wolf : UGameplayAbilityGetPettedWhileStanding
{
    default m_PetMontageHeroStanding =  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/StrokeWolf/A_Wolf_N_StrokeWolf_Montage.A_Wolf_N_StrokeWolf_Montage'";
    default m_PetMontageHeroCrouching = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/StrokeWolf/A_Wolf_STL_StrokeWolf_Montage.A_Wolf_STL_StrokeWolf_Montage'";
}

UCLASS()
class UGA_GetPettedWhileStanding_Scavenger : UGameplayAbilityGetPettedWhileStanding
{
    default m_PetMontageHeroStanding =  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/StrokeScavengerAdult/A_Scavenger_Adult_N_StrokeScavengerAdult_Montage.A_Scavenger_Adult_N_StrokeScavengerAdult_Montage'";
    default m_PetMontageHeroCrouching = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/StrokeScavengerAdult/A_Scavenger_Adult_STL_StrokeScavengerAdult_Montage.A_Scavenger_Adult_STL_StrokeScavengerAdult_Montage'";
}