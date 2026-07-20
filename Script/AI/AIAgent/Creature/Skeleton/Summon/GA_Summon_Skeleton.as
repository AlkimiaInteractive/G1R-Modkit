UCLASS()
class UGA_Summon_Skeleton : UGA_Summon_NotVisible
{
    default m_PlayRate = 1.f;

    
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Skeleton_Summon_01_Montage.A_Skeleton_Summon_01_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Skeleton_Summon_02_Montage.A_Skeleton_Summon_02_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Summon/A_Skeleton_Summon_03_Montage.A_Skeleton_Summon_03_Montage'"));

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = character.GetFXComponent();

        fxComponent.StopFXInstancesWithTag(GameplayTag::FX_Magic_Spell_Summon_Skeletons_Cast_Charge, false);
    }
}

UCLASS()
class UGA_SkeletonMage_Summon_Skeleton : UGA_Summon_NotVisible
{
    default m_PlayRate = 1.f;

    
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/SummoningSkeletons/SummonedSkeletons/A_Skeleton_SkMageSummon_01_Montage.A_Skeleton_SkMageSummon_01_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/SummoningSkeletons/SummonedSkeletons/A_Skeleton_SkMageSummon_02_Montage.A_Skeleton_SkMageSummon_02_Montage'"));
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton_Mage/Combat/Attacks/Spells/SummoningSkeletons/SummonedSkeletons/A_Skeleton_SkMageSummon_03_Montage.A_Skeleton_SkMageSummon_03_Montage'"));
}