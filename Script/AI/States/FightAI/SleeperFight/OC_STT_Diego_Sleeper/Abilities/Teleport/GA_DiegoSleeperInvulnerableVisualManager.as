UCLASS()
class UGA_DiegoSleeperInvulnerableVisualManager : UGA_InvulnerableVisualManager
{
    UInvulnerableVisualComponent GetInvulnerableVisualComponent() override
    {
        return UDiegoSleeperInvulnerableVisualComponent::GetOrCreate(GetAvatarActorFromActorInfo());
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        OnSpawnExplosionVisual(FGameplayEventData());
        OnActivateInvulnerableVisual(FGameplayEventData());
    }
}