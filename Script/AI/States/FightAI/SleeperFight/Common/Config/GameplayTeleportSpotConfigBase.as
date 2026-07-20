UCLASS()
class UGameplayTeleportSpotConfigBase : UGameplayTeleportSpotConfig
{    
    UPROPERTY()
	TSoftObjectPtr<UAnimMontage> m_DisappearMontage =  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Teleport/A_XardasSleeper_S1H_Teleport_In_Montage.A_XardasSleeper_S1H_Teleport_In_Montage'";

    UPROPERTY()
	TSoftObjectPtr<UAnimMontage> m_AppearMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Sleeper/Xardas/Ground/Teleport/A_XardasSleeper_S1H_Teleport_Out_Montage.A_XardasSleeper_S1H_Teleport_Out_Montage'";

    TSoftObjectPtr<UAnimMontage> GetMontageForTag(FGameplayTag Tag)
    {
        // if(m_MontageMap.Contains(Tag))
        //     return m_MontageMap[Tag];
        for(auto tuple : m_MontageMap)
        {
            if(tuple.Key.MatchesTagExact(Tag))
                return tuple.Value;
        }
        return nullptr;
    }
}

    
