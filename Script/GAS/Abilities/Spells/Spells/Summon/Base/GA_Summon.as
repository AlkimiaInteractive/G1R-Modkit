//@DE - Granted to summoned creatures
UCLASS()
class UGA_Summon : UGameplayAbilitySummon
{
    UPROPERTY()
    TSubclassOf<UGameplayEffect> m_SummonGE_AnimBlocked = UGE_Summoned_SpawnAnimSkip::StaticClass();
    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        //FString text = FString("Playrate: ");
        // text.Append(FString::ApplyFormat(m_PlayRate, FString()));
        // Print(FString(text));
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.ApplyGameplayEffectToSelf(m_SummonGE_AnimBlocked, 0, abComp.MakeEffectContext());
    }
}


