UCLASS()
class UGA_Summon_MCQueen_PH2_Sleeper : UGA_Summon_NotVisible
{
    default m_PlayRate = 1.f;
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase2/Combat/Movement/Grounded/N/Spawn/A_MCQueen_Ph2_Emerge_Montage.A_MCQueen_Ph2_Emerge_Montage'"));

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey = n"Mud_Sleeper_Teleport_ToCheerPlace_Completed";
    UPROPERTY(NotVisible, NotEditable)
    FName m_MudSleeperUniqueName = n"ST_VLK_Mud_Sleeper";

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        
        if(!HasAuthority())
        {
            return;
        }
            
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                return;
            }
        }
        if(FCharacterUniqueName(m_MudSleeperUniqueName).NPCState == nullptr)
            return;        
        auto abComp = FCharacterUniqueName(m_MudSleeperUniqueName).NPCState.AbilitySystemComponent;
        abComp.SendGameplayEvent(GameplayTag::Event_Teleport_Scripted_MudSleeper_ToCheer, FGameplayEventData());
    }
}
