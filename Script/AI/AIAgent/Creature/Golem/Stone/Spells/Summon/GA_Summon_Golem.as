UCLASS()
class UGA_Summon_Golem : UGA_Summon_NotVisible
{
    default m_PlayRate = 1.f;

    
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/Summon/A_StoneGolem_Invoked_Montage.A_StoneGolem_Invoked_Montage'"));
}