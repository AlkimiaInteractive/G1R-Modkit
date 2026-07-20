UCLASS()
class UGA_Summon_VarragArushat : UGA_Summon_Varrag
{
    default m_PlayRate = 1.f;

    default m_SpawningVisualActorClass = AArushatSpawningVisual::StaticClass();
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Summon/Varrag/A_Varrag_Appear_01_Montage.A_Varrag_Appear_01_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Summon/Varrag/A_Varrag_Appear_02_Montage.A_Varrag_Appear_02_Montage'"));
}