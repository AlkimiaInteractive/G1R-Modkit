
class UGA_Into_Trance_MadCorKalom_PlayMontage : UGA_MadCorKalom_PlayMontage
{ 
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/A_CorKalom_SleeperAltar_Trance_In_Montage.A_CorKalom_SleeperAltar_Trance_In_Montage'";
    UPROPERTY()
    TSoftObjectPtr<UAnimMontage> m_TranceMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/A_CorKalom_SleeperAltar_Trance_Montage.A_CorKalom_SleeperAltar_Trance_Montage'";
    UPROPERTY()
    TSubclassOf<UGameplayEffectBase> m_TranceGE = UGE_Into_Trance_MadCorKalom_PlayMontage::StaticClass();
    UPROPERTY()
    FGameplayTag m_TranceTag = GameplayTag::State_MadCorKalom_InTrance;

    UPROPERTY(NotVisible, NotEditable)
    FName m_TeleportWayPointActorName = n"ST_MadCorKalom_Trance_Spawn_WayPoint";

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);

        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(abComp.HasTagExact(m_TranceTag))
        {
            GoToFinalPosition();
            return;
        }

        auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(m_TranceGE, 1, contextHandle);
        sourceAbComp.ApplyGameplayEffectSpecToSelf(geSpecHandle);
    }

    void GoToFinalPosition()
    {
        FInteractionSpotHandle Spot(m_TeleportWayPointActorName);
        if(Spot.IsValid())
        {
            GetAvatarActorFromActorInfo().SetActorLocation(Spot.GetLocation());
            GetAvatarActorFromActorInfo().SetActorRotation(Spot.GetTransform().GetRotation());
            m_Montage = m_TranceMontage;
            PlayMontage();
        }
        
    }

    UFUNCTION(BlueprintOverride)
    void OnLaunchSpell_Scriptable()
    {
        m_Montage = m_TranceMontage;
        PlayMontage();
    }


}

UCLASS()
class UGE_Into_Trance_MadCorKalom_PlayMontage : UScriptGameplayEffect
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_MadCorKalom_InTrance);
    
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_MadCorKalom_InTrance);
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::GE_Persistent);

    default DurationPolicy = EGameplayEffectDurationType::Infinite;

    default StackLimitCount = 1;
}